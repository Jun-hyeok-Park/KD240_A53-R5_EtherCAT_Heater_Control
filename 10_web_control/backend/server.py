"""KD240 Heater Web Control mock server."""

from __future__ import annotations

import json
import mimetypes
import os
import sys
import threading
import time
from http import HTTPStatus
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from typing import Any, Dict, Tuple
from urllib.parse import urlparse


BACKEND_DIR = Path(__file__).resolve().parent
PROJECT_DIR = BACKEND_DIR.parent
FRONTEND_DIR = PROJECT_DIR / "frontend"
sys.dont_write_bytecode = True
if str(BACKEND_DIR) not in sys.path:
    sys.path.insert(0, str(BACKEND_DIR))

from adapters.mock_adapter import MockAdapter  # noqa: E402
from service import HeaterControlService  # noqa: E402
from ws import WebSocketClient, WebSocketHub, accept_key, read_frame  # noqa: E402


def json_bytes(payload: Dict[str, Any]) -> bytes:
    return json.dumps(payload, indent=2).encode("utf-8")


def create_handler(service: HeaterControlService, hub: WebSocketHub):
    class KD240RequestHandler(BaseHTTPRequestHandler):
        server_version = "KD240WebControl/0.1"

        def do_OPTIONS(self) -> None:
            self.send_response(HTTPStatus.NO_CONTENT)
            self._send_cors_headers()
            self.end_headers()

        def do_GET(self) -> None:
            parsed = urlparse(self.path)
            if parsed.path == "/ws":
                self._handle_websocket()
                return

            if parsed.path == "/api/health":
                self._send_json(HTTPStatus.OK, service.health())
                return

            if parsed.path == "/api/status":
                self._send_json(HTTPStatus.OK, service.get_status())
                return

            if parsed.path == "/api/history":
                self._send_json(HTTPStatus.OK, service.get_history())
                return

            self._serve_static(parsed.path)

        def do_POST(self) -> None:
            parsed = urlparse(self.path)
            try:
                payload = self._read_json_body()
                status, response = self._dispatch_post(parsed.path, payload)
            except ValueError as exc:
                self._send_json(HTTPStatus.BAD_REQUEST, {"ok": False, "message": str(exc)})
                return
            except Exception as exc:  # noqa: BLE001
                self._send_json(
                    HTTPStatus.INTERNAL_SERVER_ERROR,
                    {"ok": False, "message": f"Unhandled server error: {exc}"},
                )
                return

            self._send_json(status, response)

        def log_message(self, fmt: str, *args: Any) -> None:
            sys.stdout.write("[%s] %s\n" % (self.log_date_time_string(), fmt % args))
            sys.stdout.flush()

        def _dispatch_post(self, path: str, payload: Dict[str, Any]) -> Tuple[int, Dict[str, Any]]:
            if path == "/api/control/run":
                return service.run(payload)
            if path == "/api/control/params":
                return service.write_params(payload)
            if path == "/api/control/stop":
                return service.stop()
            if path == "/api/control/reset":
                return service.reset()
            if path == "/api/autotune/start":
                return service.start_auto_tune(payload)
            if path == "/api/autotune/apply":
                return service.apply_tuned_gain(payload)
            if path == "/api/autotune/auto-apply":
                return service.set_auto_apply(payload)
            return int(HTTPStatus.NOT_FOUND), {"ok": False, "message": f"Unknown API path: {path}"}

        def _read_json_body(self) -> Dict[str, Any]:
            length = int(self.headers.get("Content-Length", "0") or "0")
            if length == 0:
                return {}
            raw = self.rfile.read(length)
            try:
                payload = json.loads(raw.decode("utf-8"))
            except json.JSONDecodeError as exc:
                raise ValueError("Request body must be valid JSON") from exc
            if not isinstance(payload, dict):
                raise ValueError("Request body must be a JSON object")
            return payload

        def _send_json(self, status: int, payload: Dict[str, Any]) -> None:
            body = json_bytes(payload)
            self.send_response(status)
            self._send_cors_headers()
            self.send_header("Content-Type", "application/json; charset=utf-8")
            self.send_header("Content-Length", str(len(body)))
            self.end_headers()
            self.wfile.write(body)

        def _serve_static(self, path: str) -> None:
            if path in ("", "/"):
                target = FRONTEND_DIR / "index.html"
            else:
                safe_parts = [part for part in path.strip("/").split("/") if part and part not in (".", "..")]
                if safe_parts and safe_parts[0] == "frontend":
                    safe_parts = safe_parts[1:]
                target = FRONTEND_DIR.joinpath(*safe_parts)

            try:
                target = target.resolve()
                target.relative_to(FRONTEND_DIR.resolve())
            except ValueError:
                self._send_json(HTTPStatus.FORBIDDEN, {"ok": False, "message": "Forbidden"})
                return

            if not target.exists() or not target.is_file():
                self._send_json(HTTPStatus.NOT_FOUND, {"ok": False, "message": "Not found"})
                return

            body = target.read_bytes()
            content_type = mimetypes.guess_type(str(target))[0] or "application/octet-stream"
            self.send_response(HTTPStatus.OK)
            self._send_cors_headers()
            self.send_header("Content-Type", content_type)
            self.send_header("Content-Length", str(len(body)))
            self.end_headers()
            self.wfile.write(body)

        def _handle_websocket(self) -> None:
            if self.headers.get("Upgrade", "").lower() != "websocket":
                self._send_json(HTTPStatus.BAD_REQUEST, {"ok": False, "message": "Expected WebSocket upgrade"})
                return

            key = self.headers.get("Sec-WebSocket-Key")
            if not key:
                self._send_json(HTTPStatus.BAD_REQUEST, {"ok": False, "message": "Missing Sec-WebSocket-Key"})
                return

            self.send_response(HTTPStatus.SWITCHING_PROTOCOLS)
            self.send_header("Upgrade", "websocket")
            self.send_header("Connection", "Upgrade")
            self.send_header("Sec-WebSocket-Accept", accept_key(key))
            self.end_headers()

            client = WebSocketClient(self.request)
            hub.add(client)
            for message in service.websocket_initial_messages():
                client.send_json(message)

            try:
                while client.alive:
                    frame = read_frame(self.rfile)
                    if frame is None:
                        break
                    opcode, payload = frame
                    if opcode == 0x8:
                        break
                    if opcode == 0x9:
                        client.send_frame(payload, opcode=0xA)
            finally:
                hub.remove(client)

        def _send_cors_headers(self) -> None:
            self.send_header("Access-Control-Allow-Origin", "*")
            self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
            self.send_header("Access-Control-Allow-Headers", "Content-Type")

    return KD240RequestHandler


def start_broadcaster(service: HeaterControlService, hub: WebSocketHub) -> threading.Thread:
    def run() -> None:
        while True:
            if hub.client_count:
                messages = service.websocket_tick()
            else:
                messages = []
            if messages:
                hub.broadcast(messages)
            time.sleep(0.5)

    thread = threading.Thread(target=run, name="kd240-ws-broadcaster", daemon=True)
    thread.start()
    return thread


def main() -> None:
    host = os.environ.get("KD240_WEB_HOST", "127.0.0.1")
    port = int(os.environ.get("KD240_WEB_PORT", "8080"))

    service = HeaterControlService(MockAdapter())
    hub = WebSocketHub()
    start_broadcaster(service, hub)

    handler = create_handler(service, hub)
    httpd = ThreadingHTTPServer((host, port), handler)
    print(f"KD240 mock Web Control running at http://{host}:{port}")
    print("Press Ctrl+C to stop.")
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        httpd.server_close()


if __name__ == "__main__":
    main()
