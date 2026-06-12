"""Backend adapter interface for KD240 Heater Control."""

from typing import Any, Dict, List

from dto import CommandDTO, StatusDTO


class BackendAdapterError(RuntimeError):
    pass


class IHeaterBackendAdapter:
    name = "base"

    def __init__(self) -> None:
        self.connected = False

    def connect(self) -> None:
        self.connected = True

    def disconnect(self) -> None:
        self.connected = False

    def read_status(self) -> StatusDTO:
        raise NotImplementedError

    def write_params(self, command: CommandDTO) -> StatusDTO:
        raise NotImplementedError

    def run(self, command: CommandDTO) -> StatusDTO:
        raise NotImplementedError

    def stop(self) -> StatusDTO:
        raise NotImplementedError

    def reset(self) -> StatusDTO:
        raise NotImplementedError

    def start_auto_tune(self, command: CommandDTO) -> StatusDTO:
        raise NotImplementedError

    def apply_tuned_gain(self, target_temp: float) -> StatusDTO:
        raise NotImplementedError

    def clear_command(self) -> StatusDTO:
        return self.read_status()

    def take_events(self) -> List[Dict[str, Any]]:
        return []

    def get_diagnostics(self) -> Dict[str, Any]:
        return {
            "adapter": self.name,
            "connected": self.connected,
        }
