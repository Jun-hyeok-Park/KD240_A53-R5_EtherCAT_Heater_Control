"""EtherCAT bridge adapter for the Python 3.10+ Web backend.

The Web backend starts a small Python 3.6 WMX bridge process and exchanges
newline-delimited JSON commands with it.
"""

from __future__ import annotations

import json
import os
import queue
import subprocess
import sys
import threading
from pathlib import Path
from typing import Any, Dict, List, Optional

from adapters.base import BackendAdapterError, IHeaterBackendAdapter
from dto import CommandDTO, StatusDTO
from pdo_codec import RX_PDO_SIZE, TX_PDO_SIZE
from protocol import AutoTuneState, HeaterState, pack_state


class EthercatBridgeAdapter(IHeaterBackendAdapter):
    name = "ethercat_bridge"

    def __init__(
        self,
        *,
        py36_executable: Optional[str] = None,
        bridge_script: Optional[str] = None,
        request_timeout_sec: float = 5.0,
    ) -> None:
        super().__init__()
        project_dir = Path(__file__).resolve().parents[2]
        self.py36_executable = py36_executable or os.environ.get("KD240_WMX_PY36", "python")
        self.bridge_script = Path(
            bridge_script or os.environ.get("KD240_WMX_BRIDGE_SCRIPT", project_dir / "bridge" / "wmx_bridge_py36.py")
        )
        self.request_timeout_sec = request_timeout_sec
        self.process: Optional[subprocess.Popen[str]] = None
        self._lock = threading.RLock()
        self._seq = 0
        self._stdout_queue: "queue.Queue[Dict[str, Any]]" = queue.Queue()
        self._stderr_tail: List[str] = []
        self._events: List[Dict[str, Any]] = []
        self.command = CommandDTO()
        self.last_status = self._default_status()
        self.last_error: Optional[str] = None
        self.last_response: Optional[Dict[str, Any]] = None
        self.last_bridge_diagnostics: Dict[str, Any] = {}

    def connect(self) -> None:
        with self._lock:
            self._ensure_process()
            response = self._request("connect")
            self.connected = True
            self._update_diagnostics(response)
            self.last_error = None
            self._push_event("info", "WMX Python 3.6 bridge connected", self.get_diagnostics())

    def disconnect(self) -> None:
        with self._lock:
            if self.process is not None and self.process.poll() is None:
                try:
                    self._request("disconnect", allow_unconnected=True)
                    self._request("shutdown", allow_unconnected=True)
                except Exception as exc:  # noqa: BLE001
                    self.last_error = f"Bridge disconnect failed: {exc}"
                finally:
                    self._terminate_process()
            else:
                self._terminate_process()
            self.connected = False

    def read_status(self) -> StatusDTO:
        with self._lock:
            if not self.connected:
                return self.last_status
            try:
                response = self._request("read_status")
                return self._status_from_response(response)
            except Exception as exc:  # noqa: BLE001
                self.last_error = str(exc)
                return self.last_status

    def write_params(self, command: CommandDTO) -> StatusDTO:
        with self._lock:
            self.command = command
            response = self._request("write_params", self._command_payload(command))
            return self._status_from_response(response)

    def run(self, command: CommandDTO) -> StatusDTO:
        with self._lock:
            self.command = command
            response = self._request("run", self._command_payload(command))
            return self._status_from_response(response)

    def stop(self) -> StatusDTO:
        with self._lock:
            response = self._request("stop")
            return self._status_from_response(response)

    def reset(self) -> StatusDTO:
        with self._lock:
            response = self._request("reset")
            return self._status_from_response(response)

    def start_auto_tune(self, command: CommandDTO) -> StatusDTO:
        with self._lock:
            self.command = command
            response = self._request("start_auto_tune", self._command_payload(command))
            return self._status_from_response(response)

    def apply_tuned_gain(self, target_temp: float) -> StatusDTO:
        with self._lock:
            response = self._request("apply_tuned_gain", {"target_temp": target_temp})
            status = self._status_from_response(response)
            self.command = CommandDTO(target_temp=status.target_temp, kp=status.kp, ki=status.ki)
            return status

    def clear_command(self) -> StatusDTO:
        with self._lock:
            response = self._request("clear_command")
            return self._status_from_response(response)

    def take_events(self) -> List[Dict[str, Any]]:
        with self._lock:
            events = list(self._events)
            self._events.clear()
            return events

    def get_diagnostics(self) -> Dict[str, Any]:
        process_alive = self.process is not None and self.process.poll() is None
        return {
            "adapter": self.name,
            "adapter_type": "ethercat_bridge",
            "connected": self.connected,
            "fault": self.last_error,
            "py36_executable": self.py36_executable,
            "bridge_script": str(self.bridge_script),
            "bridge_process_alive": process_alive,
            "bridge_pid": self.process.pid if process_alive and self.process is not None else None,
            "request_timeout_sec": self.request_timeout_sec,
            "rxpdo_bytes": RX_PDO_SIZE,
            "txpdo_bytes": TX_PDO_SIZE,
            "last_response": self.last_response,
            "bridge_diagnostics": self.last_bridge_diagnostics,
            "stderr_tail": list(self._stderr_tail[-20:]),
        }

    def _ensure_process(self) -> None:
        if self.process is not None and self.process.poll() is None:
            return

        if not self.bridge_script.exists():
            raise BackendAdapterError(f"WMX bridge script not found: {self.bridge_script}")

        cmd = [
            self.py36_executable,
            "-u",
            str(self.bridge_script),
            "--stdio",
        ]
        try:
            self.process = subprocess.Popen(
                cmd,
                cwd=str(self.bridge_script.parents[1]),
                stdin=subprocess.PIPE,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                encoding="utf-8",
                bufsize=1,
            )
        except Exception as exc:  # noqa: BLE001
            self.process = None
            self.last_error = f"Failed to start WMX bridge: {exc}"
            raise BackendAdapterError(self.last_error) from exc

        self._stdout_queue = queue.Queue()
        threading.Thread(target=self._read_stdout, name="kd240-wmx-bridge-stdout", daemon=True).start()
        threading.Thread(target=self._read_stderr, name="kd240-wmx-bridge-stderr", daemon=True).start()

    def _request(
        self,
        command: str,
        payload: Optional[Dict[str, Any]] = None,
        *,
        allow_unconnected: bool = False,
    ) -> Dict[str, Any]:
        if self.process is None or self.process.poll() is not None:
            self.connected = False
            raise BackendAdapterError("WMX bridge process is not running")
        if not allow_unconnected and command != "connect" and not self.connected:
            raise BackendAdapterError("WMX bridge adapter is not connected")
        if self.process.stdin is None:
            raise BackendAdapterError("WMX bridge stdin is not available")

        self._seq += 1
        request = {
            "id": self._seq,
            "command": command,
            "payload": payload or {},
        }
        try:
            self.process.stdin.write(json.dumps(request, separators=(",", ":")) + "\n")
            self.process.stdin.flush()
        except Exception as exc:  # noqa: BLE001
            self.connected = False
            self.last_error = f"Failed to write to WMX bridge: {exc}"
            raise BackendAdapterError(self.last_error) from exc

        try:
            response = self._stdout_queue.get(timeout=self.request_timeout_sec)
        except queue.Empty as exc:
            self.last_error = f"WMX bridge timeout waiting for {command}"
            raise BackendAdapterError(self.last_error) from exc

        self.last_response = response
        self._update_diagnostics(response)
        if not response.get("ok", False):
            self.last_error = str(response.get("error") or response.get("message") or f"Bridge command failed: {command}")
            raise BackendAdapterError(self.last_error)
        self.last_error = None
        return response

    def _status_from_response(self, response: Dict[str, Any]) -> StatusDTO:
        self._update_diagnostics(response)
        status_dict = response.get("status")
        if not isinstance(status_dict, dict):
            raise BackendAdapterError("WMX bridge response did not include status")
        self.last_status = self._status_from_dict(status_dict)
        return self.last_status

    def _status_from_dict(self, status: Dict[str, Any]) -> StatusDTO:
        return StatusDTO(
            status_word=int(status.get("status_word", 0)),
            state_packed=int(status.get("state_packed", 0)),
            heater_state=int(status.get("heater_state", 0)),
            auto_tune_state=int(status.get("auto_tune_state", 0)),
            current_temp=round(float(status.get("current_temp", 0.0)), 3),
            target_temp=round(float(status.get("target_temp", self.command.target_temp)), 3),
            error=round(float(status.get("error", 0.0)), 3),
            u_ctrl=round(float(status.get("u_ctrl", 0.0)), 4),
            duty_cnt=int(status.get("duty_cnt", 0)),
            tune_k=round(float(status.get("tune_k", 0.0)), 4),
            tune_l=round(float(status.get("tune_l", 0.0)), 4),
            tune_t=round(float(status.get("tune_t", 0.0)), 4),
            tune_kp=round(float(status.get("tune_kp", 0.0)), 6),
            tune_ki=round(float(status.get("tune_ki", 0.0)), 6),
            tuned_gain_valid=bool(status.get("tuned_gain_valid", False)),
            auto_tune_error=int(status.get("auto_tune_error", 0)),
            kp=round(float(status.get("kp", self.command.kp)), 6),
            ki=round(float(status.get("ki", self.command.ki)), 6),
        )

    def _update_diagnostics(self, response: Dict[str, Any]) -> None:
        diagnostics = response.get("diagnostics")
        if isinstance(diagnostics, dict):
            self.last_bridge_diagnostics = diagnostics

    def _read_stdout(self) -> None:
        if self.process is None or self.process.stdout is None:
            return
        for line in self.process.stdout:
            try:
                self._stdout_queue.put(json.loads(line))
            except json.JSONDecodeError:
                self._stdout_queue.put({"ok": False, "error": f"Invalid JSON from WMX bridge: {line.strip()}"})

    def _read_stderr(self) -> None:
        if self.process is None or self.process.stderr is None:
            return
        for line in self.process.stderr:
            text = line.rstrip()
            if text:
                self._stderr_tail.append(text)
                if len(self._stderr_tail) > 100:
                    self._stderr_tail = self._stderr_tail[-100:]

    def _terminate_process(self) -> None:
        process = self.process
        if process is None:
            return
        if process.poll() is None:
            process.terminate()
            try:
                process.wait(timeout=2.0)
            except subprocess.TimeoutExpired:
                process.kill()
                process.wait(timeout=2.0)
        for stream in (process.stdin, process.stdout, process.stderr):
            if stream is not None:
                try:
                    stream.close()
                except OSError:
                    pass
        self.process = None

    def _command_payload(self, command: CommandDTO) -> Dict[str, float]:
        return command.to_dict()

    def _push_event(self, level: str, message: str, context: Dict[str, Any]) -> None:
        self._events.append(
            {
                "type": "event.log",
                "level": level,
                "message": message,
                "context": context,
            }
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
