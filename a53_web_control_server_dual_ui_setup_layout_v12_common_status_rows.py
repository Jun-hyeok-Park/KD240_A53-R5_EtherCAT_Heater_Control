import asyncio
import datetime
import json
import logging
import math
import time
from collections import deque
from contextlib import asynccontextmanager
from logging.handlers import RotatingFileHandler
from pathlib import Path
from typing import Any, Deque, Dict, List, Optional

from fastapi import FastAPI, Request, WebSocket, WebSocketDisconnect
from fastapi.responses import HTMLResponse, JSONResponse

# ============================================================
# Path settings
# ============================================================
BASE_DIR = Path.home() / "protec_kv260_lab"
CONFIG_DIR = BASE_DIR / "config"
LOG_DIR = BASE_DIR / "logs"
STATIC_DIR = BASE_DIR / "static"

CONFIG_FILE = CONFIG_DIR / "server_config.json"
LOG_FILE = LOG_DIR / "a53_web_control_server.log"

CONFIG_DIR.mkdir(parents=True, exist_ok=True)
LOG_DIR.mkdir(parents=True, exist_ok=True)
STATIC_DIR.mkdir(parents=True, exist_ok=True)

# ============================================================
# Default config
# ============================================================
DEFAULT_CONFIG: Dict[str, Any] = {
    "server": {
        "name": "Protec KV260 Mini Control Server",
        "version": "1.2.0-dual-url-ui",
    },
    "heater": {
        "channel_count": 4,
        "ambient_temp": 35.0,
        "initial_target_temp": 60.0,
        "initial_current_temp": 25.0,
        "default_kp": 28.0,
        "control_period_sec": 0.010,
        "min_target_temp": 0.0,
        "max_target_temp": 10000.0,
        # 채널 수와 채널별 표시 이름/초기값은 config 파일에서 바꿀 수 있다.
        # channel_count와 channels 길이가 맞지 않아도 부족한 채널은 자동 기본값으로 채운다.
        "channels": [
            {"ch": 1, "name": "Nozzle Top", "role": "Nozzle", "type": "temperature", "unit": "°C"},
            {"ch": 2, "name": "Nozzle Bottom", "role": "Nozzle", "type": "temperature", "unit": "°C"},
            {"ch": 3, "name": "Work Top", "role": "Work", "type": "temperature", "unit": "°C"},
            {"ch": 4, "name": "Work Bottom", "role": "Work", "type": "temperature", "unit": "°C"},
        ],
    },
    "simulation": {
        "heat_gain": 0.5,
        "cooling_gain_run": 0.0025,
        "cooling_gain_stop": 0.03,
    },
    "websocket": {
        "send_period_sec": 0.500,
    },
    "scheduler": {
        "history_max_samples": 10000,
        "max_history_batch_packets_per_send": 300,
        "websocket_send_timeout_sec": 0.050,
        "metric_window_sec": 10.0,
        "collision_guard_sec": 0.002,
        "collision_delay_sec": 0.004,
        "auto_phase_offset": True,
        "manual_phase_offset_ms": 5.0,
        "chart_enabled": True,
        "chart_batch_enabled": True,
    },
}


def deep_update(base: Dict[str, Any], override: Dict[str, Any]) -> Dict[str, Any]:
    result = dict(base)
    for key, value in override.items():
        if key in result and isinstance(result[key], dict) and isinstance(value, dict):
            result[key] = deep_update(result[key], value)
        else:
            result[key] = value
    return result


def load_config() -> Dict[str, Any]:
    if not CONFIG_FILE.exists():
        with CONFIG_FILE.open("w", encoding="utf-8") as f:
            json.dump(DEFAULT_CONFIG, f, indent=2, ensure_ascii=False)
        return DEFAULT_CONFIG

    try:
        with CONFIG_FILE.open("r", encoding="utf-8") as f:
            user_config = json.load(f)
    except Exception as e:
        # Config 손상 시 서버가 죽지 않게 default로 복구한다.
        backup_file = CONFIG_FILE.with_suffix(".broken.json")
        CONFIG_FILE.replace(backup_file)
        with CONFIG_FILE.open("w", encoding="utf-8") as f:
            json.dump(DEFAULT_CONFIG, f, indent=2, ensure_ascii=False)
        print(f"Config file was broken and moved to {backup_file}: {e}")
        return DEFAULT_CONFIG

    return deep_update(DEFAULT_CONFIG, user_config)


CONFIG = load_config()

# ============================================================
# Runtime settings from config
# ============================================================
SERVER_NAME = str(CONFIG["server"]["name"])
SERVER_VERSION = str(CONFIG["server"]["version"])
CHANNEL_COUNT = int(CONFIG["heater"]["channel_count"])
AMBIENT_TEMP = float(CONFIG["heater"]["ambient_temp"])
INITIAL_TARGET_TEMP = float(CONFIG["heater"]["initial_target_temp"])
INITIAL_CURRENT_TEMP = float(CONFIG["heater"]["initial_current_temp"])
DEFAULT_KP = float(CONFIG["heater"]["default_kp"])
MIN_TARGET_TEMP = float(CONFIG["heater"]["min_target_temp"])
MAX_TARGET_TEMP = float(CONFIG["heater"]["max_target_temp"])

INITIAL_CONTROL_PERIOD_SEC = float(CONFIG["heater"]["control_period_sec"])
INITIAL_WEBSOCKET_SEND_PERIOD_SEC = float(CONFIG["websocket"]["send_period_sec"])

HEAT_GAIN = float(CONFIG["simulation"]["heat_gain"])
COOLING_GAIN_RUN = float(CONFIG["simulation"]["cooling_gain_run"])
COOLING_GAIN_STOP = float(CONFIG["simulation"]["cooling_gain_stop"])

HISTORY_MAX_SAMPLES = int(CONFIG["scheduler"]["history_max_samples"])
MAX_HISTORY_BATCH_PACKETS_PER_SEND = int(CONFIG["scheduler"].get("max_history_batch_packets_per_send", 300))
WEBSOCKET_SEND_TIMEOUT_SEC = float(CONFIG["scheduler"].get("websocket_send_timeout_sec", 0.050))
METRIC_WINDOW_SEC = float(CONFIG["scheduler"]["metric_window_sec"])
COLLISION_GUARD_SEC = float(CONFIG["scheduler"]["collision_guard_sec"])
COLLISION_DELAY_SEC = float(CONFIG["scheduler"]["collision_delay_sec"])


def build_channel_definitions(config: Dict[str, Any], channel_count: int) -> List[Dict[str, Any]]:
    """Build normalized channel metadata from config.

    config/server_config.json에서 channels를 일부만 적어도 된다.
    없는 채널은 CH 번호 기반 기본값으로 보완한다.
    """
    raw_channels = config.get("heater", {}).get("channels", [])
    channel_map: Dict[int, Dict[str, Any]] = {}

    if isinstance(raw_channels, list):
        for item in raw_channels:
            if not isinstance(item, dict):
                continue
            ch_raw = item.get("ch")
            if isinstance(ch_raw, int) and not isinstance(ch_raw, bool) and 1 <= ch_raw <= channel_count:
                channel_map[ch_raw] = dict(item)

    result: List[Dict[str, Any]] = []
    for ch in range(1, channel_count + 1):
        item = channel_map.get(ch, {})
        result.append({
            "ch": ch,
            "name": str(item.get("name", f"CH{ch}")),
            "role": str(item.get("role", "Heater")),
            "type": str(item.get("type", "temperature")),
            "unit": str(item.get("unit", "°C")),
            "enable": bool(item.get("enable", True)),
            "initial_target_temp": float(item.get("initial_target_temp", INITIAL_TARGET_TEMP)),
            "initial_current_temp": float(item.get("initial_current_temp", INITIAL_CURRENT_TEMP)),
            "kp": float(item.get("kp", DEFAULT_KP)),
        })
    return result


CHANNEL_DEFS = build_channel_definitions(CONFIG, CHANNEL_COUNT)

# ============================================================
# Logging
# ============================================================
logger = logging.getLogger("protec.a53_web_gateway")
logger.setLevel(logging.INFO)
logger.propagate = False

if not logger.handlers:
    file_handler = RotatingFileHandler(
        LOG_FILE,
        maxBytes=2_000_000,
        backupCount=5,
        encoding="utf-8",
    )
    file_handler.setFormatter(logging.Formatter("%(asctime)s | %(levelname)s | %(message)s"))
    logger.addHandler(file_handler)

    console_handler = logging.StreamHandler()
    console_handler.setFormatter(logging.Formatter("%(asctime)s | %(levelname)s | %(message)s"))
    logger.addHandler(console_handler)


def write_log(message: str) -> None:
    logger.info(message)


# ============================================================
# Global runtime state
# ============================================================
state_lock = asyncio.Lock()
websocket_manager: "WebSocketManager"
simulation_task: Optional[asyncio.Task] = None
websocket_broadcast_task: Optional[asyncio.Task] = None
server_start_monotonic: Optional[float] = None

pending_history_buffer: Deque[Dict[str, Any]] = deque(maxlen=HISTORY_MAX_SAMPLES)


def is_harmonic_period(websocket_period_sec: float, control_period_sec: float) -> bool:
    if control_period_sec <= 0.0 or websocket_period_sec <= 0.0:
        return False
    ratio = websocket_period_sec / control_period_sec
    return abs(ratio - round(ratio)) < 1e-6


def phase_mode_string(websocket_period_sec: float, control_period_sec: float) -> str:
    return "Harmonic Offset" if is_harmonic_period(websocket_period_sec, control_period_sec) else "Collision Avoidance"


def default_phase_offset_ms(control_period_sec: float) -> float:
    return control_period_sec * 1000.0 / 2.0


runtime_state: Dict[str, Any] = {
    "system_state": "READY",
    "control_enabled": False,
    "seq": 0,
    "server_start_time": None,
    "display_extended_perf": True,

    # Scheduler / phase diagnostic
    "fast_loop_next_ready_timestamp": 0.0,
    "websocket_schedule_reset_requested": False,
    "auto_phase_offset": bool(CONFIG["scheduler"]["auto_phase_offset"]),
    "manual_phase_offset_ms": float(CONFIG["scheduler"]["manual_phase_offset_ms"]),
    "applied_phase_offset_ms": default_phase_offset_ms(INITIAL_CONTROL_PERIOD_SEC),
    "phase_control_mode_string": phase_mode_string(INITIAL_WEBSOCKET_SEND_PERIOD_SEC, INITIAL_CONTROL_PERIOD_SEC),
    "collision_avoid_events_count": 0,
    "nearest_fast_tick_distance_ms": 0.0,
    "actual_collision_delay_ms": 0.0,

    # Chart / history transport control
    "chart_enabled": bool(CONFIG["scheduler"].get("chart_enabled", True)),
    "chart_batch_enabled": bool(CONFIG["scheduler"].get("chart_batch_enabled", True)),

    # Fast loop performance
    "fast_avg_period_10s": 0.0,
    "fast_cum_avg_period": 0.0,
    "fast_realtime_jitter_sec": 0.0,
    "fast_max_abs_jitter_sec": 0.0,

    # Slow / broadcast loop performance
    "slow_avg_period_10s": 0.0,
    "slow_cum_avg_period": 0.0,
    "slow_realtime_jitter_sec": 0.0,
    "slow_max_abs_jitter_sec": 0.0,

    "config": {
        "server_name": SERVER_NAME,
        "server_version": SERVER_VERSION,
        "channel_count": CHANNEL_COUNT,
        "ambient_temp": AMBIENT_TEMP,
        "control_period_sec": INITIAL_CONTROL_PERIOD_SEC,
        "websocket_send_period_sec": INITIAL_WEBSOCKET_SEND_PERIOD_SEC,
        "min_target_temp": MIN_TARGET_TEMP,
        "max_target_temp": MAX_TARGET_TEMP,
    },
    "channels": [
        {
            "ch": meta["ch"],
            "name": meta["name"],
            "role": meta["role"],
            "type": meta["type"],
            "unit": meta["unit"],
            "enable": bool(meta["enable"]),
            "target_temp": float(meta["initial_target_temp"]),
            "current_temp": float(meta["initial_current_temp"]),
            "output_percent": 0.0,
            "state": "READY" if bool(meta["enable"]) else "DISABLED",
            "fault_code": 0,
            "kp": float(meta["kp"]),
        }
        for meta in CHANNEL_DEFS
    ],
}

# ============================================================
# Utility functions
# ============================================================

def now_text() -> str:
    return datetime.datetime.now().isoformat(timespec="milliseconds")


def clamp(value: float, low: float, high: float) -> float:
    return max(low, min(high, value))


def is_real_number(value: Any) -> bool:
    return isinstance(value, (int, float)) and not isinstance(value, bool) and math.isfinite(float(value))


def get_server_elapsed_sec() -> float:
    if server_start_monotonic is None:
        return 0.0
    return time.monotonic() - server_start_monotonic


def write_to_hardware_register(ch: int, output_percent: float) -> None:
    """
    실제 하드웨어 연결 전 stub.

    주의:
    - 실제 mmap/UIO/daemon call을 여기에 넣을 경우 block 가능성이 있다.
    - 따라서 이 함수는 state_lock 밖에서 호출되도록 구성했다.
    - 다음 단계에서는 이 위치를 C++ daemon command 또는 R5F/FPGA bridge로 교체한다.
    """
    pass


async def save_runtime_config_to_file() -> None:
    """Persist current setup-oriented values to server_config.json.

    지금은 채널 enable/target/kp와 loop/chart 옵션만 저장한다.
    이후 UI에서 channel_count 변경까지 허용하려면 runtime channel 재생성 정책을 별도로 둔다.
    """
    async with state_lock:
        config_to_save = deep_update(DEFAULT_CONFIG, CONFIG)
        config_to_save["server"]["name"] = str(runtime_state["config"].get("server_name", SERVER_NAME))
        config_to_save["server"]["version"] = str(runtime_state["config"].get("server_version", SERVER_VERSION))
        config_to_save["heater"]["channel_count"] = CHANNEL_COUNT
        config_to_save["heater"]["ambient_temp"] = float(runtime_state["config"].get("ambient_temp", AMBIENT_TEMP))
        config_to_save["heater"]["control_period_sec"] = float(runtime_state["config"]["control_period_sec"])
        config_to_save["websocket"]["send_period_sec"] = float(runtime_state["config"]["websocket_send_period_sec"])
        config_to_save["scheduler"]["auto_phase_offset"] = bool(runtime_state["auto_phase_offset"])
        config_to_save["scheduler"]["manual_phase_offset_ms"] = float(runtime_state["manual_phase_offset_ms"])
        config_to_save["scheduler"]["chart_enabled"] = bool(runtime_state["chart_enabled"])
        config_to_save["scheduler"]["chart_batch_enabled"] = bool(runtime_state["chart_batch_enabled"])
        config_to_save["heater"]["channels"] = [
            {
                "ch": int(ch["ch"]),
                "name": str(ch.get("name", f"CH{ch['ch']}")),
                "role": str(ch.get("role", "Heater")),
                "type": str(ch.get("type", "temperature")),
                "unit": str(ch.get("unit", "°C")),
                "enable": bool(ch["enable"]),
                "initial_target_temp": float(ch["target_temp"]),
                "initial_current_temp": float(ch["current_temp"]),
                "kp": float(ch.get("kp", DEFAULT_KP)),
            }
            for ch in runtime_state["channels"]
        ]

    tmp_file = CONFIG_FILE.with_suffix(".json.tmp")
    with tmp_file.open("w", encoding="utf-8") as f:
        json.dump(config_to_save, f, indent=2, ensure_ascii=False)
    tmp_file.replace(CONFIG_FILE)
    write_log(f"runtime config saved to {CONFIG_FILE}")


class PeriodMetrics:
    def __init__(self, window_sec: float) -> None:
        self.window_sec = window_sec
        self.intervals: Deque[float] = deque()
        self.total_loop_count = 0
        self.session_start_time = time.monotonic()
        self.last_mark_time = self.session_start_time
        self.max_abs_jitter_sec = 0.0

    def reset(self) -> None:
        now = time.monotonic()
        self.intervals.clear()
        self.total_loop_count = 0
        self.session_start_time = now
        self.last_mark_time = now
        self.max_abs_jitter_sec = 0.0

    def reset_max_only(self) -> None:
        self.max_abs_jitter_sec = 0.0

    def update(self, now: float, target_period_sec: float) -> Dict[str, float]:
        actual_interval = now - self.last_mark_time
        self.last_mark_time = now
        self.total_loop_count += 1

        realtime_jitter_sec = actual_interval - target_period_sec
        self.max_abs_jitter_sec = max(self.max_abs_jitter_sec, abs(realtime_jitter_sec))

        self.intervals.append(actual_interval)
        max_samples = max(1, int(self.window_sec / max(target_period_sec, 1e-6)))
        while len(self.intervals) > max_samples:
            self.intervals.popleft()

        avg_period = sum(self.intervals) / len(self.intervals)
        cum_avg_period = (now - self.session_start_time) / max(1, self.total_loop_count)

        return {
            "avg_period": avg_period,
            "cum_avg_period": cum_avg_period,
            "realtime_jitter_sec": realtime_jitter_sec,
            "max_abs_jitter_sec": self.max_abs_jitter_sec,
            "actual_interval": actual_interval,
        }


fast_metrics = PeriodMetrics(METRIC_WINDOW_SEC)
slow_metrics = PeriodMetrics(METRIC_WINDOW_SEC)


def update_phase_mode_unlocked() -> None:
    control_period = float(runtime_state["config"]["control_period_sec"])
    websocket_period = float(runtime_state["config"]["websocket_send_period_sec"])
    runtime_state["phase_control_mode_string"] = phase_mode_string(websocket_period, control_period)

    if runtime_state["auto_phase_offset"]:
        if is_harmonic_period(websocket_period, control_period):
            runtime_state["applied_phase_offset_ms"] = default_phase_offset_ms(control_period)
        else:
            runtime_state["applied_phase_offset_ms"] = 0.0
    else:
        runtime_state["applied_phase_offset_ms"] = float(runtime_state["manual_phase_offset_ms"])


def make_snapshot_unlocked(history_batch: List[Dict[str, Any]]) -> Dict[str, Any]:
    show_extended = bool(runtime_state["display_extended_perf"])
    chart_enabled = bool(runtime_state["chart_enabled"])
    chart_batch_enabled = bool(runtime_state["chart_batch_enabled"])
    effective_history_batch = history_batch if (chart_enabled and chart_batch_enabled) else []

    fast_rt_str = f"{runtime_state['fast_realtime_jitter_sec'] * 1000:+.3f}" if show_extended else None
    slow_rt_str = f"{runtime_state['slow_realtime_jitter_sec'] * 1000:+.3f}" if show_extended else None

    return {
        "type": "heater_status_snapshot",
        "seq": runtime_state["seq"],
        "timestamp": now_text(),
        "system_state": runtime_state["system_state"],
        "control_enabled": runtime_state["control_enabled"],
        "total_elapsed_sec": round(get_server_elapsed_sec(), 1),
        "extended_enabled": show_extended,
        "chart_enabled": chart_enabled,
        "chart_batch_enabled": chart_batch_enabled,
        "chart_history_pending_count": len(pending_history_buffer),
        "chart_history_batch": effective_history_batch,

        "phase_mode": runtime_state["phase_control_mode_string"],
        "auto_phase_offset": runtime_state["auto_phase_offset"],
        "manual_phase_offset_ms": runtime_state["manual_phase_offset_ms"],
        "applied_phase_offset_ms": runtime_state["applied_phase_offset_ms"],
        "collision_avoid_count": runtime_state["collision_avoid_events_count"],
        "nearest_fast_tick_distance_ms": runtime_state["nearest_fast_tick_distance_ms"],
        "actual_collision_delay_ms": runtime_state["actual_collision_delay_ms"],

        "fast_perf": {
            "avg_period_10s": round(runtime_state["fast_avg_period_10s"] * 1000.0, 3),
            "cum_avg_period": round(runtime_state["fast_cum_avg_period"] * 1000.0, 3) if show_extended else None,
            "realtime_jitter_ms_str": fast_rt_str,
            "max_abs_jitter_ms": round(runtime_state["fast_max_abs_jitter_sec"] * 1000.0, 3) if show_extended else None,
        },
        "slow_perf": {
            "avg_period_10s": round(runtime_state["slow_avg_period_10s"] * 1000.0, 3),
            "cum_avg_period": round(runtime_state["slow_cum_avg_period"] * 1000.0, 3) if show_extended else None,
            "realtime_jitter_ms_str": slow_rt_str,
            "max_abs_jitter_ms": round(runtime_state["slow_max_abs_jitter_sec"] * 1000.0, 3) if show_extended else None,
        },
        "config": dict(runtime_state["config"]),
        "channels": [
            {
                "ch": ch["ch"],
                "name": ch.get("name", f"CH{ch['ch']}"),
                "role": ch.get("role", "Heater"),
                "type": ch.get("type", "temperature"),
                "unit": ch.get("unit", "°C"),
                "enable": ch["enable"],
                "target_temp": round(ch["target_temp"], 3),
                "current_temp": round(ch["current_temp"], 3),
                "output_percent": round(ch["output_percent"], 3),
                "state": ch["state"],
                "fault_code": ch["fault_code"],
                "kp": round(ch.get("kp", DEFAULT_KP), 3),
            }
            for ch in runtime_state["channels"]
        ],
    }


# ============================================================
# WebSocket manager
# ============================================================
class WebSocketManager:
    def __init__(self) -> None:
        self._clients: List[WebSocket] = []
        self._lock = asyncio.Lock()

    async def connect(self, websocket: WebSocket) -> None:
        await websocket.accept()
        async with self._lock:
            self._clients.append(websocket)
        write_log(f"WebSocket client connected. clients={await self.client_count()}")

    async def disconnect(self, websocket: WebSocket) -> None:
        async with self._lock:
            if websocket in self._clients:
                self._clients.remove(websocket)
        write_log(f"WebSocket client disconnected. clients={await self.client_count()}")

    async def client_count(self) -> int:
        async with self._lock:
            return len(self._clients)

    async def broadcast_text(self, payload: str) -> None:
        async with self._lock:
            clients = list(self._clients)

        if not clients:
            return

        async def send_one(websocket: WebSocket) -> Optional[WebSocket]:
            try:
                await asyncio.wait_for(websocket.send_text(payload), timeout=WEBSOCKET_SEND_TIMEOUT_SEC)
                return None
            except Exception as e:
                write_log(f"WebSocket send failed or timed out: {e}")
                return websocket

        results = await asyncio.gather(*(send_one(ws) for ws in clients), return_exceptions=False)
        dead_clients = [ws for ws in results if ws is not None]

        if dead_clients:
            async with self._lock:
                self._clients = [ws for ws in self._clients if ws not in dead_clients]


websocket_manager = WebSocketManager()

# ============================================================
# Plant simulation / control loop
# ============================================================
async def update_virtual_plant_once(control_period_sec: float) -> None:
    hw_outputs: List[tuple[int, float]] = []

    async with state_lock:
        runtime_state["seq"] += 1
        seq = int(runtime_state["seq"])
        elapsed_sec = get_server_elapsed_sec()

        for ch in runtime_state["channels"]:
            current = float(ch["current_temp"])
            target = float(ch["target_temp"])
            enabled = bool(ch["enable"])

            if runtime_state["control_enabled"] and enabled:
                error = target - current
                output = clamp(float(ch["kp"]) * error, 0.0, 100.0)
                temp_delta = ((output / 100.0) * HEAT_GAIN - COOLING_GAIN_RUN * (current - AMBIENT_TEMP)) * control_period_sec
                ch["current_temp"] = current + temp_delta
                ch["output_percent"] = output
                ch["state"] = "RUN"
            else:
                temp_delta = (-COOLING_GAIN_STOP * (current - AMBIENT_TEMP)) * control_period_sec
                ch["current_temp"] = current + temp_delta
                ch["output_percent"] = 0.0
                ch["state"] = "READY" if enabled else "DISABLED"

            hw_outputs.append((int(ch["ch"]), float(ch["output_percent"])))

        collect_history = bool(runtime_state["chart_enabled"]) and bool(runtime_state["chart_batch_enabled"])
        if collect_history:
            history_packet = {
                "seq": seq,
                "t_rel_sec": round(elapsed_sec, 4),
                "channels": [
                    {
                        "ch": int(ch["ch"]),
                        "name": str(ch.get("name", f"CH{ch['ch']}")),
                        "current_temp": float(ch["current_temp"]),
                        "target_temp": float(ch["target_temp"]),
                        "output_percent": float(ch["output_percent"]),
                        "state": str(ch["state"]),
                    }
                    for ch in runtime_state["channels"]
                ],
            }
            # Fast loop는 chart batch가 켜진 경우에만 history를 append한다.
            # 그래프를 끄면 이 10ms history packet 생성/전송 비용도 같이 사라진다.
            pending_history_buffer.append(history_packet)

    # 실제 하드웨어 출력은 lock 밖에서 수행한다.
    for ch_num, output_percent in hw_outputs:
        write_to_hardware_register(ch_num, output_percent)


async def simulation_loop() -> None:
    write_log("virtual heater plant loop started")
    fast_metrics.reset()

    next_ready_time = time.monotonic()
    last_period_sec: Optional[float] = None

    while True:
        async with state_lock:
            control_period_sec = float(runtime_state["config"]["control_period_sec"])

        if last_period_sec is None or abs(control_period_sec - last_period_sec) > 1e-9:
            next_ready_time = time.monotonic()
            fast_metrics.reset()
            last_period_sec = control_period_sec
            write_log(f"fast loop period updated: {control_period_sec * 1000.0:.3f} ms")

        await update_virtual_plant_once(control_period_sec)

        next_ready_time += control_period_sec
        async with state_lock:
            runtime_state["fast_loop_next_ready_timestamp"] = next_ready_time

        remaining_time = next_ready_time - time.monotonic()
        if remaining_time > 0.0:
            await asyncio.sleep(remaining_time)
        else:
            # 뒤처진 경우 누적 보정을 포기하고 현재 시각 기준으로 재정렬한다.
            next_ready_time = time.monotonic()

        now = time.monotonic()
        metric = fast_metrics.update(now, control_period_sec)
        async with state_lock:
            runtime_state["fast_avg_period_10s"] = metric["avg_period"]
            runtime_state["fast_cum_avg_period"] = metric["cum_avg_period"]
            runtime_state["fast_realtime_jitter_sec"] = metric["realtime_jitter_sec"]
            runtime_state["fast_max_abs_jitter_sec"] = metric["max_abs_jitter_sec"]


# ============================================================
# WebSocket broadcaster loop
# ============================================================
async def websocket_broadcast_loop() -> None:
    write_log("websocket broadcaster loop started")
    slow_metrics.reset()

    next_ready_time = time.monotonic()
    last_period_sec: Optional[float] = None

    while True:
        async with state_lock:
            websocket_period_sec = float(runtime_state["config"]["websocket_send_period_sec"])
            control_period_sec = float(runtime_state["config"]["control_period_sec"])
            reset_requested = bool(runtime_state["websocket_schedule_reset_requested"])
            runtime_state["websocket_schedule_reset_requested"] = False
            update_phase_mode_unlocked()
            phase_offset_sec = float(runtime_state["applied_phase_offset_ms"]) / 1000.0
            is_harmonic = is_harmonic_period(websocket_period_sec, control_period_sec)

        if last_period_sec is None or abs(websocket_period_sec - last_period_sec) > 1e-9 or reset_requested:
            now = time.monotonic()
            next_ready_time = now + (phase_offset_sec if is_harmonic else 0.0)
            slow_metrics.reset()
            last_period_sec = websocket_period_sec
            write_log(
                "websocket broadcaster schedule reset: "
                f"period={websocket_period_sec * 1000.0:.3f} ms, "
                f"phase_offset={phase_offset_sec * 1000.0:.3f} ms, "
                f"mode={'harmonic' if is_harmonic else 'collision'}"
            )

        # Non-harmonic period에서는 fast loop와 동시에 깨어날 가능성을 best-effort로 피한다.
        if not is_harmonic:
            async with state_lock:
                fast_loop_next = float(runtime_state["fast_loop_next_ready_timestamp"])

            time_diff = abs(next_ready_time - fast_loop_next)
            rem_phase = time_diff % max(control_period_sec, 1e-6)
            distance_to_nearest_tick = min(rem_phase, control_period_sec - rem_phase)

            if distance_to_nearest_tick < COLLISION_GUARD_SEC:
                next_ready_time += COLLISION_DELAY_SEC
                async with state_lock:
                    runtime_state["collision_avoid_events_count"] += 1
                    runtime_state["nearest_fast_tick_distance_ms"] = distance_to_nearest_tick * 1000.0
                    runtime_state["actual_collision_delay_ms"] = COLLISION_DELAY_SEC * 1000.0
            else:
                async with state_lock:
                    runtime_state["nearest_fast_tick_distance_ms"] = distance_to_nearest_tick * 1000.0
                    runtime_state["actual_collision_delay_ms"] = 0.0

        remaining_time = next_ready_time - time.monotonic()
        if remaining_time > 0.0:
            await asyncio.sleep(remaining_time)
        else:
            next_ready_time = time.monotonic()

        async with state_lock:
            chart_enabled = bool(runtime_state["chart_enabled"])
            chart_batch_enabled = bool(runtime_state["chart_batch_enabled"])

        # history scan 금지: 10ms fast loop 지터를 줄이기 위해 pending packet만 drain한다.
        # 그래프 또는 batch가 꺼져 있으면 pending history를 즉시 버리고 payload에서 제외한다.
        history_batch: List[Dict[str, Any]] = []
        if chart_enabled and chart_batch_enabled:
            drained_history: List[Dict[str, Any]] = []
            while pending_history_buffer:
                drained_history.append(pending_history_buffer.popleft())

            # UI가 오래 멈췄다가 돌아온 경우 payload 폭주를 막기 위해 최신 N개만 전송한다.
            if len(drained_history) > MAX_HISTORY_BATCH_PACKETS_PER_SEND:
                history_batch = drained_history[-MAX_HISTORY_BATCH_PACKETS_PER_SEND:]
            else:
                history_batch = drained_history
        else:
            pending_history_buffer.clear()

        client_count = await websocket_manager.client_count()
        if client_count > 0:
            async with state_lock:
                snapshot = make_snapshot_unlocked(history_batch)

            payload = json.dumps(snapshot, ensure_ascii=False)
            await websocket_manager.broadcast_text(payload)

        now = time.monotonic()
        metric = slow_metrics.update(now, websocket_period_sec)
        async with state_lock:
            runtime_state["slow_avg_period_10s"] = metric["avg_period"]
            runtime_state["slow_cum_avg_period"] = metric["cum_avg_period"]
            runtime_state["slow_realtime_jitter_sec"] = metric["realtime_jitter_sec"]
            runtime_state["slow_max_abs_jitter_sec"] = metric["max_abs_jitter_sec"]

        next_ready_time += websocket_period_sec


# ============================================================
# Command handling
# ============================================================
async def snapshot_response(ok: bool, message: Optional[str] = None, error: Optional[str] = None) -> Dict[str, Any]:
    async with state_lock:
        snapshot = make_snapshot_unlocked(history_batch=[])

    response: Dict[str, Any] = {"ok": ok, "snapshot": snapshot}
    if message is not None:
        response["message"] = message
    if error is not None:
        response["error"] = error
    return response


async def handle_command(body: Dict[str, Any], source: str) -> Dict[str, Any]:
    cmd = body.get("cmd")
    write_log(f"{source} RX: {json.dumps(body, ensure_ascii=False)}")

    if cmd == "ping":
        response = await snapshot_response(True, message="pong")
        response["server_time"] = now_text()

    elif cmd == "read_status":
        response = await snapshot_response(True)

    elif cmd == "reset_max_jitter":
        fast_metrics.reset_max_only()
        slow_metrics.reset_max_only()
        async with state_lock:
            runtime_state["fast_max_abs_jitter_sec"] = 0.0
            runtime_state["slow_max_abs_jitter_sec"] = 0.0
            runtime_state["collision_avoid_events_count"] = 0
            runtime_state["nearest_fast_tick_distance_ms"] = 0.0
            runtime_state["actual_collision_delay_ms"] = 0.0
        response = await snapshot_response(True, message="all jitter/collision counters reset done")

    elif cmd == "toggle_perf_display":
        async with state_lock:
            runtime_state["display_extended_perf"] = not runtime_state["display_extended_perf"]
            status_str = "ENABLED" if runtime_state["display_extended_perf"] else "DISABLED"
        response = await snapshot_response(True, message=f"extended metrics display {status_str}")

    elif cmd == "start_control":
        async with state_lock:
            runtime_state["control_enabled"] = True
            runtime_state["system_state"] = "RUN"
            for ch in runtime_state["channels"]:
                if ch["enable"]:
                    ch["state"] = "RUN"
        response = await snapshot_response(True, message="control started")

    elif cmd == "stop_control":
        async with state_lock:
            runtime_state["control_enabled"] = False
            runtime_state["system_state"] = "READY"
            for ch in runtime_state["channels"]:
                ch["output_percent"] = 0.0
                ch["state"] = "READY" if ch["enable"] else "DISABLED"
        response = await snapshot_response(True, message="control stopped")

    elif cmd == "set_targets":
        targets = body.get("targets")
        if not isinstance(targets, list):
            response = await snapshot_response(False, error="targets must be a list")
        elif len(targets) != CHANNEL_COUNT:
            response = await snapshot_response(False, error=f"targets length must be {CHANNEL_COUNT}")
        elif not all(is_real_number(value) for value in targets):
            response = await snapshot_response(False, error="all targets must be finite numbers")
        elif not all(MIN_TARGET_TEMP <= float(value) <= MAX_TARGET_TEMP for value in targets):
            response = await snapshot_response(False, error=f"target range must be {MIN_TARGET_TEMP}..{MAX_TARGET_TEMP}")
        else:
            async with state_lock:
                for idx, value in enumerate(targets):
                    runtime_state["channels"][idx]["target_temp"] = float(value)
            response = await snapshot_response(True, message=f"{CHANNEL_COUNT}ch targets updated")

    elif cmd == "set_target":
        ch_num = body.get("ch")
        value = body.get("value")
        if not isinstance(ch_num, int) or isinstance(ch_num, bool):
            response = await snapshot_response(False, error="ch must be integer")
        elif ch_num < 1 or ch_num > CHANNEL_COUNT:
            response = await snapshot_response(False, error=f"ch must be 1..{CHANNEL_COUNT}")
        elif not is_real_number(value):
            response = await snapshot_response(False, error="value must be finite number")
        elif not (MIN_TARGET_TEMP <= float(value) <= MAX_TARGET_TEMP):
            response = await snapshot_response(False, error=f"target range must be {MIN_TARGET_TEMP}..{MAX_TARGET_TEMP}")
        else:
            async with state_lock:
                runtime_state["channels"][ch_num - 1]["target_temp"] = float(value)
            response = await snapshot_response(True, message=f"CH{ch_num} target updated")

    elif cmd == "set_channel_enable":
        ch_num = body.get("ch")
        enable_value = body.get("enable")
        if not isinstance(ch_num, int) or isinstance(ch_num, bool):
            response = await snapshot_response(False, error="ch must be integer")
        elif ch_num < 1 or ch_num > CHANNEL_COUNT:
            response = await snapshot_response(False, error=f"ch must be 1..{CHANNEL_COUNT}")
        elif not isinstance(enable_value, bool):
            response = await snapshot_response(False, error="enable must be boolean")
        else:
            async with state_lock:
                ch = runtime_state["channels"][ch_num - 1]
                ch["enable"] = enable_value
                if not enable_value:
                    ch["output_percent"] = 0.0
                    ch["state"] = "DISABLED"
                else:
                    ch["state"] = "RUN" if runtime_state["control_enabled"] else "READY"
            response = await snapshot_response(True, message=f"CH{ch_num} enable={enable_value}")

    elif cmd == "set_channel_kp":
        ch_num = body.get("ch")
        value = body.get("value")
        if not isinstance(ch_num, int) or isinstance(ch_num, bool):
            response = await snapshot_response(False, error="ch must be integer")
        elif ch_num < 1 or ch_num > CHANNEL_COUNT:
            response = await snapshot_response(False, error=f"ch must be 1..{CHANNEL_COUNT}")
        elif not is_real_number(value):
            response = await snapshot_response(False, error="value must be finite number")
        elif not (0.0 <= float(value) <= 10000.0):
            response = await snapshot_response(False, error="kp range must be 0.0..10000.0")
        else:
            async with state_lock:
                runtime_state["channels"][ch_num - 1]["kp"] = float(value)
            response = await snapshot_response(True, message=f"CH{ch_num} kp updated")

    elif cmd == "save_config":
        await save_runtime_config_to_file()
        response = await snapshot_response(True, message=f"runtime setup saved to {CONFIG_FILE}")

    elif cmd == "set_phase_offset":
        raw_value = body.get("value", -1.0)
        if not is_real_number(raw_value):
            response = await snapshot_response(False, error="value must be a finite number. Use negative value for auto mode.")
        else:
            value = float(raw_value)
            async with state_lock:
                if value < 0.0:
                    runtime_state["auto_phase_offset"] = True
                else:
                    runtime_state["auto_phase_offset"] = False
                    runtime_state["manual_phase_offset_ms"] = value
                update_phase_mode_unlocked()
                runtime_state["websocket_schedule_reset_requested"] = True
                msg = (
                    f"phase offset updated: auto={runtime_state['auto_phase_offset']}, "
                    f"applied={runtime_state['applied_phase_offset_ms']:.3f}ms"
                )
            response = await snapshot_response(True, message=msg)

    elif cmd == "set_loop_periods":
        control_ms = body.get("control_period_ms")
        websocket_ms = body.get("websocket_period_ms")

        if not is_real_number(control_ms) or not is_real_number(websocket_ms):
            response = await snapshot_response(False, error="control_period_ms and websocket_period_ms must be finite numbers")
        else:
            control_ms_f = float(control_ms)
            websocket_ms_f = float(websocket_ms)

            if not (2.0 <= control_ms_f <= 1000.0):
                response = await snapshot_response(False, error="control_period_ms must be 2.0..1000.0")
            elif not (20.0 <= websocket_ms_f <= 10000.0):
                response = await snapshot_response(False, error="websocket_period_ms must be 20.0..10000.0")
            else:
                async with state_lock:
                    runtime_state["config"]["control_period_sec"] = control_ms_f / 1000.0
                    runtime_state["config"]["websocket_send_period_sec"] = websocket_ms_f / 1000.0
                    update_phase_mode_unlocked()
                    runtime_state["websocket_schedule_reset_requested"] = True
                response = await snapshot_response(True, message=f"loop periods updated: fast={control_ms_f:.3f}ms, ws={websocket_ms_f:.3f}ms")

    elif cmd == "set_chart_options":
        chart_enabled = body.get("chart_enabled", None)
        chart_batch_enabled = body.get("chart_batch_enabled", None)

        if chart_enabled is not None and not isinstance(chart_enabled, bool):
            response = await snapshot_response(False, error="chart_enabled must be boolean")
        elif chart_batch_enabled is not None and not isinstance(chart_batch_enabled, bool):
            response = await snapshot_response(False, error="chart_batch_enabled must be boolean")
        else:
            async with state_lock:
                if chart_enabled is not None:
                    runtime_state["chart_enabled"] = chart_enabled
                if chart_batch_enabled is not None:
                    runtime_state["chart_batch_enabled"] = chart_batch_enabled

                # 그래프가 꺼진 상태에서는 batch를 강제로 의미 없게 둔다.
                # 다시 켜면 사용자가 batch checkbox 상태를 통해 재설정할 수 있다.
                if not runtime_state["chart_enabled"]:
                    runtime_state["chart_batch_enabled"] = False

                if not runtime_state["chart_enabled"] or not runtime_state["chart_batch_enabled"]:
                    pending_history_buffer.clear()

                msg = (
                    f"chart options updated: chart_enabled={runtime_state['chart_enabled']}, "
                    f"chart_batch_enabled={runtime_state['chart_batch_enabled']}"
                )
            response = await snapshot_response(True, message=msg)

    elif cmd == "reset_fault":
        async with state_lock:
            for ch in runtime_state["channels"]:
                ch["fault_code"] = 0
        response = await snapshot_response(True, message="fault reset done")

    else:
        response = await snapshot_response(False, error=f"unknown cmd: {cmd}")

    # snapshot이 너무 커질 수 있으므로 log에는 snapshot 일부를 제거한다.
    log_response = dict(response)
    if "snapshot" in log_response:
        snapshot_copy = dict(log_response["snapshot"])
        snapshot_copy["chart_history_batch"] = f"{len(snapshot_copy.get('chart_history_batch', []))} packets"
        log_response["snapshot"] = snapshot_copy
    write_log(f"{source} TX: {json.dumps(log_response, ensure_ascii=False)}")
    return response


# ============================================================
# FastAPI lifespan
# ============================================================
@asynccontextmanager
async def lifespan(app: FastAPI):
    global simulation_task, websocket_broadcast_task, server_start_monotonic

    server_start_monotonic = time.monotonic()
    runtime_state["server_start_time"] = now_text()
    write_log(f"{SERVER_NAME} v{SERVER_VERSION} starting")

    simulation_task = asyncio.create_task(simulation_loop(), name="simulation_loop")
    websocket_broadcast_task = asyncio.create_task(websocket_broadcast_loop(), name="websocket_broadcast_loop")

    try:
        yield
    finally:
        for task in (simulation_task, websocket_broadcast_task):
            if task:
                task.cancel()

        for task in (simulation_task, websocket_broadcast_task):
            if task:
                try:
                    await task
                except asyncio.CancelledError:
                    pass

        write_log(f"{SERVER_NAME} stopped")


app = FastAPI(title=SERVER_NAME, version=SERVER_VERSION, lifespan=lifespan)

# ============================================================
# Web UI
# ============================================================

MENU_PAGE = r"""
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Protec KV260 Web UI Launcher</title>
  <style>
    :root { --text:#e5e7eb; --muted:#94a3b8; --blue:#3b82f6; --green:#22c55e; --line:rgba(148,163,184,0.22); }
    * { box-sizing: border-box; }
    body { margin:0; min-height:100vh; font-family:Arial,sans-serif; background:radial-gradient(circle at top left,#1e3a8a 0,#0f172a 42%,#020617 100%); color:var(--text); display:flex; align-items:center; justify-content:center; padding:24px; }
    .shell { width:min(980px,100%); }
    .hero { border:1px solid var(--line); background:rgba(15,23,42,0.78); border-radius:24px; padding:28px; box-shadow:0 30px 80px rgba(0,0,0,0.28); backdrop-filter:blur(10px); }
    h1 { margin:0 0 8px; font-size:clamp(28px,5vw,44px); letter-spacing:-0.04em; }
    .subtitle { color:var(--muted); line-height:1.6; margin-bottom:24px; }
    .grid { display:grid; grid-template-columns:1fr 1fr; gap:16px; }
    .card { border:1px solid var(--line); background:rgba(30,41,59,0.78); border-radius:18px; padding:22px; min-height:230px; display:flex; flex-direction:column; justify-content:space-between; }
    .card h2 { margin:0 0 10px; font-size:22px; }
    .card p { color:var(--muted); line-height:1.55; margin:0 0 16px; }
    .tags { display:flex; gap:8px; flex-wrap:wrap; margin:12px 0 18px; }
    .tag { font-size:12px; border:1px solid var(--line); border-radius:999px; padding:4px 9px; color:#cbd5e1; }
    a.button { display:inline-flex; align-items:center; justify-content:center; min-height:48px; border-radius:12px; padding:12px 16px; color:white; text-decoration:none; font-weight:800; }
    a.setup { background:var(--green); color:#052e16; }
    a.legacy { background:var(--blue); }
    .footer { margin-top:16px; color:var(--muted); font-size:13px; line-height:1.7; }
    code { background:rgba(148,163,184,0.16); padding:2px 6px; border-radius:6px; color:#e2e8f0; }
    @media (max-width:760px) { .grid { grid-template-columns:1fr; } .hero { padding:20px; } }
  </style>
</head>
<body>
  <main class="shell">
    <section class="hero">
      <h1>Protec KV260 Web UI</h1>
      <div class="subtitle">
        하나의 A53 server에서 기존 실험 UI와 채널 선택형 setup UI를 URL로 분리했습니다.<br/>
        REST API와 WebSocket은 공통으로 사용하므로 제어 상태는 한 군데에서만 관리됩니다.
      </div>
      <div class="grid">
        <article class="card">
          <div>
            <h2>Channel Setup UI</h2>
            <p>장비 셋업용 화면입니다. 채널을 고르고, 선택 채널의 target, Kp, enable, trend를 집중해서 봅니다.</p>
            <div class="tags"><span class="tag">Tablet friendly</span><span class="tag">Channel detail</span><span class="tag">Setup mode</span></div>
          </div>
          <a class="button setup" href="/setup">Open /setup</a>
        </article>
        <article class="card">
          <div>
            <h2>Legacy Demo UI</h2>
            <p>호님이 올려준 기존 화면입니다. 전체 성능 진단, chart load, target all setting을 원래 방식으로 확인합니다.</p>
            <div class="tags"><span class="tag">Original UI</span><span class="tag">Loop diagnostics</span><span class="tag">Batch chart</span></div>
          </div>
          <a class="button legacy" href="/legacy">Open /legacy</a>
        </article>
      </div>
      <div class="footer">
        API: <code>/api/status</code>, <code>/api/cmd</code> · WebSocket: <code>/ws/temperature</code><br/>
        권장 접속: 장비 setup은 <code>/setup</code>, 기존 동작 비교는 <code>/legacy</code>
      </div>
    </section>
  </main>
</body>
</html>
"""

LEGACY_HTML_PAGE = r"""
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>KV260 Heater Demo</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    body { font-family: Arial, sans-serif; margin: 0; background: #eef2f7; color: #20242a; }
    .legacy-page { padding: 16px; max-width: 1500px; margin: 0 auto; display: grid; gap: 16px; }
    .legacy-grid { display: grid; grid-template-columns: minmax(0, 1fr) minmax(340px, .42fr); gap: 16px; align-items: start; }
    .legacy-side { display: grid; gap: 16px; }
    @media (max-width: 1080px) { .legacy-grid { grid-template-columns: 1fr; } }
    h1 { margin-bottom: 4px; }
    .subtitle { color: #5c6670; margin-bottom: 20px; }
    .panel { background: white; border-radius: 14px; padding: 16px; margin-bottom: 0; box-shadow: 0 2px 10px rgba(15,23,42,0.08); border: 1px solid rgba(215,222,232,0.86); }
    button { padding: 10px 13px; margin-right: 8px; margin-top: 4px; border: none; border-radius: 10px; cursor: pointer; background: #2563eb; color: white; font-weight: 850; }
    button.stop { background: #dc2626; }
    button.gray { background: #475569; }
    button.orange { background: #ea580c; }
    input { width: 80px; padding: 8px; margin: 4px; border: 1px solid #cbd5e1; border-radius: 6px; }
    table { width: 100%; border-collapse: collapse; background: white; margin-top: 10px; }
    th, td { border: 1px solid #e2e8f0; padding: 10px; text-align: center; }
    th { background: #f1f5f9; font-size: 13px; }
    tr.selected-row { background:#eff6ff; }
    tr.clickable { cursor:pointer; }
    .state { font-weight: bold; }
    .small { color: #64748b; font-size: 13px; line-height: 1.8; }
    .align-value { display: inline-block; width: 85px; text-align: right; font-family: monospace; font-size: 14px; }
    .elapsed-value { font-weight: bold; color: #ea580c; font-family: monospace; font-size: 14px; }
    .highlight-perf { font-weight: bold; color: #16a34a; }
    .highlight-cum { font-weight: bold; color: #ea580c; }
    .highlight-jitter { font-weight: bold; color: #dc2626; }
    .disabled-text { color: #cbd5e1; font-style: italic; text-decoration: line-through; display: inline-block; width: 85px; text-align: right; }
    .chart-container { position: relative; height: 320px; width: 100%; }
    .notice { background:#fff7ed; color:#9a3412; border:1px solid #fed7aa; border-radius:8px; padding:12px; font-size:13px; margin-bottom:12px; }
    .pill { display:inline-block; padding:2px 8px; border-radius:999px; background:#e0f2fe; color:#075985; font-weight:bold; }
    .config-bar { background: #f1f5f9; padding: 12px; border-radius: 8px; margin-bottom: 12px; font-size: 13px; display: flex; align-items: center; flex-wrap: wrap; gap: 15px; }
    .config-bar input[type="number"] { width: 70px; padding: 4px 6px; margin: 0 4px; }
    #log { background: #0f172a; color: #dbeafe; padding: 12px; height: 160px; overflow-y: auto; border-radius: 8px; font-family: Consolas, monospace; font-size: 13px; white-space: pre-wrap; }
    header { padding: 12px 16px; background: #0f172a; color: white; position: sticky; top: 0; z-index: 20; box-shadow: 0 3px 14px rgba(15,23,42,0.25); }
    .split { display:flex; justify-content:space-between; gap: 12px; align-items:center; flex-wrap: wrap; }
    .legacy-topbar-title { font-weight: 900; letter-spacing: -0.02em; font-size:21px; }
    .legacy-topbar-subtitle { color: #cbd5e1; font-size: 13px; margin-top: 4px; }
    .header-actions { display:flex; gap: 8px; align-items:center; justify-content:space-between; flex-wrap:wrap; flex: 1 1 560px; }
    .header-main-actions { display:flex; gap: 8px; flex-wrap: wrap; align-items:center; }
    .header-actions a { text-decoration: none; }
    .header-actions button { margin: 0; padding: 9px 12px; white-space: nowrap; }
    .header-actions button.light { background: #e2e8f0; color:#334155; }
    .header-channel-box { display:flex; gap:7px; align-items:center; background:#1e293b; border:1px solid #334155; border-radius:12px; padding:6px 8px; }
    .header-channel-box label { color:#cbd5e1; margin:0; font-size:11px; white-space:nowrap; font-weight:800; }
    .header-channel-box select { width:auto; min-width:150px; padding:8px 10px; font-size:14px; border-radius:10px; border:1px solid #cbd5e1; background:white; }
    .primary-nav-link { display:inline-flex; margin-right: 28px !important; flex: 0 0 auto; }
    .launcher-link { margin-left:auto; }
    .compact-status { display:grid; grid-template-columns: repeat(4, minmax(140px, 1fr)); gap: 10px; margin-top: 12px; }
    .compact-card { background:#f8fafc; border:1px solid #d7dee8; border-radius:12px; padding:10px; min-height:64px; }
    .compact-card .label { color:#64748b; font-size:11px; font-weight:800; text-transform:uppercase; letter-spacing:.02em; }
    .compact-card .value { font-family:Consolas, monospace; font-weight:900; font-size:15px; margin-top:6px; overflow-wrap:anywhere; }
    .section-title { display:flex; justify-content:space-between; align-items:center; gap:10px; flex-wrap:wrap; margin-bottom:12px; }
    .section-title h2 { margin:0; }
    .target-grid { display:grid; grid-template-columns: repeat(auto-fit, minmax(118px, 1fr)); gap:10px; }
    .target-cell { background:#f8fafc; border:1px solid #e2e8f0; border-radius:10px; padding:8px; }
    .target-cell label { display:block; color:#64748b; font-size:11px; font-weight:800; margin-bottom:4px; }
    .target-cell input { width:100%; margin:0; }
    .table-wrap { overflow-x:auto; }
    @media (max-width: 680px) {
      header { padding: 8px 10px; }
      .legacy-page { padding: 10px; }
      .legacy-topbar-title { font-size: 17px; }
      .legacy-topbar-subtitle { font-size: 11px; margin-top: 2px; }
      .split { gap: 7px; }
      .header-actions { flex-basis: 100%; flex-wrap: nowrap; gap: 5px; align-items:center; }
      .header-main-actions { flex: 1 1 auto; width:auto; display:flex; flex-wrap: nowrap; gap: 5px; min-width:0; }
      .header-actions button { width:auto; padding: 7px 8px; font-size: 13.5px; border-radius: 9px; line-height: 1.15; }
      .header-channel-box { flex: 0 1 142px; gap: 4px; padding: 3px 4px; border-radius: 8px; min-width: 110px; }
      .header-channel-box label { display:none; }
      .header-channel-box select { flex:1; min-width:0; width:100%; padding: 6px 6px; font-size: 13px; border-radius: 7px; }
      .primary-nav-link { display:inline-flex; margin-right: 22px !important; flex: 0 0 auto; }
      .launcher-link { margin-left:auto; flex:0 0 auto; width:auto; }
      .launcher-link button { width:auto; }
      .compact-status { grid-template-columns: repeat(2, minmax(0, 1fr)); }
    }
  </style>
</head>
<body>
<header>
  <div class="split">
    <div>
      <div class="legacy-topbar-title">KV260 Heater Demo</div>
      <div class="legacy-topbar-subtitle">A53 Web Gateway | Legacy diagnostics, full trend, batch target setting</div>
    </div>
    <div class="header-actions">
      <div class="header-main-actions">
        <a href="/setup" class="primary-nav-link"><button class="light">Setup UI</button></a>
        <button onclick="sendCommand({cmd:'start_control'})">Start</button>
        <button class="stop" onclick="sendCommand({cmd:'stop_control'})">Stop</button>
        <div class="header-channel-box">
          <label for="legacy_channel_select">Channel</label>
          <select id="legacy_channel_select" onchange="selectLegacyChannel(Number(this.value))"></select>
        </div>
      </div>
      <a href="/" class="launcher-link"><button class="light">Launcher</button></a>
    </div>
  </div>
</header>

<main class="legacy-page">

  <section class="panel">
    <div class="section-title"><h2>Server & Performance Info</h2><span class="pill">Legacy View</span></div>
    <div class="small">
      Server: <span id="server_name">-</span>, Version: <span id="server_version">-</span>, Channel Count: <span id="channel_count">-</span><br/>
      <b>⏱️ 서버 가동 시간: <span id="total_elapsed" class="elapsed-value">-</span></b>
    </div>

    <table>
      <thead>
        <tr>
          <th>Loop Layer</th><th>최근 10s 평균 주기</th><th>전역 누적 평균 주기</th><th>실시간 Jitter 편차</th><th>Jitter 절대값 최댓값</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td style="text-align:left; font-weight:bold; color:#2563eb;">🚀 Fast plant loop (<span id="cfg_fast_period">-</span>ms)</td>
          <td><span id="fast_avg" class="align-value highlight-perf">-</span> ms</td>
          <td><span id="fast_cum" class="align-value highlight-cum">-</span> ms</td>
          <td><span id="fast_rt_jit" class="align-value highlight-jitter">-</span> ms</td>
          <td><span id="fast_max_jit" class="align-value highlight-jitter">-</span> ms</td>
        </tr>
        <tr>
          <td style="text-align:left; font-weight:bold; color:#475569;">🌐 WebSocket broadcast loop (<span id="cfg_slow_period">-</span>ms)</td>
          <td><span id="slow_avg" class="align-value highlight-perf">-</span> ms</td>
          <td><span id="slow_cum" class="align-value highlight-cum">-</span> ms</td>
          <td><span id="slow_rt_jit" class="align-value highlight-jitter">-</span> ms</td>
          <td><span id="slow_max_jit" class="align-value highlight-jitter">-</span> ms</td>
        </tr>
      </tbody>
    </table>
    <br/>

    <div class="small" style="background:#f0fdf4; padding:10px 16px; border-radius:8px; display:flex; gap:20px; color:#166534; font-weight:bold; border:1px solid #bbf7d0; flex-wrap:wrap;">
      <div>⚙️ Phase Mode: <span id="phase_mode_ui" style="color:#2563eb;">-</span></div>
      <div>⚡ Applied Offset/Delay: <span id="applied_offset_ui" style="color:#ea580c;">-</span> ms</div>
      <div>🛡️ Collision Avoid: <span id="avoid_count_ui" style="color:#dc2626;">0</span> 회</div>
      <div>Nearest Fast Tick: <span id="nearest_tick_ui" style="color:#dc2626;">-</span> ms</div>
      <div>Injected Delay: <span id="actual_delay_ui" style="color:#dc2626;">-</span> ms</div>
    </div>
    <br/>

    <button class="orange" onclick="sendCommand({cmd: 'reset_max_jitter'})">Reset Max Jitter</button>
    <button class="gray" onclick="sendCommand({cmd: 'toggle_perf_display'})">Toggle Extended Metrics</button>
  </section>

  <section class="legacy-grid">
    <div class="legacy-main">
      <section class="panel">
        <div class="section-title"><h2>Real-time High-Resolution Temperature Trend</h2><span id="chart_mode_label" class="pill">-</span></div>

    <div class="config-bar">
      <div>
        <b>📊 Chart Load:</b>
        <label style="margin-left:8px; font-weight:bold; cursor:pointer; color:#2563eb;">
          <input type="checkbox" id="chart_enabled" checked onchange="updateChartOptionsToServer()"> Graph On
        </label>
        <label style="margin-left:8px; font-weight:bold; cursor:pointer; color:#16a34a;">
          <input type="checkbox" id="chart_batch_enabled" checked onchange="updateChartOptionsToServer()"> 10ms Batch On
        </label>
        <span class="pill">Chart Options</span>
      </div>
      <div style="border-left: 1px solid #cbd5e1; height: 16px;"></div>
      <div>
        <b>📈 Y축:</b>
        <label style="margin-left:8px; font-weight:bold; cursor:pointer;">
          <input type="checkbox" id="y_auto" checked onchange="toggleYScaleUI()"> Auto
        </label>
        <span id="y_manual_inputs" style="display: none; margin-left:12px;">
          Min: <input type="number" id="y_min" value="15" onchange="applyChartSettings()"> °C |
          Max: <input type="number" id="y_max" value="100" onchange="applyChartSettings()"> °C
        </span>
      </div>
      <div style="border-left: 1px solid #cbd5e1; height: 16px;"></div>
      <div>
        <b>⏱️ X축:</b>
        표시 샘플 수: <input type="number" id="x_max_points" value="500" onchange="applyChartSettings()"> 개
      </div>
      <div style="border-left: 1px solid #cbd5e1; height: 16px;"></div>
      <div>
        <b>🧪 Loop Period:</b>
        Fast <input type="number" id="fast_period_ms" value="10" step="1"> ms |
        WS <input type="number" id="ws_period_ms" value="500" step="10"> ms
        <button class="gray" onclick="updateLoopPeriodsToServer()">Apply Periods</button>
      </div>
      <div style="border-left: 1px solid #cbd5e1; height: 16px;"></div>
      <div>
        <b>🛡️ Phase Staggering:</b>
        <label style="margin-left:6px; font-weight:bold; cursor:pointer; color:#2563eb;">
          <input type="checkbox" id="offset_auto" checked onchange="toggleOffsetUI()"> Auto
        </label>
        <span id="offset_manual_inputs" style="display:none; margin-left:10px;">
          Offset: <input type="number" id="manual_offset_ms" value="5.0" step="0.5"> ms
        </span>
        <button class="gray" onclick="updatePhaseOffsetToServer()">Apply Phase</button>
      </div>
    </div>

    <div id="chart_disabled_notice" class="notice" style="display:none;">
      그래프 기능이 꺼져 있습니다. 이 상태에서는 서버가 10ms chart history batch를 만들지 않고, 브라우저도 Chart.js 업데이트를 수행하지 않습니다.
    </div>
    <div id="chart_container" class="chart-container">
      <canvas id="realtimeChart"></canvas>
    </div>
      </section>
    </div>
    <div class="legacy-side">
      <section class="panel">
        <div class="section-title"><h2>System Control</h2><span id="system_state_pill" class="pill">STATE: -</span></div>
    <div>System State: <span id="system_state" class="state">-</span></div>
    <div class="small">Last Update: <span id="timestamp">-</span>, Seq: <span id="seq">-</span></div>
    <br />
    <button onclick="sendCommand({cmd: 'start_control'})">Start</button>
    <button class="stop" onclick="sendCommand({cmd: 'stop_control'})">Stop</button>
    <button class="gray" onclick="sendCommand({cmd: 'read_status'})">Read Status REST</button>
    <button class="gray" onclick="sendCommand({cmd: 'ping'})">Ping</button>
    <button class="gray" onclick="syncTargetInputsFromServer()">Sync Targets From Server</button>
      </section>

      <section class="panel">
        <div class="section-title"><h2>Target Temperature Setting</h2><button onclick="setTargets()">Set All Targets</button></div>
        <div id="target_inputs" class="target-grid"></div>
      </section>
    </div>
  </section>

  <section class="panel">
    <div class="section-title"><h2>Temperature Feedback via WebSocket Broadcast</h2><span class="pill">All Channels</span></div>
    <div class="table-wrap">
    <table>
      <thead>
        <tr>
          <th>CH</th><th>Enable</th><th>State</th><th>Target Temp [°C]</th><th>Current Temp [°C]</th><th>Output [%]</th><th>Fault</th>
        </tr>
      </thead>
      <tbody id="channel_table"></tbody>
    </table>
    </div>
  </section>

  <section class="panel">
    <div class="section-title"><h2>Client Log</h2><button class="gray" onclick="sendCommand({cmd: 'ping'})">Ping</button></div>
    <div id="log"></div>
  </section>
</main>

<script>
  let ws = null;
  let channelCount = 0;
  let targetInputsInitialized = false;
  let latestSnapshot = null;
  let myChart = null;
  let maxChartPoints = 500;
  let chartEnabled = true;
  let chartBatchEnabled = true;
  let channelSummarySignature = "";

  function log(msg) {
    const box = document.getElementById("log");
    const t = new Date().toLocaleTimeString();
    box.textContent += `[${t}] ${msg}\n`;
    box.scrollTop = box.scrollHeight;
  }

  function formatElapsedTime(totalSeconds) {
    const days = Math.floor(totalSeconds / 86400);
    const hours = Math.floor((totalSeconds % 86400) / 3600);
    const minutes = Math.floor((totalSeconds % 3600) / 60);
    const seconds = Math.floor(totalSeconds % 60);
    const timeStr = `${String(hours).padStart(2, '0')}:${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
    return days > 0 ? `${days} days ${timeStr}` : timeStr;
  }

  function applyChartVisibility() {
    const chartContainer = document.getElementById('chart_container');
    const disabledNotice = document.getElementById('chart_disabled_notice');
    const batchCheckbox = document.getElementById('chart_batch_enabled');
    const modeLabel = document.getElementById('chart_mode_label');

    if (batchCheckbox) batchCheckbox.disabled = !chartEnabled;

    if (!chartEnabled) {
      if (chartContainer) chartContainer.style.display = 'none';
      if (disabledNotice) disabledNotice.style.display = 'block';
      if (modeLabel) modeLabel.textContent = 'Graph OFF / no batch payload';
      if (myChart) {
        myChart.destroy();
        myChart = null;
      }
      return;
    }

    if (chartContainer) chartContainer.style.display = 'block';
    if (disabledNotice) disabledNotice.style.display = 'none';
    if (modeLabel) {
      modeLabel.textContent = chartBatchEnabled ? 'Graph ON / 10ms batch' : 'Graph ON / slow snapshot only';
    }
  }

  function syncChartOptionsFromSnapshot(snapshot) {
    if (snapshot.chart_enabled !== undefined) chartEnabled = !!snapshot.chart_enabled;
    if (snapshot.chart_batch_enabled !== undefined) chartBatchEnabled = !!snapshot.chart_batch_enabled;

    const chartEnabledBox = document.getElementById('chart_enabled');
    const chartBatchBox = document.getElementById('chart_batch_enabled');
    if (chartEnabledBox) chartEnabledBox.checked = chartEnabled;
    if (chartBatchBox) chartBatchBox.checked = chartBatchEnabled;
    applyChartVisibility();
  }

  function appendChartPoint(label, channels) {
    if (!chartEnabled || !channels) return;
    if (!myChart) initChart(channels);
    if (!myChart) return;

    myChart.data.labels.push(label);
    channels.forEach((chData, idx) => {
      if (myChart.data.datasets[idx]) {
        myChart.data.datasets[idx].data.push(chData.current_temp);
      }
    });

    if (myChart.data.labels.length > maxChartPoints) {
      myChart.data.labels.shift();
      myChart.data.datasets.forEach(dataset => dataset.data.shift());
    }
  }

  function initChart(channels) {
    const ctx = document.getElementById('realtimeChart').getContext('2d');
    const colors = ['#2563eb', '#dc2626', '#16a34a', '#ea580c', '#9333ea', '#06b6d4', '#4b5563', '#b45309'];
    const datasets = channels.map((ch, idx) => ({
      label: `CH${ch.ch}`,
      data: [],
      borderColor: colors[idx % colors.length],
      borderWidth: 2,
      pointRadius: 0,
      fill: false,
      tension: 0.05
    }));

    myChart = new Chart(ctx, {
      type: 'line',
      data: { labels: [], datasets: datasets },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        animation: false,
        normalized: true,
        scales: {
          x: { display: true, ticks: { maxTicksLimit: 10 } },
          y: { display: true }
        }
      }
    });
    applyChartSettings();
  }

  function toggleYScaleUI() {
    const isAuto = document.getElementById('y_auto').checked;
    document.getElementById('y_manual_inputs').style.display = isAuto ? 'none' : 'inline';
    applyChartSettings();
  }

  function toggleOffsetUI() {
    const isAuto = document.getElementById('offset_auto').checked;
    document.getElementById('offset_manual_inputs').style.display = isAuto ? 'none' : 'inline';
  }

  function applyChartSettings() {
    if (!myChart) return;
    const isAuto = document.getElementById('y_auto').checked;
    if (isAuto) {
      myChart.options.scales.y.min = undefined;
      myChart.options.scales.y.max = undefined;
    } else {
      myChart.options.scales.y.min = Number(document.getElementById('y_min').value);
      myChart.options.scales.y.max = Number(document.getElementById('y_max').value);
    }

    let xInput = Number(document.getElementById('x_max_points').value);
    if (xInput > 5000) xInput = 5000;
    if (xInput < 50) xInput = 50;
    document.getElementById('x_max_points').value = xInput;
    maxChartPoints = xInput;
    myChart.update('none');
  }

  function updateChartFromSnapshot(snapshot) {
    if (!chartEnabled) return;

    if (chartBatchEnabled && snapshot.chart_history_batch && snapshot.chart_history_batch.length > 0) {
      snapshot.chart_history_batch.forEach(packet => {
        const label = packet.t_rel_sec !== undefined ? `${Number(packet.t_rel_sec).toFixed(2)}s` : `${packet.seq}`;
        appendChartPoint(label, packet.channels);
      });
    } else if (!chartBatchEnabled && snapshot.channels && snapshot.channels.length > 0) {
      const label = snapshot.total_elapsed_sec !== undefined ? `${Number(snapshot.total_elapsed_sec).toFixed(1)}s` : `${snapshot.seq}`;
      appendChartPoint(label, snapshot.channels);
    }

    if (myChart) myChart.update('none');
  }

  let selectedLegacyChannel = 1;

  function ensureTargetInputs(count) {
    if (channelCount === count) return;
    channelCount = count;
    targetInputsInitialized = false;
    const box = document.getElementById("target_inputs");
    const select = document.getElementById("legacy_channel_select");
    box.innerHTML = "";
    if (select) select.innerHTML = "";
    for (let i = 1; i <= count; i++) {
      const cell = document.createElement("div");
      cell.className = "target-cell";
      const label = document.createElement("label");
      label.textContent = `CH${i} Target`;
      const input = document.createElement("input");
      input.id = `target${i}`;
      input.type = "number";
      input.value = "60";
      input.step = "0.1";
      cell.appendChild(label);
      cell.appendChild(input);
      box.appendChild(cell);
      if (select) {
        const opt = document.createElement("option");
        opt.value = String(i);
        opt.textContent = `CH${i}`;
        select.appendChild(opt);
      }
    }
    selectedLegacyChannel = Math.min(Math.max(selectedLegacyChannel, 1), Math.max(count, 1));
    if (select) select.value = String(selectedLegacyChannel);
  }

  function selectLegacyChannel(ch) {
    selectedLegacyChannel = ch;
    const select = document.getElementById("legacy_channel_select");
    if (select) select.value = String(ch);
    const input = document.getElementById(`target${ch}`);
    if (input) {
      input.focus({preventScroll: true});
      input.select();
    }
    renderLegacySelectionHighlight();
  }

  function renderLegacySelectionHighlight() {
    document.querySelectorAll('#channel_table tr').forEach(row => {
      row.classList.toggle('selected-row', Number(row.dataset.ch) === selectedLegacyChannel);
    });
  }

  function initializeTargetInputsOnce(channels) {
    if (targetInputsInitialized) return;
    for (const ch of channels) {
      const input = document.getElementById(`target${ch.ch}`);
      if (input) input.value = ch.target_temp.toFixed(1);
    }
    targetInputsInitialized = true;
    log("Target inputs initialized from server snapshot");
  }

  function syncDevInputsFromSnapshot(snapshot) {
    syncChartOptionsFromSnapshot(snapshot);
    if (!snapshot.config) return;
    document.getElementById('fast_period_ms').value = (snapshot.config.control_period_sec * 1000).toFixed(3);
    document.getElementById('ws_period_ms').value = (snapshot.config.websocket_send_period_sec * 1000).toFixed(3);

    if (snapshot.auto_phase_offset !== undefined) {
      document.getElementById('offset_auto').checked = snapshot.auto_phase_offset;
      toggleOffsetUI();
    }
    if (snapshot.manual_phase_offset_ms !== undefined) {
      document.getElementById('manual_offset_ms').value = Number(snapshot.manual_phase_offset_ms).toFixed(3);
    }
  }

  function renderSnapshot(snapshot) {
    latestSnapshot = snapshot;
    syncChartOptionsFromSnapshot(snapshot);
    updateChartFromSnapshot(snapshot);

    document.getElementById("system_state").textContent = snapshot.system_state;
    const statePill = document.getElementById("system_state_pill");
    if (statePill) statePill.textContent = `STATE: ${snapshot.system_state}`;
    document.getElementById("timestamp").textContent = snapshot.timestamp;
    document.getElementById("seq").textContent = snapshot.seq;

    if (snapshot.phase_mode !== undefined) document.getElementById("phase_mode_ui").textContent = snapshot.phase_mode;
    if (snapshot.applied_phase_offset_ms !== undefined) document.getElementById("applied_offset_ui").textContent = Number(snapshot.applied_phase_offset_ms).toFixed(3);
    if (snapshot.collision_avoid_count !== undefined) document.getElementById("avoid_count_ui").textContent = snapshot.collision_avoid_count;
    if (snapshot.nearest_fast_tick_distance_ms !== undefined) document.getElementById("nearest_tick_ui").textContent = Number(snapshot.nearest_fast_tick_distance_ms).toFixed(3);
    if (snapshot.actual_collision_delay_ms !== undefined) document.getElementById("actual_delay_ui").textContent = Number(snapshot.actual_collision_delay_ms).toFixed(3);

    if (snapshot.total_elapsed_sec !== undefined) document.getElementById("total_elapsed").textContent = formatElapsedTime(snapshot.total_elapsed_sec);

    if (snapshot.config) {
      document.getElementById("server_name").textContent = snapshot.config.server_name;
      document.getElementById("server_version").textContent = snapshot.config.server_version;
      document.getElementById("channel_count").textContent = snapshot.config.channel_count;
      document.getElementById("cfg_fast_period").textContent = (snapshot.config.control_period_sec * 1000).toFixed(3);
      document.getElementById("cfg_slow_period").textContent = (snapshot.config.websocket_send_period_sec * 1000).toFixed(3);
    }

    const extEnabled = snapshot.extended_enabled;

    if (snapshot.fast_perf) {
      document.getElementById("fast_avg").textContent = snapshot.fast_perf.avg_period_10s.toFixed(3);
      const fCum = document.getElementById("fast_cum"), fRt = document.getElementById("fast_rt_jit"), fMax = document.getElementById("fast_max_jit");
      if (extEnabled) {
        fCum.className = "align-value highlight-cum"; fCum.textContent = snapshot.fast_perf.cum_avg_period.toFixed(3);
        fRt.className = "align-value highlight-jitter"; fRt.textContent = snapshot.fast_perf.realtime_jitter_ms_str;
        fMax.className = "align-value highlight-jitter"; fMax.textContent = snapshot.fast_perf.max_abs_jitter_ms.toFixed(3);
      } else {
        fCum.className = fRt.className = fMax.className = "disabled-text"; fCum.textContent = fRt.textContent = fMax.textContent = "Muted";
      }
    }

    if (snapshot.slow_perf) {
      document.getElementById("slow_avg").textContent = snapshot.slow_perf.avg_period_10s.toFixed(3);
      const sCum = document.getElementById("slow_cum"), sRt = document.getElementById("slow_rt_jit"), sMax = document.getElementById("slow_max_jit");
      if (extEnabled) {
        sCum.className = "align-value highlight-cum"; sCum.textContent = snapshot.slow_perf.cum_avg_period.toFixed(3);
        sRt.className = "align-value highlight-jitter"; sRt.textContent = snapshot.slow_perf.realtime_jitter_ms_str;
        sMax.className = "align-value highlight-jitter"; sMax.textContent = snapshot.slow_perf.max_abs_jitter_ms.toFixed(3);
      } else {
        sCum.className = sRt.className = sMax.className = "disabled-text"; sCum.textContent = sRt.textContent = sMax.textContent = "Muted";
      }
    }

    const channels = snapshot.channels || [];
    ensureTargetInputs(channels.length);
    initializeTargetInputsOnce(channels);

    const tbody = document.getElementById("channel_table");
    tbody.innerHTML = "";
    for (const ch of channels) {
      const tr = document.createElement("tr");
      tr.dataset.ch = ch.ch;
      tr.className = "clickable";
      tr.onclick = () => selectLegacyChannel(ch.ch);
      tr.innerHTML = `<td>${ch.ch}</td><td>${ch.enable}</td><td>${ch.state}</td><td>${ch.target_temp.toFixed(1)}</td><td>${ch.current_temp.toFixed(2)}</td><td>${ch.output_percent.toFixed(1)}</td><td>${ch.fault_code}</td>`;
      tbody.appendChild(tr);
    }
    renderLegacySelectionHighlight();
  }

  function connectWebSocket() {
    const protocol = location.protocol === "https:" ? "wss" : "ws";
    const url = `${protocol}://${location.host}/ws/temperature`;
    ws = new WebSocket(url);
    ws.onopen = () => { log("WebSocket connected"); };
    ws.onmessage = (event) => { renderSnapshot(JSON.parse(event.data)); };
    ws.onclose = () => { log("WebSocket closed. reconnecting..."); setTimeout(connectWebSocket, 2000); };
    ws.onerror = () => { ws.close(); };
  }

  async function sendCommand(command) {
    log("REST TX: " + JSON.stringify(command));
    try {
      const response = await fetch("/api/cmd", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(command)
      });
      const data = await response.json();
      log("REST RX: " + JSON.stringify({ok: data.ok, message: data.message, error: data.error}));
      if (data.snapshot) renderSnapshot(data.snapshot);
      return data;
    } catch (err) {
      log("REST ERROR: " + err);
      return null;
    }
  }

  async function setTargets() {
    const targets = [];
    for (let i = 1; i <= channelCount; i++) {
      const input = document.getElementById(`target${i}`);
      if (!input) return;
      targets.push(Number(input.value));
    }
    await sendCommand({ cmd: "set_targets", targets: targets });
  }

  function syncTargetInputsFromServer() {
    if (!latestSnapshot || !latestSnapshot.channels) return;
    for (const ch of latestSnapshot.channels) {
      const input = document.getElementById(`target${ch.ch}`);
      if (input) input.value = ch.target_temp.toFixed(1);
    }
    log("Target inputs manually synced");
  }

  async function updateChartOptionsToServer() {
    const chartBox = document.getElementById('chart_enabled');
    const batchBox = document.getElementById('chart_batch_enabled');

    chartEnabled = chartBox ? chartBox.checked : true;
    chartBatchEnabled = chartEnabled && batchBox ? batchBox.checked : false;
    if (!chartEnabled && batchBox) batchBox.checked = false;
    applyChartVisibility();

    await sendCommand({
      cmd: "set_chart_options",
      chart_enabled: chartEnabled,
      chart_batch_enabled: chartBatchEnabled
    });
  }

  async function updatePhaseOffsetToServer() {
    const isAuto = document.getElementById('offset_auto').checked;
    let offsetValue = -1.0;
    if (!isAuto) {
      offsetValue = Number(document.getElementById('manual_offset_ms').value);
    }
    await sendCommand({ cmd: "set_phase_offset", value: offsetValue });
  }

  async function updateLoopPeriodsToServer() {
    const fastMs = Number(document.getElementById('fast_period_ms').value);
    const wsMs = Number(document.getElementById('ws_period_ms').value);
    await sendCommand({ cmd: "set_loop_periods", control_period_ms: fastMs, websocket_period_ms: wsMs });
  }

  connectWebSocket();
  sendCommand({cmd: "read_status"}).then(data => { if (data && data.snapshot) syncDevInputsFromSnapshot(data.snapshot); });
</script>
</body>
</html>
"""

SETUP_HTML_PAGE = r"""
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Protec Setup Console</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    :root {
      --bg: #eef2f7;
      --card: #ffffff;
      --ink: #17202c;
      --muted: #667085;
      --line: #d7dee8;
      --blue: #2563eb;
      --green: #16a34a;
      --red: #dc2626;
      --orange: #ea580c;
      --dark: #0f172a;
      --soft-blue: #eff6ff;
      --soft-green: #f0fdf4;
      --soft-red: #fef2f2;
      --soft-orange: #fff7ed;
    }
    * { box-sizing: border-box; }
    body { margin: 0; font-family: Arial, sans-serif; background: var(--bg); color: var(--ink); }
    header { padding: 12px 16px; background: var(--dark); color: white; position: sticky; top: 0; z-index: 20; box-shadow: 0 3px 14px rgba(15,23,42,0.25); }
    h1 { margin: 0; font-size: 21px; letter-spacing: -0.02em; }
    h2 { margin: 0 0 12px 0; font-size: 18px; }
    h3 { margin: 0 0 10px 0; font-size: 15px; }
    .subtitle { color: #cbd5e1; font-size: 13px; margin-top: 4px; }
    .page { padding: 16px; display: grid; gap: 16px; max-width: 1500px; margin: 0 auto; }
    .panel { background: var(--card); border-radius: 14px; padding: 16px; box-shadow: 0 2px 10px rgba(15, 23, 42, 0.08); border: 1px solid rgba(215, 222, 232, 0.86); }
    .split { display:flex; justify-content:space-between; gap: 12px; align-items:center; flex-wrap: wrap; }
    .muted { color: var(--muted); font-size: 13px; line-height: 1.55; }
    .pill { display:inline-flex; align-items:center; gap: 6px; padding: 5px 10px; border-radius: 999px; font-weight: 800; font-size: 12px; background: #e0f2fe; color: #075985; white-space: nowrap; }
    .pill.dark { background: #334155; color: #e2e8f0; }
    .pill.run { background: #dcfce7; color: #166534; }
    .pill.alarm { background: #fee2e2; color: #991b1b; }
    .pill.ready { background: #e0f2fe; color: #075985; }
    .pill.disabled { background: #e2e8f0; color: #475569; }
    .top-status-grid { display:grid; gap: 8px; }
    .status-row { display:grid; gap:8px; }
    .status-row-main { grid-template-columns: repeat(2, minmax(130px, 1fr)); }
    .status-row-triple { grid-template-columns: repeat(3, minmax(92px, 1fr)); }
    .status-card { background:#f8fafc; border:1px solid var(--line); border-radius:10px; padding: 8px 10px; min-height: 58px; }
    .status-card .label { color: var(--muted); font-size: 10px; font-weight: 800; text-transform: uppercase; letter-spacing: .02em; }
    .status-card .value { font-family: Consolas, monospace; font-weight: 900; font-size: 14px; margin-top: 5px; overflow-wrap: anywhere; }
    .status-card.emphasis { background: var(--soft-blue); border-color:#bfdbfe; }
    .control-row { display:flex; gap:8px; flex-wrap: wrap; margin-top: 12px; align-items:center; }
    .common-button-block { display:grid; gap:8px; margin-top:12px; }
    .common-button-row { display:flex; gap:8px; align-items:center; flex-wrap:nowrap; }
    .common-button-row button { flex: 0 0 auto; min-width: 112px; }
    .common-button-note { margin-top: 4px; }
    .header-actions { display:flex; gap: 8px; align-items:center; justify-content:space-between; flex-wrap:wrap; flex: 1 1 560px; }
    .header-main-actions { display:flex; gap: 8px; flex-wrap: wrap; align-items:center; }
    .header-actions a { text-decoration:none; }
    .launcher-link { margin-left:auto; }
    .header-actions select { width:auto; min-width: 150px; padding: 8px 10px; font-size: 14px; border-radius: 10px; }
    .header-channel-box { display:flex; gap:7px; align-items:center; background:#1e293b; border:1px solid #334155; border-radius:12px; padding:6px 8px; }
    .header-channel-box label { color:#cbd5e1; margin:0; font-size:11px; white-space:nowrap; }
    .header-actions button { padding: 9px 12px; white-space:nowrap; }
    button { padding: 10px 13px; border: none; border-radius: 10px; cursor: pointer; background: var(--blue); color: white; font-weight: 850; }
    button.stop { background: var(--red); }
    button.gray { background: #475569; }
    button.green { background: var(--green); }
    button.orange { background: var(--orange); }
    button.light { background: #e2e8f0; color:#334155; }
    button:disabled { opacity: .5; cursor: not-allowed; }
    input, select { width: 100%; padding: 10px 10px; border:1px solid #cbd5e1; border-radius: 10px; font-size: 15px; background:white; }
    input[type="checkbox"] { width: auto; transform: scale(1.2); margin-right: 8px; }
    label { display:block; font-size: 12px; color: var(--muted); font-weight: 800; margin-bottom: 5px; }
    .check-row { display:flex; align-items:center; padding: 11px; background:#f8fafc; border: 1px solid var(--line); border-radius: 10px; font-weight:800; }

    .channel-summary-grid { display:grid; grid-template-columns: repeat(auto-fit, minmax(230px, 1fr)); gap: 10px; }
    .channel-card { border: 2px solid transparent; border-radius: 14px; padding: 12px; background: #f8fafc; cursor: pointer; transition: border-color .12s ease, background-color .12s ease, box-shadow .12s ease; user-select: none; touch-action: pan-y; -webkit-tap-highlight-color: transparent; }
    .channel-card:hover { border-color: #93c5fd; background: #f1f5f9; }
    .channel-card:active { border-color: var(--blue); background: var(--soft-blue); }
    .channel-card.selected { border-color: var(--blue); background: var(--soft-blue); box-shadow: 0 0 0 3px rgba(37,99,235,.10); }
    .channel-card.disabled { opacity: 0.56; }
    .channel-card * { pointer-events: none; }
    .channel-title { display:flex; justify-content:space-between; align-items:center; gap: 8px; font-weight:900; }
    .channel-role { color: var(--muted); font-size: 12px; margin-top: 3px; }
    .mini-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 7px; margin-top: 10px; }
    .mini { background: white; border: 1px solid var(--line); border-radius: 9px; padding: 7px; text-align:center; }
    .mini .label { font-size: 10px; color: var(--muted); font-weight:800; }
    .mini .value { font-family: Consolas, monospace; font-weight: 900; margin-top: 2px; font-size: 14px; }

    .bottom-grid { display:grid; grid-template-columns: minmax(360px, .85fr) minmax(420px, 1.15fr); gap: 16px; align-items: stretch; }
    .detail-grid { display:grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 10px; }
    .metric { background:#f8fafc; border:1px solid var(--line); border-radius:12px; padding:10px; min-height: 68px; }
    .metric .label { color: var(--muted); font-size: 11px; font-weight:800; }
    .metric .value { font-size: 23px; font-weight: 900; font-family: Consolas, monospace; margin-top: 5px; }
    .metric .unit { font-size: 13px; color: var(--muted); margin-left: 3px; }
    .form-grid { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 10px; }
    .setting-list { display:grid; gap: 9px; margin-top: 14px; }
    .setting-row { display:grid; grid-template-columns: minmax(0, 1fr) auto; gap: 9px; align-items:end; padding: 9px; border:1px solid var(--line); border-radius:12px; background:#f8fafc; }
    .setting-row .check-row { padding: 10px; background:white; }
    .setting-row button { min-width: 116px; height: 42px; }
    .chart-container { position: relative; height: 360px; width: 100%; }
    .chart-toolbar { display:grid; grid-template-columns: repeat(4, minmax(0, 1fr)); gap: 10px; margin-top: 12px; }
    table { width: 100%; border-collapse: collapse; background: white; }
    th, td { border: 1px solid #e2e8f0; padding: 8px; text-align: center; font-size: 13px; }
    th { background: #f1f5f9; }
    tr.selected-row { background: var(--soft-blue); }
    tr.clickable { cursor: pointer; }
    #log { background: var(--dark); color: #dbeafe; padding: 12px; height: 130px; overflow-y: auto; border-radius: 10px; font-family: Consolas, monospace; font-size: 12px; white-space: pre-wrap; }
    details { border:1px solid var(--line); border-radius: 12px; background:#f8fafc; padding: 12px; }
    details > summary { cursor:pointer; font-weight: 900; }
    .eng-grid { display:grid; grid-template-columns: repeat(4, minmax(0, 1fr)); gap: 10px; margin-top:12px; }
    .danger-text { color: var(--red); font-weight:900; }
    .ok-text { color: var(--green); font-weight:900; }
    .notice { background:#fff7ed; color:#9a3412; border:1px solid #fed7aa; border-radius:10px; padding:12px; font-size:13px; }
    .primary-nav-link { display:inline-flex; margin-right: 28px !important; flex: 0 0 auto; }

    @media (max-width: 1180px) {
      .status-row-main { grid-template-columns: repeat(2, minmax(120px, 1fr)); }
      .status-row-triple { grid-template-columns: repeat(3, minmax(86px, 1fr)); }
      .bottom-grid { grid-template-columns: 1fr; }
      .chart-container { height: 320px; }
      .eng-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
    }
    @media (max-width: 680px) {
      header { padding: 8px 10px; }
      .page { padding: 10px; }
      .title { font-size: 17px; }
      .subtitle { font-size: 11px; margin-top: 2px; }
      .split { gap: 7px; }
      .status-row-main { grid-template-columns: repeat(2, minmax(0, 1fr)); }
      .status-row-triple { grid-template-columns: repeat(3, minmax(0, 1fr)); }
      .status-card { padding: 7px 7px; min-height: 52px; }
      .status-card .label { font-size: 9px; }
      .status-card .value { font-size: 12px; }
      .form-grid, .chart-toolbar, .eng-grid { grid-template-columns: 1fr; }
      .detail-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
      .metric .value { font-size: 20px; }
      .setting-row { grid-template-columns: minmax(0, 1fr) auto; }
      .mini-grid { grid-template-columns: repeat(2, 1fr); }
      button { width: 100%; }
      .header-actions { justify-content:flex-start; flex-basis:100%; flex-wrap: nowrap; gap: 5px; align-items:center; }
      .header-main-actions { flex: 1 1 auto; width:auto; display:flex; flex-wrap: nowrap; gap: 5px; min-width:0; }
      .header-actions button, .setting-row button { width: auto; }
      .header-actions button { padding: 7px 8px; font-size: 13.5px; border-radius: 9px; line-height: 1.15; }
      .primary-nav-link { display:inline-flex; margin-right: 22px !important; flex: 0 0 auto; }
      .header-channel-box { flex: 0 1 142px; gap: 4px; padding: 3px 4px; border-radius: 8px; min-width: 110px; }
      .header-channel-box label { display:none; }
      .header-channel-box select { flex:1; min-width:0; width:100%; padding: 6px 6px; font-size: 13px; border-radius: 7px; }
      .launcher-link { margin-left:auto; flex:0 0 auto; width:auto; }
      .launcher-link button { width:auto; }
      .common-button-block { gap: 7px; }
      .common-button-row { gap: 7px; }
      .common-button-row button { min-width: 0; flex: 1 1 0; padding: 8px 8px; font-size: 13.5px; }
      .control-row { display:grid; grid-template-columns: 1fr; }
      .chart-container { height: 250px; }
    }
  </style>
</head>
<body>
<header>
  <div class="split">
    <div>
      <h1 id="ui_title">Protec Setup Console</h1>
      <div class="subtitle">A53 Web Gateway | Common status → Channel summary → Selected channel detail</div>
    </div>
    <div class="header-actions">
      <div class="header-main-actions">
        <a href="/legacy" class="primary-nav-link"><button class="light">Legacy UI</button></a>
        <button onclick="sendCommand({cmd:'start_control'})">Start</button>
        <button class="stop" onclick="sendCommand({cmd:'stop_control'})">Stop</button>
        <div class="header-channel-box">
          <label for="selected_channel_select">Channel</label>
          <select id="selected_channel_select" onchange="selectChannel(Number(this.value))"></select>
        </div>
      </div>
      <a href="/" class="launcher-link"><button class="light">Launcher</button></a>
    </div>
  </div>
</header>

<div class="page">
  <section class="panel">
    <div class="split">
      <h2>Common Parameters <span class="muted">/ compact</span></h2>
      <div class="control-row" style="margin-top:0;">
        <span id="conn_pill" class="pill dark">WS: connecting</span>
        <span id="state_pill" class="pill ready">STATE: -</span>
      </div>
    </div>
    <div class="top-status-grid" style="margin-top:12px;">
      <div class="status-row status-row-main">
        <div class="status-card emphasis"><div class="label">Server</div><div id="server_name" class="value">-</div></div>
        <div class="status-card"><div class="label">Version</div><div id="server_version" class="value">-</div></div>
      </div>
      <div class="status-row status-row-triple">
        <div class="status-card"><div class="label">Channels</div><div id="channel_count" class="value">-</div></div>
        <div class="status-card"><div class="label">Elapsed</div><div id="elapsed" class="value">-</div></div>
        <div class="status-card"><div class="label">Seq</div><div id="seq" class="value">-</div></div>
      </div>
      <div class="status-row status-row-triple">
        <div class="status-card"><div class="label">Fast Loop</div><div id="fast_period" class="value">-</div></div>
        <div class="status-card"><div class="label">WS Period</div><div id="ws_period" class="value">-</div></div>
        <div class="status-card"><div class="label">Phase</div><div id="phase_mode" class="value">-</div></div>
      </div>
    </div>
    <div class="common-button-block">
      <div class="common-button-row">
        <button onclick="sendCommand({cmd:'start_control'})">Start</button>
        <button class="stop" onclick="sendCommand({cmd:'stop_control'})">Stop</button>
      </div>
      <div class="common-button-row">
        <button class="gray" onclick="sendCommand({cmd:'read_status'})">Read Status</button>
        <button class="orange" onclick="sendCommand({cmd:'reset_fault'})">Reset Fault</button>
        <button class="green" onclick="sendCommand({cmd:'save_config'})">Save Config</button>
      </div>
      <div class="muted common-button-note">공통 운전 상태와 개발 파라미터는 위쪽에 고정해서, 채널을 바꿔도 시야가 흩어지지 않게 했습니다.</div>
    </div>
  </section>

  <section class="panel">
    <div class="split">
      <div>
        <h2>Channel Summary</h2>
        <div class="muted">PC는 클릭, 태블릿은 짧은 탭으로 선택합니다. 손가락으로 카드를 잡고 스크롤할 때는 선택하지 않습니다.</div>
      </div>
      <span id="selected_channel_pill" class="pill">Selected CH-</span>
    </div>
    <div id="channel_summary" class="channel-summary-grid" style="margin-top:12px;"></div>
    <div style="margin-top:14px; overflow-x:auto;">
      <table>
        <thead>
          <tr><th>CH</th><th>Name</th><th>Role</th><th>Enable</th><th>State</th><th>SV</th><th>PV</th><th>Output</th><th>Kp</th><th>Fault</th></tr>
        </thead>
        <tbody id="overview_table"></tbody>
      </table>
    </div>
  </section>

  <section class="bottom-grid">
    <div class="panel">
      <div class="split">
        <div>
          <h2 id="detail_title">Selected Channel Detail</h2>
          <div id="detail_subtitle" class="muted">-</div>
        </div>
        <span id="detail_state" class="pill ready">-</span>
      </div>

      <div class="detail-grid" style="margin-top:14px;">
        <div class="metric"><div class="label">PV Current</div><div><span id="detail_pv" class="value">-</span><span id="pv_unit" class="unit">°C</span></div></div>
        <div class="metric"><div class="label">SV Target</div><div><span id="detail_sv" class="value">-</span><span id="sv_unit" class="unit">°C</span></div></div>
        <div class="metric"><div class="label">Output</div><div><span id="detail_out" class="value">-</span><span class="unit">%</span></div></div>
        <div class="metric"><div class="label">Fault</div><div><span id="detail_fault" class="value">-</span></div></div>
      </div>

      <div class="setting-list">
        <div class="setting-row">
          <div class="check-row">
            <input id="selected_enable" type="checkbox" /> Channel Enable
          </div>
          <button class="orange" onclick="applySelectedEnable()">Apply</button>
        </div>
        <div class="setting-row">
          <div>
            <label>Target Temperature</label>
            <input id="selected_target" type="number" step="0.1" />
          </div>
          <button onclick="applySelectedTarget()">Apply</button>
        </div>
        <div class="setting-row">
          <div>
            <label>Kp Gain</label>
            <input id="selected_kp" type="number" step="0.1" />
          </div>
          <button class="gray" onclick="applySelectedKp()">Apply</button>
        </div>
      </div>
      <div class="control-row">
        <button class="light" onclick="syncSelectedInputs()">Sync From Server</button>
      </div>
    </div>

    <div class="panel">
      <div class="split">
        <div>
          <h2>Selected Channel Trend</h2>
          <div class="muted">그래프는 선택 채널 1개만 표시합니다. 셋업 단말에서는 이쪽이 더 읽기 쉽고 부담도 적습니다.</div>
        </div>
        <span id="chart_mode_label" class="pill">-</span>
      </div>
      <div id="chart_disabled_notice" class="notice" style="display:none; margin-top:12px;">그래프 기능이 꺼져 있습니다. 서버 chart history batch 생성/전송도 줄입니다.</div>
      <div id="chart_container" class="chart-container" style="margin-top:12px;"><canvas id="realtimeChart"></canvas></div>
      <div class="chart-toolbar">
        <div class="check-row"><input type="checkbox" id="chart_enabled" checked onchange="updateChartOptionsToServer()" /> Graph On</div>
        <div class="check-row"><input type="checkbox" id="chart_batch_enabled" checked onchange="updateChartOptionsToServer()" /> 10ms Batch</div>
        <div><label>Samples</label><input id="x_max_points" type="number" value="500" onchange="applyChartSettings()" /></div>
        <div class="check-row"><input type="checkbox" id="y_auto" checked onchange="toggleYScaleUI()" /> Y Auto</div>
      </div>
      <div id="y_manual_inputs" class="form-grid" style="display:none; margin-top:10px;">
        <div><label>Y Min</label><input type="number" id="y_min" value="15" onchange="applyChartSettings()" /></div>
        <div><label>Y Max</label><input type="number" id="y_max" value="100" onchange="applyChartSettings()" /></div>
      </div>
    </div>
  </section>

  <details>
    <summary>Engineering Diagnostics / Client Log</summary>
    <div class="eng-grid">
      <div><label>Fast Control Period [ms]</label><input type="number" id="fast_period_ms" value="10" step="1" /></div>
      <div><label>WebSocket Period [ms]</label><input type="number" id="ws_period_ms" value="500" step="10" /></div>
      <div class="check-row"><input type="checkbox" id="offset_auto" checked onchange="toggleOffsetUI()" /> Auto Phase Offset</div>
      <div id="offset_manual_inputs" style="display:none;"><label>Manual Offset [ms]</label><input type="number" id="manual_offset_ms" value="5.0" step="0.5" /></div>
    </div>
    <div class="control-row">
      <button onclick="updateLoopPeriodsToServer()">Apply Periods</button>
      <button class="gray" onclick="updatePhaseOffsetToServer()">Apply Phase</button>
      <button class="orange" onclick="sendCommand({cmd:'reset_max_jitter'})">Reset Jitter</button>
      <button class="gray" onclick="sendCommand({cmd:'toggle_perf_display'})">Toggle Extended Metrics</button>
    </div>
    <div style="margin-top:12px; overflow-x:auto;">
      <table>
        <thead><tr><th>Layer</th><th>Avg 10s [ms]</th><th>Cum Avg [ms]</th><th>Realtime Jitter [ms]</th><th>Max Abs Jitter [ms]</th></tr></thead>
        <tbody>
          <tr><td>Fast Plant Loop</td><td id="fast_avg">-</td><td id="fast_cum">-</td><td id="fast_rt_jit">-</td><td id="fast_max_jit">-</td></tr>
          <tr><td>WebSocket Loop</td><td id="slow_avg">-</td><td id="slow_cum">-</td><td id="slow_rt_jit">-</td><td id="slow_max_jit">-</td></tr>
        </tbody>
      </table>
    </div>
    <div class="control-row">
      <span class="pill">Applied <span id="applied_offset_ui">-</span> ms</span>
      <span class="pill alarm">Collision <span id="avoid_count_ui">0</span></span>
      <span class="pill">Nearest <span id="nearest_tick_ui">-</span> ms</span>
      <span class="pill">Delay <span id="actual_delay_ui">-</span> ms</span>
    </div>
    <div id="log" style="margin-top:12px;"></div>
  </details>
</div>

<script>
  let ws = null;
  let latestSnapshot = null;
  let selectedCh = 1;
  let selectedInputsDirty = false;
  let myChart = null;
  let maxChartPoints = 500;
  let chartEnabled = true;
  let chartBatchEnabled = true;
  let channelSummarySignature = "";

  function $(id) { return document.getElementById(id); }

  function log(msg) {
    const box = $("log");
    if (!box) return;
    const t = new Date().toLocaleTimeString();
    box.textContent += `[${t}] ${msg}
`;
    box.scrollTop = box.scrollHeight;
  }

  function fmt(value, digits=1) {
    const n = Number(value);
    return Number.isFinite(n) ? n.toFixed(digits) : "-";
  }

  function formatElapsedTime(totalSeconds) {
    const s = Math.floor(Number(totalSeconds) || 0);
    const days = Math.floor(s / 86400);
    const hours = Math.floor((s % 86400) / 3600);
    const minutes = Math.floor((s % 3600) / 60);
    const seconds = s % 60;
    const timeStr = `${String(hours).padStart(2, '0')}:${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
    return days > 0 ? `${days}d ${timeStr}` : timeStr;
  }

  function stateClass(state, fault, enabled=true) {
    if (!enabled) return "disabled";
    if (fault && Number(fault) !== 0) return "alarm";
    if (state === "RUN") return "run";
    return "ready";
  }

  function getSelectedChannel() {
    if (!latestSnapshot || !latestSnapshot.channels) return null;
    return latestSnapshot.channels.find(ch => Number(ch.ch) === Number(selectedCh)) || latestSnapshot.channels[0] || null;
  }

  function selectChannel(ch) {
    selectedCh = Number(ch);
    selectedInputsDirty = false;
    if (latestSnapshot) renderSnapshot(latestSnapshot);
    rebuildChart();
  }

  function syncSelectedInputs(options = {}) {
    const ch = getSelectedChannel();
    if (!ch) return;
    $("selected_target").value = fmt(ch.target_temp, 1);
    $("selected_kp").value = fmt(ch.kp, 1);
    $("selected_enable").checked = !!ch.enable;
    selectedInputsDirty = false;
    if (!options.silent) log(`CH${ch.ch} inputs synced from server`);
  }

  function bindTapSelect(card, chNumber) {
    let startX = 0;
    let startY = 0;
    let startTime = 0;
    let moved = false;
    const MOVE_LIMIT_PX = 14;
    const LONG_TOUCH_MS = 700;

    card.tabIndex = 0;

    card.addEventListener("pointerdown", (event) => {
      startX = event.clientX;
      startY = event.clientY;
      startTime = Date.now();
      moved = false;
    });

    card.addEventListener("pointermove", (event) => {
      const dx = Math.abs(event.clientX - startX);
      const dy = Math.abs(event.clientY - startY);
      if (dx > MOVE_LIMIT_PX || dy > MOVE_LIMIT_PX) moved = true;
    });

    card.addEventListener("pointercancel", () => { moved = true; });

    card.addEventListener("pointerup", (event) => {
      const dx = Math.abs(event.clientX - startX);
      const dy = Math.abs(event.clientY - startY);
      const elapsed = Date.now() - startTime;
      const isShortTap = !moved && dx <= MOVE_LIMIT_PX && dy <= MOVE_LIMIT_PX && elapsed <= LONG_TOUCH_MS;
      if (!isShortTap) return;
      selectChannel(chNumber);
    });

    card.addEventListener("keydown", (event) => {
      if (event.key === "Enter" || event.key === " ") {
        event.preventDefault();
        selectChannel(chNumber);
      }
    });
  }

  window.addEventListener("load", () => {
    ["selected_target", "selected_kp", "selected_enable"].forEach(id => {
      const el = $(id);
      if (el) {
        el.addEventListener("input", () => { selectedInputsDirty = true; });
        el.addEventListener("change", () => { selectedInputsDirty = true; });
      }
    });
    connectWebSocket();
    sendCommand({cmd: "read_status"});
  });

  function renderHeader(snapshot) {
    const cfg = snapshot.config || {};
    $("ui_title").textContent = cfg.server_name || "Protec Setup Console";
    $("server_name").textContent = cfg.server_name || "-";
    $("server_version").textContent = cfg.server_version || "-";
    $("channel_count").textContent = `${(snapshot.channels || []).length} CH`;
    $("elapsed").textContent = formatElapsedTime(snapshot.total_elapsed_sec);
    $("seq").textContent = snapshot.seq ?? "-";
    $("fast_period").textContent = cfg.control_period_sec !== undefined ? `${(cfg.control_period_sec * 1000).toFixed(1)} ms` : "-";
    $("ws_period").textContent = cfg.websocket_send_period_sec !== undefined ? `${(cfg.websocket_send_period_sec * 1000).toFixed(1)} ms` : "-";
    $("phase_mode").textContent = snapshot.phase_mode || "-";
    const statePill = $("state_pill");
    statePill.textContent = `STATE: ${snapshot.system_state || '-'}`;
    statePill.className = `pill ${snapshot.system_state === 'RUN' ? 'run' : 'ready'}`;
  }

  function renderChannelSummary(channels) {
    const box = $("channel_summary");
    const select = $("selected_channel_select");
    if (!box || !select) return;

    // WebSocket snapshot이 0.5s마다 들어오므로 카드 DOM을 매번 갈아엎으면
    // hover/click 순간에 카드가 재생성되어 미세한 떨림과 클릭 씹힘이 생길 수 있다.
    // 채널 구성 자체가 바뀐 경우에만 rebuild하고, 평소에는 기존 DOM의 텍스트만 갱신한다.
    const signature = channels.map(ch => `${ch.ch}|${ch.name || ''}|${ch.role || ''}|${ch.type || ''}`).join(";");
    const needsRebuild = channelSummarySignature !== signature || box.children.length !== channels.length;

    if (needsRebuild) {
      channelSummarySignature = signature;
      box.innerHTML = "";
      select.innerHTML = "";

      channels.forEach(ch => {
        const opt = document.createElement("option");
        opt.value = ch.ch;
        opt.textContent = `CH${ch.ch} ${ch.name || ''}`;
        select.appendChild(opt);

        const card = document.createElement("div");
        card.dataset.ch = String(ch.ch);
        card.className = "channel-card";
        bindTapSelect(card, Number(ch.ch));
        card.innerHTML = `
          <div class="channel-title">
            <span data-field="title">CH${ch.ch} ${ch.name || ''}</span>
            <span data-field="state" class="pill ready">-</span>
          </div>
          <div class="channel-role" data-field="role">-</div>
          <div class="mini-grid">
            <div class="mini"><div class="label">PV</div><div data-field="pv" class="value">-</div></div>
            <div class="mini"><div class="label">SV</div><div data-field="sv" class="value">-</div></div>
            <div class="mini"><div class="label">OUT</div><div data-field="out" class="value">-</div></div>
            <div class="mini"><div class="label">Kp</div><div data-field="kp" class="value">-</div></div>
          </div>`;
        box.appendChild(card);
      });
    }

    channels.forEach(ch => {
      const card = box.querySelector(`[data-ch="${ch.ch}"]`);
      if (!card) return;
      const cls = stateClass(ch.state, ch.fault_code, ch.enable);
      card.className = `channel-card ${Number(ch.ch) === Number(selectedCh) ? 'selected' : ''} ${!ch.enable ? 'disabled' : ''}`;

      const title = card.querySelector('[data-field="title"]');
      const state = card.querySelector('[data-field="state"]');
      const role = card.querySelector('[data-field="role"]');
      const pv = card.querySelector('[data-field="pv"]');
      const sv = card.querySelector('[data-field="sv"]');
      const out = card.querySelector('[data-field="out"]');
      const kp = card.querySelector('[data-field="kp"]');

      if (title) title.textContent = `CH${ch.ch} ${ch.name || ''}`;
      if (state) {
        state.className = `pill ${cls}`;
        state.textContent = ch.enable ? ch.state : 'DISABLED';
      }
      if (role) role.textContent = `${ch.role || '-'} / ${ch.type || '-'}`;
      if (pv) pv.textContent = fmt(ch.current_temp, 1);
      if (sv) sv.textContent = fmt(ch.target_temp, 1);
      if (out) out.textContent = `${fmt(ch.output_percent, 0)}%`;
      if (kp) kp.textContent = fmt(ch.kp, 1);
    });

    select.value = selectedCh;
    $("selected_channel_pill").textContent = `Selected CH${selectedCh}`;
  }

  function renderOverviewTable(channels) {
    const tbody = $("overview_table");
    tbody.innerHTML = "";
    channels.forEach(ch => {
      const tr = document.createElement("tr");
      tr.className = `clickable ${Number(ch.ch) === Number(selectedCh) ? 'selected-row' : ''}`;
      tr.onclick = () => selectChannel(ch.ch);
      const faultText = Number(ch.fault_code) === 0 ? `<span class="ok-text">0</span>` : `<span class="danger-text">${ch.fault_code}</span>`;
      tr.innerHTML = `
        <td>${ch.ch}</td><td style="text-align:left; font-weight:800;">${ch.name || ''}</td><td>${ch.role || '-'}</td>
        <td>${ch.enable}</td><td>${ch.enable ? ch.state : 'DISABLED'}</td><td>${fmt(ch.target_temp,1)}</td><td>${fmt(ch.current_temp,2)}</td>
        <td>${fmt(ch.output_percent,1)}</td><td>${fmt(ch.kp,1)}</td><td>${faultText}</td>`;
      tbody.appendChild(tr);
    });
  }

  function renderSelectedDetail() {
    const ch = getSelectedChannel();
    if (!ch) return;
    $("detail_title").textContent = `CH${ch.ch} ${ch.name || ''}`;
    $("detail_subtitle").textContent = `${ch.role || '-'} / ${ch.type || '-'} / unit ${ch.unit || '°C'}`;
    const cls = stateClass(ch.state, ch.fault_code, ch.enable);
    const stateEl = $("detail_state");
    stateEl.className = `pill ${cls}`;
    stateEl.textContent = ch.enable ? ch.state : "DISABLED";
    $("detail_pv").textContent = fmt(ch.current_temp, 2);
    $("detail_sv").textContent = fmt(ch.target_temp, 1);
    $("detail_out").textContent = fmt(ch.output_percent, 1);
    $("detail_fault").textContent = ch.fault_code;
    $("pv_unit").textContent = ch.unit || "°C";
    $("sv_unit").textContent = ch.unit || "°C";
    $("selected_channel_select").value = ch.ch;
    if (!selectedInputsDirty) syncSelectedInputs({silent: true});
  }

  function renderEngineering(snapshot) {
    const cfg = snapshot.config || {};
    if (cfg.control_period_sec !== undefined) $("fast_period_ms").value = (cfg.control_period_sec * 1000).toFixed(3);
    if (cfg.websocket_send_period_sec !== undefined) $("ws_period_ms").value = (cfg.websocket_send_period_sec * 1000).toFixed(3);
    if (snapshot.auto_phase_offset !== undefined) { $("offset_auto").checked = !!snapshot.auto_phase_offset; toggleOffsetUI(); }
    if (snapshot.manual_phase_offset_ms !== undefined) $("manual_offset_ms").value = Number(snapshot.manual_phase_offset_ms).toFixed(3);
    if (snapshot.fast_perf) {
      $("fast_avg").textContent = fmt(snapshot.fast_perf.avg_period_10s, 3);
      $("fast_cum").textContent = snapshot.fast_perf.cum_avg_period == null ? "Muted" : fmt(snapshot.fast_perf.cum_avg_period, 3);
      $("fast_rt_jit").textContent = snapshot.fast_perf.realtime_jitter_ms_str ?? "Muted";
      $("fast_max_jit").textContent = snapshot.fast_perf.max_abs_jitter_ms == null ? "Muted" : fmt(snapshot.fast_perf.max_abs_jitter_ms, 3);
    }
    if (snapshot.slow_perf) {
      $("slow_avg").textContent = fmt(snapshot.slow_perf.avg_period_10s, 3);
      $("slow_cum").textContent = snapshot.slow_perf.cum_avg_period == null ? "Muted" : fmt(snapshot.slow_perf.cum_avg_period, 3);
      $("slow_rt_jit").textContent = snapshot.slow_perf.realtime_jitter_ms_str ?? "Muted";
      $("slow_max_jit").textContent = snapshot.slow_perf.max_abs_jitter_ms == null ? "Muted" : fmt(snapshot.slow_perf.max_abs_jitter_ms, 3);
    }
    $("applied_offset_ui").textContent = fmt(snapshot.applied_phase_offset_ms, 3);
    $("avoid_count_ui").textContent = snapshot.collision_avoid_count ?? 0;
    $("nearest_tick_ui").textContent = fmt(snapshot.nearest_fast_tick_distance_ms, 3);
    $("actual_delay_ui").textContent = fmt(snapshot.actual_collision_delay_ms, 3);
  }

  function renderSnapshot(snapshot) {
    if (!snapshot) return;
    latestSnapshot = snapshot;
    const channels = snapshot.channels || [];
    if (channels.length > 0 && !channels.some(ch => Number(ch.ch) === Number(selectedCh))) selectedCh = Number(channels[0].ch);
    syncChartOptionsFromSnapshot(snapshot);
    renderHeader(snapshot);
    renderChannelSummary(channels);
    renderOverviewTable(channels);
    renderSelectedDetail();
    renderEngineering(snapshot);
    updateChartFromSnapshot(snapshot);
  }

  function rebuildChart() {
    if (myChart) { myChart.destroy(); myChart = null; }
    if (latestSnapshot && chartEnabled) initChart();
  }

  function initChart() {
    const canvas = $("realtimeChart");
    if (!canvas || !latestSnapshot) return;
    const ch = getSelectedChannel();
    if (!ch) return;
    const ctx = canvas.getContext('2d');
    myChart = new Chart(ctx, {
      type: 'line',
      data: { labels: [], datasets: [{ label: `CH${ch.ch} ${ch.name || ''}`, data: [], borderWidth: 2, pointRadius: 0, fill: false, tension: 0.05 }] },
      options: { responsive: true, maintainAspectRatio: false, animation: false, normalized: true, scales: { x: { ticks: { maxTicksLimit: 10 } }, y: { display: true } } }
    });
    applyChartSettings();
  }

  function appendChartPoint(label, channels) {
    if (!chartEnabled || !channels) return;
    const chData = channels.find(ch => Number(ch.ch) === Number(selectedCh));
    if (!chData) return;
    if (!myChart) initChart();
    if (!myChart) return;
    myChart.data.labels.push(label);
    myChart.data.datasets[0].data.push(chData.current_temp);
    if (myChart.data.labels.length > maxChartPoints) {
      myChart.data.labels.shift();
      myChart.data.datasets[0].data.shift();
    }
  }

  function updateChartFromSnapshot(snapshot) {
    if (!chartEnabled) return;
    if (chartBatchEnabled && snapshot.chart_history_batch && snapshot.chart_history_batch.length > 0) {
      snapshot.chart_history_batch.forEach(packet => {
        const label = packet.t_rel_sec !== undefined ? `${Number(packet.t_rel_sec).toFixed(2)}s` : `${packet.seq}`;
        appendChartPoint(label, packet.channels);
      });
    } else if (!chartBatchEnabled && snapshot.channels && snapshot.channels.length > 0) {
      const label = snapshot.total_elapsed_sec !== undefined ? `${Number(snapshot.total_elapsed_sec).toFixed(1)}s` : `${snapshot.seq}`;
      appendChartPoint(label, snapshot.channels);
    }
    if (myChart) myChart.update('none');
  }

  function applyChartVisibility() {
    const chartContainer = $('chart_container');
    const disabledNotice = $('chart_disabled_notice');
    const batchCheckbox = $('chart_batch_enabled');
    const modeLabel = $('chart_mode_label');
    if (batchCheckbox) batchCheckbox.disabled = !chartEnabled;
    if (!chartEnabled) {
      if (chartContainer) chartContainer.style.display = 'none';
      if (disabledNotice) disabledNotice.style.display = 'block';
      if (modeLabel) modeLabel.textContent = 'Graph OFF';
      if (myChart) { myChart.destroy(); myChart = null; }
      return;
    }
    if (chartContainer) chartContainer.style.display = 'block';
    if (disabledNotice) disabledNotice.style.display = 'none';
    if (modeLabel) modeLabel.textContent = chartBatchEnabled ? 'Graph ON / 10ms batch' : 'Graph ON / slow snapshot';
  }

  function syncChartOptionsFromSnapshot(snapshot) {
    if (snapshot.chart_enabled !== undefined) chartEnabled = !!snapshot.chart_enabled;
    if (snapshot.chart_batch_enabled !== undefined) chartBatchEnabled = !!snapshot.chart_batch_enabled;
    if ($('chart_enabled')) $('chart_enabled').checked = chartEnabled;
    if ($('chart_batch_enabled')) $('chart_batch_enabled').checked = chartBatchEnabled;
    applyChartVisibility();
  }

  function toggleYScaleUI() {
    const isAuto = $('y_auto').checked;
    $('y_manual_inputs').style.display = isAuto ? 'none' : 'grid';
    applyChartSettings();
  }

  function applyChartSettings() {
    let xInput = Number($('x_max_points').value);
    if (xInput > 5000) xInput = 5000;
    if (xInput < 50) xInput = 50;
    $('x_max_points').value = xInput;
    maxChartPoints = xInput;
    if (!myChart) return;
    const isAuto = $('y_auto').checked;
    if (isAuto) {
      myChart.options.scales.y.min = undefined;
      myChart.options.scales.y.max = undefined;
    } else {
      myChart.options.scales.y.min = Number($('y_min').value);
      myChart.options.scales.y.max = Number($('y_max').value);
    }
    myChart.update('none');
  }

  function toggleOffsetUI() {
    $('offset_manual_inputs').style.display = $('offset_auto').checked ? 'none' : 'block';
  }

  async function sendCommand(command) {
    log('REST TX: ' + JSON.stringify(command));
    try {
      const response = await fetch('/api/cmd', { method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify(command) });
      const data = await response.json();
      log('REST RX: ' + JSON.stringify({ok: data.ok, message: data.message, error: data.error}));
      if (data.snapshot) renderSnapshot(data.snapshot);
      return data;
    } catch (err) {
      log('REST ERROR: ' + err);
      return null;
    }
  }

  async function applySelectedTarget() {
    await sendCommand({ cmd: 'set_target', ch: Number(selectedCh), value: Number($('selected_target').value) });
    selectedInputsDirty = false;
  }

  async function applySelectedKp() {
    await sendCommand({ cmd: 'set_channel_kp', ch: Number(selectedCh), value: Number($('selected_kp').value) });
    selectedInputsDirty = false;
  }

  async function applySelectedEnable() {
    await sendCommand({ cmd: 'set_channel_enable', ch: Number(selectedCh), enable: $('selected_enable').checked });
    selectedInputsDirty = false;
  }

  async function updateChartOptionsToServer() {
    chartEnabled = $('chart_enabled').checked;
    chartBatchEnabled = chartEnabled && $('chart_batch_enabled').checked;
    if (!chartEnabled) $('chart_batch_enabled').checked = false;
    applyChartVisibility();
    await sendCommand({ cmd: 'set_chart_options', chart_enabled: chartEnabled, chart_batch_enabled: chartBatchEnabled });
  }

  async function updatePhaseOffsetToServer() {
    const isAuto = $('offset_auto').checked;
    const offsetValue = isAuto ? -1.0 : Number($('manual_offset_ms').value);
    await sendCommand({ cmd: 'set_phase_offset', value: offsetValue });
  }

  async function updateLoopPeriodsToServer() {
    await sendCommand({ cmd: 'set_loop_periods', control_period_ms: Number($('fast_period_ms').value), websocket_period_ms: Number($('ws_period_ms').value) });
  }

  function connectWebSocket() {
    const protocol = location.protocol === 'https:' ? 'wss' : 'ws';
    const url = `${protocol}://${location.host}/ws/temperature`;
    ws = new WebSocket(url);
    ws.onopen = () => { $('conn_pill').textContent = 'WS: connected'; $('conn_pill').className = 'pill run'; log('WebSocket connected'); };
    ws.onmessage = (event) => { renderSnapshot(JSON.parse(event.data)); };
    ws.onclose = () => { $('conn_pill').textContent = 'WS: reconnecting'; $('conn_pill').className = 'pill alarm'; log('WebSocket closed. reconnecting...'); setTimeout(connectWebSocket, 2000); };
    ws.onerror = () => { ws.close(); };
  }
</script>
</body>
</html>
"""


@app.get("/", response_class=HTMLResponse)
async def web_ui_home() -> str:
    return MENU_PAGE


@app.get("/legacy", response_class=HTMLResponse)
async def web_ui_legacy() -> str:
    return LEGACY_HTML_PAGE


@app.get("/setup", response_class=HTMLResponse)
async def web_ui_setup() -> str:
    return SETUP_HTML_PAGE


@app.get("/channel", response_class=HTMLResponse)
async def web_ui_channel_alias() -> str:
    return SETUP_HTML_PAGE


# ============================================================
# REST API
# ============================================================
@app.get("/api/status")
async def api_status() -> JSONResponse:
    async with state_lock:
        snapshot = make_snapshot_unlocked(history_batch=[])
    return JSONResponse(snapshot)


@app.post("/api/cmd")
async def api_command(request: Request) -> JSONResponse:
    try:
        body = await request.json()
    except Exception:
        return JSONResponse({"ok": False, "error": "invalid JSON body"}, status_code=400)

    if not isinstance(body, dict):
        return JSONResponse({"ok": False, "error": "request body must be object"}, status_code=400)

    response = await handle_command(body, source="REST")
    status_code = 200 if response.get("ok") else 400
    return JSONResponse(response, status_code=status_code)


# ============================================================
# WebSocket endpoint
# ============================================================
@app.websocket("/ws/temperature")
async def websocket_temperature(websocket: WebSocket) -> None:
    await websocket_manager.connect(websocket)
    try:
        # 이 endpoint는 client 등록/해제만 담당한다.
        # 실제 데이터 송신은 websocket_broadcast_loop 하나가 모든 client에 broadcast한다.
        while True:
            await websocket.receive_text()
    except WebSocketDisconnect:
        pass
    except Exception as e:
        write_log(f"WebSocket receive exception: {e}")
    finally:
        await websocket_manager.disconnect(websocket)
