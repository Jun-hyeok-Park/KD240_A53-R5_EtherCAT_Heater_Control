import sys
import traceback

sys.path.append(r"C:\Program Files\SoftServo\WMX3\Lib\PythonApi")

from WMX3ApiPython import *

INFINITE = int(0xFFFFFFFF)

print("Import OK", flush=True)

wmx = WMX3Api()
print("WMX3Api object created", flush=True)

print("Before CreateDevice", flush=True)

ret = wmx.CreateDevice(
    'C:\\Program Files\\SoftServo\\WMX3\\',
    DeviceType.DeviceTypeNormal,
    INFINITE
)

print("After CreateDevice, ret =", ret, flush=True)

input("Press Enter to close...")
wmx.CloseDevice()