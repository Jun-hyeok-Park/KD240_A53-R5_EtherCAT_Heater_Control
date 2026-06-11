import os
import sys
import struct
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

RX_PDO_SIZE = 14
TX_PDO_SIZE = 20

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
    data = struct.pack(
        "<HIII",
        int(control_word) & 0xFFFF,
        f32_to_u32(target_temp),
        f32_to_u32(kp),
        f32_to_u32(ki),
    )
    return list(data)


def parse_txpdo(data):
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


class GatewayHeaterPdoGui:
    def __init__(self, root):
        self.root = root
        self.root.title("KD240 EtherCAT Heater PI Monitor")
        self.root.geometry("1060x720")
        self.root.minsize(1060, 720)

        # Theme Colors
        self.bg = "#0F172A"
        self.card = "#111827"
        self.card2 = "#1E293B"
        self.border = "#334155"
        self.text = "#E5E7EB"
        self.subtext = "#94A3B8"
        self.green = "#22C55E"
        self.red = "#EF4444"
        self.yellow = "#F59E0B"
        self.blue = "#3B82F6"
        self.button = "#2563EB"
        self.button_hover = "#1D4ED8"
        self.dark_button = "#334155"
        self.purple = "#8B5CF6"

        self.root.configure(bg=self.bg)

        self.wmx = None
        self.io = None
        self.connected = False
        self.auto_running = False

        self.last_control_word = 0x0000
        self.last_target = 80.0
        self.last_kp = 0.03
        self.last_ki = 0.0001

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

    def make_entry(self, parent, label_text, default):
        tk.Label(
            parent,
            text=label_text,
            bg=self.card,
            fg=self.subtext,
            font=("Segoe UI", 10)
        ).pack(anchor="w")

        entry = tk.Entry(
            parent,
            bg=self.card2,
            fg=self.text,
            insertbackground="white",
            relief="flat",
            font=("Consolas", 13, "bold"),
            justify="center"
        )
        entry.insert(0, str(default))
        entry.pack(fill="x", pady=(4, 12), ipady=8)
        return entry

    # =====================================================
    # UI 구성
    # =====================================================
    def build_ui(self):
        # Header
        header = tk.Frame(self.root, bg=self.bg)
        header.pack(fill="x", padx=24, pady=(22, 10))

        title = tk.Label(
            header,
            text="KD240 EtherCAT Heater PI Monitor",
            bg=self.bg,
            fg=self.text,
            font=("Segoe UI", 22, "bold")
        )
        title.pack(anchor="w")

        subtitle = tk.Label(
            header,
            text="WMX I/O Space 기반 Heater PDO Test | RxPDO 14 byte / TxPDO 20 byte",
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

        right = tk.Frame(main, bg=self.bg, width=320)
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

        # Heater Status Card
        status_card = self.make_card(left, "Heater Status / TxPDO")
        status_card.pack(fill="x", pady=(0, 14))

        self.state_label = self.make_value_label(status_card, "State")
        self.status_word_label = self.make_value_label(status_card, "StatusWord")
        self.temp_label = self.make_value_label(status_card, "Current Temp")
        self.error_label = self.make_value_label(status_card, "Error")
        self.u_ctrl_label = self.make_value_label(status_card, "U Ctrl")
        self.duty_label = self.make_value_label(status_card, "Duty Count")
        self.raw_label = self.make_value_label(status_card, "Raw Input")

        state_row = tk.Frame(status_card, bg=self.card)
        state_row.pack(fill="x", padx=18, pady=(14, 18))

        self.state_badge = tk.Label(
            state_row,
            text="WAITING",
            bg=self.yellow,
            fg="#111827",
            font=("Segoe UI", 13, "bold"),
            padx=14,
            pady=6
        )
        self.state_badge.pack(side="left")

        self.state_desc = tk.Label(
            state_row,
            text="Connect 후 Read 또는 RUN을 수행하세요.",
            bg=self.card,
            fg=self.subtext,
            font=("Segoe UI", 10)
        )
        self.state_desc.pack(side="left", padx=12)

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
        control_card = self.make_card(right, "Heater Command / RxPDO")
        control_card.pack(fill="x", pady=(0, 14))

        form = tk.Frame(control_card, bg=self.card)
        form.pack(fill="x", padx=16, pady=(8, 12))

        self.target_entry = self.make_entry(form, "Target Temp [°C]", "80.0")
        self.kp_entry = self.make_entry(form, "Kp", "0.03")
        self.ki_entry = self.make_entry(form, "Ki", "0.0001")

        btn_row1 = tk.Frame(form, bg=self.card)
        btn_row1.pack(fill="x", pady=(4, 4))

        self.reset_btn = self.make_button(btn_row1, "RESET", self.reset_heater, self.purple, width=10)
        self.reset_btn.pack(side="left", expand=True, fill="x", padx=(0, 4))

        self.run_btn = self.make_button(btn_row1, "RUN", self.run_heater, self.green, width=10)
        self.run_btn.pack(side="left", expand=True, fill="x", padx=4)

        self.stop_btn = self.make_button(btn_row1, "STOP", self.stop_heater, self.red, width=10)
        self.stop_btn.pack(side="left", expand=True, fill="x", padx=(4, 0))

        self.clear_btn = self.make_button(form, "CLEAR ControlWord", self.clear_control, self.dark_button, width=24)
        self.clear_btn.pack(fill="x", pady=(8, 4))

        self.read_btn = self.make_button(form, "Read Now", self.read_once, self.blue, width=24)
        self.read_btn.pack(fill="x", pady=4)

        self.auto_btn = self.make_button(form, "Start Auto Monitor", self.start_auto, self.green, width=24)
        self.auto_btn.pack(fill="x", pady=(16, 4))

        self.auto_stop_btn = self.make_button(form, "Stop Auto Monitor", self.stop_auto, self.red, width=24)
        self.auto_stop_btn.pack(fill="x", pady=4)

        # Info Card
        info_card = self.make_card(right, "Mapping Info")
        info_card.pack(fill="x")

        info_text = (
            "RxPDO / Output : 14 byte\n"
            "  0: ControlWord   UINT16\n"
            "  2: TargetTempRaw UINT32\n"
            "  6: KpRaw         UINT32\n"
            " 10: KiRaw         UINT32\n\n"
            "TxPDO / Input : 20 byte\n"
            "  0: StatusWord     UINT16\n"
            "  2: State          UINT16\n"
            "  4: CurrentTempRaw UINT32\n"
            "  8: ErrorRaw       UINT32\n"
            " 12: UCtrlRaw       UINT32\n"
            " 16: DutyCnt        UINT32"
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
    # Parameter
    # =====================================================
    def get_params(self):
        try:
            target = float(self.target_entry.get())
            kp = float(self.kp_entry.get())
            ki = float(self.ki_entry.get())
        except ValueError:
            messagebox.showerror("Input Error", "Target/Kp/Ki는 숫자로 입력하세요.")
            return None

        self.last_target = target
        self.last_kp = kp
        self.last_ki = ki

        return target, kp, ki

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

            ret = self.wmx.SetDeviceName("GatewayHeaterPdoGui")
            self.log("SetDeviceName ret = {}".format(ret))

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
        self.set_state_waiting("Disconnected")

    # =====================================================
    # Output Write
    # =====================================================
    def write_output(self, control_word):
        if not self.ensure_connected():
            return False

        params = self.get_params()
        if params is None:
            return False

        target, kp, ki = params

        out_data = make_rxpdo(control_word, target, kp, ki)
        ret = self.io.SetOutBytes(0x00, RX_PDO_SIZE, out_data)

        self.last_control_word = control_word

        if not is_success(ret):
            self.log("[ERROR] SetOutBytes failed. ret={}".format(ret))
            self.set_state_fault("SetOutBytes failed")
            return False

        self.log(
            "SetOutBytes ret={}, CW=0x{:04X}, Target={:.2f}, Kp={}, Ki={}, data={}".format(
                ret,
                control_word,
                target,
                kp,
                ki,
                ["0x{:02X}".format(x) for x in out_data]
            )
        )

        return True

    def reset_heater(self):
        if self.write_output(0x0004):
            self.root.after(80, self.clear_control)
            self.root.after(180, self.read_once)

    def run_heater(self):
        if self.write_output(0x0001):
            self.root.after(120, self.read_once)

    def stop_heater(self):
        if self.write_output(0x0002):
            self.root.after(80, self.clear_control)
            self.root.after(180, self.read_once)

    def clear_control(self):
        if self.write_output(0x0000):
            self.root.after(120, self.read_once)

    # =====================================================
    # Input Read
    # =====================================================
    def read_once(self):
        if not self.ensure_connected():
            return

        try:
            ret, in_data = self.io.GetInBytes(0x00, TX_PDO_SIZE)
            if not is_success(ret):
                self.log("[ERROR] GetInBytes failed. ret={}".format(ret))
                self.set_state_fault("GetInBytes failed")
                return

            in_data = list(in_data[:TX_PDO_SIZE])
            status = parse_txpdo(in_data)

            self.update_status_view(status, in_data)

        except Exception:
            err = traceback.format_exc()
            self.log(err)
            messagebox.showerror("Exception", err)

    def update_status_view(self, status, raw_bytes):
        self.status_word_label.config(text="0x{:04X}".format(status["status_word"]))
        self.state_label.config(
            text="{} ({})".format(status["state"], status["state_name"])
        )
        self.temp_label.config(
            text="{:.2f} °C   raw=0x{:08X}".format(status["current_t"], status["current_raw"])
        )
        self.error_label.config(
            text="{:.2f} °C   raw=0x{:08X}".format(status["error"], status["error_raw"])
        )
        self.u_ctrl_label.config(
            text="{:.3f}   raw=0x{:08X}".format(status["u_ctrl"], status["u_raw"])
        )
        self.duty_label.config(
            text="{} / 100000".format(status["duty"])
        )
        self.raw_label.config(
            text=" ".join("{:02X}".format(x) for x in raw_bytes)
        )

        state = status["state"]

        if state == 0:
            self.set_state_idle("IDLE")
        elif state == 1:
            self.set_state_run("RUN")
        elif state == 2:
            self.set_state_stable("STABLE")
        elif state == 3:
            self.set_state_fault("FAULT")
        else:
            self.set_state_waiting("UNKNOWN")

    # =====================================================
    # Auto monitor
    # =====================================================
    def start_auto(self):
        if not self.ensure_connected():
            return

        if self.auto_running:
            return

        self.auto_running = True
        self.log("[INFO] Auto monitor started.")
        self.auto_loop()

    def stop_auto(self):
        self.auto_running = False
        self.log("[INFO] Auto monitor stopped.")

    def auto_loop(self):
        if not self.auto_running:
            return

        # RUN 상태라면 RUN command 유지. STOP/IDLE이어도 마지막 ControlWord를 유지하지 않고 Read만 수행.
        self.read_once()

        self.root.after(300, self.auto_loop)

    # =====================================================
    # State badge
    # =====================================================
    def set_state_idle(self, desc):
        self.state_badge.config(text="IDLE", bg=self.yellow, fg="#111827")
        self.state_desc.config(text=desc, fg=self.text)

    def set_state_run(self, desc):
        self.state_badge.config(text="RUN", bg=self.green, fg="#052E16")
        self.state_desc.config(text=desc, fg=self.text)

    def set_state_stable(self, desc):
        self.state_badge.config(text="STABLE", bg=self.blue, fg="white")
        self.state_desc.config(text=desc, fg=self.text)

    def set_state_fault(self, desc):
        self.state_badge.config(text="FAULT", bg=self.red, fg="white")
        self.state_desc.config(text=desc, fg=self.text)

    def set_state_waiting(self, desc):
        self.state_badge.config(text="WAITING", bg=self.yellow, fg="#111827")
        self.state_desc.config(text=desc, fg=self.subtext)

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
    app = GatewayHeaterPdoGui(root)
    root.mainloop()