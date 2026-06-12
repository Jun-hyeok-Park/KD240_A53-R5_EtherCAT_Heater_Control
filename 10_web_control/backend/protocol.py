"""KD240 heater protocol constants and byte helpers."""

from typing import Any, Dict

from pdo_codec import (
    AUTO_TUNE_STATE_NAMES,
    HEATER_STATE_NAMES,
    PDO_INPUT_ADDR,
    PDO_OUTPUT_ADDR,
    PWM_PERIOD_COUNT,
    RX_PDO_SIZE,
    TX_PDO_SIZE,
    AutoTuneState,
    ControlWord,
    HeaterState,
    StatusBit,
    auto_tune_state_name,
    build_status_word,
    clamp,
    encode_rxpdo,
    encode_txpdo_sample,
    f32_to_u32,
    heater_state_name,
    pack_state,
    unpack_state,
    u32_to_f32,
)


def decode_txpdo(data: bytes) -> Dict[str, Any]:
    from pdo_codec import decode_txpdo as decode_txpdo_status

    return decode_txpdo_status(data).to_dict()


def encode_txpdo(status: Dict[str, Any]) -> bytes:
    return encode_txpdo_sample(
        status_word=int(status.get("status_word", 0)),
        state_packed=int(status.get("state_packed", 0)),
        current_temp=float(status.get("current_temp", 0.0)),
        error=float(status.get("error", 0.0)),
        u_ctrl=float(status.get("u_ctrl", 0.0)),
        duty_cnt=int(status.get("duty_cnt", 0)),
        tune_k=float(status.get("tune_k", 0.0)),
        tune_l=float(status.get("tune_l", 0.0)),
        tune_t=float(status.get("tune_t", 0.0)),
        tune_kp=float(status.get("tune_kp", 0.0)),
        tune_ki=float(status.get("tune_ki", 0.0)),
        tuned_gain_valid=bool(status.get("tuned_gain_valid", False)),
        auto_tune_error=int(status.get("auto_tune_error", 0)),
    )
