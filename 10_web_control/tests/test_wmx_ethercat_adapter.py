from __future__ import annotations

import struct
import sys
import unittest
from pathlib import Path


BACKEND_DIR = Path(__file__).resolve().parents[1] / "backend"
sys.path.insert(0, str(BACKEND_DIR))

from adapters.base import BackendAdapterError  # noqa: E402
from adapters.wmx_ethercat_adapter import WmxEthercatAdapter  # noqa: E402
from dto import CommandDTO  # noqa: E402
from pdo_codec import (  # noqa: E402
    AutoTuneState,
    ControlWord,
    HeaterState,
    StatusBit,
    encode_txpdo_sample,
    pack_state,
)


class FakeDeviceType:
    DeviceTypeLowPriority = 7


class FakeWmx:
    def __init__(self) -> None:
        self.created = False
        self.closed = False
        self.device_name = None
        self.root = None
        self.device_type = None
        self.timeout = None

    def CreateDevice(self, root: str, device_type: int, timeout: int) -> int:  # noqa: N802
        self.created = True
        self.root = root
        self.device_type = device_type
        self.timeout = timeout
        return 0

    def SetDeviceName(self, name: str) -> int:  # noqa: N802
        self.device_name = name
        return 0

    def CloseDevice(self) -> int:  # noqa: N802
        self.closed = True
        return 0


class FakeIo:
    def __init__(self, wmx: FakeWmx) -> None:
        self.wmx = wmx
        self.out_writes: list[tuple[int, int, list[int]]] = []
        self.in_data = encode_txpdo_sample(
            status_word=StatusBit.RUN | StatusBit.AUTO_TUNE_DONE | StatusBit.TUNED_GAIN_VALID,
            state_packed=pack_state(HeaterState.RUN, AutoTuneState.DONE),
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

    def SetOutBytes(self, addr: int, size: int, data: list[int]) -> int:  # noqa: N802
        self.out_writes.append((addr, size, list(data)))
        return 0

    def GetInBytes(self, addr: int, size: int):  # noqa: N802
        return 0, list(self.in_data[:size])


class FakeWmxModule:
    DeviceType = FakeDeviceType
    INFINITE = 123456

    @staticmethod
    def WMX3Api() -> FakeWmx:  # noqa: N802
        return FakeWmx()

    @staticmethod
    def Io(wmx: FakeWmx) -> FakeIo:  # noqa: N802
        return FakeIo(wmx)


class FailingWmx(FakeWmx):
    def CreateDevice(self, root: str, device_type: int, timeout: int) -> int:  # noqa: N802
        super().CreateDevice(root, device_type, timeout)
        return 901


class FailingWmxModule(FakeWmxModule):
    @staticmethod
    def WMX3Api() -> FailingWmx:  # noqa: N802
        return FailingWmx()


class TestWmxEthercatAdapter(unittest.TestCase):
    def test_adapter_import_and_construct_without_wmx3(self) -> None:
        adapter = WmxEthercatAdapter()

        diagnostics = adapter.get_diagnostics()

        self.assertEqual(diagnostics["adapter"], "ethercat")
        self.assertEqual(diagnostics["adapter_type"], "wmx_ethercat")
        self.assertFalse(diagnostics["connected"])
        self.assertEqual(diagnostics["rxpdo_bytes"], 14)
        self.assertEqual(diagnostics["txpdo_bytes"], 48)

    def test_connect_run_and_read_status_with_fake_wmx_api(self) -> None:
        adapter = WmxEthercatAdapter(
            api_module=FakeWmxModule,
            clear_delay_sec=0.0,
            device_name="UnitTestDevice",
        )

        adapter.connect()
        status = adapter.run(CommandDTO(target_temp=80.0, kp=0.04, ki=0.003))

        self.assertTrue(adapter.connected)
        self.assertEqual(status.heater_state, int(HeaterState.RUN))
        self.assertEqual(status.auto_tune_state, int(AutoTuneState.DONE))
        self.assertAlmostEqual(status.tune_kp, 0.038, places=6)
        self.assertEqual(len(adapter.io.out_writes), 1)

        addr, size, data = adapter.io.out_writes[0]
        self.assertEqual(addr, 0x00)
        self.assertEqual(size, 14)
        self.assertEqual(struct.unpack("<H", bytes(data[:2]))[0], ControlWord.RUN)

    def test_pulse_command_writes_command_then_clear(self) -> None:
        adapter = WmxEthercatAdapter(api_module=FakeWmxModule, clear_delay_sec=0.0)
        adapter.connect()

        adapter.start_auto_tune(CommandDTO(target_temp=80.0, kp=0.04, ki=0.003))

        self.assertGreaterEqual(len(adapter.io.out_writes), 2)
        first = struct.unpack("<H", bytes(adapter.io.out_writes[0][2][:2]))[0]
        second = struct.unpack("<H", bytes(adapter.io.out_writes[1][2][:2]))[0]
        self.assertEqual(first, ControlWord.AUTO_TUNE_START)
        self.assertEqual(second, ControlWord.CLEAR)

    def test_apply_tuned_gain_uses_decoded_tuned_gains_then_run(self) -> None:
        adapter = WmxEthercatAdapter(api_module=FakeWmxModule, clear_delay_sec=0.0)
        adapter.connect()

        status = adapter.apply_tuned_gain(80.0)

        self.assertTrue(status.tuned_gain_valid)
        self.assertAlmostEqual(status.kp, 0.038, places=6)
        self.assertAlmostEqual(status.ki, 0.0028, places=6)
        last_write = adapter.io.out_writes[-1][2]
        self.assertEqual(struct.unpack("<H", bytes(last_write[:2]))[0], ControlWord.RUN)

    def test_connect_failure_is_diagnostic_not_import_time_failure(self) -> None:
        adapter = WmxEthercatAdapter(api_module=FailingWmxModule)

        with self.assertRaises(BackendAdapterError):
            adapter.connect()

        diagnostics = adapter.get_diagnostics()
        self.assertFalse(adapter.connected)
        self.assertIn("CreateDevice failed", diagnostics["fault"])


if __name__ == "__main__":
    unittest.main()
