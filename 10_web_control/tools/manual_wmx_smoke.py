"""Manual WMX3 EtherCAT smoke test for KD240 CH1.

Run this only on the Windows machine where WMX3 Python API is installed
and the KD240 EtherCAT network is configured/OP.
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path


BACKEND_DIR = Path(__file__).resolve().parents[1] / "backend"
sys.path.insert(0, str(BACKEND_DIR))

from adapters.wmx_ethercat_adapter import WmxEthercatAdapter  # noqa: E402
from dto import CommandDTO  # noqa: E402


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--target", type=float, default=80.0)
    parser.add_argument("--kp", type=float, default=0.04)
    parser.add_argument("--ki", type=float, default=0.003)
    parser.add_argument("--run", action="store_true", help="Send RUN after connecting")
    args = parser.parse_args()

    adapter = WmxEthercatAdapter()
    try:
        adapter.connect()
        print("connected:", adapter.get_diagnostics())
        if args.run:
            status = adapter.run(CommandDTO(target_temp=args.target, kp=args.kp, ki=args.ki))
        else:
            status = adapter.read_status()
        print("status:", status.to_dict())
        print("diagnostics:", adapter.get_diagnostics())
        return 0
    finally:
        adapter.disconnect()


if __name__ == "__main__":
    raise SystemExit(main())
