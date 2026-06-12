# KD240 Heater Web Control

This folder contains the new KD240 Heater Web Control implementation.
The current phase validates the Web UI, REST API, WebSocket stream, DTOs,
mock adapter, and the WMX Python 3.6 bridge split.

`09_GUI` remains legacy reference material and is not modified by this
implementation.

## Current Scope

- Multi-channel HMI-style Web UI under `frontend/`
- Modular backend under `backend/`
- Mock backend adapter
- EtherCAT bridge adapter for a separate WMX3 Python 3.6 bridge process
- Placeholder adapter for future KD240 shared-memory mode
- The Web backend does not import `WMX3ApiPython` directly
- Current KD240 PDO is still one channel: CH1 is active, CH2-CH8 are disabled future placeholders
- RxPDO 14 bytes / TxPDO 48 bytes remain the protocol baseline

## Structure

```text
10_web_control/
  backend/
    server.py
    service.py
    dto.py
    protocol.py
    pdo_codec.py
    ws.py
    adapters/
      base.py
      ethercat_bridge_adapter.py
      mock_adapter.py
      wmx_ethercat_adapter.py
      kd240_shared_memory_adapter.py
  bridge/
    pdo_codec_py36.py
    wmx_bridge_py36.py
  docs/
    web_control_architecture.md
    kd240_protocol.md
    api_contract.md
    migration_plan.md
  frontend/
    index.html
    styles.css
    app.js
  tests/
    fake_wmx_bridge.py
    test_pdo_codec.py
    test_python36_wmx_smoke_compat.py
    test_wmx_ethercat_adapter.py
  tools/
    manual_wmx_smoke.py
```

## Run

Run the Web backend with Python 3.13 on the WMX master PC:

```powershell
cd C:\Users\user\Desktop\KD240\10_web_control
py -3.13 backend\server.py
```

Then open:

```text
http://127.0.0.1:8080
```

Do not open `frontend/index.html` directly as a file for normal use.
The Web UI expects the backend server to provide REST API and WebSocket
endpoints from the same origin.

If `python` is not on `PATH` in this Codex desktop environment, use the
bundled runtime:

```powershell
C:\Users\user\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe backend\server.py
```

Optional port override:

```powershell
$env:KD240_WEB_PORT="8081"
py -3.13 backend\server.py
```

## Browser Check

After starting the server, verify these URLs:

```text
http://127.0.0.1:8080/
http://127.0.0.1:8080/styles.css
http://127.0.0.1:8080/app.js
http://127.0.0.1:8080/api/health
```

Expected results:

- `/` returns the Web UI HTML.
- `/styles.css` returns `text/css` and should not be 404.
- `/app.js` returns JavaScript and should not be 404.
- `/api/health` returns JSON with `"adapter": "mock"`.

## REST API

Minimum phase-1 endpoints:

| Method | Path | Purpose |
|---|---|---|
| `GET` | `/api/health` | Backend health and active adapter |
| `GET` | `/api/mode` | Active backend mode and diagnostics |
| `POST` | `/api/mode` | Switch backend mode |
| `POST` | `/api/connect` | Connect active adapter |
| `POST` | `/api/disconnect` | Disconnect active adapter |
| `GET` | `/api/adapter/diagnostics` | Adapter diagnostics |
| `GET` | `/api/status` | Latest decoded status DTO |
| `POST` | `/api/control/run` | RUN with setpoint/Kp/Ki |
| `POST` | `/api/control/params` | Update setpoint/Kp/Ki without changing run state |
| `POST` | `/api/control/stop` | STOP |
| `POST` | `/api/control/reset` | RESET |
| `POST` | `/api/autotune/start` | Start mock Auto Tune |
| `POST` | `/api/autotune/apply` | Apply valid tuned gain and RUN |
| `POST` | `/api/autotune/auto-apply` | Enable or disable Auto Apply After DONE |

Example command body:

```json
{
  "target_temp": 80.0,
  "kp": 0.04,
  "ki": 0.003
}
```

## WebSocket

Endpoint:

```text
/ws
```

Server-to-client message types:

- `status.snapshot`
- `history.batch`
- `event.log`
- `adapter.state`
- `autotune.event`

## Protocol Codec Tests

The PDO codec is tested against the legacy v4.5 GUI byte layout:

- RxPDO: 14 bytes, `ControlWord` UINT16 little-endian plus three float32 raw UINT32 values
- TxPDO: 48 bytes, `StatusWord`, packed state, temperature/control/tuning fields

Run from `10_web_control`:

```powershell
py -3.13 -m unittest discover -s tests
```

With the bundled Codex Python runtime:

```powershell
C:\Users\user\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe -m unittest discover -s tests
```

## EtherCAT Mode

EtherCAT access is split into two processes:

- Web backend, Python 3.13 on the WMX master PC: REST, WebSocket, Web UI, `EthercatBridgeAdapter`
- Web backend, Python 3.10+ on KD240 A53 Linux: shared-memory adapter path
- WMX bridge, Python 3.6: `WMX3ApiPython`, `SetOutBytes`, `GetInBytes`

Mock mode remains the safe default and does not start the bridge.

Start the Web backend directly in EtherCAT bridge mode:

```powershell
cd C:\Users\user\Desktop\KD240\10_web_control
$env:KD240_BACKEND_MODE="ethercat_bridge"
$env:KD240_WMX_PY36="C:\Users\abc\AppData\Local\Programs\Python\Python36\python.exe"
py -3.13 backend\server.py
```

`KD240_WMX_PY36` must point to the Python 3.6 executable that can import
`WMX3ApiPython` on the WMX master PC. If it is not set, the adapter uses
`python` from `PATH`.

Or switch a running server:

```powershell
Invoke-RestMethod -Method Post `
  -Uri http://127.0.0.1:8080/api/mode `
  -ContentType "application/json" `
  -Body '{"mode":"ethercat_bridge"}'
```

Check diagnostics:

```powershell
Invoke-RestMethod http://127.0.0.1:8080/api/adapter/diagnostics
```

The bridge uses the same WMX3 pattern as the v4.5 GUI and the validated
manual smoke test:

- `WMX_ROOT`: default `C:\Program Files\SoftServo\WMX3`
- Python API path: `C:\Program Files\SoftServo\WMX3\Lib\PythonApi`
- `WMX3Api()`
- `CreateDevice(..., DeviceType.DeviceTypeLowPriority, timeout)`
- `Io(wmx)`
- `SetOutBytes(0x00, 14, list(rxpdo_bytes))`
- `GetInBytes(0x00, 48)`

Bridge-only smoke test on the WMX master PC:

```powershell
cd C:\Users\user\Desktop\KD240\10_web_control
C:\Users\abc\AppData\Local\Programs\Python\Python36\python.exe bridge\wmx_bridge_py36.py --smoke
C:\Users\abc\AppData\Local\Programs\Python\Python36\python.exe bridge\wmx_bridge_py36.py --smoke --run --target 80 --kp 0.04 --ki 0.003
```

The existing smoke command is preserved as a wrapper:

```powershell
C:\Users\abc\AppData\Local\Programs\Python\Python36\python.exe tools\manual_wmx_smoke.py
C:\Users\abc\AppData\Local\Programs\Python\Python36\python.exe tools\manual_wmx_smoke.py --run --target 80 --kp 0.04 --ki 0.003
```

Before real KD240 EtherCAT testing, confirm:

- WMX3 runtime and Python API are installed.
- The same Python environment can import `WMX3ApiPython`.
- ENI/ESI mapping is still one channel: `IoOutput 14`, `IoInput 48`.
- KD240 A53 EtherCAT slave app is running.
- R5 heater control app is running.
- EtherCAT slave is in OP state before sending RUN.
- `SetOutBytes(0x00, 14)` and `GetInBytes(0x00, 48)` match the active ENI.

Some `WMX3ApiPython` versions do not export `INFINITE`. The Python 3.6
bridge does not require that symbol. It uses:

```python
getattr(WMX3ApiPython, "INFINITE", 0xFFFFFFFF)
```

The actual timeout value used for `CreateDevice` is reported in bridge
diagnostics as `create_device_timeout`, and the Web backend exposes that
under `/api/adapter/diagnostics`.

Python version note:

WMX3 master PCs may use Python 3.6. Python 3.6 compatibility is limited
to the bridge path:

- `bridge/wmx_bridge_py36.py`
- `bridge/pdo_codec_py36.py`
- `tools/manual_wmx_smoke.py`

The Web backend remains Python 3.13 on the WMX master PC and Python 3.10+
on KD240 A53 Linux. It may use modern typing/runtime features. Do not run
`backend/server.py` with the WMX Python 3.6 runtime.

The bridge path avoids Python 3.7+ `from __future__ import annotations`,
Python 3.9+ collection generics, Python 3.10 `|` union types, and
`dataclasses`. No `dataclasses` backport is required for the WMX bridge
smoke test.

Run on the WMX master PC:

```powershell
py -0p
C:\Users\abc\AppData\Local\Programs\Python\Python36\python.exe bridge\wmx_bridge_py36.py --smoke
C:\Users\abc\AppData\Local\Programs\Python\Python36\python.exe bridge\wmx_bridge_py36.py --smoke --run --target 80 --kp 0.04 --ki 0.003
```

The Web backend starts the bridge with:

```text
<KD240_WMX_PY36> -u bridge\wmx_bridge_py36.py --stdio
```

The IPC contract is newline-delimited JSON. The backend sends one command
per line, for example:

```json
{"id":1,"command":"run","payload":{"target_temp":80.0,"kp":0.04,"ki":0.003}}
```

The bridge returns one JSON response per line with `ok`, optional
`status`, and `diagnostics`.

Full WMX master PC check sequence:

```powershell
cd C:\Users\user\Desktop\KD240\10_web_control
py -0p
C:\Users\abc\AppData\Local\Programs\Python\Python36\python.exe bridge\wmx_bridge_py36.py --smoke
C:\Users\abc\AppData\Local\Programs\Python\Python36\python.exe bridge\wmx_bridge_py36.py --smoke --run --target 80 --kp 0.04 --ki 0.003
$env:KD240_BACKEND_MODE="ethercat_bridge"
$env:KD240_WMX_PY36="C:\Users\abc\AppData\Local\Programs\Python\Python36\python.exe"
py -3.13 backend\server.py
```

In the Web UI, confirm the adapter badge and `/api/mode` report
`ethercat_bridge`.

## UI Layout

The UI is organized around the multi-channel HMI layout used as the
reference for this phase:

- Top Header: project name, adapter mode, WebSocket status, Start/Stop, channel select
- Common Parameters: server/version/adapter/channel count/RxPDO/TxPDO/backend state/WS period/sequence
- Channel Summary: CH1 active, CH2-CH8 disabled future placeholders
- Selected Channel Detail: PV/SV/Error/Output/Duty/StatusWord/Kp/Ki and control buttons
- Auto Tune Panel: Start, Apply Tuned Gain, Auto Apply After DONE, Tune K/L/T, tuned Kp/Ki, valid/error
- Trend Chart: current temperature, target temperature, output %, duty %, error
- Client Log: REST command log, WebSocket connection log, Auto Tune events

## Adapter Policy

The Web UI talks only to REST and WebSocket. Hardware access is isolated
behind `IHeaterBackendAdapter`.

Current:

- `MockAdapter`: implemented
- `EthercatBridgeAdapter`: implemented; starts the Python 3.6 WMX bridge subprocess
- `WmxEthercatAdapter`: compatibility wrapper that routes to `EthercatBridgeAdapter`

Future placeholders:

- `Kd240SharedMemoryAdapter`: not implemented in this phase

For the later KD240 A53 Linux deployment, keep using the Web backend,
frontend, REST/WebSocket contracts, DTOs, and `pdo_codec`. Replace
`EthercatBridgeAdapter` with `Kd240SharedMemoryAdapter` once the A53
shared-memory contract is implemented.

The future `autotune.apply` implementation must not blindly forward
`0x0010` to KD240 shared memory because that bit is `APPLY_TUNED_GAIN`
in the legacy GUI scope but `AUTO_TUNE_ABORT` in the shared-memory
header scope.
