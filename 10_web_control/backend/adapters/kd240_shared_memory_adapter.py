"""Placeholder for the future KD240 A53 shared-memory backend adapter."""

from __future__ import annotations

from adapters.base import BackendAdapterError, IHeaterBackendAdapter


class Kd240SharedMemoryAdapter(IHeaterBackendAdapter):
    name = "kd240_shared_memory"

    def connect(self) -> None:
        raise BackendAdapterError("KD240 shared-memory adapter is not implemented in the mock phase")
