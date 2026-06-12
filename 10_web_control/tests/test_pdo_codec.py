from __future__ import annotations

import struct
import sys
import unittest
from pathlib import Path


BACKEND_DIR = Path(__file__).resolve().parents[1] / "backend"
sys.path.insert(0, str(BACKEND_DIR))

from pdo_codec import (  # noqa: E402
    RX_PDO_SIZE,
    TX_PDO_SIZE,
    AutoTuneState,
    ControlWord,
    HeaterState,
    StatusBit,
    decode_txpdo,
    encode_rxpdo,
    encode_txpdo_sample,
    f32_to_u32,
    pack_state,
    u32_to_f32,
)


class TestPdoCodec(unittest.TestCase):
    def test_rxpdo_run_encodes_14_bytes(self) -> None:
        data = encode_rxpdo(ControlWord.RUN, 80.0, 0.04, 0.003)

        self.assertEqual(len(data), RX_PDO_SIZE)
        self.assertEqual(
            data,
            struct.pack(
                "<HIII",
                0x0001,
                f32_to_u32(80.0),
                f32_to_u32(0.04),
                f32_to_u32(0.003),
            ),
        )
        self.assertEqual(data.hex(" "), "01 00 00 00 a0 42 0a d7 23 3d a6 9b 44 3b")

    def test_rxpdo_pulse_command_words(self) -> None:
        commands = [
            (ControlWord.STOP, 0x0002),
            (ControlWord.RESET, 0x0004),
            (ControlWord.AUTO_TUNE_START, 0x0008),
        ]

        for command, expected in commands:
            with self.subTest(command=command.name):
                data = encode_rxpdo(command, 80.0, 0.04, 0.003)
                self.assertEqual(len(data), RX_PDO_SIZE)
                self.assertEqual(struct.unpack("<H", data[:2])[0], expected)

    def test_float32_little_endian_raw_conversion(self) -> None:
        self.assertEqual(f32_to_u32(80.0), 0x42A00000)
        self.assertEqual(f32_to_u32(0.04), 0x3D23D70A)
        self.assertEqual(f32_to_u32(0.003), 0x3B449BA6)
        self.assertEqual(struct.pack("<I", f32_to_u32(80.0)), b"\x00\x00\xa0\x42")
        self.assertAlmostEqual(u32_to_f32(0x42A00000), 80.0, places=6)

    def test_txpdo_decode_48_byte_sample(self) -> None:
        status_word = (
            StatusBit.RUN
            | StatusBit.AUTO_TUNE_DONE
            | StatusBit.TUNED_GAIN_VALID
        )
        state_packed = pack_state(HeaterState.RUN, AutoTuneState.DONE)
        data = encode_txpdo_sample(
            status_word=status_word,
            state_packed=state_packed,
            current_temp=79.25,
            error=0.75,
            u_ctrl=0.35,
            duty_cnt=35000,
            tune_k=118.5,
            tune_l=1.25,
            tune_t=47.5,
            tune_kp=0.038,
            tune_ki=0.0028,
            tuned_gain_valid=True,
            auto_tune_error=0,
        )

        self.assertEqual(len(data), TX_PDO_SIZE)
        decoded = decode_txpdo(data)

        self.assertEqual(decoded.status_word, int(status_word))
        self.assertEqual(decoded.state_packed, 0x0401)
        self.assertEqual(decoded.heater_state, 1)
        self.assertEqual(decoded.heater_state_name, "RUN")
        self.assertEqual(decoded.auto_tune_state, 4)
        self.assertEqual(decoded.auto_tune_state_name, "DONE")
        self.assertAlmostEqual(decoded.current_temp, 79.25, places=6)
        self.assertAlmostEqual(decoded.error, 0.75, places=6)
        self.assertAlmostEqual(decoded.u_ctrl, 0.35, places=6)
        self.assertAlmostEqual(decoded.u_percent, 35.0, places=5)
        self.assertEqual(decoded.duty_cnt, 35000)
        self.assertAlmostEqual(decoded.duty_percent, 35.0, places=6)
        self.assertAlmostEqual(decoded.tune_k, 118.5, places=6)
        self.assertAlmostEqual(decoded.tune_l, 1.25, places=6)
        self.assertAlmostEqual(decoded.tune_t, 47.5, places=6)
        self.assertAlmostEqual(decoded.tune_kp, 0.038, places=6)
        self.assertAlmostEqual(decoded.tune_ki, 0.0028, places=6)
        self.assertTrue(decoded.tuned_gain_valid)
        self.assertEqual(decoded.auto_tune_error, 0)
        self.assertTrue(decoded.is_run)
        self.assertFalse(decoded.is_stable)
        self.assertFalse(decoded.is_fault)
        self.assertFalse(decoded.is_auto_tune)
        self.assertTrue(decoded.auto_tune_done)
        self.assertFalse(decoded.auto_tune_fail_or_abort)
        self.assertTrue(decoded.tuned_gain_valid_flag)

    def test_txpdo_status_word_bits_decode(self) -> None:
        status_word = (
            StatusBit.RUN
            | StatusBit.STABLE
            | StatusBit.FAULT
            | StatusBit.AUTO_TUNE
            | StatusBit.AUTO_TUNE_DONE
            | StatusBit.AUTO_TUNE_FAIL_OR_ABORT
            | StatusBit.TUNED_GAIN_VALID
        )
        data = encode_txpdo_sample(
            status_word=status_word,
            state_packed=pack_state(HeaterState.FAULT, AutoTuneState.FAIL),
            current_temp=65.0,
            error=-2.5,
            u_ctrl=1.0,
            duty_cnt=100000,
            tune_k=0.0,
            tune_l=0.0,
            tune_t=0.0,
            tune_kp=0.0,
            tune_ki=0.0,
            tuned_gain_valid=False,
            auto_tune_error=7,
        )

        decoded = decode_txpdo(data)

        self.assertTrue(decoded.is_run)
        self.assertTrue(decoded.is_stable)
        self.assertTrue(decoded.is_fault)
        self.assertTrue(decoded.is_auto_tune)
        self.assertTrue(decoded.auto_tune_done)
        self.assertTrue(decoded.auto_tune_fail_or_abort)
        self.assertTrue(decoded.tuned_gain_valid_flag)
        self.assertEqual(decoded.heater_state_name, "FAULT")
        self.assertEqual(decoded.auto_tune_state_name, "FAIL")
        self.assertEqual(decoded.auto_tune_error, 7)

    def test_txpdo_rejects_wrong_length(self) -> None:
        with self.assertRaises(ValueError):
            decode_txpdo(bytes(TX_PDO_SIZE - 1))


if __name__ == "__main__":
    unittest.main()
