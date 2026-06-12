from __future__ import annotations

import sys
import unittest
from pathlib import Path


BACKEND_DIR = Path(__file__).resolve().parents[1] / "backend"
sys.path.insert(0, str(BACKEND_DIR))

from adapters.ethercat_bridge_adapter import EthercatBridgeAdapter  # noqa: E402
from adapters.wmx_ethercat_adapter import WmxEthercatAdapter  # noqa: E402
from dto import CommandDTO  # noqa: E402


FAKE_BRIDGE = Path(__file__).resolve().parent / "fake_wmx_bridge.py"


class TestEthercatBridgeAdapter(unittest.TestCase):
    def make_adapter(self) -> EthercatBridgeAdapter:
        return EthercatBridgeAdapter(
            py36_executable=sys.executable,
            bridge_script=str(FAKE_BRIDGE),
            request_timeout_sec=3.0,
        )

    def test_connect_run_and_read_status_through_bridge_subprocess(self) -> None:
        adapter = self.make_adapter()
        try:
            adapter.connect()
            status = adapter.run(CommandDTO(target_temp=80.0, kp=0.04, ki=0.003))

            self.assertTrue(adapter.connected)
            self.assertEqual(status.heater_state, 1)
            self.assertEqual(status.auto_tune_state, 4)
            self.assertAlmostEqual(status.tune_kp, 0.038, places=6)
            self.assertEqual(adapter.get_diagnostics()["adapter"], "ethercat_bridge")
            self.assertTrue(adapter.get_diagnostics()["bridge_process_alive"])
            self.assertEqual(
                adapter.get_diagnostics()["bridge_diagnostics"]["create_device_timeout"],
                0xFFFFFFFF,
            )
        finally:
            adapter.disconnect()

    def test_apply_tuned_gain_uses_bridge_status(self) -> None:
        adapter = self.make_adapter()
        try:
            adapter.connect()
            status = adapter.apply_tuned_gain(82.0)

            self.assertTrue(status.tuned_gain_valid)
            self.assertAlmostEqual(status.target_temp, 82.0, places=3)
            self.assertAlmostEqual(status.kp, 0.038, places=6)
            self.assertAlmostEqual(status.ki, 0.0028, places=6)
        finally:
            adapter.disconnect()

    def test_legacy_wmx_adapter_import_routes_to_bridge_adapter(self) -> None:
        adapter = WmxEthercatAdapter(
            py36_executable=sys.executable,
            bridge_script=str(FAKE_BRIDGE),
            request_timeout_sec=3.0,
        )
        try:
            adapter.connect()
            self.assertEqual(adapter.name, "ethercat_bridge")
            self.assertEqual(adapter.get_diagnostics()["adapter_type"], "ethercat_bridge")
        finally:
            adapter.disconnect()


if __name__ == "__main__":
    unittest.main()
