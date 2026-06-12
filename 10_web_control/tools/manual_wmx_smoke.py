r"""Compatibility wrapper for the Python 3.6 WMX bridge smoke test.

Existing usage is preserved:
  python tools\manual_wmx_smoke.py --run --target 80 --kp 0.04 --ki 0.003

The actual WMX3ApiPython import now lives in bridge/wmx_bridge_py36.py.
"""

import subprocess
import sys
from pathlib import Path


PROJECT_DIR = Path(__file__).resolve().parents[1]
BRIDGE_SCRIPT = PROJECT_DIR / "bridge" / "wmx_bridge_py36.py"


def main():
    cmd = [sys.executable, str(BRIDGE_SCRIPT), "--smoke"] + sys.argv[1:]
    return subprocess.call(cmd, cwd=str(PROJECT_DIR))


if __name__ == "__main__":
    raise SystemExit(main())
