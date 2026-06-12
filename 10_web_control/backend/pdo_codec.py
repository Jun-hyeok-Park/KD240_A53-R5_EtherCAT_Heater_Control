"""RxPDO/TxPDO codec for the KD240 heater protocol.

The byte layout matches the legacy v4.5 GUI reference:
`09_GUI/kd240_heater_ethercat_gui_v4_5_report_layout_fix.py`.
"""

import struct
from enum import IntEnum
from typing import Any, Dict, Sequence, Tuple


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
    # EtherCAT GUI scope only. Do not forward this bit directly to KD240
    # shared memory because the same 0x0010 value is AUTO_TUNE_ABORT there.
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


class TxPdoStatus:
    def __init__(
        self,
        status_word: int,
        state_packed: int,
        heater_state: int,
        heater_state_name: str,
        auto_tune_state: int,
        auto_tune_state_name: str,
        current_temp: float,
        error: float,
        u_ctrl: float,
        u_percent: float,
        duty_cnt: int,
        duty_percent: float,
        tune_k: float,
        tune_l: float,
        tune_t: float,
        tune_kp: float,
        tune_ki: float,
        tuned_gain_valid: bool,
        auto_tune_error: int,
        is_run: bool,
        is_stable: bool,
        is_fault: bool,
        is_auto_tune: bool,
        auto_tune_done: bool,
        auto_tune_fail_or_abort: bool,
        tuned_gain_valid_flag: bool,
    ) -> None:
        self.status_word = status_word
        self.state_packed = state_packed
        self.heater_state = heater_state
        self.heater_state_name = heater_state_name
        self.auto_tune_state = auto_tune_state
        self.auto_tune_state_name = auto_tune_state_name
        self.current_temp = current_temp
        self.error = error
        self.u_ctrl = u_ctrl
        self.u_percent = u_percent
        self.duty_cnt = duty_cnt
        self.duty_percent = duty_percent
        self.tune_k = tune_k
        self.tune_l = tune_l
        self.tune_t = tune_t
        self.tune_kp = tune_kp
        self.tune_ki = tune_ki
        self.tuned_gain_valid = tuned_gain_valid
        self.auto_tune_error = auto_tune_error
        self.is_run = is_run
        self.is_stable = is_stable
        self.is_fault = is_fault
        self.is_auto_tune = is_auto_tune
        self.auto_tune_done = auto_tune_done
        self.auto_tune_fail_or_abort = auto_tune_fail_or_abort
        self.tuned_gain_valid_flag = tuned_gain_valid_flag

    def to_dict(self) -> Dict[str, Any]:
        return {
            "status_word": self.status_word,
            "state_packed": self.state_packed,
            "heater_state": self.heater_state,
            "heater_state_name": self.heater_state_name,
            "auto_tune_state": self.auto_tune_state,
            "auto_tune_state_name": self.auto_tune_state_name,
            "current_temp": self.current_temp,
            "error": self.error,
            "u_ctrl": self.u_ctrl,
            "u_percent": self.u_percent,
            "duty_cnt": self.duty_cnt,
            "duty_percent": self.duty_percent,
            "tune_k": self.tune_k,
            "tune_l": self.tune_l,
            "tune_t": self.tune_t,
            "tune_kp": self.tune_kp,
            "tune_ki": self.tune_ki,
            "tuned_gain_valid": self.tuned_gain_valid,
            "auto_tune_error": self.auto_tune_error,
            "is_run": self.is_run,
            "is_stable": self.is_stable,
            "is_fault": self.is_fault,
            "is_auto_tune": self.is_auto_tune,
            "auto_tune_done": self.auto_tune_done,
            "auto_tune_fail_or_abort": self.auto_tune_fail_or_abort,
            "tuned_gain_valid_flag": self.tuned_gain_valid_flag,
        }


def clamp(value: float, low: float, high: float) -> float:
    return max(low, min(high, value))


def f32_to_u32(value: float) -> int:
    return struct.unpack("<I", struct.pack("<f", float(value)))[0]


def u32_to_f32(value: int) -> float:
    return struct.unpack("<f", struct.pack("<I", int(value) & 0xFFFFFFFF))[0]


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


def unpack_state(state_packed: int) -> Tuple[int, int]:
    heater_state = int(state_packed) & 0x00FF
    auto_tune_state = (int(state_packed) >> 8) & 0x00FF
    return heater_state, auto_tune_state


def encode_rxpdo(control_word: int, target_temp: float, kp: float, ki: float) -> bytes:
    """Encode RxPDO as 14 bytes: UINT16 + three raw float32 UINT32 fields."""

    data = struct.pack(
        "<HIII",
        int(control_word) & 0xFFFF,
        f32_to_u32(target_temp),
        f32_to_u32(kp),
        f32_to_u32(ki),
    )
    if len(data) != RX_PDO_SIZE:
        raise ValueError(f"RxPDO must be {RX_PDO_SIZE} bytes, got {len(data)}")
    return data


def decode_txpdo(data: Sequence[int]) -> TxPdoStatus:
    """Decode 48-byte TxPDO into a structured status object."""

    raw = bytes(data)
    if len(raw) != TX_PDO_SIZE:
        raise ValueError(f"TxPDO must be {TX_PDO_SIZE} bytes, got {len(raw)}")

    (
        status_word,
        state_packed,
        current_raw,
        error_raw,
        u_ctrl_raw,
        duty_cnt,
        tune_k_raw,
        tune_l_raw,
        tune_t_raw,
        tune_kp_raw,
        tune_ki_raw,
        tuned_gain_valid,
        auto_tune_error,
    ) = struct.unpack("<HHIIIIIIIIIII", raw)

    heater_state, auto_tune_state = unpack_state(state_packed)
    u_ctrl = u32_to_f32(u_ctrl_raw)
    duty_percent = clamp((float(duty_cnt) / PWM_PERIOD_COUNT) * 100.0, 0.0, 100.0)
    u_percent = clamp(float(u_ctrl) * 100.0, 0.0, 100.0)

    return TxPdoStatus(
        status_word=status_word,
        state_packed=state_packed,
        heater_state=heater_state,
        heater_state_name=heater_state_name(heater_state),
        auto_tune_state=auto_tune_state,
        auto_tune_state_name=auto_tune_state_name(auto_tune_state),
        current_temp=u32_to_f32(current_raw),
        error=u32_to_f32(error_raw),
        u_ctrl=u_ctrl,
        u_percent=u_percent,
        duty_cnt=duty_cnt,
        duty_percent=duty_percent,
        tune_k=u32_to_f32(tune_k_raw),
        tune_l=u32_to_f32(tune_l_raw),
        tune_t=u32_to_f32(tune_t_raw),
        tune_kp=u32_to_f32(tune_kp_raw),
        tune_ki=u32_to_f32(tune_ki_raw),
        tuned_gain_valid=bool(tuned_gain_valid),
        auto_tune_error=auto_tune_error,
        is_run=bool(status_word & StatusBit.RUN),
        is_stable=bool(status_word & StatusBit.STABLE),
        is_fault=bool(status_word & StatusBit.FAULT),
        is_auto_tune=bool(status_word & StatusBit.AUTO_TUNE),
        auto_tune_done=bool(status_word & StatusBit.AUTO_TUNE_DONE),
        auto_tune_fail_or_abort=bool(status_word & StatusBit.AUTO_TUNE_FAIL_OR_ABORT),
        tuned_gain_valid_flag=bool(status_word & StatusBit.TUNED_GAIN_VALID) or bool(tuned_gain_valid),
    )


def encode_txpdo_sample(
    *,
    status_word: int,
    state_packed: int,
    current_temp: float,
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
) -> bytes:
    """Build TxPDO bytes for tests and mock diagnostics."""

    data = struct.pack(
        "<HHIIIIIIIIIII",
        int(status_word) & 0xFFFF,
        int(state_packed) & 0xFFFF,
        f32_to_u32(current_temp),
        f32_to_u32(error),
        f32_to_u32(u_ctrl),
        int(duty_cnt) & 0xFFFFFFFF,
        f32_to_u32(tune_k),
        f32_to_u32(tune_l),
        f32_to_u32(tune_t),
        f32_to_u32(tune_kp),
        f32_to_u32(tune_ki),
        int(bool(tuned_gain_valid)),
        int(auto_tune_error) & 0xFFFFFFFF,
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
