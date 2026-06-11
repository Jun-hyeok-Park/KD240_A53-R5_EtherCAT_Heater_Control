# -*- coding: utf-8 -*-
"""
KD240 EtherCAT Virtual Heater PI Controller GUI v3.6 - Recipe Save/Load

v3.0 scope
- Keep stable Tkinter + WMX3 structure from v2.1
- Add Auto Tune Start command through RxPDO ControlWord bit 0x0008
- Add Apply Tuned Gain and Run command through RxPDO ControlWord bit 0x0010
- Decode packed State: low byte = heater_state, high byte = auto_tune_state
- Show Auto Tune phase in the live status panel
- Support optional automatic Apply Tuned Gain after Auto Tune DONE
- Add visible Last Sent Target/Kp/Ki and active gain-source status
- Decode tuned Auto Tune result values from expanded 48-byte TxPDO
- Keep Save CSV / Save PNG options for automatic save on STOP
- Rename U Ctrl to Controller Output for clearer operator-facing terminology

Target environment
- Windows
- Python 3.6
- Movensys WMX3 Python API
- Tkinter + Matplotlib(TkAgg)
"""

import os
import sys
import csv
import json
import time
import struct
import datetime
import traceback
import tkinter as tk
from tkinter import ttk, messagebox, filedialog

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
# EtherCAT PDO constants
# =========================================================
INFINITE = int(0xFFFFFFFF)

RX_PDO_SIZE = 14
TX_PDO_SIZE = 48

OUTPUT_ADDR = 0x00
INPUT_ADDR = 0x00

CTRL_CLEAR = 0x0000
CTRL_RUN = 0x0001
CTRL_STOP_PULSE = 0x0002
CTRL_RESET_PULSE = 0x0004
CTRL_AUTO_TUNE_START = 0x0008
CTRL_APPLY_TUNED_GAIN = 0x0010

HEATER_STATE_NAME = {
    0: "IDLE",
    1: "RUN",
    2: "STABLE",
    3: "FAULT",
    4: "AUTO_TUNE",
}

AUTO_TUNE_STATE_NAME = {
    0: "IDLE",
    1: "STABILIZE",
    2: "STEP_TEST",
    3: "CALCULATE",
    4: "DONE",
    5: "FAIL",
    6: "ABORT",
}

# StatusWord bits from A53 PDO bridge
STATUS_RUN = 0x0001
STATUS_STABLE = 0x0002
STATUS_FAULT = 0x0004
STATUS_AUTO_TUNE = 0x0008
STATUS_AUTO_TUNE_DONE = 0x0010
STATUS_AUTO_TUNE_FAIL_ABORT = 0x0020
STATUS_TUNED_GAIN_VALID = 0x0040

# GUI defaults
DEFAULT_TARGET = 80.0
DEFAULT_KP = 0.040
DEFAULT_KI = 0.0030


# =========================================================
# Utility functions
# =========================================================
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
    TxPDO, Slave -> Master, 48 bytes

    Offset 0   StatusWord      UINT16
    Offset 2   State           UINT16
               low byte  = heater_state
               high byte = auto_tune_state
    Offset 4   CurrentTempRaw  UINT32, IEEE754 float raw
    Offset 8   ErrorRaw        UINT32, IEEE754 float raw
    Offset 12  UCtrlRaw        UINT32, IEEE754 float raw
    Offset 16  DutyCnt         UINT32
    Offset 20  TuneKRaw        UINT32, IEEE754 float raw
    Offset 24  TuneLRaw        UINT32, IEEE754 float raw
    Offset 28  TuneTRaw        UINT32, IEEE754 float raw
    Offset 32  TuneKpRaw       UINT32, IEEE754 float raw
    Offset 36  TuneKiRaw       UINT32, IEEE754 float raw
    Offset 40  TunedGainValid  UINT32
    Offset 44  AutoTuneError   UINT32
    """
    data = list(data[:TX_PDO_SIZE])

    if len(data) < TX_PDO_SIZE:
        raise ValueError("TxPDO length is too short: {} bytes".format(len(data)))

    raw = bytes(data)
    (
        status_word,
        state_packed,
        current_raw,
        error_raw,
        u_raw,
        duty,
        tune_k_raw,
        tune_l_raw,
        tune_t_raw,
        tune_kp_raw,
        tune_ki_raw,
        tuned_gain_valid,
        auto_tune_error,
    ) = struct.unpack("<HHIIIIIIIIIII", raw)

    heater_state = state_packed & 0x00FF
    auto_tune_state = (state_packed >> 8) & 0x00FF

    tune_k = u32_to_f32(tune_k_raw)
    tune_l = u32_to_f32(tune_l_raw)
    tune_t = u32_to_f32(tune_t_raw)
    tune_kp = u32_to_f32(tune_kp_raw)
    tune_ki = u32_to_f32(tune_ki_raw)

    return {
        "status_word": status_word,
        "state_packed": state_packed,
        "state": heater_state,
        "state_name": HEATER_STATE_NAME.get(heater_state, "UNKNOWN"),
        "heater_state": heater_state,
        "heater_state_name": HEATER_STATE_NAME.get(heater_state, "UNKNOWN"),
        "auto_tune_state": auto_tune_state,
        "auto_tune_state_name": AUTO_TUNE_STATE_NAME.get(auto_tune_state, "UNKNOWN"),
        "current_raw": current_raw,
        "error_raw": error_raw,
        "u_raw": u_raw,
        "duty": duty,
        "current_t": u32_to_f32(current_raw),
        "error": u32_to_f32(error_raw),
        "u_ctrl": u32_to_f32(u_raw),
        "tune_k_raw": tune_k_raw,
        "tune_l_raw": tune_l_raw,
        "tune_t_raw": tune_t_raw,
        "tune_kp_raw": tune_kp_raw,
        "tune_ki_raw": tune_ki_raw,
        "tune_k": tune_k,
        "tune_l": tune_l,
        "tune_t": tune_t,
        "tune_kp": tune_kp,
        "tune_ki": tune_ki,
        "tuned_gain_valid": int(tuned_gain_valid),
        "auto_tune_error": int(auto_tune_error),
        "auto_tune_done": (status_word & STATUS_AUTO_TUNE_DONE) != 0,
        "auto_tune_fail": (status_word & STATUS_AUTO_TUNE_FAIL_ABORT) != 0,
        "tuned_gain_valid_flag": ((status_word & STATUS_TUNED_GAIN_VALID) != 0) or (int(tuned_gain_valid) != 0),
    }

def bytes_to_hex(data):
    return " ".join("{:02X}".format(x) for x in data)


def now_timestamp():
    return datetime.datetime.now().strftime("%Y%m%d_%H%M%S")


def safe_float_text(value, digits=3):
    if value is None:
        return "-"
    try:
        return ("{:." + str(digits) + "f}").format(float(value))
    except Exception:
        return "-"


# =========================================================
# GUI class
# =========================================================
class KD240HeaterGuiV36:
    def __init__(self, root):
        self.root = root
        self.root.title("KD240 EtherCAT Virtual Heater PI Controller v3.6")
        self.root.geometry("1600x930")
        self.root.minsize(1440, 840)

        # ------------------------------
        # Theme Colors
        # ------------------------------
        self.bg = "#0F172A"
        self.panel = "#111827"
        self.panel2 = "#1E293B"
        self.panel3 = "#020617"
        self.border = "#334155"
        self.text = "#E5E7EB"
        self.subtext = "#94A3B8"
        self.muted = "#64748B"
        self.green = "#22C55E"
        self.red = "#EF4444"
        self.yellow = "#F59E0B"
        self.blue = "#3B82F6"
        self.cyan = "#06B6D4"
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
        self.event_markers = []
        self.result_rows = []
        self.test_count = 0

        self.last_control_word = CTRL_CLEAR
        self.last_status = None
        self.last_auto_tune_state = None
        self.auto_apply_sent = False

        self.last_target = DEFAULT_TARGET
        self.last_kp = DEFAULT_KP
        self.last_ki = DEFAULT_KI

        self.last_sent_target = DEFAULT_TARGET
        self.last_sent_kp = DEFAULT_KP
        self.last_sent_ki = DEFAULT_KI
        self.last_sent_control_word = CTRL_CLEAR
        self.active_gain_source = "Manual/default"
        self.tuned_gain_note = "TxPDO 48-byte 확장 모드: tune_K/L/T/Kp/Ki 표시 가능"
        self.loaded_recipe = None
        self.stable_timer_start_time = None
        self.stable_elapsed_sec = None
        self.stable_logged = False

        self.after_id_poll = None
        self.after_id_auto_stop = None

        # ------------------------------
        # Tk variables
        # ------------------------------
        self.var_show_target = tk.IntVar(value=1)
        self.var_show_current = tk.IntVar(value=1)
        self.var_show_u = tk.IntVar(value=1)
        self.var_show_duty = tk.IntVar(value=1)
        self.var_show_band = tk.IntVar(value=1)
        self.var_auto_scale = tk.IntVar(value=1)
        self.var_view_window = tk.StringVar(value="All")
        self.var_save_csv_on_stop = tk.IntVar(value=0)
        self.var_save_png_on_stop = tk.IntVar(value=0)
        self.var_auto_apply_after_done = tk.IntVar(value=1)

        self.build_ui()
        self.root.protocol("WM_DELETE_WINDOW", self.on_close)

        self.set_connection_state(False)
        self.set_state_badge("WAITING", "Connect 후 Read Once 또는 RUN을 수행하세요.", self.yellow)

    # =====================================================
    # UI helpers
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

    def make_label_value(self, parent, caption, row, col, width=18, colspan=1,
                         value_font_size=15, label_font_size=9, value_pady=8):
        cell = tk.Frame(parent, bg=self.panel)
        cell.grid(row=row, column=col, columnspan=colspan, sticky="nsew", padx=5, pady=5)

        label = tk.Label(
            cell,
            text=caption,
            bg=self.panel,
            fg=self.subtext,
            font=("Segoe UI", label_font_size, "bold"),
            anchor="w"
        )
        label.pack(fill="x")

        value = tk.Label(
            cell,
            text="-",
            bg=self.panel2,
            fg=self.text,
            font=("Consolas", value_font_size, "bold"),
            anchor="center",
            width=width,
            padx=8,
            pady=value_pady
        )
        value.pack(fill="x", pady=(3, 0))
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

    def make_check(self, parent, text, variable):
        cb = tk.Checkbutton(
            parent,
            text=text,
            variable=variable,
            command=self.update_plot,
            bg=self.panel,
            fg=self.text,
            selectcolor=self.panel2,
            activebackground=self.panel,
            activeforeground=self.text,
            font=("Segoe UI", 9),
            anchor="w"
        )
        return cb

    # =====================================================
    # UI layout
    # =====================================================
    def build_ui(self):
        self.configure_ttk_style()

        header = tk.Frame(self.root, bg=self.bg)
        header.pack(fill="x", padx=24, pady=(16, 8))

        title = tk.Label(
            header,
            text="KD240 EtherCAT Virtual Heater PI Controller v3.6",
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
            text="WMX I/O Space | RxPDO 14 byte / TxPDO 48 byte | RUN/STOP | Auto Tune v3.6 | Tuned Gain Display",
            bg=self.bg,
            fg=self.subtext,
            font=("Segoe UI", 10)
        )
        subtitle.pack(fill="x", padx=24, pady=(0, 8), anchor="w")

        main = tk.Frame(self.root, bg=self.bg)
        main.pack(fill="both", expand=True, padx=24, pady=10)

        left = tk.Frame(main, bg=self.bg)
        left.pack(side="left", fill="both", expand=True)

        right = tk.Frame(main, bg=self.bg, width=420)
        right.pack(side="right", fill="y", padx=(16, 0))
        right.pack_propagate(False)

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

        # Current run/stable state box
        # Moved from the Live Status card to the spare area in Connection / Control.
        self.state_box = tk.Frame(
            conn_body,
            bg=self.panel2,
            highlightbackground=self.border,
            highlightthickness=1
        )
        self.state_box.pack(side="right", padx=(8, 0), ipady=2)

        self.state_badge = tk.Label(
            self.state_box,
            text="WAITING",
            bg=self.yellow,
            fg="#111827",
            font=("Segoe UI", 11, "bold"),
            width=12,
            padx=10,
            pady=6
        )
        self.state_badge.pack(side="left", padx=(6, 6), pady=5)

        self.state_desc = tk.Label(
            self.state_box,
            text="Connect 후 Read Once 또는 RUN을 수행하세요.",
            bg=self.panel2,
            fg=self.subtext,
            font=("Segoe UI", 9, "bold"),
            anchor="w",
            width=30
        )
        self.state_desc.pack(side="left", padx=(0, 8), pady=5)

        self.lbl_stable_time = tk.Label(
            self.state_box,
            text="Stable: -",
            bg=self.panel3,
            fg=self.text,
            font=("Consolas", 10, "bold"),
            anchor="center",
            width=16,
            padx=8,
            pady=6
        )
        self.lbl_stable_time.pack(side="left", padx=(0, 8), pady=5)

        # Live status card
        status_card = self.make_card(left, "Live Status / TxPDO")
        status_card.pack(fill="x", pady=(0, 12))

        status_body = tk.Frame(status_card, bg=self.panel)
        status_body.pack(fill="x", padx=12, pady=(6, 14))

        for c in range(7):
            status_body.grid_columnconfigure(c, weight=1)

        self.lbl_state = self.make_label_value(status_body, "Heater State", 0, 0, width=14, value_font_size=14)
        self.lbl_auto_state = self.make_label_value(status_body, "Auto Tune", 0, 1, width=14, value_font_size=14)
        self.lbl_status_word = self.make_label_value(status_body, "StatusWord", 0, 2, width=14, value_font_size=14)
        self.lbl_current_t = self.make_label_value(status_body, "Current Temp", 0, 3, width=14, value_font_size=14)
        self.lbl_error = self.make_label_value(status_body, "Error", 0, 4, width=14, value_font_size=14)
        self.lbl_u_ctrl = self.make_label_value(status_body, "Controller Output", 0, 5, width=14, value_font_size=14)
        self.lbl_duty = self.make_label_value(status_body, "Duty", 0, 6, width=14, value_font_size=14)

        # Tuned gain status is integrated into Live Status, but wide values use column spans
        # so K/L/T and Kp/Ki are not clipped.
        self.lbl_gain_source = self.make_label_value(status_body, "Gain Source", 1, 0, width=12,
                                                     value_font_size=14)
        self.lbl_entry_gain = self.make_label_value(status_body, "Entry / Last Sent", 1, 1, width=30,
                                                    colspan=2, value_font_size=12, label_font_size=8,
                                                    value_pady=7)
        self.lbl_tune_model = self.make_label_value(status_body, "Auto Tune Model", 1, 3, width=36,
                                                    colspan=2, value_font_size=12, label_font_size=8,
                                                    value_pady=7)
        self.lbl_tuned_gain = self.make_label_value(status_body, "Tuned Gain", 1, 5, width=36,
                                                    colspan=2, value_font_size=12, label_font_size=8,
                                                    value_pady=7)

        # Graph card
        plot_card = self.make_card(left, "Live Trend v3.6")
        plot_card.pack(fill="both", expand=True, pady=(0, 12))

        plot_option = tk.Frame(plot_card, bg=self.panel)
        plot_option.pack(fill="x", padx=16, pady=(4, 4))

        self.make_check(plot_option, "Target", self.var_show_target).pack(side="left", padx=(0, 8))
        self.make_check(plot_option, "Current", self.var_show_current).pack(side="left", padx=8)
        self.make_check(plot_option, "Controller Output", self.var_show_u).pack(side="left", padx=8)
        self.make_check(plot_option, "Duty", self.var_show_duty).pack(side="left", padx=8)
        self.make_check(plot_option, "Settling Band ±1°C", self.var_show_band).pack(side="left", padx=8)
        self.make_check(plot_option, "Auto Scale", self.var_auto_scale).pack(side="left", padx=8)

        tk.Label(plot_option, text="Window", bg=self.panel, fg=self.subtext, font=("Segoe UI", 9, "bold")).pack(side="left", padx=(18, 6))
        window_menu = tk.OptionMenu(plot_option, self.var_view_window, "All", "30s", "60s", "120s", command=lambda _v: self.update_plot())
        window_menu.configure(bg=self.panel2, fg=self.text, activebackground=self.panel2, activeforeground=self.text, relief="flat", width=8)
        window_menu["menu"].configure(bg=self.panel2, fg=self.text)
        window_menu.pack(side="left")

        self.btn_clear_plot_top = self.make_small_button(plot_option, "Clear Plot", self.clear_test_data, self.dark_button, width=11)
        self.btn_analyze_top = self.make_small_button(plot_option, "Analyze", self.analyze, self.blue, width=11)
        self.btn_save_csv = self.make_small_button(plot_option, "Save CSV", self.save_csv, self.dark_button, width=10)
        self.btn_save_png = self.make_small_button(plot_option, "Save PNG", self.save_png, self.dark_button, width=10)
        self.btn_clear_plot_top.pack(side="right", padx=(8, 0))
        self.btn_analyze_top.pack(side="right", padx=(8, 0))
        self.btn_save_png.pack(side="right", padx=(8, 0))
        self.btn_save_csv.pack(side="right", padx=(8, 0))

        plot_body = tk.Frame(plot_card, bg=self.panel)
        plot_body.pack(fill="both", expand=True, padx=16, pady=(4, 16))

        self.figure = Figure(figsize=(8.5, 5.2), dpi=100, facecolor=self.panel)
        self.ax_temp = self.figure.add_subplot(211)
        self.ax_out = self.figure.add_subplot(212, sharex=self.ax_temp)

        self.configure_axes()
        self.figure.tight_layout(pad=2.0)

        self.canvas = FigureCanvasTkAgg(self.figure, master=plot_body)
        self.canvas.get_tk_widget().pack(fill="both", expand=True)

        # Right: manual control
        param_card = self.make_card(right, "Manual Control / RxPDO")
        param_card.pack(fill="x", pady=(0, 12))

        form = tk.Frame(param_card, bg=self.panel)
        form.pack(fill="x", padx=16, pady=(8, 14))

        self.entry_target = self.make_entry(form, "Target Temp [°C]", str(DEFAULT_TARGET))
        self.entry_kp = self.make_entry(form, "Kp", str(DEFAULT_KP))
        self.entry_ki = self.make_entry(form, "Ki", str(DEFAULT_KI))
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

        self.btn_write.pack(fill="x", pady=(10, 4))
        self.btn_clear.pack(fill="x", pady=4)

        future_box = tk.Frame(form, bg=self.panel)
        future_box.pack(fill="x", pady=(8, 0))

        self.btn_auto_tune = self.make_small_button(future_box, "Auto Tune Start", self.start_auto_tune, self.yellow, width=15)
        self.btn_apply_best = self.make_small_button(future_box, "Apply Tuned Gain", self.apply_tuned_gain, self.purple, width=15)
        self.btn_auto_tune.pack(side="left", fill="x", expand=True, padx=(0, 4))
        self.btn_apply_best.pack(side="left", fill="x", expand=True, padx=(4, 0))

        recipe_box = tk.Frame(form, bg=self.panel)
        recipe_box.pack(fill="x", pady=(8, 0))

        self.btn_save_recipe = self.make_small_button(recipe_box, "Save Recipe", self.save_recipe, self.dark_button, width=12)
        self.btn_load_recipe = self.make_small_button(recipe_box, "Load Recipe", self.load_recipe, self.dark_button, width=12)
        self.btn_apply_recipe = self.make_small_button(recipe_box, "Apply Recipe Gain", self.apply_recipe_gain, self.cyan, width=16)

        self.btn_save_recipe.grid(row=0, column=0, sticky="ew", padx=(0, 4), pady=4)
        self.btn_load_recipe.grid(row=0, column=1, sticky="ew", padx=4, pady=4)
        self.btn_apply_recipe.grid(row=0, column=2, sticky="ew", padx=(4, 0), pady=4)

        recipe_box.grid_columnconfigure(0, weight=1)
        recipe_box.grid_columnconfigure(1, weight=1)
        recipe_box.grid_columnconfigure(2, weight=1)

        tk.Checkbutton(
            form,
            text="Auto apply tuned gain after DONE",
            variable=self.var_auto_apply_after_done,
            bg=self.panel,
            fg=self.text,
            selectcolor=self.panel2,
            activebackground=self.panel,
            activeforeground=self.text,
            font=("Segoe UI", 9),
            anchor="w"
        ).pack(fill="x", pady=(8, 0))

        # Log card, right side bottom area.
        # Keep the entire remaining right-side area as log console.
        log_card = self.make_card(right, "Log Console")
        log_card.pack(fill="both", expand=True, pady=(0, 0))

        log_toolbar = tk.Frame(log_card, bg=self.panel)
        log_toolbar.pack(fill="x", padx=16, pady=(4, 0))

        self.btn_clear_log = self.make_small_button(log_toolbar, "Clear Log", self.clear_log, self.dark_button, width=10)
        self.btn_clear_log.pack(side="right")

        self.log_text = tk.Text(
            log_card,
            bg=self.panel3,
            fg="#CBD5E1",
            insertbackground="white",
            relief="flat",
            bd=0,
            font=("Consolas", 9)
        )
        self.log_text.pack(fill="both", expand=True, padx=16, pady=(6, 16))

        self.result_tree = None
        self.update_gain_status_view()
        self.update_stable_time_view()

    def configure_ttk_style(self):
        style = ttk.Style()
        try:
            style.theme_use("clam")
        except Exception:
            pass
        style.configure(
            "Treeview",
            background=self.panel2,
            foreground=self.text,
            fieldbackground=self.panel2,
            borderwidth=0,
            rowheight=24,
            font=("Consolas", 8)
        )
        style.configure(
            "Treeview.Heading",
            background=self.dark_button,
            foreground=self.text,
            relief="flat",
            font=("Segoe UI", 8, "bold")
        )
        style.map("Treeview", background=[("selected", self.blue)])

    def configure_axes(self):
        for ax in [self.ax_temp, self.ax_out]:
            ax.set_facecolor("#0B1220")
            ax.grid(True, color="#334155", alpha=0.55)
            ax.tick_params(labelsize=8, colors=self.text)
            for spine in ax.spines.values():
                spine.set_color(self.border)
            ax.xaxis.label.set_color(self.text)
            ax.yaxis.label.set_color(self.text)
            ax.title.set_color(self.text)

        self.ax_temp.set_ylabel("Temperature [°C]", fontsize=9, color=self.text)
        self.ax_out.set_ylabel("Output [%]", fontsize=9, color=self.text)
        self.ax_out.set_xlabel("Time [s]", fontsize=9, color=self.text)
        self.ax_temp.set_title("Temperature Response", fontsize=10, fontweight="bold", color=self.text)
        self.ax_out.set_title("Controller Output", fontsize=10, fontweight="bold", color=self.text)

    def update_gain_status_view(self, status=None):
        """
        Show manual gain, last sent command, and tuned gain values inside
        the Live Status / TxPDO panel without consuming graph height.
        """
        if not hasattr(self, "lbl_gain_source"):
            return

        if status is None:
            status = self.last_status

        def fmt_f(value, digits):
            if value is None:
                return "-"
            try:
                return ("{: ." + str(digits) + "f}").format(float(value)).strip()
            except Exception:
                return "-"

        try:
            entry_kp = float(self.entry_kp.get())
            entry_ki = float(self.entry_ki.get())
        except Exception:
            entry_kp = None
            entry_ki = None

        gain_source = self.active_gain_source
        tune_valid = "0"
        tune_error = "0"
        tune_k = None
        tune_l = None
        tune_t = None
        tune_kp = None
        tune_ki = None

        if status is not None:
            tune_valid = "1" if status.get("tuned_gain_valid_flag", False) else "0"
            tune_error = str(status.get("auto_tune_error", 0))
            tune_k = status.get("tune_k")
            tune_l = status.get("tune_l")
            tune_t = status.get("tune_t")
            tune_kp = status.get("tune_kp")
            tune_ki = status.get("tune_ki")

        if status is not None and status.get("tuned_gain_valid_flag", False):
            gain_source = "TUNED"
            gain_color = self.purple
        elif self.active_gain_source.startswith("Auto"):
            gain_source = "AUTO"
            gain_color = self.purple
        elif self.active_gain_source.startswith("Manual"):
            gain_source = "MANUAL"
            gain_color = self.blue
        elif self.active_gain_source.startswith("Stopped"):
            gain_source = "STOPPED"
            gain_color = self.dark_button
        else:
            gain_source = "READY"
            gain_color = self.yellow

        # Wide compact values for the second Live Status row.
        self.lbl_gain_source.config(text=gain_source, bg=gain_color,
                                    fg="white" if gain_color != self.yellow else "#111827")
        self.lbl_entry_gain.config(
            text="Kp={}  Ki={}  |  CW=0x{:04X}".format(
                fmt_f(entry_kp, 5),
                fmt_f(entry_ki, 6),
                self.last_sent_control_word
            )
        )
        self.lbl_tune_model.config(
            text="Valid={} Err={} | K={}  L={}s  T={}s".format(
                tune_valid,
                tune_error,
                fmt_f(tune_k, 3),
                fmt_f(tune_l, 2),
                fmt_f(tune_t, 2)
            )
        )
        self.lbl_tuned_gain.config(
            text="Kp={}  |  Ki={}".format(
                fmt_f(tune_kp, 6),
                fmt_f(tune_ki, 8)
            )
        )

    def update_stable_time_view(self):
        if not hasattr(self, "lbl_stable_time"):
            return

        if self.stable_elapsed_sec is None:
            self.lbl_stable_time.config(text="Stable: -", bg=self.panel3, fg=self.text)
        else:
            self.lbl_stable_time.config(
                text="Stable: {:.1f}s".format(self.stable_elapsed_sec),
                bg=self.blue,
                fg="white"
            )

    def reset_stable_timer(self):
        self.stable_timer_start_time = None
        self.stable_elapsed_sec = None
        self.stable_logged = False
        self.update_stable_time_view()

    def start_stable_timer(self):
        self.stable_timer_start_time = time.time()
        self.stable_elapsed_sec = None
        self.stable_logged = False
        self.update_stable_time_view()

    def update_stable_elapsed_if_needed(self, status):
        if status is None:
            return

        if self.stable_timer_start_time is None:
            return

        if self.stable_elapsed_sec is not None:
            return

        if status.get("state", 0) == 2:
            self.stable_elapsed_sec = time.time() - self.stable_timer_start_time
            self.update_stable_time_view()

            if not self.stable_logged:
                self.stable_logged = True
                self.log("[STABLE] Reached STABLE in {:.3f} s.".format(self.stable_elapsed_sec))

    # =====================================================
    # Parameter handling
    # =====================================================
    # Parameter handling
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
        self.update_gain_status_view()
        return target, kp, ki

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

            ret = self.wmx.SetDeviceName("KD240HeaterGuiV36")
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
        self.last_sent_control_word = control_word
        self.last_sent_target = target
        self.last_sent_kp = kp
        self.last_sent_ki = ki
        self.update_gain_status_view()

        if log_tx:
            self.log(
                "TX: ret={}, CW=0x{:04X}, Target={:.3f}, Kp={:.6f}, Ki={:.8f}, bytes={}".format(
                    ret, control_word, target, kp, ki, bytes_to_hex(out_data)
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
        self.update_status_view(status)
        self.update_gain_status_view(status)
        return status

    def read_once(self):
        status = self.read_input(log_rx=True)
        if status is not None:
            self.start_polling()
            self.log("[OK] Read Once success. Live polling started.")

    # =====================================================
    # Commands
    # =====================================================
    def write_params(self):
        if self.write_output(self.last_control_word, log_tx=True):
            self.log("[OK] Parameters written with current ControlWord=0x{:04X}".format(self.last_control_word))

    def reset_heater(self):
        self.stop_auto_timer()
        self.logging_enabled = False
        self.clear_test_data()
        self.reset_stable_timer()
        if self.write_output(CTRL_RESET_PULSE, log_tx=True):
            self.add_event_marker("RESET")
            self.root.after(80, self.clear_control)
            self.root.after(180, self.read_once)
            self.log("[CMD] RESET pulse sent.")

    def run_heater(self):
        self.clear_test_data()
        self.logging_enabled = True
        self.test_start_time = time.time()
        self.start_stable_timer()
        self.auto_apply_sent = False
        if self.write_output(CTRL_RUN, log_tx=True):
            self.active_gain_source = "Manual input gain"
            self.update_gain_status_view()
            self.add_event_marker("RUN")
            self.root.after(80, self.clear_control)
            self.root.after(180, self.read_once)
            self.start_polling()
            self.log("[CMD] RUN pulse sent. Logging started.")

    def stop_heater(self):
        self.add_event_marker("STOP")
        self.logging_enabled = False
        self.stop_auto_timer()
        if self.write_output(CTRL_STOP_PULSE, log_tx=True):
            self.active_gain_source = "Stopped"
            self.update_gain_status_view()
            self.root.after(80, self.clear_control)
            self.root.after(180, self.read_once)
            self.log("[CMD] STOP pulse sent. Logging stopped.")

    def clear_control(self):
        if self.is_connected():
            self.write_output(CTRL_CLEAR, log_tx=True)

    def handle_stop_save_options(self):
        # Auto-save checkboxes were removed in v3.6.
        # Save CSV / PNG are available as explicit graph-toolbar buttons.
        return

    # =====================================================
    # Polling / Optional save
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
        if status is not None:
            self.check_auto_apply_after_done(status)
            if self.logging_enabled:
                self.append_log_sample(status)

        self.after_id_poll = self.root.after(200, self.poll_loop)

    def stop_auto_timer(self):
        if self.after_id_auto_stop is not None:
            try:
                self.root.after_cancel(self.after_id_auto_stop)
            except Exception:
                pass
            self.after_id_auto_stop = None

    # =====================================================
    # Auto Tune commands
    # =====================================================
    def send_pulse_command(self, control_word, label, clear_delay_ms=80, read_delay_ms=180):
        if self.write_output(control_word, log_tx=True):
            self.add_event_marker(label)
            self.root.after(clear_delay_ms, self.clear_control)
            self.root.after(read_delay_ms, self.read_once)
            self.log("[CMD] {} pulse sent.".format(label))
            return True
        return False

    def start_auto_tune(self):
        self.stop_auto_timer()
        self.clear_test_data()
        self.reset_stable_timer()

        self.logging_enabled = True
        self.test_start_time = time.time()
        self.auto_apply_sent = False
        self.last_auto_tune_state = None

        if self.send_pulse_command(CTRL_AUTO_TUNE_START, "AUTO_TUNE_START"):
            self.active_gain_source = "Auto Tune in progress"
            self.update_gain_status_view()
            self.start_polling()
            self.set_state_badge("AUTO TUNE", "Auto Tune command sent. Waiting for R5 phase update.", self.yellow)
            self.log("[AUTO] Auto Tune Start requested.")

    def apply_tuned_gain(self):
        if self.last_status is not None:
            if not self.last_status.get("auto_tune_done", False):
                self.log("[WARN] Apply Tuned Gain requested before Auto Tune DONE.")

        self.logging_enabled = True
        if self.test_start_time is None:
            self.test_start_time = time.time()

        if self.send_pulse_command(CTRL_APPLY_TUNED_GAIN, "APPLY_TUNED_GAIN"):
            self.start_stable_timer()
            self.active_gain_source = "Auto tuned gain applied inside A53/R5"
            self.update_gain_status_view()
            self.start_polling()
            self.set_state_badge("APPLY", "Apply tuned gain command sent.", self.purple)
            self.log("[AUTO] Apply Tuned Gain and RUN requested.")

    def check_auto_apply_after_done(self, status):
        if status is None:
            return

        auto_state = status.get("auto_tune_state", 0)

        if auto_state != self.last_auto_tune_state:
            self.last_auto_tune_state = auto_state
            self.log("[AUTO] Phase changed: {}({})".format(
                status.get("auto_tune_state_name", "UNKNOWN"),
                auto_state
            ))

        if self.var_auto_apply_after_done.get() == 0:
            return

        if self.auto_apply_sent:
            return

        if status.get("auto_tune_done", False):
            self.auto_apply_sent = True
            self.log("[AUTO] DONE detected. Auto applying tuned gain in 300 ms.")
            self.root.after(300, self.apply_tuned_gain)

    # =====================================================
    # Status / Plot
    # =====================================================
    def update_status_view(self, status):
        state = status["state"]
        state_name = status["state_name"]
        auto_state = status.get("auto_tune_state", 0)
        auto_name = status.get("auto_tune_state_name", "UNKNOWN")

        u_percent = status["u_ctrl"] * 100.0
        duty_percent = float(status["duty"]) / 1000.0

        self.update_stable_elapsed_if_needed(status)

        self.lbl_state.config(text="{} ({})".format(state_name, state))
        self.lbl_auto_state.config(text="{} ({})".format(auto_name, auto_state))
        self.lbl_status_word.config(text="0x{:04X}".format(status["status_word"]))
        self.lbl_current_t.config(text="{:.3f} °C".format(status["current_t"]))
        self.lbl_error.config(text="{:.3f} °C".format(status["error"]))
        self.lbl_u_ctrl.config(text="{:.3f} ({:.1f}%)".format(status["u_ctrl"], u_percent))
        self.lbl_duty.config(text="{:.1f}% ({})".format(duty_percent, status["duty"]))

        if status.get("auto_tune_fail", False):
            self.set_state_badge("AUTO FAIL", "Auto Tune failed or aborted.", self.red)
        elif status.get("auto_tune_done", False) and state != 1 and state != 2:
            self.set_state_badge("TUNE DONE", "Auto Tune completed. Apply tuned gain to run PI.", self.blue)
        elif state == 4:
            self.set_state_badge("AUTO TUNE", "Auto Tune phase: {}".format(auto_name), self.yellow)
        elif state == 0:
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
            "Status: SW=0x{:04X}, HEATER={}({}), AUTO={}({}), T={:.3f}, ERR={:.3f}, ControllerOutput={:.3f}, DUTY={}".format(
                status["status_word"],
                status["state"], status["state_name"],
                status.get("auto_tune_state", 0), status.get("auto_tune_state_name", "UNKNOWN"),
                status["current_t"], status["error"], status["u_ctrl"], status["duty"]
            )
        )
        if status.get("tuned_gain_valid_flag", False):
            self.log(
                "TuneResult: K={:.6f}, L={:.3f}s, T={:.3f}s, Kp={:.6f}, Ki={:.8f}, Err={}".format(
                    status.get("tune_k", 0.0),
                    status.get("tune_l", 0.0),
                    status.get("tune_t", 0.0),
                    status.get("tune_kp", 0.0),
                    status.get("tune_ki", 0.0),
                    status.get("auto_tune_error", 0),
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
            "auto_tune_state": status.get("auto_tune_state", 0),
            "auto_tune_state_name": status.get("auto_tune_state_name", "UNKNOWN"),
            "state_packed": status.get("state_packed", status["state"]),
            "status_word": status["status_word"],
            "kp": self.last_kp,
            "ki": self.last_ki,
            "gain_source": self.active_gain_source,
            "tune_k": status.get("tune_k"),
            "tune_l": status.get("tune_l"),
            "tune_t": status.get("tune_t"),
            "tune_kp": status.get("tune_kp"),
            "tune_ki": status.get("tune_ki"),
            "tuned_gain_valid": status.get("tuned_gain_valid", 0),
            "auto_tune_error": status.get("auto_tune_error", 0),
            "stable_elapsed_sec": self.stable_elapsed_sec,
        }
        self.log_rows.append(row)
        self.update_plot()

    def add_event_marker(self, label):
        if self.test_start_time is None:
            return
        t = time.time() - self.test_start_time
        self.event_markers.append({"time_sec": t, "label": label})

    def get_visible_rows(self):
        if not self.log_rows:
            return []

        window = self.var_view_window.get()
        if window == "All":
            return list(self.log_rows)

        try:
            sec = float(window.replace("s", ""))
        except Exception:
            return list(self.log_rows)

        last_t = self.log_rows[-1]["time_sec"]
        min_t = max(0.0, last_t - sec)
        return [r for r in self.log_rows if r["time_sec"] >= min_t]

    def update_plot(self):
        self.ax_temp.clear()
        self.ax_out.clear()
        self.configure_axes()

        rows = self.get_visible_rows()
        if not rows:
            self.canvas.draw_idle()
            return

        times = [r["time_sec"] for r in rows]
        targets = [r["target_temp"] for r in rows]
        temps = [r["current_temp"] for r in rows]
        duties = [r["duty_percent"] for r in rows]
        us = [r["u_percent"] for r in rows]

        # Temperature graph
        if self.var_show_band.get():
            upper = [v + 1.0 for v in targets]
            lower = [v - 1.0 for v in targets]
            self.ax_temp.fill_between(times, lower, upper, color="#CBD5E1", alpha=0.35, label="Settling Band ±1°C")

        if self.var_show_target.get():
            self.ax_temp.plot(times, targets, label="Target Temp", color="#DC2626", linestyle="--", linewidth=2.0)

        if self.var_show_current.get():
            self.ax_temp.plot(times, temps, label="Current Temp", color="#2563EB", linewidth=2.2)

        # Output graph
        if self.var_show_u.get():
            self.ax_out.plot(times, us, label="Controller Output [%]", color="#7C3AED", linewidth=1.8)

        if self.var_show_duty.get():
            self.ax_out.plot(times, duties, label="Duty [%]", color="#16A34A", linewidth=1.8)

        # Event markers in visible range
        if times:
            min_x = times[0]
            max_x = times[-1]
            for marker in self.event_markers:
                t = marker["time_sec"]
                if t < min_x or t > max_x:
                    continue
                label = marker["label"]
                for ax in [self.ax_temp, self.ax_out]:
                    ax.axvline(t, color="#64748B", linestyle=":", linewidth=1.0)
                self.ax_temp.text(t, self.ax_temp.get_ylim()[1], label, rotation=90, va="top", ha="right", fontsize=7, color="#475569")

        # X range
        if times:
            self.ax_temp.set_xlim(times[0], max(times[-1], times[0] + 1.0))

        if self.var_auto_scale.get():
            # Temperature y
            y_temp = []
            if self.var_show_target.get():
                y_temp += targets
            if self.var_show_current.get():
                y_temp += temps
            if self.var_show_band.get():
                y_temp += [v - 1.0 for v in targets] + [v + 1.0 for v in targets]
            if y_temp:
                mn = min(y_temp)
                mx = max(y_temp)
                margin = max(3.0, (mx - mn) * 0.12)
                self.ax_temp.set_ylim(mn - margin, mx + margin)
            else:
                self.ax_temp.set_ylim(0, 120)

            # Output y
            y_out = []
            if self.var_show_u.get():
                y_out += us
            if self.var_show_duty.get():
                y_out += duties
            if y_out:
                mn = min(y_out)
                mx = max(y_out)
                margin = max(5.0, (mx - mn) * 0.12)
                self.ax_out.set_ylim(mn - margin, mx + margin)
            else:
                self.ax_out.set_ylim(-5, 105)
        else:
            self.ax_temp.set_ylim(0, 120)
            self.ax_out.set_ylim(-5, 105)

        self.ax_temp.legend(loc="upper left", fontsize=8)
        self.ax_out.legend(loc="upper left", fontsize=8)
        self.figure.tight_layout(pad=2.0)
        self.canvas.draw_idle()

    def clear_test_data(self):
        self.log_rows = []
        self.event_markers = []
        self.test_start_time = None
        self.reset_stable_timer()
        self.update_gain_status_view()
        self.update_plot()

    # =====================================================
    # Recipe management
    # =====================================================
    def set_entry_value(self, entry, value):
        entry.delete(0, "end")
        entry.insert(0, str(value))

    def build_recipe_dict(self):
        params = self.get_params()
        if params is None:
            return None

        target, kp, ki = params
        status = self.last_status or {}

        recipe = {
            "recipe_version": "1.0",
            "project": "KD240 EtherCAT Virtual Heater PI Controller",
            "gui_version": "v3.6",
            "created_at": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "target_temp": target,
            "entry_kp": kp,
            "entry_ki": ki,
            "last_sent_control_word": self.last_sent_control_word,
            "last_sent_target": self.last_sent_target,
            "last_sent_kp": self.last_sent_kp,
            "last_sent_ki": self.last_sent_ki,
            "tune_k": status.get("tune_k"),
            "tune_l": status.get("tune_l"),
            "tune_t": status.get("tune_t"),
            "tuned_kp": status.get("tune_kp"),
            "tuned_ki": status.get("tune_ki"),
            "tuned_gain_valid": int(status.get("tuned_gain_valid", 0)),
            "tuned_gain_valid_flag": bool(status.get("tuned_gain_valid_flag", False)),
            "auto_tune_error": int(status.get("auto_tune_error", 0)),
            "stable_elapsed_sec": self.stable_elapsed_sec,
            "note": "KD240 heater auto tune recipe"
        }
        return recipe

    def save_recipe(self):
        recipe = self.build_recipe_dict()
        if recipe is None:
            return

        default_name = "kd240_heater_recipe_{}.json".format(now_timestamp())
        filename = filedialog.asksaveasfilename(
            defaultextension=".json",
            initialfile=default_name,
            filetypes=[("JSON recipe", "*.json"), ("All files", "*.*")]
        )
        if not filename:
            return

        try:
            with open(filename, "w", encoding="utf-8") as f:
                json.dump(recipe, f, indent=2, ensure_ascii=False)
        except Exception:
            err = traceback.format_exc()
            self.log(err)
            messagebox.showerror("Save Recipe Error", err)
            return

        self.log("[RECIPE] Saved: {}".format(os.path.abspath(filename)))

    def load_recipe(self):
        filename = filedialog.askopenfilename(
            filetypes=[("JSON recipe", "*.json"), ("All files", "*.*")]
        )
        if not filename:
            return

        try:
            with open(filename, "r", encoding="utf-8") as f:
                recipe = json.load(f)
        except Exception:
            err = traceback.format_exc()
            self.log(err)
            messagebox.showerror("Load Recipe Error", err)
            return

        self.loaded_recipe = recipe

        target = recipe.get("target_temp", recipe.get("last_sent_target", DEFAULT_TARGET))
        entry_kp = recipe.get("entry_kp", DEFAULT_KP)
        entry_ki = recipe.get("entry_ki", DEFAULT_KI)

        self.set_entry_value(self.entry_target, target)
        self.set_entry_value(self.entry_kp, entry_kp)
        self.set_entry_value(self.entry_ki, entry_ki)

        self.active_gain_source = "Recipe loaded"
        self.update_gain_status_view()

        self.log("[RECIPE] Loaded: {}".format(os.path.abspath(filename)))
        self.log("[RECIPE] Entry Target={:.3f}, Kp={:.6f}, Ki={:.8f}".format(
            float(target), float(entry_kp), float(entry_ki)
        ))
        self.log("[RECIPE] Tuned Kp={}, Tuned Ki={}, Valid={}".format(
            recipe.get("tuned_kp"),
            recipe.get("tuned_ki"),
            recipe.get("tuned_gain_valid_flag", recipe.get("tuned_gain_valid", 0))
        ))

    def apply_recipe_gain(self):
        if self.loaded_recipe is None:
            messagebox.showinfo("Apply Recipe Gain", "먼저 Load Recipe를 수행하세요.")
            self.log("[RECIPE] No loaded recipe.")
            return

        recipe = self.loaded_recipe
        tuned_kp = recipe.get("tuned_kp")
        tuned_ki = recipe.get("tuned_ki")

        if tuned_kp is None or tuned_ki is None:
            messagebox.showwarning("Apply Recipe Gain", "Recipe에 tuned Kp/Ki 값이 없습니다.")
            self.log("[RECIPE] Tuned Kp/Ki not found in recipe.")
            return

        target = recipe.get("target_temp", recipe.get("last_sent_target", DEFAULT_TARGET))

        self.set_entry_value(self.entry_target, target)
        self.set_entry_value(self.entry_kp, tuned_kp)
        self.set_entry_value(self.entry_ki, tuned_ki)

        self.active_gain_source = "Recipe tuned gain"
        self.update_gain_status_view()
        self.log("[RECIPE] Applied to entry: Target={:.3f}, Kp={:.6f}, Ki={:.8f}".format(
            float(target), float(tuned_kp), float(tuned_ki)
        ))
        self.log("[RECIPE] Use RUN or Write Params to send the recipe gain to the slave.")

    # =====================================================
    # Save / Analyze
    # =====================================================
    def save_csv(self, auto=False):
        if not self.log_rows:
            if not auto:
                messagebox.showinfo("Save CSV", "저장할 로그 데이터가 없습니다.")
            self.log("[INFO] No log data to save.")
            return None

        default_name = "kd240_heater_v3_6_log_{}.csv".format(now_timestamp())
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
                "time_sec", "target_temp", "current_temp", "error",
                "controller_output", "controller_output_percent", "duty_cnt", "duty_percent",
                "state", "state_name", "auto_tune_state", "auto_tune_state_name", "state_packed", "status_word",
                "entry_kp", "entry_ki", "gain_source",
                "tune_k", "tune_l", "tune_t", "tune_kp", "tune_ki", "tuned_gain_valid", "auto_tune_error", "stable_elapsed_sec"
            ])
            for r in self.log_rows:
                writer.writerow([
                    r["time_sec"], r["target_temp"], r["current_temp"], r["error"],
                    r["u_ctrl"], r["u_percent"], r["duty_cnt"], r["duty_percent"],
                    r["state"], r["state_name"], r.get("auto_tune_state", 0), r.get("auto_tune_state_name", "UNKNOWN"),
                    r.get("state_packed", r["state"]), r["status_word"], r.get("kp", self.last_kp), r.get("ki", self.last_ki), r.get("gain_source", self.active_gain_source),
                    r.get("tune_k"), r.get("tune_l"), r.get("tune_t"), r.get("tune_kp"), r.get("tune_ki"), r.get("tuned_gain_valid", 0), r.get("auto_tune_error", 0), r.get("stable_elapsed_sec")
                ])

        self.log("[SAVE] CSV saved: {}".format(os.path.abspath(filename)))
        return filename

    def save_png(self, auto=False):
        if not self.log_rows:
            if not auto:
                messagebox.showinfo("Save PNG", "저장할 그래프 데이터가 없습니다.")
            self.log("[INFO] No graph data to save.")
            return None

        default_name = "kd240_heater_v3_6_result_{}.png".format(now_timestamp())
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
        kp = self.last_kp
        ki = self.last_ki

        temps = [r["current_temp"] for r in self.log_rows]
        times = [r["time_sec"] for r in self.log_rows]
        states = [r["state"] for r in self.log_rows]
        u_values = [r["u_percent"] for r in self.log_rows]

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

        oscillation_count = self.estimate_oscillation_count(target, temps)
        saturation_ratio = self.estimate_saturation_ratio(u_values)

        overshoot_pass = overshoot <= 5.0
        settling_pass = settling_time is not None and settling_time <= 30.0
        final_error_pass = final_error_avg <= 1.0
        fault_pass = not fault_occurred

        score = (
            overshoot * 3.0 +
            final_error_avg * 5.0 +
            (settling_time if settling_time is not None else 60.0) * 0.5 +
            oscillation_count * 2.0 +
            saturation_ratio * 20.0 +
            (1000.0 if fault_occurred else 0.0)
        )

        final_pass = overshoot_pass and settling_pass and final_error_pass and fault_pass
        result = "PASS" if final_pass else "FAIL"
        result_color = self.green if final_pass else self.red

        if settling_time is None:
            settling_text = "Not settled"
            settling_for_table = "N/A"
        else:
            settling_text = "{:.3f} s".format(settling_time)
            settling_for_table = "{:.1f}".format(settling_time)

        metrics = (
            "Target Temp     : {:.3f} °C\n"
            "Kp / Ki         : {:.6f} / {:.8f}\n"
            "Max Temp        : {:.3f} °C\n"
            "Overshoot       : {:.3f} °C  {}\n"
            "Settling Time   : {}  {}\n"
            "Final Error Avg : {:.3f} °C  {}\n"
            "Oscillation Cnt : {}\n"
            "Saturation Ratio: {:.1f}%\n"
            "Fault Occurred  : {}  {}\n"
            "Score           : {:.2f}\n"
            "Final Result    : {}"
        ).format(
            target, kp, ki, max_temp,
            overshoot, "PASS" if overshoot_pass else "FAIL",
            settling_text, "PASS" if settling_pass else "FAIL",
            final_error_avg, "PASS" if final_error_pass else "FAIL",
            oscillation_count,
            saturation_ratio * 100.0,
            "Yes" if fault_occurred else "No", "PASS" if fault_pass else "FAIL",
            score,
            result
        )

        if not auto:
            messagebox.showinfo("Trend Analysis", metrics)
        self.log("")
        self.log("===== Trend Analysis =====")
        for line in metrics.splitlines():
            self.log(line)

        self.add_result_history(kp, ki, overshoot, settling_for_table, final_error_avg, score, result)

        return {
            "result": result,
            "overshoot": overshoot,
            "settling_time": settling_time,
            "final_error_avg": final_error_avg,
            "fault_occurred": fault_occurred,
            "oscillation_count": oscillation_count,
            "saturation_ratio": saturation_ratio,
            "score": score,
        }

    def estimate_oscillation_count(self, target, temps):
        if len(temps) < 3:
            return 0
        signs = []
        for temp in temps:
            err = target - temp
            if abs(err) < 0.2:
                signs.append(0)
            elif err > 0:
                signs.append(1)
            else:
                signs.append(-1)
        count = 0
        prev = 0
        for s in signs:
            if s == 0:
                continue
            if prev != 0 and s != prev:
                count += 1
            prev = s
        return count

    def estimate_saturation_ratio(self, u_values):
        if not u_values:
            return 0.0
        sat = 0
        for u in u_values:
            if u >= 99.0 or u <= 1.0:
                sat += 1
        return float(sat) / float(len(u_values))

    def add_result_history(self, kp, ki, overshoot, settling_text, final_error_avg, score, result):
        self.test_count += 1
        values = (
            self.test_count,
            "{:.4g}".format(kp),
            "{:.4g}".format(ki),
            "{:.2f}".format(overshoot),
            settling_text,
            "{:.2f}".format(final_error_avg),
            "{:.1f}".format(score),
            result,
        )
        if self.result_tree is not None:
            self.result_tree.insert("", "end", values=values)

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
    app = KD240HeaterGuiV36(root)
    root.mainloop()


if __name__ == "__main__":
    main()
