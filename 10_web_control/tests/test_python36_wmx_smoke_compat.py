import ast
import unittest
from pathlib import Path


class TestPython36WmxSmokeCompat(unittest.TestCase):
    def test_wmx_bridge_path_parses_as_python36(self):
        root = Path(__file__).resolve().parents[1]
        files = [
            root / "bridge" / "wmx_bridge_py36.py",
            root / "bridge" / "pdo_codec_py36.py",
            root / "tools" / "manual_wmx_smoke.py",
        ]

        for path in files:
            with self.subTest(path=str(path)):
                source = path.read_text(encoding="utf-8")
                ast.parse(source, filename=str(path), feature_version=(3, 6))


if __name__ == "__main__":
    unittest.main()
