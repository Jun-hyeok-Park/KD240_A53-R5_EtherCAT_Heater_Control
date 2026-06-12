"""KD240 heater protocol constants and byte helpers.

This module mirrors the protocol described in docs/kd240_protocol.md:
RxPDO is 14 bytes, TxPDO is 48 bytes, and float values are IEEE754
single-precision little-endian values.
"""

from __future__ import annotations

import struct
from enum import IntEnum
from typing import Any, Dict


RX_PDO_SIZE = 14
TX_PDO_SIZE = 48
PDO_INPUT_ADDR = 0x00
PDO_OUTPUT_ADDR = 0x00

PWM_PERIOD_COUNT = 100000


class ControlWord(IntEnum):
    CLEAR = 0x0000
    RUN = 0x0001
    STOP = 0x0002
    RESET = 0x0004
    AUTO_TUNE_START = 0x0008
    APPLY_TUNED_GAIN = 0x0010


class StatusBit(IntEnum):
    RUN = 0x0001
    STABLE = 0x0002
    FAULT = 0x0004
    AUTO_TUNE = 0x0008
    AUTO_TUNE_DONE = 0x0010
    AUTO_TUNE_FAIL_OR_ABORT = 0x0020
    TUNED_GAIN_VALID = 0x0040


class HeaterState(IntEnum):
    IDLE = 0
    RUN = 1
    STABLE = 2
    FAULT = 3
    AUTO_TUNE = 4


class AutoTuneState(IntEnum):
    IDLE = 0
    STABILIZE = 1
    STEP_TEST = 2
    CALCULATE = 3
    DONE = 4
    FAIL = 5
    ABORT = 6


HEATER_STATE_NAMES = {
    HeaterState.IDLE: "IDLE",
    HeaterState.RUN: "RUN",
    HeaterState.STABLE: "STABLE",
    HeaterState.FAULT: "FAULT",
    HeaterState.AUTO_TUNE: "AUTO_TUNE",
}

AUTO_TUNE_STATE_NAMES = {
    AutoTuneState.IDLE: "IDLE",
    AutoTuneState.STABILIZE: "STABILIZE",
    AutoTuneState.STEP_TEST: "STEP_TEST",
    AutoTuneState.CALCULATE: "CALCULATE",
    AutoTuneState.DONE: "DONE",
    AutoTuneState.FAIL: "FAIL",
    AutoTuneState.ABORT: "ABORT",
}


def clamp(value: float, low: float, high: float) -> float:
    return max(low, min(high, value))


def heater_state_name(value: int) -> str:
    try:
        return HEATER_STATE_NAMES[HeaterState(value)]
    except ValueError:
        return f"UNKNOWN_{value}"


def auto_tune_state_name(value: int) -> str:
    try:
        return AUTO_TUNE_STATE_NAMES[AutoTuneState(value)]
    except ValueError:
        return f"UNKNOWN_{value}"


def pack_state(heater_state: int, auto_tune_state: int) -> int:
    return ((int(auto_tune_state) & 0xFF) << 8) | (int(heater_state) & 0xFF)


def unpack_state(state_packed: int) -> tuple[int, int]:
    heater_state = state_packed & 0xFF
    auto_tune_state = (state_packed >> 8) & 0xFF
    return heater_state, auto_tune_state


def encode_rxpdo(control_word: int, target_temp: float, kp: float, ki: float) -> bytes:
    data = struct.pack("<Hfff", int(control_word), float(target_temp), float(kp), float(ki))
    if len(data) != RX_PDO_SIZE:
        raise ValueError(f"RxPDO must be {RX_PDO_SIZE} bytes, got {len(data)}")
    return data


def decode_txpdo(data: bytes) -> Dict[str, Any]:
    if len(data) != TX_PDO_SIZE:
        raise ValueError(f"TxPDO must be {TX_PDO_SIZE} bytes, got {len(data)}")

    (
        status_word,
        state_packed,
        current_temp,
        error,
        u_ctrl,
        duty_cnt,
        tune_k,
        tune_l,
        tune_t,
        tune_kp,
        tune_ki,
        tuned_gain_valid,
        auto_tune_error,
    ) = struct.unpack("<HHfffIfffffII", data)

    heater_state, auto_tune_state = unpack_state(state_packed)
    duty_percent = clamp((float(duty_cnt) / PWM_PERIOD_COUNT) * 100.0, 0.0, 100.0)
    u_percent = clamp(float(u_ctrl) * 100.0, 0.0, 100.0)

    return {
        "status_word": status_word,
        "state_packed": state_packed,
        "heater_state": heater_state,
        "heater_state_name": heater_state_name(heater_state),
        "auto_tune_state": auto_tune_state,
        "auto_tune_state_name": auto_tune_state_name(auto_tune_state),
        "current_temp": current_temp,
        "error": error,
        "u_ctrl": u_ctrl,
        "u_percent": u_percent,
        "duty_cnt": duty_cnt,
        "duty_percent": duty_percent,
        "tune_k": tune_k,
        "tune_l": tune_l,
        "tune_t": tune_t,
        "tune_kp": tune_kp,
        "tune_ki": tune_ki,
        "tuned_gain_valid": bool(tuned_gain_valid),
        "auto_tune_error": auto_tune_error,
        "is_run": bool(status_word & StatusBit.RUN),
        "is_stable": bool(status_word & StatusBit.STABLE),
        "is_fault": bool(status_word & StatusBit.FAULT),
        "is_auto_tune": bool(status_word & StatusBit.AUTO_TUNE),
        "auto_tune_done": bool(status_word & StatusBit.AUTO_TUNE_DONE),
        "auto_tune_fail_or_abort": bool(status_word & StatusBit.AUTO_TUNE_FAIL_OR_ABORT),
        "tuned_gain_valid_flag": bool(status_word & StatusBit.TUNED_GAIN_VALID),
    }


def encode_txpdo(status: Dict[str, Any]) -> bytes:
    data = struct.pack(
        "<HHfffIfffffII",
        int(status.get("status_word", 0)),
        int(status.get("state_packed", 0)),
        float(status.get("current_temp", 0.0)),
        float(status.get("error", 0.0)),
        float(status.get("u_ctrl", 0.0)),
        int(status.get("duty_cnt", 0)),
        float(status.get("tune_k", 0.0)),
        float(status.get("tune_l", 0.0)),
        float(status.get("tune_t", 0.0)),
        float(status.get("tune_kp", 0.0)),
        float(status.get("tune_ki", 0.0)),
        int(bool(status.get("tuned_gain_valid", False))),
        int(status.get("auto_tune_error", 0)),
    )
    if len(data) != TX_PDO_SIZE:
        raise ValueError(f"TxPDO must be {TX_PDO_SIZE} bytes, got {len(data)}")
    return data


def build_status_word(
    heater_state: int,
    auto_tune_state: int,
    tuned_gain_valid: bool,
    auto_tune_error: int = 0,
) -> int:
    status_word = 0

    if heater_state in (HeaterState.RUN, HeaterState.STABLE, HeaterState.AUTO_TUNE):
        status_word |= StatusBit.RUN
    if heater_state == HeaterState.STABLE:
        status_word |= StatusBit.STABLE
    if heater_state == HeaterState.FAULT:
        status_word |= StatusBit.FAULT
    if heater_state == HeaterState.AUTO_TUNE:
        status_word |= StatusBit.AUTO_TUNE
    if auto_tune_state == AutoTuneState.DONE:
        status_word |= StatusBit.AUTO_TUNE_DONE
    if auto_tune_state in (AutoTuneState.FAIL, AutoTuneState.ABORT) or auto_tune_error:
        status_word |= StatusBit.AUTO_TUNE_FAIL_OR_ABORT
    if tuned_gain_valid:
        status_word |= StatusBit.TUNED_GAIN_VALID

    return int(status_word)
