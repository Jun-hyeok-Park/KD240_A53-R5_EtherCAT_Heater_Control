"""Common DTOs for KD240 Web Control."""

from __future__ import annotations

import math
import time
from dataclasses import asdict, dataclass
from datetime import datetime, timezone
from typing import Any, Dict, Optional

from protocol import (
    PWM_PERIOD_COUNT,
    auto_tune_state_name,
    clamp,
    heater_state_name,
)


KST = timezone.utc


def utc_timestamp() -> str:
    return datetime.now(timezone.utc).isoformat(timespec="milliseconds").replace("+00:00", "Z")


def finite_float(value: Any, field_name: str) -> float:
    try:
        parsed = float(value)
    except (TypeError, ValueError) as exc:
        raise ValueError(f"{field_name} must be a number") from exc
    if not math.isfinite(parsed):
        raise ValueError(f"{field_name} must be finite")
    return parsed


@dataclass
class CommandDTO:
    target_temp: float = 80.0
    kp: float = 0.04
    ki: float = 0.003

    @classmethod
    def from_payload(cls, payload: Optional[Dict[str, Any]], fallback: "CommandDTO") -> "CommandDTO":
        payload = payload or {}
        target_temp = finite_float(payload.get("target_temp", fallback.target_temp), "target_temp")
        kp = finite_float(payload.get("kp", fallback.kp), "kp")
        ki = finite_float(payload.get("ki", fallback.ki), "ki")
        if kp < 0.0:
            raise ValueError("kp must be greater than or equal to 0")
        if ki < 0.0:
            raise ValueError("ki must be greater than or equal to 0")
        return cls(target_temp=target_temp, kp=kp, ki=ki)

    def to_dict(self) -> Dict[str, float]:
        return asdict(self)


@dataclass
class StatusDTO:
    status_word: int
    state_packed: int
    heater_state: int
    auto_tune_state: int
    current_temp: float
    target_temp: float
    error: float
    u_ctrl: float
    duty_cnt: int
    tune_k: float
    tune_l: float
    tune_t: float
    tune_kp: float
    tune_ki: float
    tuned_gain_valid: bool
    auto_tune_error: int
    kp: float
    ki: float

    def to_dict(self) -> Dict[str, Any]:
        result = asdict(self)
        result["heater_state_name"] = heater_state_name(self.heater_state)
        result["auto_tune_state_name"] = auto_tune_state_name(self.auto_tune_state)
        result["u_percent"] = clamp(self.u_ctrl * 100.0, 0.0, 100.0)
        result["duty_percent"] = clamp((self.duty_cnt / PWM_PERIOD_COUNT) * 100.0, 0.0, 100.0)
        result["is_run"] = bool(self.status_word & 0x0001)
        result["is_stable"] = bool(self.status_word & 0x0002)
        result["is_fault"] = bool(self.status_word & 0x0004)
        result["is_auto_tune"] = bool(self.status_word & 0x0008)
        result["auto_tune_done"] = bool(self.status_word & 0x0010)
        result["auto_tune_fail_or_abort"] = bool(self.status_word & 0x0020)
        result["tuned_gain_valid_flag"] = bool(self.status_word & 0x0040)
        return result


@dataclass
class HistorySample:
    time_sec: float
    timestamp: str
    target_temp: float
    current_temp: float
    error: float
    u_percent: float
    duty_percent: float
    heater_state: int
    heater_state_name: str
    auto_tune_state: int
    auto_tune_state_name: str

    @classmethod
    def from_status(cls, status: StatusDTO, start_time: float) -> "HistorySample":
        status_dict = status.to_dict()
        return cls(
            time_sec=round(time.monotonic() - start_time, 3),
            timestamp=utc_timestamp(),
            target_temp=status.target_temp,
            current_temp=status.current_temp,
            error=status.error,
            u_percent=status_dict["u_percent"],
            duty_percent=status_dict["duty_percent"],
            heater_state=status.heater_state,
            heater_state_name=status_dict["heater_state_name"],
            auto_tune_state=status.auto_tune_state,
            auto_tune_state_name=status_dict["auto_tune_state_name"],
        )

    def to_dict(self) -> Dict[str, Any]:
        return asdict(self)


def response_envelope(adapter: str, connected: bool, status: StatusDTO) -> Dict[str, Any]:
    return {
        "ok": True,
        "adapter": adapter,
        "connected": connected,
        "status": status.to_dict(),
    }
