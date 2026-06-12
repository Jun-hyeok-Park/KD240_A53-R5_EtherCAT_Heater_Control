"""Small WebSocket helper for the mock server.

It supports the browser client used by this project without external
dependencies. Incoming client messages are accepted but not required for
the phase-1 API.
"""

from __future__ import annotations

import base64
import hashlib
import json
import socket
import struct
import threading
from typing import Any, Dict, Iterable, Optional, Tuple


WS_GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"


class WebSocketClient:
    def __init__(self, conn: socket.socket) -> None:
        self.conn = conn
        self.lock = threading.Lock()
        self.alive = True

    def send_json(self, message: Dict[str, Any]) -> None:
        self.send_frame(json.dumps(message, separators=(",", ":")).encode("utf-8"), opcode=0x1)

    def send_frame(self, payload: bytes, opcode: int = 0x1) -> None:
        frame = encode_frame(payload, opcode=opcode)
        with self.lock:
            if not self.alive:
                return
            try:
                self.conn.sendall(frame)
            except OSError:
                self.alive = False

    def close(self) -> None:
        with self.lock:
            if not self.alive:
                return
            self.alive = False
            try:
                self.conn.shutdown(socket.SHUT_RDWR)
            except OSError:
                pass
            try:
                self.conn.close()
            except OSError:
                pass


class WebSocketHub:
    def __init__(self) -> None:
        self._clients: set[WebSocketClient] = set()
        self._lock = threading.Lock()

    def add(self, client: WebSocketClient) -> None:
        with self._lock:
            self._clients.add(client)

    def remove(self, client: WebSocketClient) -> None:
        with self._lock:
            self._clients.discard(client)
        client.close()

    def broadcast(self, messages: Iterable[Dict[str, Any]]) -> None:
        with self._lock:
            clients = list(self._clients)
        dead: list[WebSocketClient] = []
        for client in clients:
            for message in messages:
                client.send_json(message)
                if not client.alive:
                    dead.append(client)
                    break
        for client in dead:
            self.remove(client)

    @property
    def client_count(self) -> int:
        with self._lock:
            return len(self._clients)


def accept_key(client_key: str) -> str:
    digest = hashlib.sha1((client_key + WS_GUID).encode("ascii")).digest()
    return base64.b64encode(digest).decode("ascii")


def encode_frame(payload: bytes, opcode: int = 0x1) -> bytes:
    first = 0x80 | (opcode & 0x0F)
    length = len(payload)
    if length <= 125:
        header = struct.pack("!BB", first, length)
    elif length <= 0xFFFF:
        header = struct.pack("!BBH", first, 126, length)
    else:
        header = struct.pack("!BBQ", first, 127, length)
    return header + payload


def read_frame(rfile: Any) -> Optional[Tuple[int, bytes]]:
    header = rfile.read(2)
    if len(header) != 2:
        return None

    b1, b2 = header
    opcode = b1 & 0x0F
    masked = bool(b2 & 0x80)
    length = b2 & 0x7F

    if length == 126:
        extended = rfile.read(2)
        if len(extended) != 2:
            return None
        length = struct.unpack("!H", extended)[0]
    elif length == 127:
        extended = rfile.read(8)
        if len(extended) != 8:
            return None
        length = struct.unpack("!Q", extended)[0]

    mask = b""
    if masked:
        mask = rfile.read(4)
        if len(mask) != 4:
            return None

    payload = rfile.read(length)
    if len(payload) != length:
        return None

    if masked:
        payload = bytes(byte ^ mask[index % 4] for index, byte in enumerate(payload))

    return opcode, payload
