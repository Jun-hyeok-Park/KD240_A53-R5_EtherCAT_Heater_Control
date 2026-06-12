"""Application service for REST and WebSocket handlers."""

from __future__ import annotations

import threading
import time
from typing import Any, Dict, List, Tuple

from adapters.base import BackendAdapterError, IHeaterBackendAdapter
from adapters.kd240_shared_memory_adapter import Kd240SharedMemoryAdapter
from adapters.mock_adapter import MockAdapter
from adapters.wmx_ethercat_adapter import WmxEthercatAdapter
from dto import CommandDTO, HistorySample, StatusDTO, response_envelope, utc_timestamp
from protocol import AutoTuneState, HeaterState, pack_state


class HeaterControlService:
    server_name = "KD240 Heater Control Server"
    version = "0.1.0-mock"
    channel_count = 8
    active_channel = 1
    ws_period_ms = 500
    available_modes = ["mock", "ethercat", "shared_memory"]

    def __init__(self, adapter: IHeaterBackendAdapter) -> None:
        self.adapter = adapter
        self.command = CommandDTO()
        self.started_at = time.monotonic()
        self.auto_apply_after_done = False
        self._auto_apply_performed = False
        self._adapter_fault: str | None = None
        self._lock = threading.RLock()
        self._seq = 0
        self._history: List[HistorySample] = []
        self._event_queue: List[Dict[str, Any]] = []
        self._last_status = self._default_status()
        self._last_history_sample_at = 0.0
        self._last_history_batch_seq = -1
        self._last_auto_tune_state: int | None = None
        self._last_adapter_state: bool | None = None
        self._log("info", "Mock backend ready", {"adapter": self.adapter.name})

    def health(self) -> Dict[str, Any]:
        with self._lock:
            return {
                "ok": True,
                "service": "kd240-heater-web-control",
                "server": self.server_name,
                "version": self.version,
                "adapter": self.adapter.name,
                "connected": self.adapter.connected,
                "mode": self.adapter.name,
                "mock": self.adapter.name == "mock",
                "channel_count": self.channel_count,
                "active_channel": self.active_channel,
                "rxpdo_bytes": 14,
                "txpdo_bytes": 48,
                "ws_period_ms": self.ws_period_ms,
                "uptime_sec": round(time.monotonic() - self.started_at, 3),
                "diagnostics": self.adapter.get_diagnostics(),
            }

    def get_mode(self) -> Dict[str, Any]:
        with self._lock:
            return {
                "ok": True,
                "mode": self.adapter.name,
                "available_modes": self.available_modes,
                "connected": self.adapter.connected,
                "fault": self._current_adapter_fault(),
                "diagnostics": self.adapter.get_diagnostics(),
            }

    def set_mode(self, payload: Dict[str, Any]) -> Tuple[int, Dict[str, Any]]:
        mode = str(payload.get("mode", "")).strip().lower()
        if mode not in self.available_modes:
            return 400, {
                "ok": False,
                "message": f"Unsupported mode: {mode}",
                "available_modes": self.available_modes,
            }

        with self._lock:
            if self.adapter.name == mode:
                return 200, self.get_mode()

            old_adapter = self.adapter
            try:
                old_adapter.disconnect()
            except Exception:  # noqa: BLE001
                pass

            self.adapter = self._create_adapter(mode)
            self._adapter_fault = None
            self._last_adapter_state = None
            self._history = []
            self._last_history_sample_at = 0.0
            self._last_status = self._default_status()

            ok = True
            message = f"Adapter mode changed to {mode}"
            if mode != "mock":
                try:
                    self.adapter.connect()
                except BackendAdapterError as exc:
                    ok = False
                    message = f"Adapter mode changed to {mode}, but connect failed: {exc}"
                    self._adapter_fault = str(exc)
                except Exception as exc:  # noqa: BLE001
                    ok = False
                    message = f"Adapter mode changed to {mode}, but connect raised: {exc}"
                    self._adapter_fault = str(exc)

            self._log("info" if ok else "warn", message, {"mode": mode})
            return 200, {
                "ok": ok,
                "message": message,
                "mode": self.adapter.name,
                "available_modes": self.available_modes,
                "connected": self.adapter.connected,
                "fault": self._current_adapter_fault(),
                "diagnostics": self.adapter.get_diagnostics(),
                "status": self._last_status.to_dict(),
            }

    def connect_adapter(self) -> Tuple[int, Dict[str, Any]]:
        with self._lock:
            try:
                self.adapter.connect()
                self._adapter_fault = None
                self._log("info", "Adapter connected", {"mode": self.adapter.name})
                ok = True
                message = "Adapter connected"
            except BackendAdapterError as exc:
                self._adapter_fault = str(exc)
                self._log("warn", f"Adapter connect failed: {exc}", {"mode": self.adapter.name})
                ok = False
                message = str(exc)
            return 200, {
                "ok": ok,
                "message": message,
                "mode": self.adapter.name,
                "connected": self.adapter.connected,
                "fault": self._current_adapter_fault(),
                "diagnostics": self.adapter.get_diagnostics(),
            }

    def disconnect_adapter(self) -> Tuple[int, Dict[str, Any]]:
        with self._lock:
            self.adapter.disconnect()
            self._log("info", "Adapter disconnected", {"mode": self.adapter.name})
            return 200, {
                "ok": True,
                "message": "Adapter disconnected",
                "mode": self.adapter.name,
                "connected": self.adapter.connected,
                "diagnostics": self.adapter.get_diagnostics(),
            }

    def get_status(self) -> Dict[str, Any]:
        with self._lock:
            status = self._read_status_locked()
            response = response_envelope(self.adapter.name, self.adapter.connected, status)
            response["fault"] = self._current_adapter_fault()
            return response

    def get_history(self) -> Dict[str, Any]:
        with self._lock:
            return {
                "ok": True,
                "adapter": self.adapter.name,
                "samples": [sample.to_dict() for sample in self._history],
            }

    def get_adapter_diagnostics(self) -> Dict[str, Any]:
        with self._lock:
            return {
                "ok": True,
                "mode": self.adapter.name,
                "connected": self.adapter.connected,
                "fault": self._current_adapter_fault(),
                "diagnostics": self.adapter.get_diagnostics(),
            }

    def run(self, payload: Dict[str, Any]) -> Tuple[int, Dict[str, Any]]:
        with self._lock:
            command = CommandDTO.from_payload(payload, self.command)
            self.command = command
            self._auto_apply_performed = False
            try:
                status = self.adapter.run(command)
            except Exception as exc:  # noqa: BLE001
                return self._adapter_command_error("RUN command failed", exc)
            self._append_history_locked(status, force=True)
            self._log("info", "RUN command sent", command.to_dict())
            return 200, self._command_response("RUN command sent", status)

    def write_params(self, payload: Dict[str, Any]) -> Tuple[int, Dict[str, Any]]:
        with self._lock:
            command = CommandDTO.from_payload(payload, self.command)
            self.command = command
            try:
                status = self.adapter.write_params(command)
            except Exception as exc:  # noqa: BLE001
                return self._adapter_command_error("Parameter update failed", exc)
            self._append_history_locked(status, force=True)
            self._log("info", "Parameter update sent", command.to_dict())
            return 200, self._command_response("Parameter update sent", status)

    def stop(self) -> Tuple[int, Dict[str, Any]]:
        with self._lock:
            try:
                status = self.adapter.stop()
            except Exception as exc:  # noqa: BLE001
                return self._adapter_command_error("STOP command failed", exc)
            self._append_history_locked(status, force=True)
            self._log("info", "STOP command sent", {})
            return 200, self._command_response("STOP command sent", status)

    def reset(self) -> Tuple[int, Dict[str, Any]]:
        with self._lock:
            try:
                status = self.adapter.reset()
            except Exception as exc:  # noqa: BLE001
                return self._adapter_command_error("RESET command failed", exc)
            self._auto_apply_performed = False
            self._append_history_locked(status, force=True)
            self._log("info", "RESET command sent", {})
            return 200, self._command_response("RESET command sent", status)

    def start_auto_tune(self, payload: Dict[str, Any]) -> Tuple[int, Dict[str, Any]]:
        with self._lock:
            command = CommandDTO.from_payload(payload, self.command)
            self.command = command
            self._auto_apply_performed = False
            try:
                status = self.adapter.start_auto_tune(command)
            except Exception as exc:  # noqa: BLE001
                return self._adapter_command_error("Auto Tune Start command failed", exc)
            self._append_history_locked(status, force=True)
            self._log("info", "Auto Tune Start command sent", command.to_dict())
            return 200, self._command_response("Auto Tune Start command sent", status)

    def set_auto_apply(self, payload: Dict[str, Any]) -> Tuple[int, Dict[str, Any]]:
        with self._lock:
            self.auto_apply_after_done = bool(payload.get("enabled", False))
            self._auto_apply_performed = False
            status = self._read_status_locked()
            self._log(
                "info",
                f"Auto Apply After DONE {'enabled' if self.auto_apply_after_done else 'disabled'}",
                {"enabled": self.auto_apply_after_done},
            )
            return 200, {
                "ok": True,
                "message": "Auto Apply After DONE updated",
                "adapter": self.adapter.name,
                "connected": self.adapter.connected,
                "auto_apply_after_done": self.auto_apply_after_done,
                "status": status.to_dict(),
            }

    def apply_tuned_gain(self, payload: Dict[str, Any]) -> Tuple[int, Dict[str, Any]]:
        with self._lock:
            target_temp = CommandDTO.from_payload(payload, self.command).target_temp
            try:
                status = self.adapter.apply_tuned_gain(target_temp)
            except Exception as exc:  # noqa: BLE001
                current = self._read_status_locked()
                self._log("warn", str(exc), {})
                return 409, {
                    "ok": False,
                    "message": str(exc),
                    "adapter": self.adapter.name,
                    "connected": self.adapter.connected,
                    "status": current.to_dict(),
                }

            self.command = CommandDTO(
                target_temp=status.target_temp,
                kp=status.kp,
                ki=status.ki,
            )
            self._auto_apply_performed = True
            self._append_history_locked(status, force=True)
            self._log("info", "Tuned gain applied and RUN command sent", self.command.to_dict())
            return 200, self._command_response("Tuned gain applied and RUN command sent", status)

    def websocket_initial_messages(self) -> List[Dict[str, Any]]:
        with self._lock:
            status = self._read_status_locked()
            return [
                self._adapter_state_message(force=True),
                self._status_message(status),
                self._history_message(force=True),
            ]

    def websocket_tick(self) -> List[Dict[str, Any]]:
        with self._lock:
            status = self._read_status_locked()
            status = self._apply_tuned_gain_if_ready_locked(status)
            messages = [self._status_message(status)]

            adapter_state = self._adapter_state_message(force=False)
            if adapter_state is not None:
                messages.append(adapter_state)

            history_msg = self._history_message(force=False)
            if history_msg is not None:
                messages.append(history_msg)

            for adapter_event in self.adapter.take_events():
                adapter_event.setdefault("timestamp", utc_timestamp())
                messages.append(adapter_event)
                if adapter_event.get("type") == "autotune.event":
                    self._log(
                        "info",
                        adapter_event.get("message", "Auto Tune event"),
                        {
                            "auto_tune_state": adapter_event.get("auto_tune_state"),
                            "auto_tune_state_name": adapter_event.get("auto_tune_state_name"),
                        },
                    )

            if status.auto_tune_state != self._last_auto_tune_state:
                self._last_auto_tune_state = status.auto_tune_state

            messages.extend(self._drain_events_locked())
            return messages

    def _read_status_locked(self) -> StatusDTO:
        try:
            status = self.adapter.read_status()
            self._adapter_fault = self._extract_adapter_fault()
        except Exception as exc:  # noqa: BLE001
            self._adapter_fault = str(exc)
            self._log("warn", f"Adapter read_status failed: {exc}", {"mode": self.adapter.name})
            status = self._last_status
        self._last_status = status
        self._append_history_locked(status, force=False)
        return status

    def _append_history_locked(self, status: StatusDTO, force: bool) -> None:
        now = time.monotonic()
        if not force and now - self._last_history_sample_at < 0.5:
            return
        self._last_history_sample_at = now
        self._history.append(HistorySample.from_status(status, self.started_at))
        if len(self._history) > 600:
            self._history = self._history[-600:]

    def _command_response(self, message: str, status: StatusDTO) -> Dict[str, Any]:
        return {
            "ok": True,
            "message": message,
            "adapter": self.adapter.name,
            "connected": self.adapter.connected,
                "status": status.to_dict(),
            }

    def _adapter_command_error(self, message: str, exc: Exception) -> Tuple[int, Dict[str, Any]]:
        self._adapter_fault = str(exc)
        self._log("warn", f"{message}: {exc}", {"mode": self.adapter.name})
        return 409, {
            "ok": False,
            "message": f"{message}: {exc}",
            "adapter": self.adapter.name,
            "connected": self.adapter.connected,
            "fault": self._current_adapter_fault(),
            "diagnostics": self.adapter.get_diagnostics(),
            "status": self._last_status.to_dict(),
        }

    def _status_message(self, status: StatusDTO) -> Dict[str, Any]:
        self._seq += 1
        return {
            "type": "status.snapshot",
            "seq": self._seq,
            "timestamp": utc_timestamp(),
            "adapter": self.adapter.name,
            "connected": self.adapter.connected,
            "server": self.server_name,
            "version": self.version,
            "channel_count": self.channel_count,
            "active_channel": self.active_channel,
            "rxpdo_bytes": 14,
            "txpdo_bytes": 48,
            "ws_period_ms": self.ws_period_ms,
            "auto_apply_after_done": self.auto_apply_after_done,
            "fault": self._current_adapter_fault(),
            "status": status.to_dict(),
        }

    def _history_message(self, force: bool) -> Dict[str, Any] | None:
        if not force and self._last_history_batch_seq == self._seq:
            return None
        if not force and self._seq % 2 != 0:
            return None
        self._last_history_batch_seq = self._seq
        return {
            "type": "history.batch",
            "seq": self._seq,
            "timestamp": utc_timestamp(),
            "samples": [sample.to_dict() for sample in self._history[-240:]],
        }

    def _adapter_state_message(self, force: bool) -> Dict[str, Any] | None:
        connected = self.adapter.connected
        if not force and connected == self._last_adapter_state:
            return None
        self._last_adapter_state = connected
        return {
            "type": "adapter.state",
            "timestamp": utc_timestamp(),
            "adapter": self.adapter.name,
            "connected": connected,
            "fault": self._current_adapter_fault(),
        }

    def _apply_tuned_gain_if_ready_locked(self, status: StatusDTO) -> StatusDTO:
        if not self.auto_apply_after_done:
            return status
        if self._auto_apply_performed:
            return status
        if not status.tuned_gain_valid or status.auto_tune_state != 4:
            return status

        try:
            applied = self.adapter.apply_tuned_gain(status.target_temp)
        except BackendAdapterError as exc:
            self._log("warn", f"Auto Apply failed: {exc}", {})
            self._auto_apply_performed = True
            return status

        self.command = CommandDTO(target_temp=applied.target_temp, kp=applied.kp, ki=applied.ki)
        self._auto_apply_performed = True
        self._append_history_locked(applied, force=True)
        self._log("info", "Auto Apply After DONE applied tuned gain", self.command.to_dict())
        return applied

    def _log(self, level: str, message: str, context: Dict[str, Any]) -> None:
        self._event_queue.append(
            {
                "type": "event.log",
                "timestamp": utc_timestamp(),
                "level": level,
                "message": message,
                "context": context,
            }
        )

    def _drain_events_locked(self) -> List[Dict[str, Any]]:
        events = list(self._event_queue)
        self._event_queue.clear()
        return events

    def _create_adapter(self, mode: str) -> IHeaterBackendAdapter:
        if mode == "mock":
            return MockAdapter()
        if mode == "ethercat":
            return WmxEthercatAdapter()
        if mode == "shared_memory":
            return Kd240SharedMemoryAdapter()
        raise BackendAdapterError(f"Unsupported adapter mode: {mode}")

    def _extract_adapter_fault(self) -> str | None:
        diagnostics = self.adapter.get_diagnostics()
        fault = diagnostics.get("fault") or diagnostics.get("last_error")
        return str(fault) if fault else None

    def _current_adapter_fault(self) -> str | None:
        return self._adapter_fault or self._extract_adapter_fault()

    def _default_status(self) -> StatusDTO:
        return StatusDTO(
            status_word=0,
            state_packed=pack_state(HeaterState.IDLE, AutoTuneState.IDLE),
            heater_state=int(HeaterState.IDLE),
            auto_tune_state=int(AutoTuneState.IDLE),
            current_temp=0.0,
            target_temp=self.command.target_temp,
            error=0.0,
            u_ctrl=0.0,
            duty_cnt=0,
            tune_k=0.0,
            tune_l=0.0,
            tune_t=0.0,
            tune_kp=0.0,
            tune_ki=0.0,
            tuned_gain_valid=False,
            auto_tune_error=0,
            kp=self.command.kp,
            ki=self.command.ki,
        )
