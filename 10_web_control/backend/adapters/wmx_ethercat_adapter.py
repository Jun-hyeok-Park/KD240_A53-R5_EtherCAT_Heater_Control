"""WMX3 EtherCAT backend adapter for the KD240 1-channel PDO path."""

from __future__ import annotations

import importlib
import os
import sys
import time
import traceback
from pathlib import Path
from typing import Any, Dict, List, Optional

from adapters.base import BackendAdapterError, IHeaterBackendAdapter
from dto import CommandDTO, StatusDTO
from pdo_codec import (
    PDO_INPUT_ADDR,
    PDO_OUTPUT_ADDR,
    RX_PDO_SIZE,
    TX_PDO_SIZE,
    ControlWord,
    decode_txpdo,
    encode_rxpdo,
)
from protocol import AutoTuneState, HeaterState, pack_state


def is_success(ret: Any) -> bool:
    return ret is None or ret == 0


class WmxEthercatAdapter(IHeaterBackendAdapter):
    name = "ethercat"

    def __init__(
        self,
        *,
        wmx_root: str | None = None,
        device_name: str = "KD240HeaterWebControl",
        clear_delay_sec: float = 0.05,
        api_module: Any | None = None,
    ) -> None:
        super().__init__()
        self.wmx_root = wmx_root or os.environ.get("WMX_ROOT", r"C:\Program Files\SoftServo\WMX3")
        self.device_name = device_name
        self.clear_delay_sec = clear_delay_sec
        self._api_module = api_module
        self._api: Dict[str, Any] = {}
        self.wmx: Any | None = None
        self.io: Any | None = None
        self.command = CommandDTO()
        self.last_status = self._default_status()
        self.last_error: str | None = None
        self.last_traceback: str | None = None
        self.last_ret: Any | None = None
        self.last_control_word = int(ControlWord.CLEAR)
        self.last_rxpdo_hex: str | None = None
        self.last_txpdo_hex: str | None = None
        self._events: List[Dict[str, Any]] = []

    def connect(self) -> None:
        self.last_error = None
        self.last_traceback = None
        try:
            api = self._load_wmx_api()
            self.wmx = api["WMX3Api"]()
            ret = self.wmx.CreateDevice(
                self._wmx_root_with_separator(),
                api["DeviceType"].DeviceTypeLowPriority,
                api["INFINITE"],
            )
            self.last_ret = ret
            if not is_success(ret):
                self.wmx = None
                raise BackendAdapterError(f"CreateDevice failed. ret={ret}")

            ret = self.wmx.SetDeviceName(self.device_name)
            self.last_ret = ret
            if not is_success(ret):
                self.wmx = None
                raise BackendAdapterError(f"SetDeviceName failed. ret={ret}")

            self.io = api["Io"](self.wmx)
            self.connected = True
            self._push_event("info", "WMX3 EtherCAT adapter connected", {"device_name": self.device_name})
        except BackendAdapterError as exc:
            self._set_error(str(exc))
            self.disconnect()
            raise
        except Exception as exc:  # noqa: BLE001
            self._set_error(f"WMX3 connect exception: {exc}", traceback.format_exc())
            self.disconnect()
            raise BackendAdapterError(self.last_error or "WMX3 connect exception") from exc

    def disconnect(self) -> None:
        if self.wmx is not None:
            try:
                ret = self.wmx.CloseDevice()
                self.last_ret = ret
            except Exception as exc:  # noqa: BLE001
                self._set_error(f"CloseDevice exception: {exc}", traceback.format_exc())
        self.wmx = None
        self.io = None
        self.connected = False

    def read_status(self) -> StatusDTO:
        if not self.connected or self.io is None:
            return self.last_status

        try:
            ret, in_data = self.io.GetInBytes(PDO_INPUT_ADDR, TX_PDO_SIZE)
            self.last_ret = ret
            if not is_success(ret):
                raise BackendAdapterError(f"GetInBytes failed. ret={ret}")

            raw = bytes(list(in_data[:TX_PDO_SIZE]))
            self.last_txpdo_hex = raw.hex(" ")
            decoded = decode_txpdo(raw)
            self.last_status = self._status_from_decoded(decoded)
            self.last_error = None
            return self.last_status
        except BackendAdapterError as exc:
            self._set_error(str(exc))
            return self.last_status
        except Exception as exc:  # noqa: BLE001
            self._set_error(f"GetInBytes exception: {exc}", traceback.format_exc())
            return self.last_status

    def write_params(self, command: CommandDTO) -> StatusDTO:
        self.command = command
        self._write_output(ControlWord.CLEAR, command)
        return self.read_status()

    def run(self, command: CommandDTO) -> StatusDTO:
        self.command = command
        self._write_output(ControlWord.RUN, command)
        return self.read_status()

    def stop(self) -> StatusDTO:
        self._write_pulse(ControlWord.STOP, self.command)
        return self.read_status()

    def reset(self) -> StatusDTO:
        self._write_pulse(ControlWord.RESET, self.command)
        return self.read_status()

    def start_auto_tune(self, command: CommandDTO) -> StatusDTO:
        self.command = command
        self._write_pulse(ControlWord.AUTO_TUNE_START, command)
        return self.read_status()

    def apply_tuned_gain(self, target_temp: float) -> StatusDTO:
        status = self.read_status()
        if not status.tuned_gain_valid:
            raise BackendAdapterError("No valid tuned gain is available")

        command = CommandDTO(
            target_temp=target_temp,
            kp=status.tune_kp,
            ki=status.tune_ki,
        )
        return self.run(command)

    def clear_command(self) -> StatusDTO:
        self._write_output(ControlWord.CLEAR, self.command)
        return self.read_status()

    def take_events(self) -> List[Dict[str, Any]]:
        events = list(self._events)
        self._events.clear()
        return events

    def get_diagnostics(self) -> Dict[str, Any]:
        return {
            "adapter": self.name,
            "adapter_type": "wmx_ethercat",
            "connected": self.connected,
            "fault": self.last_error,
            "last_ret": self.last_ret,
            "wmx_root": self.wmx_root,
            "device_name": self.device_name,
            "pdo_input_addr": PDO_INPUT_ADDR,
            "pdo_output_addr": PDO_OUTPUT_ADDR,
            "rxpdo_bytes": RX_PDO_SIZE,
            "txpdo_bytes": TX_PDO_SIZE,
            "last_control_word": self.last_control_word,
            "last_rxpdo_hex": self.last_rxpdo_hex,
            "last_txpdo_hex": self.last_txpdo_hex,
            "traceback": self.last_traceback,
        }

    def _load_wmx_api(self) -> Dict[str, Any]:
        if self._api:
            return self._api

        module = self._api_module
        if module is None:
            self._prepare_wmx_paths()
            try:
                module = importlib.import_module("WMX3ApiPython")
            except Exception as exc:  # noqa: BLE001
                raise BackendAdapterError(
                    "WMX3ApiPython import failed. Check WMX3 installation, Python version, and WMX_ROOT."
                ) from exc

        try:
            self._api = {
                "WMX3Api": getattr(module, "WMX3Api"),
                "Io": getattr(module, "Io"),
                "DeviceType": getattr(module, "DeviceType"),
                "INFINITE": getattr(module, "INFINITE"),
            }
        except AttributeError as exc:
            raise BackendAdapterError(f"WMX3ApiPython missing expected symbol: {exc}") from exc

        return self._api

    def _prepare_wmx_paths(self) -> None:
        root = Path(self.wmx_root)
        python_api = root / "Lib" / "PythonApi"
        path_parts = [
            str(root),
            str(root / "Bin"),
            str(root / "Lib"),
            str(root / "Lib" / "x64"),
        ]
        os.environ["PATH"] = ";".join(path_parts + [os.environ.get("PATH", "")])
        if str(python_api) not in sys.path:
            sys.path.append(str(python_api))

    def _wmx_root_with_separator(self) -> str:
        root = str(self.wmx_root)
        if not root.endswith(("\\", "/")):
            root += "\\"
        return root

    def _write_pulse(self, control_word: int, command: CommandDTO) -> None:
        self._write_output(control_word, command)
        time.sleep(self.clear_delay_sec)
        self._write_output(ControlWord.CLEAR, command)

    def _write_output(self, control_word: int, command: CommandDTO) -> None:
        if not self.connected or self.io is None:
            raise BackendAdapterError("WMX3 EtherCAT adapter is not connected")

        out_data = encode_rxpdo(control_word, command.target_temp, command.kp, command.ki)
        try:
            ret = self.io.SetOutBytes(PDO_OUTPUT_ADDR, RX_PDO_SIZE, list(out_data))
            self.last_ret = ret
            if not is_success(ret):
                raise BackendAdapterError(f"SetOutBytes failed. ret={ret}")

            self.last_control_word = int(control_word)
            self.last_rxpdo_hex = out_data.hex(" ")
            self.last_error = None
        except BackendAdapterError as exc:
            self._set_error(str(exc))
            raise
        except Exception as exc:  # noqa: BLE001
            self._set_error(f"SetOutBytes exception: {exc}", traceback.format_exc())
            raise BackendAdapterError(self.last_error or "SetOutBytes exception") from exc

    def _status_from_decoded(self, decoded: Any) -> StatusDTO:
        return StatusDTO(
            status_word=decoded.status_word,
            state_packed=decoded.state_packed,
            heater_state=decoded.heater_state,
            auto_tune_state=decoded.auto_tune_state,
            current_temp=round(decoded.current_temp, 3),
            target_temp=round(self.command.target_temp, 3),
            error=round(decoded.error, 3),
            u_ctrl=round(decoded.u_ctrl, 4),
            duty_cnt=int(decoded.duty_cnt),
            tune_k=round(decoded.tune_k, 4),
            tune_l=round(decoded.tune_l, 4),
            tune_t=round(decoded.tune_t, 4),
            tune_kp=round(decoded.tune_kp, 6),
            tune_ki=round(decoded.tune_ki, 6),
            tuned_gain_valid=bool(decoded.tuned_gain_valid),
            auto_tune_error=int(decoded.auto_tune_error),
            kp=round(self.command.kp, 6),
            ki=round(self.command.ki, 6),
        )

    def _default_status(self) -> StatusDTO:
        return StatusDTO(
            status_word=0,
            state_packed=pack_state(HeaterState.IDLE, AutoTuneState.IDLE),
            heater_state=int(HeaterState.IDLE),
            auto_tune_state=int(AutoTuneState.IDLE),
            current_temp=0.0,
            target_temp=self.command.target_temp,
            error=0.0,
            u_ctrl=0.0,
            duty_cnt=0,
            tune_k=0.0,
            tune_l=0.0,
            tune_t=0.0,
            tune_kp=0.0,
            tune_ki=0.0,
            tuned_gain_valid=False,
            auto_tune_error=0,
            kp=self.command.kp,
            ki=self.command.ki,
        )

    def _set_error(self, message: str, trace: str | None = None) -> None:
        self.last_error = message
        self.last_traceback = trace
        self._push_event("warn", message, {})

    def _push_event(self, level: str, message: str, context: Dict[str, Any]) -> None:
        self._events.append(
            {
                "type": "event.log",
                "level": level,
                "message": message,
                "context": context,
            }
        )
