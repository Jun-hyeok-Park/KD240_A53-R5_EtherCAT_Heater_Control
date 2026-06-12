"""Python 3.6-compatible KD240 RxPDO/TxPDO codec for the WMX bridge."""

import struct
from enum import IntEnum


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
        status_word,
        state_packed,
        heater_state,
        heater_state_name,
        auto_tune_state,
        auto_tune_state_name,
        current_temp,
        error,
        u_ctrl,
        u_percent,
        duty_cnt,
        duty_percent,
        tune_k,
        tune_l,
        tune_t,
        tune_kp,
        tune_ki,
        tuned_gain_valid,
        auto_tune_error,
        is_run,
        is_stable,
        is_fault,
        is_auto_tune,
        auto_tune_done,
        auto_tune_fail_or_abort,
        tuned_gain_valid_flag,
    ):
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

    def to_dict(self):
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


def clamp(value, low, high):
    return max(low, min(high, value))


def f32_to_u32(value):
    return struct.unpack("<I", struct.pack("<f", float(value)))[0]


def u32_to_f32(value):
    return struct.unpack("<f", struct.pack("<I", int(value) & 0xFFFFFFFF))[0]


def heater_state_name(value):
    try:
        return HEATER_STATE_NAMES[HeaterState(value)]
    except ValueError:
        return "UNKNOWN_{0}".format(value)


def auto_tune_state_name(value):
    try:
        return AUTO_TUNE_STATE_NAMES[AutoTuneState(value)]
    except ValueError:
        return "UNKNOWN_{0}".format(value)


def pack_state(heater_state, auto_tune_state):
    return ((int(auto_tune_state) & 0xFF) << 8) | (int(heater_state) & 0xFF)


def unpack_state(state_packed):
    heater_state = int(state_packed) & 0x00FF
    auto_tune_state = (int(state_packed) >> 8) & 0x00FF
    return heater_state, auto_tune_state


def encode_rxpdo(control_word, target_temp, kp, ki):
    data = struct.pack(
        "<HIII",
        int(control_word) & 0xFFFF,
        f32_to_u32(target_temp),
        f32_to_u32(kp),
        f32_to_u32(ki),
    )
    if len(data) != RX_PDO_SIZE:
        raise ValueError("RxPDO must be {0} bytes, got {1}".format(RX_PDO_SIZE, len(data)))
    return data


def decode_txpdo(data):
    raw = bytes(bytearray(data))
    if len(raw) != TX_PDO_SIZE:
        raise ValueError("TxPDO must be {0} bytes, got {1}".format(TX_PDO_SIZE, len(raw)))

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
