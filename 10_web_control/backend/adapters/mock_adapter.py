"""Deterministic mock backend for Web UI and API validation."""

from __future__ import annotations

import time
from typing import Any, Dict, List

from adapters.base import BackendAdapterError, IHeaterBackendAdapter
from dto import CommandDTO, StatusDTO
from protocol import (
    AutoTuneState,
    HeaterState,
    PWM_PERIOD_COUNT,
    auto_tune_state_name,
    build_status_word,
    clamp,
    pack_state,
)


class MockAdapter(IHeaterBackendAdapter):
    name = "mock"

    def __init__(self) -> None:
        super().__init__()
        self.connected = True
        self.command = CommandDTO()
        self.current_temp = 25.0
        self.heater_state = HeaterState.IDLE
        self.auto_tune_state = AutoTuneState.IDLE
        self.tune_k = 0.0
        self.tune_l = 0.0
        self.tune_t = 0.0
        self.tune_kp = 0.0
        self.tune_ki = 0.0
        self.tuned_gain_valid = False
        self.auto_tune_error = 0
        self.u_ctrl = 0.0
        self.duty_cnt = 0
        self._ambient_temp = 25.0
        self._last_update = time.monotonic()
        self._auto_tune_started_at: float | None = None
        self._events: List[Dict[str, Any]] = []

    def connect(self) -> None:
        self.connected = True

    def disconnect(self) -> None:
        self.connected = False

    def write_params(self, command: CommandDTO) -> StatusDTO:
        self._advance()
        self.command = command
        return self._status()

    def run(self, command: CommandDTO) -> StatusDTO:
        self._advance()
        self.command = command
        self.auto_tune_state = AutoTuneState.IDLE
        self._auto_tune_started_at = None
        self.heater_state = HeaterState.RUN
        return self._status()

    def stop(self) -> StatusDTO:
        self._advance()
        self.heater_state = HeaterState.IDLE
        self.auto_tune_state = AutoTuneState.IDLE
        self._auto_tune_started_at = None
        self.u_ctrl = 0.0
        self.duty_cnt = 0
        return self._status()

    def reset(self) -> StatusDTO:
        self._advance()
        self.heater_state = HeaterState.IDLE
        self.auto_tune_state = AutoTuneState.IDLE
        self._auto_tune_started_at = None
        self.tune_k = 0.0
        self.tune_l = 0.0
        self.tune_t = 0.0
        self.tune_kp = 0.0
        self.tune_ki = 0.0
        self.tuned_gain_valid = False
        self.auto_tune_error = 0
        self.u_ctrl = 0.0
        self.duty_cnt = 0
        return self._status()

    def start_auto_tune(self, command: CommandDTO) -> StatusDTO:
        self._advance()
        self.command = command
        self.heater_state = HeaterState.AUTO_TUNE
        self.auto_tune_state = AutoTuneState.STABILIZE
        self._auto_tune_started_at = time.monotonic()
        self.tuned_gain_valid = False
        self.auto_tune_error = 0
        self._push_auto_tune_event("Auto Tune started")
        return self._status()

    def apply_tuned_gain(self, target_temp: float) -> StatusDTO:
        self._advance()
        if not self.tuned_gain_valid:
            raise BackendAdapterError("No valid tuned gain is available")

        self.command = CommandDTO(
            target_temp=target_temp,
            kp=self.tune_kp,
            ki=self.tune_ki,
        )
        self.heater_state = HeaterState.RUN
        self.auto_tune_state = AutoTuneState.IDLE
        self._auto_tune_started_at = None
        return self._status()

    def read_status(self) -> StatusDTO:
        self._advance()
        return self._status()

    def take_events(self) -> List[Dict[str, Any]]:
        events = list(self._events)
        self._events.clear()
        return events

    def _advance(self) -> None:
        now = time.monotonic()
        dt = clamp(now - self._last_update, 0.0, 1.0)
        self._last_update = now

        self._advance_auto_tune(now)

        target = self.command.target_temp
        if self.heater_state in (HeaterState.RUN, HeaterState.STABLE, HeaterState.AUTO_TUNE):
            error = target - self.current_temp
            tau = 18.0 if error >= 0.0 else 28.0
            self.current_temp += error * clamp(dt / tau, 0.0, 1.0)
            effort = (abs(error) * 0.025) + (self.command.kp * 2.0) + (self.command.ki * 12.0)
            self.u_ctrl = clamp(effort, 0.04, 1.0)
        else:
            error = self._ambient_temp - self.current_temp
            self.current_temp += error * clamp(dt / 55.0, 0.0, 1.0)
            self.u_ctrl = 0.0

        self.duty_cnt = int(round(clamp(self.u_ctrl, 0.0, 1.0) * PWM_PERIOD_COUNT))

        if self.heater_state in (HeaterState.RUN, HeaterState.STABLE):
            if abs(self.command.target_temp - self.current_temp) <= 0.5:
                self.heater_state = HeaterState.STABLE
            else:
                self.heater_state = HeaterState.RUN

    def _advance_auto_tune(self, now: float) -> None:
        if self._auto_tune_started_at is None:
            return

        elapsed = now - self._auto_tune_started_at
        previous = self.auto_tune_state

        if elapsed < 3.0:
            self.auto_tune_state = AutoTuneState.STABILIZE
            self.heater_state = HeaterState.AUTO_TUNE
        elif elapsed < 7.0:
            self.auto_tune_state = AutoTuneState.STEP_TEST
            self.heater_state = HeaterState.AUTO_TUNE
        elif elapsed < 9.0:
            self.auto_tune_state = AutoTuneState.CALCULATE
            self.heater_state = HeaterState.AUTO_TUNE
        else:
            self.auto_tune_state = AutoTuneState.DONE
            self.heater_state = HeaterState.RUN
            self.tune_k = 118.0
            self.tune_l = 1.25
            self.tune_t = 47.5
            self.tune_kp = 0.038
            self.tune_ki = 0.0028
            self.tuned_gain_valid = True

        if self.auto_tune_state != previous:
            self._push_auto_tune_event(f"Auto Tune phase: {auto_tune_state_name(self.auto_tune_state)}")

    def _push_auto_tune_event(self, message: str) -> None:
        self._events.append(
            {
                "type": "autotune.event",
                "auto_tune_state": int(self.auto_tune_state),
                "auto_tune_state_name": auto_tune_state_name(self.auto_tune_state),
                "tuned_gain_valid": self.tuned_gain_valid,
                "auto_apply_scheduled": False,
                "message": message,
            }
        )

    def _status(self) -> StatusDTO:
        error = self.command.target_temp - self.current_temp
        status_word = build_status_word(
            heater_state=self.heater_state,
            auto_tune_state=self.auto_tune_state,
            tuned_gain_valid=self.tuned_gain_valid,
            auto_tune_error=self.auto_tune_error,
        )
        return StatusDTO(
            status_word=status_word,
            state_packed=pack_state(self.heater_state, self.auto_tune_state),
            heater_state=int(self.heater_state),
            auto_tune_state=int(self.auto_tune_state),
            current_temp=round(self.current_temp, 3),
            target_temp=round(self.command.target_temp, 3),
            error=round(error, 3),
            u_ctrl=round(self.u_ctrl, 4),
            duty_cnt=int(self.duty_cnt),
            tune_k=round(self.tune_k, 4),
            tune_l=round(self.tune_l, 4),
            tune_t=round(self.tune_t, 4),
            tune_kp=round(self.tune_kp, 6),
            tune_ki=round(self.tune_ki, 6),
            tuned_gain_valid=bool(self.tuned_gain_valid),
            auto_tune_error=int(self.auto_tune_error),
            kp=round(self.command.kp, 6),
            ki=round(self.command.ki, 6),
        )
