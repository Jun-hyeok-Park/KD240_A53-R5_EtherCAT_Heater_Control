import sys
import struct
import traceback
from time import sleep

sys.path.append(r"C:\Program Files\SoftServo\WMX3\Lib\PythonApi")
from WMX3ApiPython import *

INFINITE = int(0xFFFFFFFF)

RX_PDO_SIZE = 14   # Master -> Slave
TX_PDO_SIZE = 20   # Slave  -> Master

TARGET_TEMP = 80.0
KP = 0.03
KI = 0.0001

STATE_NAME = {
    0: "IDLE",
    1: "RUN",
    2: "STABLE",
    3: "FAULT",
}


def is_success(ret):
    return ret is None or ret == 0


def f32_to_u32(value):
    return struct.unpack("<I", struct.pack("<f", float(value)))[0]


def u32_to_f32(value):
    return struct.unpack("<f", struct.pack("<I", int(value) & 0xFFFFFFFF))[0]


def make_rxpdo(control_word, target_temp, kp, ki):
    """
    RxPDO, Master -> Slave, 14 bytes

    Offset 0   ControlWord   UINT16
    Offset 2   TargetTempRaw UINT32, float raw
    Offset 6   KpRaw         UINT32, float raw
    Offset 10  KiRaw         UINT32, float raw
    """
    data = struct.pack(
        "<HIII",
        int(control_word) & 0xFFFF,
        f32_to_u32(target_temp),
        f32_to_u32(kp),
        f32_to_u32(ki),
    )
    return list(data)


def parse_txpdo(data):
    """
    TxPDO, Slave -> Master, 20 bytes

    Offset 0   StatusWord     UINT16
    Offset 2   State          UINT16
    Offset 4   CurrentTempRaw UINT32, float raw
    Offset 8   ErrorRaw       UINT32, float raw
    Offset 12  UCtrlRaw       UINT32, float raw
    Offset 16  DutyCnt        UINT32
    """
    data = list(data[:TX_PDO_SIZE])

    if len(data) < TX_PDO_SIZE:
        raise ValueError("TxPDO length is too short: {} bytes".format(len(data)))

    raw = bytes(data)
    status_word, state, current_raw, error_raw, u_raw, duty = struct.unpack("<HHIIII", raw)

    return {
        "status_word": status_word,
        "state": state,
        "state_name": STATE_NAME.get(state, "UNKNOWN"),
        "current_raw": current_raw,
        "error_raw": error_raw,
        "u_raw": u_raw,
        "duty": duty,
        "current_t": u32_to_f32(current_raw),
        "error": u32_to_f32(error_raw),
        "u_ctrl": u32_to_f32(u_raw),
    }


def print_bytes(label, data):
    print("{} = {}".format(label, ["0x{:02X}".format(x) for x in data]), flush=True)


def set_heater_output(io, control_word, target_temp, kp, ki):
    out_data = make_rxpdo(control_word, target_temp, kp, ki)

    ret = io.SetOutBytes(0x00, RX_PDO_SIZE, out_data)

    print()
    print(
        "SetOutBytes ret = {}, ControlWord=0x{:04X}, Target={:.2f}, Kp={}, Ki={}".format(
            ret, control_word, target_temp, kp, ki
        ),
        flush=True
    )
    print_bytes("Output", out_data)

    return ret


def get_heater_input(io):
    ret, in_data = io.GetInBytes(0x00, TX_PDO_SIZE)

    if not is_success(ret):
        print("[ERROR] GetInBytes failed. ret = {}".format(ret), flush=True)
        return ret, None

    in_data = list(in_data[:TX_PDO_SIZE])
    status = parse_txpdo(in_data)

    print_bytes("Input", in_data)
    print(
        "StatusWord=0x{:04X}, STATE={}({}), T={:.2f}, ERR={:.2f}, U={:.3f}, DUTY={}".format(
            status["status_word"],
            status["state"],
            status["state_name"],
            status["current_t"],
            status["error"],
            status["u_ctrl"],
            status["duty"],
        ),
        flush=True
    )

    return ret, status


def main():
    print("==========================================", flush=True)
    print(" KD240 EtherCAT Heater PI PDO Test         ", flush=True)
    print(" WOS Communication Already Started         ", flush=True)
    print(" RxPDO: 14 bytes / TxPDO: 20 bytes         ", flush=True)
    print("==========================================", flush=True)

    wmx = WMX3Api()

    ret = wmx.CreateDevice(
        "C:\\Program Files\\SoftServo\\WMX3\\",
        DeviceType.DeviceTypeLowPriority,
        INFINITE
    )
    print("CreateDevice ret =", ret, flush=True)

    if not is_success(ret):
        print("[ERROR] CreateDevice failed", flush=True)
        input("Press Enter to exit...")
        return

    ret = wmx.SetDeviceName("GatewayHeaterPdoTest")
    print("SetDeviceName ret =", ret, flush=True)

    io = Io(wmx)
    print("[OK] Io object created", flush=True)

    try:
        # ------------------------------------------------------------
        # 1. RESET pulse
        # ------------------------------------------------------------
        print("\n[STEP 1] RESET pulse", flush=True)
        set_heater_output(io, 0x0004, TARGET_TEMP, KP, KI)
        sleep(0.05)

        # ------------------------------------------------------------
        # 2. CLEAR
        # ------------------------------------------------------------
        print("\n[STEP 2] CLEAR", flush=True)
        set_heater_output(io, 0x0000, TARGET_TEMP, KP, KI)
        sleep(0.05)

        # ------------------------------------------------------------
        # 3. RUN
        # ------------------------------------------------------------
        print("\n[STEP 3] RUN", flush=True)
        set_heater_output(io, 0x0001, TARGET_TEMP, KP, KI)
        sleep(0.2)

        # ------------------------------------------------------------
        # 4. MONITOR
        # ------------------------------------------------------------
        print("\n[STEP 4] MONITOR", flush=True)

        for i in range(150):
            # RUN 유지. Parameter도 계속 같이 전송.
            set_heater_output(io, 0x0001, TARGET_TEMP, KP, KI)
            sleep(0.05)

            ret, status = get_heater_input(io)

            if status is not None:
                print(
                    "[{:03d}] STATE={}({}), T={:.2f}, ERR={:.2f}, U={:.3f}, DUTY={}".format(
                        i,
                        status["state"],
                        status["state_name"],
                        status["current_t"],
                        status["error"],
                        status["u_ctrl"],
                        status["duty"],
                    ),
                    flush=True
                )

            sleep(0.2)

        # ------------------------------------------------------------
        # 5. STOP pulse
        # ------------------------------------------------------------
        print("\n[STEP 5] STOP pulse", flush=True)
        set_heater_output(io, 0x0002, TARGET_TEMP, KP, KI)
        sleep(0.05)

        # ------------------------------------------------------------
        # 6. CLEAR
        # ------------------------------------------------------------
        print("\n[STEP 6] CLEAR", flush=True)
        set_heater_output(io, 0x0000, TARGET_TEMP, KP, KI)
        sleep(0.1)

        # ------------------------------------------------------------
        # 7. FINAL READ
        # ------------------------------------------------------------
        print("\n[STEP 7] FINAL READ", flush=True)
        ret, status = get_heater_input(io)

        if status is not None:
            print(
                "\nAfter STOP: STATE={}({}), T={:.2f}, ERR={:.2f}, U={:.3f}, DUTY={}".format(
                    status["state"],
                    status["state_name"],
                    status["current_t"],
                    status["error"],
                    status["u_ctrl"],
                    status["duty"],
                ),
                flush=True
            )

    except KeyboardInterrupt:
        print()
        print("Stop requested by user.", flush=True)

    finally:
        print("Closing device...", flush=True)
        wmx.CloseDevice()
        print("Program End.", flush=True)


if __name__ == "__main__":
    try:
        main()
    except Exception:
        print("[PYTHON EXCEPTION]", flush=True)
        traceback.print_exc()
        input("Press Enter to exit...")