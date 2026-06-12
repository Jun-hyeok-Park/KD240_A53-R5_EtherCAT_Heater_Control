"""Python 3.6 WMX3 bridge for KD240 CH1 EtherCAT PDO access.

This process is intentionally small. It owns WMX3ApiPython and talks to
the Python 3.10+ Web backend through newline-delimited JSON on stdin/stdout.
Only stderr is used for human diagnostics.
"""

import argparse
import importlib
import json
import os
import sys
import time
import traceback
from pathlib import Path

from pdo_codec_py36 import (
    PDO_INPUT_ADDR,
    PDO_OUTPUT_ADDR,
    RX_PDO_SIZE,
    TX_PDO_SIZE,
    AutoTuneState,
    ControlWord,
    HeaterState,
    decode_txpdo,
    encode_rxpdo,
    pack_state,
)


DEFAULT_WMX_ROOT = r"C:\Program Files\SoftServo\WMX3"
DEFAULT_DEVICE_NAME = "KD240HeaterWmxBridge"


class BridgeError(RuntimeError):
    pass


def is_success(ret):
    return ret is None or ret == 0


def bytes_to_hex(data):
    return " ".join("{:02x}".format(byte) for byte in bytearray(data))


class WmxPy36Bridge:
    def __init__(self, wmx_root=None, device_name=DEFAULT_DEVICE_NAME, clear_delay_sec=0.05):
        self.wmx_root = wmx_root or os.environ.get("WMX_ROOT", DEFAULT_WMX_ROOT)
        self.device_name = device_name
        self.clear_delay_sec = clear_delay_sec
        self._api = None
        self.wmx = None
        self.io = None
        self.connected = False
        self.target_temp = 80.0
        self.kp = 0.04
        self.ki = 0.003
        self.last_status = self._default_status()
        self.last_error = None
        self.last_traceback = None
        self.last_ret = None
        self.last_control_word = int(ControlWord.CLEAR)
        self.last_create_device_timeout = None
        self.last_rxpdo_hex = None
        self.last_txpdo_hex = None

    def connect(self):
        self.last_error = None
        self.last_traceback = None
        api = self._load_wmx_api()
        self.wmx = api["WMX3Api"]()
        ret = self.wmx.CreateDevice(
            self._wmx_root_with_separator(),
            api["DeviceType"].DeviceTypeLowPriority,
            api["create_device_timeout"],
        )
        self.last_ret = ret
        if not is_success(ret):
            self.wmx = None
            raise BridgeError("CreateDevice failed. ret={0}".format(ret))

        ret = self.wmx.SetDeviceName(self.device_name)
        self.last_ret = ret
        if not is_success(ret):
            self.wmx = None
            raise BridgeError("SetDeviceName failed. ret={0}".format(ret))

        self.io = api["Io"](self.wmx)
        self.connected = True
        return self.get_diagnostics()

    def disconnect(self):
        if self.wmx is not None:
            try:
                ret = self.wmx.CloseDevice()
                self.last_ret = ret
            except Exception as exc:
                self._set_error("CloseDevice exception: {0}".format(exc), traceback.format_exc())
        self.wmx = None
        self.io = None
        self.connected = False
        return self.get_diagnostics()

    def read_status(self):
        if not self.connected or self.io is None:
            raise BridgeError("WMX bridge is not connected")

        try:
            ret, in_data = self.io.GetInBytes(PDO_INPUT_ADDR, TX_PDO_SIZE)
            self.last_ret = ret
            if not is_success(ret):
                raise BridgeError("GetInBytes failed. ret={0}".format(ret))

            raw = bytes(bytearray(list(in_data[:TX_PDO_SIZE])))
            self.last_txpdo_hex = bytes_to_hex(raw)
            decoded = decode_txpdo(raw)
            self.last_status = self._status_from_decoded(decoded)
            self.last_error = None
            self.last_traceback = None
            return self.last_status
        except BridgeError:
            raise
        except Exception as exc:
            self._set_error("GetInBytes exception: {0}".format(exc), traceback.format_exc())
            raise BridgeError(self.last_error)

    def write_params(self, payload):
        self._update_command(payload)
        self._write_output(ControlWord.CLEAR)
        return self.read_status()

    def run(self, payload):
        self._update_command(payload)
        self._write_output(ControlWord.RUN)
        return self.read_status()

    def stop(self):
        self._write_pulse(ControlWord.STOP)
        return self.read_status()

    def reset(self):
        self._write_pulse(ControlWord.RESET)
        return self.read_status()

    def start_auto_tune(self, payload):
        self._update_command(payload)
        self._write_pulse(ControlWord.AUTO_TUNE_START)
        return self.read_status()

    def apply_tuned_gain(self, payload):
        status = self.read_status()
        if not status.get("tuned_gain_valid"):
            raise BridgeError("No valid tuned gain is available")
        self.target_temp = float(payload.get("target_temp", self.target_temp))
        self.kp = float(status.get("tune_kp", self.kp))
        self.ki = float(status.get("tune_ki", self.ki))
        self._write_output(ControlWord.RUN)
        return self.read_status()

    def clear_command(self):
        self._write_output(ControlWord.CLEAR)
        return self.read_status()

    def get_diagnostics(self):
        return {
            "bridge": "wmx_bridge_py36",
            "connected": self.connected,
            "fault": self.last_error,
            "last_ret": self.last_ret,
            "create_device_timeout": self.last_create_device_timeout,
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

    def _load_wmx_api(self):
        if self._api is not None:
            return self._api

        self._prepare_wmx_paths()
        try:
            module = importlib.import_module("WMX3ApiPython")
            self._api = {
                "WMX3Api": getattr(module, "WMX3Api"),
                "Io": getattr(module, "Io"),
                "DeviceType": getattr(module, "DeviceType"),
                # Some WMX3ApiPython builds do not export INFINITE.
                "create_device_timeout": getattr(module, "INFINITE", 0xFFFFFFFF),
            }
            self.last_create_device_timeout = self._api["create_device_timeout"]
            return self._api
        except AttributeError as exc:
            raise BridgeError("WMX3ApiPython missing expected symbol: {0}".format(exc))
        except Exception as exc:
            raise BridgeError(
                "WMX3ApiPython import failed. Check WMX3 installation, Python version, and WMX_ROOT: {0}".format(exc)
            )

    def _prepare_wmx_paths(self):
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

    def _wmx_root_with_separator(self):
        root = str(self.wmx_root)
        if not root.endswith(("\\", "/")):
            root += "\\"
        return root

    def _update_command(self, payload):
        payload = payload or {}
        self.target_temp = float(payload.get("target_temp", self.target_temp))
        self.kp = float(payload.get("kp", self.kp))
        self.ki = float(payload.get("ki", self.ki))

    def _write_pulse(self, control_word):
        self._write_output(control_word)
        time.sleep(self.clear_delay_sec)
        self._write_output(ControlWord.CLEAR)

    def _write_output(self, control_word):
        if not self.connected or self.io is None:
            raise BridgeError("WMX bridge is not connected")

        out_data = encode_rxpdo(control_word, self.target_temp, self.kp, self.ki)
        try:
            ret = self.io.SetOutBytes(PDO_OUTPUT_ADDR, RX_PDO_SIZE, list(bytearray(out_data)))
            self.last_ret = ret
            if not is_success(ret):
                raise BridgeError("SetOutBytes failed. ret={0}".format(ret))
            self.last_control_word = int(control_word)
            self.last_rxpdo_hex = bytes_to_hex(out_data)
            self.last_error = None
            self.last_traceback = None
        except BridgeError:
            raise
        except Exception as exc:
            self._set_error("SetOutBytes exception: {0}".format(exc), traceback.format_exc())
            raise BridgeError(self.last_error)

    def _status_from_decoded(self, decoded):
        status = decoded.to_dict()
        status["target_temp"] = round(self.target_temp, 3)
        status["kp"] = round(self.kp, 6)
        status["ki"] = round(self.ki, 6)
        return status

    def _default_status(self):
        return {
            "status_word": 0,
            "state_packed": pack_state(HeaterState.IDLE, AutoTuneState.IDLE),
            "heater_state": int(HeaterState.IDLE),
            "auto_tune_state": int(AutoTuneState.IDLE),
            "current_temp": 0.0,
            "target_temp": self.target_temp,
            "error": 0.0,
            "u_ctrl": 0.0,
            "u_percent": 0.0,
            "duty_cnt": 0,
            "duty_percent": 0.0,
            "tune_k": 0.0,
            "tune_l": 0.0,
            "tune_t": 0.0,
            "tune_kp": 0.0,
            "tune_ki": 0.0,
            "tuned_gain_valid": False,
            "auto_tune_error": 0,
            "kp": self.kp,
            "ki": self.ki,
        }

    def _set_error(self, message, trace=None):
        self.last_error = message
        self.last_traceback = trace


def handle_request(bridge, request):
    command = request.get("command")
    payload = request.get("payload") or {}

    if command == "ping":
        return {"ok": True, "message": "pong", "diagnostics": bridge.get_diagnostics()}
    if command == "connect":
        return {"ok": True, "diagnostics": bridge.connect()}
    if command == "disconnect":
        return {"ok": True, "diagnostics": bridge.disconnect()}
    if command == "read_status":
        return {"ok": True, "status": bridge.read_status(), "diagnostics": bridge.get_diagnostics()}
    if command == "write_params":
        return {"ok": True, "status": bridge.write_params(payload), "diagnostics": bridge.get_diagnostics()}
    if command == "run":
        return {"ok": True, "status": bridge.run(payload), "diagnostics": bridge.get_diagnostics()}
    if command == "stop":
        return {"ok": True, "status": bridge.stop(), "diagnostics": bridge.get_diagnostics()}
    if command == "reset":
        return {"ok": True, "status": bridge.reset(), "diagnostics": bridge.get_diagnostics()}
    if command == "start_auto_tune":
        return {"ok": True, "status": bridge.start_auto_tune(payload), "diagnostics": bridge.get_diagnostics()}
    if command == "apply_tuned_gain":
        return {"ok": True, "status": bridge.apply_tuned_gain(payload), "diagnostics": bridge.get_diagnostics()}
    if command == "clear_command":
        return {"ok": True, "status": bridge.clear_command(), "diagnostics": bridge.get_diagnostics()}
    if command == "get_diagnostics":
        return {"ok": True, "diagnostics": bridge.get_diagnostics()}
    if command == "shutdown":
        bridge.disconnect()
        return {"ok": True, "shutdown": True, "diagnostics": bridge.get_diagnostics()}

    raise BridgeError("Unknown bridge command: {0}".format(command))


def write_json_line(payload):
    sys.stdout.write(json.dumps(payload, separators=(",", ":"), sort_keys=True) + "\n")
    sys.stdout.flush()


def stdio_loop(args):
    bridge = WmxPy36Bridge(
        wmx_root=args.wmx_root,
        device_name=args.device_name,
        clear_delay_sec=args.clear_delay_sec,
    )
    for line in sys.stdin:
        line = line.strip()
        if not line:
            continue
        request_id = None
        try:
            request = json.loads(line)
            request_id = request.get("id")
            response = handle_request(bridge, request)
            response["id"] = request_id
            write_json_line(response)
            if response.get("shutdown"):
                return 0
        except Exception as exc:
            response = {
                "id": request_id,
                "ok": False,
                "error": str(exc),
                "diagnostics": bridge.get_diagnostics(),
            }
            write_json_line(response)
    bridge.disconnect()
    return 0


def smoke(args):
    bridge = WmxPy36Bridge(
        wmx_root=args.wmx_root,
        device_name=args.device_name,
        clear_delay_sec=args.clear_delay_sec,
    )
    try:
        bridge.connect()
        print("connected:", json.dumps(bridge.get_diagnostics(), indent=2, sort_keys=True))
        payload = {"target_temp": args.target, "kp": args.kp, "ki": args.ki}
        if args.run:
            status = bridge.run(payload)
        else:
            status = bridge.read_status()
        print("status:", json.dumps(status, indent=2, sort_keys=True))
        print("diagnostics:", json.dumps(bridge.get_diagnostics(), indent=2, sort_keys=True))
        return 0
    except Exception as exc:
        print("WMX bridge smoke failed:", exc)
        print("diagnostics:", json.dumps(bridge.get_diagnostics(), indent=2, sort_keys=True))
        return 2
    finally:
        bridge.disconnect()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--stdio", action="store_true", help="Run JSON-lines bridge loop")
    parser.add_argument("--smoke", action="store_true", help="Run one-shot WMX smoke test")
    parser.add_argument("--run", action="store_true", help="Send RUN during smoke test")
    parser.add_argument("--target", type=float, default=80.0)
    parser.add_argument("--kp", type=float, default=0.04)
    parser.add_argument("--ki", type=float, default=0.003)
    parser.add_argument("--wmx-root", default=None)
    parser.add_argument("--device-name", default=DEFAULT_DEVICE_NAME)
    parser.add_argument("--clear-delay-sec", type=float, default=0.05)
    args = parser.parse_args()

    if args.smoke:
        return smoke(args)
    if args.stdio:
        return stdio_loop(args)

    parser.print_help()
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
