# KD240 Heater Web Control

This folder contains the new KD240 Heater Web Control implementation.
The current phase is a mock-only Web UI for validating the REST API,
WebSocket stream, DTOs, and backend adapter split.

`09_GUI` remains legacy reference material and is not modified by this
implementation.

## Current Scope

- Multi-channel HMI-style Web UI under `frontend/`
- Modular backend under `backend/`
- Mock backend adapter only
- Placeholder adapters for future WMX3 EtherCAT and KD240 shared-memory modes
- No WMX3, EtherCAT, or KD240 shared-memory connection in this phase
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
      mock_adapter.py
      wmx_ethercat_adapter.py
      kd240_shared_memory_adapter.py
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
    test_pdo_codec.py
    test_wmx_ethercat_adapter.py
  tools/
    manual_wmx_smoke.py
```

## Run

From this folder:

```powershell
cd C:\Users\user\Desktop\KD240\10_web_control
python backend\server.py
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
python backend\server.py
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
python -m unittest discover -s tests
```

With the bundled Codex Python runtime:

```powershell
C:\Users\user\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe -m unittest discover -s tests
```

## EtherCAT Mode

EtherCAT mode is implemented through `WmxEthercatAdapter`, but it is not
the default. Mock mode remains the safe default and does not import WMX3.

Start directly in EtherCAT mode:

```powershell
cd C:\Users\user\Desktop\KD240\10_web_control
$env:KD240_BACKEND_MODE="ethercat"
python backend\server.py
```

Or switch a running server:

```powershell
Invoke-RestMethod -Method Post `
  -Uri http://127.0.0.1:8080/api/mode `
  -ContentType "application/json" `
  -Body '{"mode":"ethercat"}'
```

Check diagnostics:

```powershell
Invoke-RestMethod http://127.0.0.1:8080/api/adapter/diagnostics
```

The adapter uses the same WMX3 pattern as the v4.5 GUI:

- `WMX_ROOT`: default `C:\Program Files\SoftServo\WMX3`
- Python API path: `C:\Program Files\SoftServo\WMX3\Lib\PythonApi`
- `WMX3Api()`
- `CreateDevice(..., DeviceType.DeviceTypeLowPriority, INFINITE)`
- `Io(wmx)`
- `SetOutBytes(0x00, 14, list(rxpdo_bytes))`
- `GetInBytes(0x00, 48)`

Manual WMX smoke test:

```powershell
cd C:\Users\user\Desktop\KD240\10_web_control
python tools\manual_wmx_smoke.py
python tools\manual_wmx_smoke.py --run --target 80 --kp 0.04 --ki 0.003
```

Before real KD240 EtherCAT testing, confirm:

- WMX3 runtime and Python API are installed.
- The same Python environment can import `WMX3ApiPython`.
- ENI/ESI mapping is still one channel: `IoOutput 14`, `IoInput 48`.
- KD240 A53 EtherCAT slave app is running.
- R5 heater control app is running.
- EtherCAT slave is in OP state before sending RUN.
- `SetOutBytes(0x00, 14)` and `GetInBytes(0x00, 48)` match the active ENI.

Python version note:

The current Web backend uses modern Python syntax and the Codex bundled
runtime is newer than the Python 3.6 environment often used with WMX3.
If `WMX3ApiPython` only works in Python 3.6 and this server cannot run
there, keep this Web backend on a modern Python and split WMX3 access
into a small Python 3.6 subprocess/bridge process. The bridge should own
`WMX3ApiPython`, expose a narrow local IPC protocol, and use the same
`pdo_codec` byte contract for RxPDO/TxPDO.

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

Future placeholders:

- `WmxEthercatAdapter`: not implemented in this phase
- `Kd240SharedMemoryAdapter`: not implemented in this phase

The future `autotune.apply` implementation must not blindly forward
`0x0010` to KD240 shared memory because that bit is `APPLY_TUNED_GAIN`
in the legacy GUI scope but `AUTO_TUNE_ABORT` in the shared-memory
header scope.
