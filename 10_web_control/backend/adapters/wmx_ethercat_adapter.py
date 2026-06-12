"""Placeholder for the future WMX3 EtherCAT backend adapter."""

from __future__ import annotations

from adapters.base import BackendAdapterError, IHeaterBackendAdapter


class WmxEthercatAdapter(IHeaterBackendAdapter):
    name = "wmx_ethercat"

    def connect(self) -> None:
        raise BackendAdapterError("WMX3 EtherCAT adapter is not implemented in the mock phase")
