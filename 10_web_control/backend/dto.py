"""Common DTOs for KD240 Web Control."""

import math
import time
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


class CommandDTO:
    def __init__(self, target_temp: float = 80.0, kp: float = 0.04, ki: float = 0.003) -> None:
        self.target_temp = target_temp
        self.kp = kp
        self.ki = ki

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
        return {
            "target_temp": self.target_temp,
            "kp": self.kp,
            "ki": self.ki,
        }


class StatusDTO:
    def __init__(
        self,
        status_word: int,
        state_packed: int,
        heater_state: int,
        auto_tune_state: int,
        current_temp: float,
        target_temp: float,
        error: float,
        u_ctrl: float,
        duty_cnt: int,
        tune_k: float,
        tune_l: float,
        tune_t: float,
        tune_kp: float,
        tune_ki: float,
        tuned_gain_valid: bool,
        auto_tune_error: int,
        kp: float,
        ki: float,
    ) -> None:
        self.status_word = status_word
        self.state_packed = state_packed
        self.heater_state = heater_state
        self.auto_tune_state = auto_tune_state
        self.current_temp = current_temp
        self.target_temp = target_temp
        self.error = error
        self.u_ctrl = u_ctrl
        self.duty_cnt = duty_cnt
        self.tune_k = tune_k
        self.tune_l = tune_l
        self.tune_t = tune_t
        self.tune_kp = tune_kp
        self.tune_ki = tune_ki
        self.tuned_gain_valid = tuned_gain_valid
        self.auto_tune_error = auto_tune_error
        self.kp = kp
        self.ki = ki

    def to_dict(self) -> Dict[str, Any]:
        result = {
            "status_word": self.status_word,
            "state_packed": self.state_packed,
            "heater_state": self.heater_state,
            "auto_tune_state": self.auto_tune_state,
            "current_temp": self.current_temp,
            "target_temp": self.target_temp,
            "error": self.error,
            "u_ctrl": self.u_ctrl,
            "duty_cnt": self.duty_cnt,
            "tune_k": self.tune_k,
            "tune_l": self.tune_l,
            "tune_t": self.tune_t,
            "tune_kp": self.tune_kp,
            "tune_ki": self.tune_ki,
            "tuned_gain_valid": self.tuned_gain_valid,
            "auto_tune_error": self.auto_tune_error,
            "kp": self.kp,
            "ki": self.ki,
        }
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


class HistorySample:
    def __init__(
        self,
        time_sec: float,
        timestamp: str,
        target_temp: float,
        current_temp: float,
        error: float,
        u_percent: float,
        duty_percent: float,
        heater_state: int,
        heater_state_name: str,
        auto_tune_state: int,
        auto_tune_state_name: str,
    ) -> None:
        self.time_sec = time_sec
        self.timestamp = timestamp
        self.target_temp = target_temp
        self.current_temp = current_temp
        self.error = error
        self.u_percent = u_percent
        self.duty_percent = duty_percent
        self.heater_state = heater_state
        self.heater_state_name = heater_state_name
        self.auto_tune_state = auto_tune_state
        self.auto_tune_state_name = auto_tune_state_name

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
        return {
            "time_sec": self.time_sec,
            "timestamp": self.timestamp,
            "target_temp": self.target_temp,
            "current_temp": self.current_temp,
            "error": self.error,
            "u_percent": self.u_percent,
            "duty_percent": self.duty_percent,
            "heater_state": self.heater_state,
            "heater_state_name": self.heater_state_name,
            "auto_tune_state": self.auto_tune_state,
            "auto_tune_state_name": self.auto_tune_state_name,
        }


def response_envelope(adapter: str, connected: bool, status: StatusDTO) -> Dict[str, Any]:
    return {
        "ok": True,
        "adapter": adapter,
        "connected": connected,
        "status": status.to_dict(),
    }
