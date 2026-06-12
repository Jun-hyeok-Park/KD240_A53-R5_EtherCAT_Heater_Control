import json
import sys


connected = False
status = {
    "status_word": 0x0051,
    "state_packed": 0x0401,
    "heater_state": 1,
    "auto_tune_state": 4,
    "current_temp": 79.25,
    "target_temp": 80.0,
    "error": 0.75,
    "u_ctrl": 0.35,
    "u_percent": 35.0,
    "duty_cnt": 35000,
    "duty_percent": 35.0,
    "tune_k": 118.5,
    "tune_l": 1.25,
    "tune_t": 47.5,
    "tune_kp": 0.038,
    "tune_ki": 0.0028,
    "tuned_gain_valid": True,
    "auto_tune_error": 0,
    "kp": 0.04,
    "ki": 0.003,
}


def diagnostics():
    return {
        "bridge": "fake_wmx_bridge",
        "connected": connected,
        "create_device_timeout": 0xFFFFFFFF,
        "rxpdo_bytes": 14,
        "txpdo_bytes": 48,
        "last_control_word": status.get("last_control_word", 0),
    }


def write(payload):
    sys.stdout.write(json.dumps(payload, separators=(",", ":")) + "\n")
    sys.stdout.flush()


for line in sys.stdin:
    request = json.loads(line)
    request_id = request.get("id")
    command = request.get("command")
    payload = request.get("payload") or {}

    if command == "connect":
        connected = True
        write({"id": request_id, "ok": True, "diagnostics": diagnostics()})
    elif command == "disconnect":
        connected = False
        write({"id": request_id, "ok": True, "diagnostics": diagnostics()})
    elif command == "shutdown":
        write({"id": request_id, "ok": True, "shutdown": True, "diagnostics": diagnostics()})
        break
    elif command in ("run", "write_params", "start_auto_tune"):
        status["target_temp"] = float(payload.get("target_temp", status["target_temp"]))
        status["kp"] = float(payload.get("kp", status["kp"]))
        status["ki"] = float(payload.get("ki", status["ki"]))
        status["last_control_word"] = {"run": 1, "write_params": 0, "start_auto_tune": 8}[command]
        write({"id": request_id, "ok": True, "status": status, "diagnostics": diagnostics()})
    elif command == "apply_tuned_gain":
        status["target_temp"] = float(payload.get("target_temp", status["target_temp"]))
        status["kp"] = status["tune_kp"]
        status["ki"] = status["tune_ki"]
        status["last_control_word"] = 1
        write({"id": request_id, "ok": True, "status": status, "diagnostics": diagnostics()})
    elif command == "stop":
        status["heater_state"] = 0
        status["last_control_word"] = 2
        write({"id": request_id, "ok": True, "status": status, "diagnostics": diagnostics()})
    elif command == "reset":
        status["heater_state"] = 0
        status["auto_tune_state"] = 0
        status["last_control_word"] = 4
        write({"id": request_id, "ok": True, "status": status, "diagnostics": diagnostics()})
    elif command in ("read_status", "clear_command"):
        write({"id": request_id, "ok": True, "status": status, "diagnostics": diagnostics()})
    elif command == "get_diagnostics":
        write({"id": request_id, "ok": True, "diagnostics": diagnostics()})
    else:
        write({"id": request_id, "ok": False, "error": "unknown command: {0}".format(command)})
