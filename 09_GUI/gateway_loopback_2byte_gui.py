import os
import sys
import traceback
import tkinter as tk
from tkinter import messagebox

# =========================================================
# WMX Python API 경로 설정
# =========================================================
WMX_ROOT = r"C:\Program Files\SoftServo\WMX3"
PYTHON_API = os.path.join(WMX_ROOT, "Lib", "PythonApi")

os.environ["PATH"] = (
    WMX_ROOT + ";" +
    os.path.join(WMX_ROOT, "Bin") + ";" +
    os.path.join(WMX_ROOT, "Lib") + ";" +
    os.path.join(WMX_ROOT, "Lib", "x64") + ";" +
    PYTHON_API + ";" +
    os.environ.get("PATH", "")
)

sys.path.append(PYTHON_API)

from WMX3ApiPython import *

INFINITE = int(0xFFFFFFFF)


def is_success(ret):
    return ret is None or ret == 0


class GatewayLoopbackGui:
    def __init__(self, root):
        self.root = root
        self.root.title("KD240 EtherCAT Gateway Monitor")
        self.root.geometry("920x620")
        self.root.minsize(920, 620)

        # Theme Colors
        self.bg = "#0F172A"          # slate-900
        self.card = "#111827"        # gray-900
        self.card2 = "#1E293B"       # slate-800
        self.border = "#334155"      # slate-700
        self.text = "#E5E7EB"        # gray-200
        self.subtext = "#94A3B8"     # slate-400
        self.green = "#22C55E"
        self.red = "#EF4444"
        self.yellow = "#F59E0B"
        self.blue = "#3B82F6"
        self.button = "#2563EB"
        self.button_hover = "#1D4ED8"
        self.dark_button = "#334155"

        self.root.configure(bg=self.bg)

        self.wmx = None
        self.io = None
        self.connected = False
        self.auto_running = False

        self.patterns = [
            [0x01, 0x00],
            [0x02, 0x00],
            [0x04, 0x00],
            [0x08, 0x00],
            [0x10, 0x00],
            [0xAA, 0x55],
            [0xFF, 0x00],
            [0x00, 0x00],
        ]
        self.pattern_index = 0
        self.last_output = [0x00, 0x00]

        self.build_ui()
        self.root.protocol("WM_DELETE_WINDOW", self.on_close)

    # =====================================================
    # UI helper
    # =====================================================
    def make_card(self, parent, title):
        frame = tk.Frame(parent, bg=self.card, highlightbackground=self.border, highlightthickness=1)
        title_label = tk.Label(
            frame,
            text=title,
            bg=self.card,
            fg=self.subtext,
            font=("Segoe UI", 10, "bold")
        )
        title_label.pack(anchor="w", padx=16, pady=(12, 4))
        return frame

    def make_button(self, parent, text, command, bg=None, width=16):
        if bg is None:
            bg = self.button

        btn = tk.Button(
            parent,
            text=text,
            command=command,
            bg=bg,
            fg="white",
            activebackground=self.button_hover,
            activeforeground="white",
            relief="flat",
            bd=0,
            font=("Segoe UI", 10, "bold"),
            width=width,
            height=2,
            cursor="hand2"
        )
        return btn

    def make_value_label(self, parent, label_text):
        row = tk.Frame(parent, bg=self.card)
        row.pack(fill="x", padx=18, pady=5)

        label = tk.Label(
            row,
            text=label_text,
            bg=self.card,
            fg=self.subtext,
            font=("Segoe UI", 10),
            width=18,
            anchor="w"
        )
        label.pack(side="left")

        value = tk.Label(
            row,
            text="--",
            bg=self.card,
            fg=self.text,
            font=("Consolas", 12, "bold"),
            anchor="w"
        )
        value.pack(side="left", fill="x", expand=True)

        return value

    # =====================================================
    # UI 구성
    # =====================================================
    def build_ui(self):
        # Header
        header = tk.Frame(self.root, bg=self.bg)
        header.pack(fill="x", padx=24, pady=(22, 10))

        title = tk.Label(
            header,
            text="KD240 EtherCAT Gateway Monitor",
            bg=self.bg,
            fg=self.text,
            font=("Segoe UI", 22, "bold")
        )
        title.pack(anchor="w")

        subtitle = tk.Label(
            header,
            text="WMX I/O Space 기반 2byte Loopback Test",
            bg=self.bg,
            fg=self.subtext,
            font=("Segoe UI", 11)
        )
        subtitle.pack(anchor="w", pady=(4, 0))

        # Main layout
        main = tk.Frame(self.root, bg=self.bg)
        main.pack(fill="both", expand=True, padx=24, pady=10)

        left = tk.Frame(main, bg=self.bg)
        left.pack(side="left", fill="both", expand=True)

        right = tk.Frame(main, bg=self.bg, width=290)
        right.pack(side="right", fill="y", padx=(16, 0))

        # Connection Card
        conn_card = self.make_card(left, "Connection")
        conn_card.pack(fill="x", pady=(0, 14))

        conn_body = tk.Frame(conn_card, bg=self.card)
        conn_body.pack(fill="x", padx=16, pady=(4, 16))

        self.status_dot = tk.Label(conn_body, text="●", bg=self.card, fg=self.red, font=("Segoe UI", 20, "bold"))
        self.status_dot.pack(side="left", padx=(0, 8))

        self.status_var = tk.StringVar(value="Disconnected")
        self.status_label = tk.Label(
            conn_body,
            textvariable=self.status_var,
            bg=self.card,
            fg=self.text,
            font=("Segoe UI", 13, "bold")
        )
        self.status_label.pack(side="left", padx=(0, 20))

        self.connect_btn = self.make_button(conn_body, "Connect", self.connect, self.green, width=12)
        self.connect_btn.pack(side="left", padx=6)

        self.disconnect_btn = self.make_button(conn_body, "Disconnect", self.disconnect, self.dark_button, width=12)
        self.disconnect_btn.pack(side="left", padx=6)

        # I/O Card
        io_card = self.make_card(left, "I/O Space")
        io_card.pack(fill="x", pady=(0, 14))

        self.output_label = self.make_value_label(io_card, "Output Write")
        self.output_readback_label = self.make_value_label(io_card, "Output Readback")
        self.input_label = self.make_value_label(io_card, "Input Read")

        match_row = tk.Frame(io_card, bg=self.card)
        match_row.pack(fill="x", padx=18, pady=(14, 18))

        self.match_badge = tk.Label(
            match_row,
            text="WAITING",
            bg=self.yellow,
            fg="#111827",
            font=("Segoe UI", 13, "bold"),
            padx=14,
            pady=6
        )
        self.match_badge.pack(side="left")

        self.match_desc = tk.Label(
            match_row,
            text="Connect 후 Write/Read를 수행하세요.",
            bg=self.card,
            fg=self.subtext,
            font=("Segoe UI", 10)
        )
        self.match_desc.pack(side="left", padx=12)

        # Log Card
        log_card = self.make_card(left, "Log")
        log_card.pack(fill="both", expand=True)

        self.log_text = tk.Text(
            log_card,
            height=10,
            bg="#020617",
            fg="#CBD5E1",
            insertbackground="white",
            relief="flat",
            bd=0,
            font=("Consolas", 9)
        )
        self.log_text.pack(fill="both", expand=True, padx=16, pady=(6, 16))

        # Control Card
        control_card = self.make_card(right, "Output Control")
        control_card.pack(fill="x", pady=(0, 14))

        form = tk.Frame(control_card, bg=self.card)
        form.pack(fill="x", padx=16, pady=(8, 12))

        tk.Label(form, text="Byte0 HEX", bg=self.card, fg=self.subtext, font=("Segoe UI", 10)).pack(anchor="w")
        self.byte0_entry = tk.Entry(
            form,
            bg=self.card2,
            fg=self.text,
            insertbackground="white",
            relief="flat",
            font=("Consolas", 14, "bold"),
            justify="center"
        )
        self.byte0_entry.insert(0, "01")
        self.byte0_entry.pack(fill="x", pady=(4, 12), ipady=8)

        tk.Label(form, text="Byte1 HEX", bg=self.card, fg=self.subtext, font=("Segoe UI", 10)).pack(anchor="w")
        self.byte1_entry = tk.Entry(
            form,
            bg=self.card2,
            fg=self.text,
            insertbackground="white",
            relief="flat",
            font=("Consolas", 14, "bold"),
            justify="center"
        )
        self.byte1_entry.insert(0, "00")
        self.byte1_entry.pack(fill="x", pady=(4, 14), ipady=8)

        self.write_btn = self.make_button(form, "Write Once", self.write_manual, self.blue, width=22)
        self.write_btn.pack(fill="x", pady=5)

        self.read_btn = self.make_button(form, "Read Now", self.read_once, self.dark_button, width=22)
        self.read_btn.pack(fill="x", pady=5)

        self.auto_btn = self.make_button(form, "Start Auto Pattern", self.start_auto, self.green, width=22)
        self.auto_btn.pack(fill="x", pady=(18, 5))

        self.stop_btn = self.make_button(form, "Stop Auto", self.stop_auto, self.red, width=22)
        self.stop_btn.pack(fill="x", pady=5)

        # Info Card
        info_card = self.make_card(right, "Mapping Info")
        info_card.pack(fill="x")

        info_text = (
            "IoOutput : Addr 0, Size 2 byte\n"
            "IoInput  : Addr 0, Size 2 byte\n\n"
            "Output PDO → KD240\n"
            "KD240 Loopback\n"
            "Input PDO  → WMX I/O Space"
        )

        info = tk.Label(
            info_card,
            text=info_text,
            bg=self.card,
            fg=self.subtext,
            justify="left",
            font=("Consolas", 9)
        )
        info.pack(anchor="w", padx=16, pady=(6, 16))

    # =====================================================
    # Log
    # =====================================================
    def log(self, msg):
        self.log_text.insert("end", msg + "\n")
        self.log_text.see("end")

    # =====================================================
    # WMX 연결
    # =====================================================
    def connect(self):
        if self.connected:
            self.log("[INFO] Already connected.")
            return

        try:
            self.wmx = WMX3Api()

            ret = self.wmx.CreateDevice(
                "C:\\Program Files\\SoftServo\\WMX3\\",
                DeviceType.DeviceTypeLowPriority,
                INFINITE
            )
            self.log("CreateDevice ret = {}".format(ret))

            if not is_success(ret):
                messagebox.showerror("Error", "CreateDevice failed. ret = {}".format(ret))
                return

            ret = self.wmx.SetDeviceName("GatewayGuiMonitor")
            self.log("SetDeviceName ret = {}".format(ret))

            # WOS가 이미 통신을 시작한 상태에서 I/O Space만 접근
            self.io = Io(self.wmx)

            self.connected = True
            self.status_var.set("Connected - LowPriority Device")
            self.status_dot.config(fg=self.green)

            self.log("[OK] WMX LowPriority Device connected.")
            self.read_once()

        except Exception:
            err = traceback.format_exc()
            self.log(err)
            messagebox.showerror("Exception", err)

    # =====================================================
    # 연결 해제
    # =====================================================
    def disconnect(self):
        self.auto_running = False

        if self.wmx is not None:
            try:
                self.wmx.CloseDevice()
                self.log("[OK] CloseDevice")
            except Exception:
                self.log("[WARN] CloseDevice failed.")

        self.wmx = None
        self.io = None
        self.connected = False
        self.status_var.set("Disconnected")
        self.status_dot.config(fg=self.red)
        self.set_match_waiting("Disconnected")

    # =====================================================
    # Write
    # =====================================================
    def write_manual(self):
        if not self.ensure_connected():
            return

        try:
            b0 = int(self.byte0_entry.get(), 16) & 0xFF
            b1 = int(self.byte1_entry.get(), 16) & 0xFF
        except ValueError:
            messagebox.showerror("Input Error", "Byte 값은 16진수로 입력하세요. 예: 01, AA, FF")
            return

        self.write_output([b0, b1])
        self.root.after(120, self.read_once)

    def write_output(self, out_data):
        ret = self.io.SetOutBytes(0x00, 2, out_data)
        self.last_output = out_data[:]

        out_u16 = out_data[0] | (out_data[1] << 8)
        self.output_label.config(
            text="[0x{:02X}, 0x{:02X}]   U16=0x{:04X} ({})".format(
                out_data[0], out_data[1], out_u16, out_u16
            )
        )

        self.log("SetOutBytes ret={}, data=[0x{:02X}, 0x{:02X}]".format(
            ret, out_data[0], out_data[1]
        ))

    # =====================================================
    # Read
    # =====================================================
    def read_once(self):
        if not self.ensure_connected():
            return

        try:
            ret, out_readback = self.io.GetOutBytes(0x00, 2)
            if not is_success(ret):
                self.log("[ERROR] GetOutBytes failed. ret={}".format(ret))
                self.set_match_ng("GetOutBytes failed")
                return

            ret, in_data = self.io.GetInBytes(0x00, 2)
            if not is_success(ret):
                self.log("[ERROR] GetInBytes failed. ret={}".format(ret))
                self.set_match_ng("GetInBytes failed")
                return

            out_b0 = out_readback[0]
            out_b1 = out_readback[1]
            in_b0 = in_data[0]
            in_b1 = in_data[1]

            out_u16 = out_b0 | (out_b1 << 8)
            in_u16 = in_b0 | (in_b1 << 8)

            self.output_readback_label.config(
                text="[0x{:02X}, 0x{:02X}]   U16=0x{:04X} ({})".format(
                    out_b0, out_b1, out_u16, out_u16
                )
            )

            self.input_label.config(
                text="[0x{:02X}, 0x{:02X}]   U16=0x{:04X} ({})".format(
                    in_b0, in_b1, in_u16, in_u16
                )
            )

            if out_u16 == in_u16:
                self.set_match_ok("Output and Input matched")
            else:
                self.set_match_ng("Output and Input mismatch")

        except Exception:
            err = traceback.format_exc()
            self.log(err)
            messagebox.showerror("Exception", err)

    # =====================================================
    # Auto pattern
    # =====================================================
    def start_auto(self):
        if not self.ensure_connected():
            return

        if self.auto_running:
            return

        self.auto_running = True
        self.log("[INFO] Auto pattern started.")
        self.auto_loop()

    def stop_auto(self):
        self.auto_running = False
        self.log("[INFO] Auto pattern stopped.")

    def auto_loop(self):
        if not self.auto_running:
            return

        out_data = self.patterns[self.pattern_index % len(self.patterns)]
        self.pattern_index += 1

        self.write_output(out_data)
        self.root.after(120, self.read_once)
        self.root.after(850, self.auto_loop)

    # =====================================================
    # Match badge
    # =====================================================
    def set_match_ok(self, desc):
        self.match_badge.config(text="OK", bg=self.green, fg="#052E16")
        self.match_desc.config(text=desc, fg=self.text)

    def set_match_ng(self, desc):
        self.match_badge.config(text="NG", bg=self.red, fg="white")
        self.match_desc.config(text=desc, fg=self.text)

    def set_match_waiting(self, desc):
        self.match_badge.config(text="WAITING", bg=self.yellow, fg="#111827")
        self.match_desc.config(text=desc, fg=self.subtext)

    # =====================================================
    # 연결 확인
    # =====================================================
    def ensure_connected(self):
        if not self.connected or self.io is None:
            messagebox.showwarning("Not Connected", "먼저 Connect를 누르세요.")
            return False
        return True

    # =====================================================
    # 종료
    # =====================================================
    def on_close(self):
        self.disconnect()
        self.root.destroy()


if __name__ == "__main__":
    root = tk.Tk()
    app = GatewayLoopbackGui(root)
    root.mainloop()