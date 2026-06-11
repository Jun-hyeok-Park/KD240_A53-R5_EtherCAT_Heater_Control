import sys
import traceback
from time import sleep

sys.path.append(r"C:\Program Files\SoftServo\WMX3\Lib\PythonApi")
from WMX3ApiPython import *

INFINITE = int(0xFFFFFFFF)


def is_success(ret):
    return ret is None or ret == 0


def main():
    print("======================================", flush=True)
    print(" KD240 EtherCAT 2byte Loopback Test   ", flush=True)
    print(" WOS Communication Already Started    ", flush=True)
    print("======================================", flush=True)

    wmx = WMX3Api()

    ret = wmx.CreateDevice(
        'C:\\Program Files\\SoftServo\\WMX3\\',
        DeviceType.DeviceTypeLowPriority,
        INFINITE
    )
    print("CreateDevice ret =", ret, flush=True)

    if not is_success(ret):
        print("[ERROR] CreateDevice failed", flush=True)
        input("Press Enter to exit...")
        return

    ret = wmx.SetDeviceName("GatewayLoopbackTest")
    print("SetDeviceName ret =", ret, flush=True)

    io = Io(wmx)
    print("[OK] Io object created", flush=True)

    patterns = [
        [0x01, 0x00],   # 0x0001
        [0x02, 0x00],   # 0x0002
        [0x04, 0x00],   # 0x0004
        [0x08, 0x00],   # 0x0008
        [0x10, 0x00],   # 0x0010
        [0xAA, 0x55],   # 0x55AA
        [0xFF, 0x00],   # 0x00FF
        [0x00, 0x00],   # 0x0000
    ]

    try:
        index = 0

        while True:
            out_data = patterns[index % len(patterns)]
            index += 1

            # 1. Output I/O Space 0번 주소부터 2byte 쓰기
            ret = io.SetOutBytes(0x00, 2, out_data)
            print()
            print(f"SetOutBytes ret = {ret}, Output = {[hex(x) for x in out_data]}", flush=True)

            # EtherCAT cycle 반영 대기
            sleep(0.2)

            # 2. Output I/O Space 확인
            ret, out_readback = io.GetOutBytes(0x00, 2)
            print(f"GetOutBytes ret = {ret}, OutputReadback = {[hex(x) for x in out_readback]}", flush=True)

            # 3. Input I/O Space 0번 주소부터 2byte 읽기
            ret, in_data = io.GetInBytes(0x00, 2)

            if not is_success(ret):
                print(f"[ERROR] GetInBytes failed. ret = {ret}", flush=True)
                sleep(0.5)
                continue

            b0 = in_data[0]
            b1 = in_data[1]

            out_u16 = out_data[0] | (out_data[1] << 8)
            in_u16 = b0 | (b1 << 8)

            print(
                f"Input[0] = 0x{b0:02X}, "
                f"Input[1] = 0x{b1:02X}, "
                f"Input U16 = 0x{in_u16:04X} ({in_u16})",
                flush=True
            )

            if out_u16 == in_u16:
                print("[OK] Loopback matched", flush=True)
            else:
                print(f"[NG] Loopback mismatch: Output=0x{out_u16:04X}, Input=0x{in_u16:04X}", flush=True)

            sleep(0.8)

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