# -*- coding: utf-8 -*-
"""
KD240 EtherCAT Heater PI Controller GUI

Target environment:
- Windows
- Python 3.6
- Movensys WMX3 Python API
- Tkinter + Matplotlib(TkAgg)
- RxPDO: 14 bytes
- TxPDO: 20 bytes

Run:
    C:/Users/abc/AppData/Local/Programs/Python/Python36/python.exe kd240_heater_ethercat_gui_tk.py

Required:
    pip install matplotlib
"""

import os
import sys
import csv
import time
import struct
import datetime
import traceback
import tkinter as tk
from tkinter import messagebox, filedialog

# =========================================================
# WMX Python API path setup
# Keep this before importing WMX3ApiPython.
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

from WMX3ApiPython import *  # noqa

# =========================================================
# Matplotlib Tk backend
# =========================================================
import matplotlib

matplotlib.use("TkAgg")

from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg

# =========================================================
# Constants
# =========================================================
INFINITE = int(0xFFFFFFFF)

RX_PDO_SIZE = 14
TX_PDO_SIZE = 20

OUTPUT_ADDR = 0x00
INPUT_ADDR = 0x00

CTRL_CLEAR = 0x0000
CTRL_RUN = 0x0001
CTRL_STOP_PULSE = 0x0002
CTRL_RESET_PULSE = 0x0004

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
    Offset 2   TargetTempRaw UINT32, IEEE754 float raw
    Offset 6   KpRaw         UINT32, IEEE754 float raw
    Offset 10  KiRaw         UINT32, IEEE754 float raw
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
    Offset 4   CurrentTempRaw UINT32, IEEE754 float raw
    Offset 8   ErrorRaw       UINT32, IEEE754 float raw
    Offset 12  UCtrlRaw       UINT32, IEEE754 float raw
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


def bytes_to_hex(data):
    return " ".join("{:02X}".format(x) for x in data)


def now_timestamp():
    return datetime.datetime.now().strftime("%Y%m%d_%H%M%S")


class KD240HeaterGui:
    def __init__(self, root):
        self.root = root
        self.root.title("KD240 EtherCAT Virtual Heater PI Controller")
        self.root.geometry("1380x860")
        self.root.minsize(1240, 780)

        # ------------------------------
        # Theme
        # ------------------------------
        self.bg = "#0F172A"
        self.panel = "#111827"
        self.panel2 = "#1E293B"
        self.panel3 = "#020617"
        self.border = "#334155"
        self.text = "#E5E7EB"
        self.subtext = "#94A3B8"
        self.green = "#22C55E"
        self.red = "#EF4444"
        self.yellow = "#F59E0B"
        self.blue = "#3B82F6"
        self.purple = "#8B5CF6"
        self.dark_button = "#334155"

        self.root.configure(bg=self.bg)

        # ------------------------------
        # WMX state
        # ------------------------------
        self.wmx = None
        self.io = None
        self.connected = False

        # ------------------------------
        # Runtime state
        # ------------------------------
        self.polling = False
        self.logging_enabled = False
        self.test_start_time = None
        self.log_rows = []

        self.last_control_word = CTRL_CLEAR
        self.last_status = None

        self.last_target = 80.0
        self.last_kp = 0.03
        self.last_ki = 0.0001

        self.after_id_poll = None
        self.after_id_auto_stop = None

        self.build_ui()
        self.root.protocol("WM_DELETE_WINDOW", self.on_close)

        self.set_connection_state(False)
        self.set_state_badge("WAITING", "Connect 후 Read Once 또는 RUN을 수행하세요.", self.yellow)

    # =====================================================
    # UI basic helper
    # =====================================================
    def make_card(self, parent, title):
        frame = tk.Frame(parent, bg=self.panel, highlightbackground=self.border, highlightthickness=1)
        title_label = tk.Label(
            frame,
            text=title,
            bg=self.panel,
            fg=self.subtext,
            font=("Segoe UI", 10, "bold")
        )
        title_label.pack(anchor="w", padx=16, pady=(12, 4))
        return frame

    def make_button(self, parent, text, command, bg=None, width=14):
        if bg is None:
            bg = self.blue

        btn = tk.Button(
            parent,
            text=text,
            command=command,
            bg=bg,
            fg="white",
            activebackground=bg,
            activeforeground="white",
            relief="flat",
            bd=0,
            font=("Segoe UI", 10, "bold"),
            width=width,
            height=2,
            cursor="hand2"
        )
        return btn

    def make_small_button(self, parent, text, command, bg=None, width=11):
        if bg is None:
            bg = self.dark_button

        btn = tk.Button(
            parent,
            text=text,
            command=command,
            bg=bg,
            fg="white",
            activebackground=bg,
            activeforeground="white",
            relief="flat",
            bd=0,
            font=("Segoe UI", 9, "bold"),
            width=width,
            height=1,
            cursor="hand2"
        )
        return btn

    def make_label_value(self, parent, caption, row, col, width=18):
        cell = tk.Frame(parent, bg=self.panel)
        cell.grid(row=row, column=col, sticky="nsew", padx=6, pady=6)

        label = tk.Label(
            cell,
            text=caption,
            bg=self.panel,
            fg=self.subtext,
            font=("Segoe UI", 9, "bold"),
            anchor="w"
        )
        label.pack(fill="x")

        value = tk.Label(
            cell,
            text="-",
            bg=self.panel2,
            fg=self.text,
            font=("Consolas", 15, "bold"),
            anchor="center",
            width=width,
            padx=8,
            pady=8
        )
        value.pack(fill="x", pady=(4, 0))

        return value

    def make_entry(self, parent, label_text, default):
        tk.Label(
            parent,
            text=label_text,
            bg=self.panel,
            fg=self.subtext,
            font=("Segoe UI", 9, "bold")
        ).pack(anchor="w")

        entry = tk.Entry(
            parent,
            bg=self.panel2,
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
    # UI layout
    # =====================================================
    def build_ui(self):
        # Header
        header = tk.Frame(self.root, bg=self.bg)
        header.pack(fill="x", padx=24, pady=(18, 10))

        title = tk.Label(
            header,
            text="KD240 EtherCAT Virtual Heater PI Controller",
            bg=self.bg,
            fg=self.text,
            font=("Segoe UI", 22, "bold")
        )
        title.pack(side="left", anchor="w")

        self.connection_badge = tk.Label(
            header,
            text="DISCONNECTED",
            bg=self.red,
            fg="white",
            font=("Segoe UI", 11, "bold"),
            padx=14,
            pady=6
        )
        self.connection_badge.pack(side="right", padx=(10, 0))

        subtitle = tk.Label(
            self.root,
            text="Movensys WMX I/O Space | RxPDO 14 byte / TxPDO 20 byte | Target/Kp/Ki -> KD240 PL heater_core",
            bg=self.bg,
            fg=self.subtext,
            font=("Segoe UI", 10)
        )
        subtitle.pack(fill="x", padx=24, pady=(0, 8), anchor="w")

        # Main two column layout
        main = tk.Frame(self.root, bg=self.bg)
        main.pack(fill="both", expand=True, padx=24, pady=10)

        left = tk.Frame(main, bg=self.bg)
        left.pack(side="left", fill="both", expand=True)

        right = tk.Frame(main, bg=self.bg, width=390)
        right.pack(side="right", fill="y", padx=(16, 0))

        # Connection card
        conn_card = self.make_card(left, "Connection / Control")
        conn_card.pack(fill="x", pady=(0, 12))

        conn_body = tk.Frame(conn_card, bg=self.panel)
        conn_body.pack(fill="x", padx=16, pady=(6, 16))

        self.btn_connect = self.make_button(conn_body, "Connect", self.connect, self.green, width=12)
        self.btn_disconnect = self.make_button(conn_body, "Disconnect", self.disconnect, self.dark_button, width=12)
        self.btn_read_once = self.make_button(conn_body, "Read Once", self.read_once, self.blue, width=12)

        self.btn_connect.pack(side="left", padx=(0, 8))
        self.btn_disconnect.pack(side="left", padx=8)
        self.btn_read_once.pack(side="left", padx=8)

        self.conn_text = tk.Label(
            conn_body,
            text="Disconnected",
            bg=self.panel,
            fg=self.subtext,
            font=("Segoe UI", 11, "bold")
        )
        self.conn_text.pack(side="left", padx=18)

        self.btn_clear_log = self.make_small_button(conn_body, "Clear Log", self.clear_log, self.dark_button, width=10)
        self.btn_clear_log.pack(side="right", padx=(8, 0))

        # Status card
        status_card = self.make_card(left, "Live Status / TxPDO")
        status_card.pack(fill="x", pady=(0, 12))

        status_body = tk.Frame(status_card, bg=self.panel)
        status_body.pack(fill="x", padx=12, pady=(6, 14))

        for c in range(6):
            status_body.grid_columnconfigure(c, weight=1)

        self.lbl_state = self.make_label_value(status_body, "State", 0, 0)
        self.lbl_status_word = self.make_label_value(status_body, "StatusWord", 0, 1)
        self.lbl_current_t = self.make_label_value(status_body, "Current Temp", 0, 2)
        self.lbl_error = self.make_label_value(status_body, "Error", 0, 3)
        self.lbl_u_ctrl = self.make_label_value(status_body, "U Ctrl", 0, 4)
        self.lbl_duty = self.make_label_value(status_body, "Duty", 0, 5)

        badge_row = tk.Frame(status_card, bg=self.panel)
        badge_row.pack(fill="x", padx=18, pady=(0, 16))

        self.state_badge = tk.Label(
            badge_row,
            text="WAITING",
            bg=self.yellow,
            fg="#111827",
            font=("Segoe UI", 13, "bold"),
            padx=14,
            pady=6
        )
        self.state_badge.pack(side="left")

        self.state_desc = tk.Label(
            badge_row,
            text="-",
            bg=self.panel,
            fg=self.subtext,
            font=("Segoe UI", 10)
        )
        self.state_desc.pack(side="left", padx=12)

        # Graph card
        plot_card = self.make_card(left, "Live Trend")
        plot_card.pack(fill="both", expand=True)

        plot_body = tk.Frame(plot_card, bg=self.panel)
        plot_body.pack(fill="both", expand=True, padx=16, pady=(6, 16))

        self.figure = Figure(figsize=(8.5, 4.2), dpi=100, facecolor=self.panel)
        self.ax = self.figure.add_subplot(111)
        self.ax.set_facecolor("#F8FAFC")
        self.ax.grid(True, alpha=0.25)
        self.ax.set_xlabel("Time [s]")
        self.ax.set_ylabel("Temperature [C] / Duty [%] / U [%]")

        self.line_target, = self.ax.plot([], [], label="Target Temp", color="#DC2626", linestyle="--", linewidth=2.4)
        self.line_temp, = self.ax.plot([], [], label="Current Temp", color="#2563EB", linewidth=2.4)
        self.line_duty, = self.ax.plot([], [], label="Duty [%]", color="#16A34A", linewidth=2.0)
        self.line_u, = self.ax.plot([], [], label="U Ctrl [%]", color="#7C3AED", linewidth=1.8)

        self.ax.legend(loc="upper left")
        self.figure.tight_layout()

        self.canvas = FigureCanvasTkAgg(self.figure, master=plot_body)
        self.canvas.get_tk_widget().pack(fill="both", expand=True)

        # Right parameter card
        param_card = self.make_card(right, "Heater Command / RxPDO")
        param_card.pack(fill="x", pady=(0, 12))

        form = tk.Frame(param_card, bg=self.panel)
        form.pack(fill="x", padx=16, pady=(8, 14))

        self.entry_target = self.make_entry(form, "Target Temp [C]", "80.0")
        self.entry_kp = self.make_entry(form, "Kp", "0.03")
        self.entry_ki = self.make_entry(form, "Ki", "0.0001")
        self.entry_duration = self.make_entry(form, "Auto Test Duration [s]", "40")

        cmd_grid = tk.Frame(form, bg=self.panel)
        cmd_grid.pack(fill="x", pady=(4, 0))

        self.btn_reset = self.make_button(cmd_grid, "RESET", self.reset_heater, self.purple, width=10)
        self.btn_run = self.make_button(cmd_grid, "RUN", self.run_heater, self.green, width=10)
        self.btn_stop = self.make_button(cmd_grid, "STOP", self.stop_heater, self.red, width=10)

        self.btn_reset.grid(row=0, column=0, sticky="ew", padx=(0, 4), pady=4)
        self.btn_run.grid(row=0, column=1, sticky="ew", padx=4, pady=4)
        self.btn_stop.grid(row=0, column=2, sticky="ew", padx=(4, 0), pady=4)

        cmd_grid.grid_columnconfigure(0, weight=1)
        cmd_grid.grid_columnconfigure(1, weight=1)
        cmd_grid.grid_columnconfigure(2, weight=1)

        self.btn_write = self.make_button(form, "Write Params", self.write_params, self.blue, width=28)
        self.btn_clear = self.make_button(form, "CLEAR ControlWord", self.clear_control, self.dark_button, width=28)
        self.btn_auto = self.make_button(form, "Start Auto Test", self.start_auto_test, self.green, width=28)
        self.btn_auto_stop = self.make_button(form, "Stop Auto Test", self.stop_auto_test, self.red, width=28)

        self.btn_write.pack(fill="x", pady=(10, 4))
        self.btn_clear.pack(fill="x", pady=4)
        self.btn_auto.pack(fill="x", pady=(14, 4))
        self.btn_auto_stop.pack(fill="x", pady=4)

        # Result card
        result_card = self.make_card(right, "Test Result")
        result_card.pack(fill="x", pady=(0, 12))

        result_body = tk.Frame(result_card, bg=self.panel)
        result_body.pack(fill="x", padx=16, pady=(8, 16))

        self.result_badge = tk.Label(
            result_body,
            text="READY",
            bg=self.dark_button,
            fg="white",
            font=("Segoe UI", 16, "bold"),
            padx=14,
            pady=10
        )
        self.result_badge.pack(fill="x", pady=(0, 10))

        self.lbl_metrics = tk.Label(
            result_body,
            text="No analysis yet.",
            bg=self.panel,
            fg=self.subtext,
            justify="left",
            font=("Consolas", 9)
        )
        self.lbl_metrics.pack(fill="x")

        action_row = tk.Frame(result_body, bg=self.panel)
        action_row.pack(fill="x", pady=(12, 0))

        self.btn_save_csv = self.make_small_button(action_row, "Save CSV", self.save_csv, self.dark_button, width=11)
        self.btn_save_png = self.make_small_button(action_row, "Save PNG", self.save_png, self.dark_button, width=11)
        self.btn_analyze = self.make_small_button(action_row, "Analyze", self.analyze, self.blue, width=11)
        self.btn_clear_plot = self.make_small_button(action_row, "Clear Plot", self.clear_test_data, self.dark_button, width=11)

        self.btn_save_csv.grid(row=0, column=0, sticky="ew", padx=(0, 4), pady=4)
        self.btn_save_png.grid(row=0, column=1, sticky="ew", padx=4, pady=4)
        self.btn_analyze.grid(row=1, column=0, sticky="ew", padx=(0, 4), pady=4)
        self.btn_clear_plot.grid(row=1, column=1, sticky="ew", padx=4, pady=4)

        action_row.grid_columnconfigure(0, weight=1)
        action_row.grid_columnconfigure(1, weight=1)

        # Mapping card
        mapping_card = self.make_card(right, "PDO Mapping")
        mapping_card.pack(fill="x", pady=(0, 12))

        mapping_text = (
            "RxPDO / Output : 14 byte\n"
            "  0 : ControlWord   UINT16\n"
            "  2 : TargetTempRaw UINT32\n"
            "  6 : KpRaw         UINT32\n"
            " 10 : KiRaw         UINT32\n\n"
            "TxPDO / Input : 20 byte\n"
            "  0 : StatusWord     UINT16\n"
            "  2 : State          UINT16\n"
            "  4 : CurrentTempRaw UINT32\n"
            "  8 : ErrorRaw       UINT32\n"
            " 12 : UCtrlRaw       UINT32\n"
            " 16 : DutyCnt        UINT32"
        )

        self.mapping_label = tk.Label(
            mapping_card,
            text=mapping_text,
            bg=self.panel,
            fg=self.subtext,
            justify="left",
            font=("Consolas", 9)
        )
        self.mapping_label.pack(anchor="w", padx=16, pady=(6, 16))

        # Log card
        log_card = self.make_card(right, "Log")
        log_card.pack(fill="both", expand=True)

        self.log_text = tk.Text(
            log_card,
            height=10,
            bg=self.panel3,
            fg="#CBD5E1",
            insertbackground="white",
            relief="flat",
            bd=0,
            font=("Consolas", 9)
        )
        self.log_text.pack(fill="both", expand=True, padx=16, pady=(6, 16))

    # =====================================================
    # Parameter
    # =====================================================
    def get_params(self):
        try:
            target = float(self.entry_target.get())
            kp = float(self.entry_kp.get())
            ki = float(self.entry_ki.get())
        except ValueError:
            messagebox.showerror("Input Error", "Target/Kp/Ki는 숫자로 입력하세요.")
            return None

        self.last_target = target
        self.last_kp = kp
        self.last_ki = ki

        return target, kp, ki

    def get_duration_sec(self):
        try:
            duration = float(self.entry_duration.get())
        except ValueError:
            messagebox.showerror("Input Error", "Auto Test Duration은 숫자로 입력하세요.")
            return None

        if duration <= 0:
            messagebox.showerror("Input Error", "Auto Test Duration은 0보다 커야 합니다.")
            return None

        return duration

    # =====================================================
    # WMX connection
    # =====================================================
    def connect(self):
        if self.connected:
            self.log("[INFO] Already connected.")
            return

        try:
            self.log("[CONNECT] Create WMX3Api")
            self.wmx = WMX3Api()

            self.log("[CONNECT] CreateDevice")
            ret = self.wmx.CreateDevice(
                "C:\\Program Files\\SoftServo\\WMX3\\",
                DeviceType.DeviceTypeLowPriority,
                INFINITE
            )
            self.log("CreateDevice ret = {}".format(ret))

            if not is_success(ret):
                messagebox.showerror("CreateDevice Error", "CreateDevice failed. ret={}".format(ret))
                self.wmx = None
                return

            ret = self.wmx.SetDeviceName("KD240HeaterGui")
            self.log("SetDeviceName ret = {}".format(ret))

            self.io = Io(self.wmx)
            self.connected = True
            self.set_connection_state(True)

            self.log("[OK] WMX LowPriority Device connected.")
            self.log("[OK] Io object created.")

            self.read_once()

        except Exception:
            err = traceback.format_exc()
            self.log(err)
            messagebox.showerror("Connection Exception", err)
            self.disconnect()

    def disconnect(self):
        self.stop_polling()
        self.stop_auto_timer()

        if self.wmx is not None:
            try:
                self.wmx.CloseDevice()
                self.log("[OK] CloseDevice")
            except Exception:
                self.log("[WARN] CloseDevice failed.")

        self.wmx = None
        self.io = None
        self.connected = False
        self.set_connection_state(False)
        self.set_state_badge("WAITING", "Disconnected", self.yellow)

    def is_connected(self):
        return self.connected and self.io is not None

    def ensure_connected(self):
        if not self.is_connected():
            messagebox.showwarning("Not Connected", "먼저 Connect를 누르세요.")
            self.log("[WARN] Not connected.")
            return False
        return True

    def set_connection_state(self, connected):
        if connected:
            self.connection_badge.config(text="CONNECTED", bg=self.green)
            self.conn_text.config(text="Connected - LowPriority Device", fg=self.green)
        else:
            self.connection_badge.config(text="DISCONNECTED", bg=self.red)
            self.conn_text.config(text="Disconnected", fg=self.subtext)

    # =====================================================
    # PDO I/O
    # =====================================================
    def write_output(self, control_word, log_tx=True):
        if not self.ensure_connected():
            return False

        params = self.get_params()
        if params is None:
            return False

        target, kp, ki = params

        out_data = make_rxpdo(control_word, target, kp, ki)

        try:
            ret = self.io.SetOutBytes(OUTPUT_ADDR, RX_PDO_SIZE, out_data)
        except Exception:
            err = traceback.format_exc()
            self.log(err)
            self.set_state_badge("FAULT", "SetOutBytes exception", self.red)
            return False

        if not is_success(ret):
            self.log("[ERROR] SetOutBytes failed. ret={}".format(ret))
            self.set_state_badge("FAULT", "SetOutBytes failed", self.red)
            return False

        self.last_control_word = control_word

        if log_tx:
            self.log(
                "TX: ret={}, CW=0x{:04X}, Target={:.3f}, Kp={:.6f}, Ki={:.8f}, bytes={}".format(
                    ret,
                    control_word,
                    target,
                    kp,
                    ki,
                    bytes_to_hex(out_data)
                )
            )

        return True

    def read_input(self, log_rx=False):
        if not self.ensure_connected():
            return None

        try:
            ret, in_data = self.io.GetInBytes(INPUT_ADDR, TX_PDO_SIZE)
        except Exception:
            err = traceback.format_exc()
            self.log(err)
            self.set_state_badge("FAULT", "GetInBytes exception", self.red)
            return None

        if not is_success(ret):
            self.log("[ERROR] GetInBytes failed. ret={}".format(ret))
            self.set_state_badge("FAULT", "GetInBytes failed", self.red)
            return None

        in_data = list(in_data[:TX_PDO_SIZE])

        try:
            status = parse_txpdo(in_data)
        except Exception:
            err = traceback.format_exc()
            self.log(err)
            self.set_state_badge("FAULT", "TxPDO parse failed", self.red)
            return None

        if log_rx:
            self.log("RX: ret={}, bytes={}".format(ret, bytes_to_hex(in_data)))
            self.log_status(status)

        self.last_status = status
        self.update_status_view(status, in_data)

        return status

    def read_once(self):
        status = self.read_input(log_rx=True)
        if status is not None:
            self.start_polling()
            self.log("[OK] Read Once success. Live polling started.")

    # =====================================================
    # Command
    # =====================================================
    def write_params(self):
        if self.write_output(self.last_control_word, log_tx=True):
            self.log("[OK] Parameters written with current ControlWord=0x{:04X}".format(self.last_control_word))

    def reset_heater(self):
        self.stop_auto_timer()
        self.logging_enabled = False
        self.clear_test_data()

        if self.write_output(CTRL_RESET_PULSE, log_tx=True):
            self.root.after(80, self.clear_control)
            self.root.after(180, self.read_once)
            self.log("[CMD] RESET pulse sent.")

    def run_heater(self):
        self.clear_test_data()

        self.logging_enabled = True
        self.test_start_time = time.time()

        if self.write_output(CTRL_RUN, log_tx=True):
            self.start_polling()
            self.log("[CMD] RUN sent. Logging started.")

    def stop_heater(self):
        self.logging_enabled = False
        self.stop_auto_timer()

        if self.write_output(CTRL_STOP_PULSE, log_tx=True):
            self.root.after(80, self.clear_control)
            self.root.after(180, self.read_once)
            self.log("[CMD] STOP pulse sent. Logging stopped.")

    def clear_control(self):
        if self.is_connected():
            self.write_output(CTRL_CLEAR, log_tx=True)

    # =====================================================
    # Polling / Auto test
    # =====================================================
    def start_polling(self):
        if self.after_id_poll is not None:
            return

        self.polling = True
        self.after_id_poll = self.root.after(200, self.poll_loop)

    def stop_polling(self):
        self.polling = False
        if self.after_id_poll is not None:
            try:
                self.root.after_cancel(self.after_id_poll)
            except Exception:
                pass
            self.after_id_poll = None

    def poll_loop(self):
        self.after_id_poll = None

        if not self.polling or not self.is_connected():
            return

        status = self.read_input(log_rx=False)

        if status is not None and self.logging_enabled:
            self.append_log_sample(status)

        self.after_id_poll = self.root.after(200, self.poll_loop)

    def start_auto_test(self):
        if not self.ensure_connected():
            return

        duration = self.get_duration_sec()
        if duration is None:
            return

        self.clear_test_data()
        self.logging_enabled = False

        self.log("[AUTO] Start sequence: RESET -> CLEAR -> RUN")

        if not self.write_output(CTRL_RESET_PULSE, log_tx=True):
            return

        self.root.after(80, lambda: self.write_output(CTRL_CLEAR, log_tx=True))
        self.root.after(180, self._auto_run)

        self.stop_auto_timer()
        self.after_id_auto_stop = self.root.after(int((duration + 0.18) * 1000), self._auto_stop)

    def _auto_run(self):
        self.logging_enabled = True
        self.test_start_time = time.time()

        if self.write_output(CTRL_RUN, log_tx=True):
            self.start_polling()
            self.log("[AUTO] RUN started.")

    def _auto_stop(self):
        self.after_id_auto_stop = None
        self.logging_enabled = False

        self.write_output(CTRL_STOP_PULSE, log_tx=True)
        self.root.after(80, lambda: self.write_output(CTRL_CLEAR, log_tx=True))
        self.root.after(180, self.read_once)

        self.log("[AUTO] STOP sent.")
        self.save_csv(auto=True)
        self.analyze(auto=True)
        self.save_png(auto=True)

    def stop_auto_test(self):
        self.stop_auto_timer()
        self.logging_enabled = False
        self.log("[AUTO] Auto test timer stopped.")

    def stop_auto_timer(self):
        if self.after_id_auto_stop is not None:
            try:
                self.root.after_cancel(self.after_id_auto_stop)
            except Exception:
                pass
            self.after_id_auto_stop = None

    # =====================================================
    # Status / Plot
    # =====================================================
    def update_status_view(self, status, raw_bytes):
        state = status["state"]
        state_name = status["state_name"]

        u_percent = status["u_ctrl"] * 100.0
        duty_percent = float(status["duty"]) / 1000.0

        self.lbl_state.config(text="{} ({})".format(state_name, state))
        self.lbl_status_word.config(text="0x{:04X}".format(status["status_word"]))
        self.lbl_current_t.config(text="{:.3f} C".format(status["current_t"]))
        self.lbl_error.config(text="{:.3f} C".format(status["error"]))
        self.lbl_u_ctrl.config(text="{:.3f} ({:.1f}%)".format(status["u_ctrl"], u_percent))
        self.lbl_duty.config(text="{:.1f}% ({})".format(duty_percent, status["duty"]))

        if state == 0:
            self.set_state_badge("IDLE", "Heater stopped / idle.", self.yellow)
        elif state == 1:
            self.set_state_badge("RUN", "PI control running.", self.green)
        elif state == 2:
            self.set_state_badge("STABLE", "Temperature settled.", self.blue)
        elif state == 3:
            self.set_state_badge("FAULT", "Fault state detected.", self.red)
        else:
            self.set_state_badge("UNKNOWN", "Unknown state.", self.yellow)

    def set_state_badge(self, text, desc, color):
        fg = "white"
        if color == self.yellow:
            fg = "#111827"

        self.state_badge.config(text=text, bg=color, fg=fg)
        self.state_desc.config(text=desc, fg=self.text)

    def log_status(self, status):
        self.log(
            "Status: SW=0x{:04X}, STATE={}({}), T={:.3f}, ERR={:.3f}, U={:.3f}, DUTY={}".format(
                status["status_word"],
                status["state"],
                status["state_name"],
                status["current_t"],
                status["error"],
                status["u_ctrl"],
                status["duty"],
            )
        )

    def append_log_sample(self, status):
        if self.test_start_time is None:
            self.test_start_time = time.time()

        t = time.time() - self.test_start_time

        target = self.last_target
        u_percent = status["u_ctrl"] * 100.0
        duty_percent = float(status["duty"]) / 1000.0

        row = {
            "time_sec": t,
            "target_temp": target,
            "current_temp": status["current_t"],
            "error": status["error"],
            "u_ctrl": status["u_ctrl"],
            "u_percent": u_percent,
            "duty_cnt": status["duty"],
            "duty_percent": duty_percent,
            "state": status["state"],
            "state_name": status["state_name"],
            "status_word": status["status_word"],
        }

        self.log_rows.append(row)
        self.update_plot()

    def update_plot(self):
        if not self.log_rows:
            self.line_target.set_data([], [])
            self.line_temp.set_data([], [])
            self.line_duty.set_data([], [])
            self.line_u.set_data([], [])
            self.canvas.draw_idle()
            return

        times = [r["time_sec"] for r in self.log_rows]
        targets = [r["target_temp"] for r in self.log_rows]
        temps = [r["current_temp"] for r in self.log_rows]
        duties = [r["duty_percent"] for r in self.log_rows]
        us = [r["u_percent"] for r in self.log_rows]

        self.line_target.set_data(times, targets)
        self.line_temp.set_data(times, temps)
        self.line_duty.set_data(times, duties)
        self.line_u.set_data(times, us)

        max_x = max(10.0, times[-1])
        all_y = targets + temps + duties + us
        min_y = min(all_y)
        max_y = max(all_y)

        y_margin = max(5.0, (max_y - min_y) * 0.12)

        self.ax.set_xlim(0, max_x)
        self.ax.set_ylim(min_y - y_margin, max_y + y_margin)
        self.canvas.draw_idle()

    def clear_test_data(self):
        self.log_rows = []
        self.test_start_time = None
        self.result_badge.config(text="READY", bg=self.dark_button, fg="white")
        self.lbl_metrics.config(text="No analysis yet.")
        self.update_plot()

    # =====================================================
    # Save / Analyze
    # =====================================================
    def save_csv(self, auto=False):
        if not self.log_rows:
            if not auto:
                messagebox.showinfo("Save CSV", "저장할 로그 데이터가 없습니다.")
            self.log("[INFO] No log data to save.")
            return None

        default_name = "kd240_heater_log_{}.csv".format(now_timestamp())

        if auto:
            filename = default_name
        else:
            filename = filedialog.asksaveasfilename(
                defaultextension=".csv",
                initialfile=default_name,
                filetypes=[("CSV files", "*.csv"), ("All files", "*.*")]
            )
            if not filename:
                return None

        with open(filename, "w", newline="", encoding="utf-8") as f:
            writer = csv.writer(f)
            writer.writerow([
                "time_sec",
                "target_temp",
                "current_temp",
                "error",
                "u_ctrl",
                "u_percent",
                "duty_cnt",
                "duty_percent",
                "state",
                "state_name",
                "status_word",
            ])

            for r in self.log_rows:
                writer.writerow([
                    r["time_sec"],
                    r["target_temp"],
                    r["current_temp"],
                    r["error"],
                    r["u_ctrl"],
                    r["u_percent"],
                    r["duty_cnt"],
                    r["duty_percent"],
                    r["state"],
                    r["state_name"],
                    r["status_word"],
                ])

        self.log("[SAVE] CSV saved: {}".format(os.path.abspath(filename)))
        return filename

    def save_png(self, auto=False):
        if not self.log_rows:
            if not auto:
                messagebox.showinfo("Save PNG", "저장할 그래프 데이터가 없습니다.")
            self.log("[INFO] No graph data to save.")
            return None

        default_name = "kd240_heater_result_{}.png".format(now_timestamp())

        if auto:
            filename = default_name
        else:
            filename = filedialog.asksaveasfilename(
                defaultextension=".png",
                initialfile=default_name,
                filetypes=[("PNG files", "*.png"), ("All files", "*.*")]
            )
            if not filename:
                return None

        self.figure.savefig(filename, dpi=150, facecolor=self.figure.get_facecolor())
        self.log("[SAVE] PNG saved: {}".format(os.path.abspath(filename)))
        return filename

    def analyze(self, auto=False):
        if not self.log_rows:
            if not auto:
                messagebox.showinfo("Analyze", "분석할 로그 데이터가 없습니다.")
            self.log("[INFO] No log data to analyze.")
            return None

        target = self.last_target
        temps = [r["current_temp"] for r in self.log_rows]
        times = [r["time_sec"] for r in self.log_rows]
        states = [r["state"] for r in self.log_rows]

        max_temp = max(temps)
        overshoot = max(0.0, max_temp - target)

        fault_occurred = any(s == 3 for s in states)

        end_time = times[-1]
        last_5s_rows = [r for r in self.log_rows if r["time_sec"] >= end_time - 5.0]

        if last_5s_rows:
            final_error_avg = sum(abs(r["target_temp"] - r["current_temp"]) for r in last_5s_rows) / len(last_5s_rows)
        else:
            final_error_avg = abs(target - temps[-1])

        settling_time = None
        for i in range(len(self.log_rows)):
            remain = self.log_rows[i:]
            if all(abs(r["target_temp"] - r["current_temp"]) <= 1.0 for r in remain):
                settling_time = self.log_rows[i]["time_sec"]
                break

        overshoot_pass = overshoot <= 5.0
        settling_pass = settling_time is not None and settling_time <= 30.0
        final_error_pass = final_error_avg <= 1.0
        fault_pass = not fault_occurred

        final_pass = overshoot_pass and settling_pass and final_error_pass and fault_pass
        result = "PASS" if final_pass else "FAIL"

        result_color = self.green if final_pass else self.red
        self.result_badge.config(text=result, bg=result_color, fg="white")

        if settling_time is None:
            settling_text = "Not settled"
        else:
            settling_text = "{:.3f} s".format(settling_time)

        metrics = (
            "Target Temp     : {:.3f} C\n"
            "Max Temp        : {:.3f} C\n"
            "Overshoot       : {:.3f} C  {}\n"
            "Settling Time   : {}  {}\n"
            "Final Error Avg : {:.3f} C  {}\n"
            "Fault Occurred  : {}  {}\n"
            "Final Result    : {}"
        ).format(
            target,
            max_temp,
            overshoot,
            "PASS" if overshoot_pass else "FAIL",
            settling_text,
            "PASS" if settling_pass else "FAIL",
            final_error_avg,
            "PASS" if final_error_pass else "FAIL",
            "Yes" if fault_occurred else "No",
            "PASS" if fault_pass else "FAIL",
            result
        )

        self.lbl_metrics.config(text=metrics)

        self.log("")
        self.log("===== Test Result =====")
        for line in metrics.splitlines():
            self.log(line)

        return {
            "result": result,
            "overshoot": overshoot,
            "settling_time": settling_time,
            "final_error_avg": final_error_avg,
            "fault_occurred": fault_occurred,
        }

    # =====================================================
    # Log / close
    # =====================================================
    def log(self, msg):
        timestamp = datetime.datetime.now().strftime("%H:%M:%S")
        self.log_text.insert("end", "[{}] {}\n".format(timestamp, msg))
        self.log_text.see("end")

    def clear_log(self):
        self.log_text.delete("1.0", "end")

    def on_close(self):
        self.disconnect()
        self.root.destroy()


def main():
    root = tk.Tk()
    KD240HeaterGui(root)
    root.mainloop()


if __name__ == "__main__":
    main()
