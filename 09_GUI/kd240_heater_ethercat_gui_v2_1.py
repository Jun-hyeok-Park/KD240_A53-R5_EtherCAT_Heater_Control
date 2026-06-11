# -*- coding: utf-8 -*-
"""
KD240 EtherCAT Virtual Heater PI Controller GUI v2.1

v2.1 scope
- Keep stable Tkinter + WMX3 structure
- Remove Auto Test workflow from the visible UI
- Add Save CSV / Save PNG checkboxes for automatic save on STOP
- Rename U Ctrl to Controller Output for clearer operator-facing terminology
- Move Analyze / Clear Plot controls to the graph toolbar for better visibility
- Move Log console to the right-side panel so it is always visible
- Improve graph title/axis contrast on the dark theme

Target environment
- Windows
- Python 3.6
- Movensys WMX3 Python API
- Tkinter + Matplotlib(TkAgg)
"""

import os
import sys
import csv
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

# GUI defaults
DEFAULT_TARGET = 80.0
DEFAULT_KP = 0.03
DEFAULT_KI = 0.0001


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
class KD240HeaterGuiV2:
    def __init__(self, root):
        self.root = root
        self.root.title("KD240 EtherCAT Virtual Heater PI Controller v2.1")
        self.root.geometry("1540x920")
        self.root.minsize(1320, 820)

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

        self.last_target = DEFAULT_TARGET
        self.last_kp = DEFAULT_KP
        self.last_ki = DEFAULT_KI

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
        self.var_save_csv_on_stop = tk.IntVar(value=1)
        self.var_save_png_on_stop = tk.IntVar(value=1)

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
            text="KD240 EtherCAT Virtual Heater PI Controller v2.1",
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
            text="WMX I/O Space | RxPDO 14 byte / TxPDO 20 byte | Manual RUN/STOP | Optional CSV/PNG autosave",
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

        self.btn_clear_log = self.make_small_button(conn_body, "Clear Log", self.clear_log, self.dark_button, width=10)
        self.btn_clear_log.pack(side="right", padx=(8, 0))

        # Live status card
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
        self.lbl_u_ctrl = self.make_label_value(status_body, "Controller Output", 0, 4)
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
        plot_card = self.make_card(left, "Live Trend v2.1")
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
        self.btn_clear_plot_top.pack(side="right", padx=(8, 0))
        self.btn_analyze_top.pack(side="right", padx=(8, 0))

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

        save_box = tk.Frame(form, bg=self.panel2, highlightbackground=self.border, highlightthickness=1)
        save_box.pack(fill="x", pady=(12, 4), ipady=6)

        tk.Label(
            save_box,
            text="On STOP Save Options",
            bg=self.panel2,
            fg=self.subtext,
            font=("Segoe UI", 9, "bold")
        ).pack(anchor="w", padx=10, pady=(6, 2))

        for text, var in [
            ("Save CSV automatically", self.var_save_csv_on_stop),
            ("Save PNG automatically", self.var_save_png_on_stop),
        ]:
            tk.Checkbutton(
                save_box,
                text=text,
                variable=var,
                bg=self.panel2,
                fg=self.text,
                selectcolor=self.panel,
                activebackground=self.panel2,
                activeforeground=self.text,
                font=("Segoe UI", 9),
                anchor="w"
            ).pack(fill="x", padx=10, pady=1)

        future_box = tk.Frame(form, bg=self.panel)
        future_box.pack(fill="x", pady=(8, 0))

        self.btn_auto_tune = self.make_small_button(future_box, "Z-N Auto Tuning", self.auto_tuning_placeholder, self.yellow, width=15)
        self.btn_apply_best = self.make_small_button(future_box, "Apply Gain", self.apply_recommended_placeholder, self.dark_button, width=15)
        self.btn_auto_tune.pack(side="left", fill="x", expand=True, padx=(0, 4))
        self.btn_apply_best.pack(side="left", fill="x", expand=True, padx=(4, 0))

        # Log card, right side for constant visibility
        log_card = self.make_card(right, "Log Console")
        log_card.pack(fill="x", pady=(0, 12))

        self.log_text = tk.Text(
            log_card,
            height=8,
            bg=self.panel3,
            fg="#CBD5E1",
            insertbackground="white",
            relief="flat",
            bd=0,
            font=("Consolas", 9)
        )
        self.log_text.pack(fill="x", padx=16, pady=(6, 16))

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

        self.btn_save_csv.grid(row=0, column=0, sticky="ew", padx=(0, 4), pady=4)
        self.btn_save_png.grid(row=0, column=1, sticky="ew", padx=4, pady=4)

        action_row.grid_columnconfigure(0, weight=1)
        action_row.grid_columnconfigure(1, weight=1)

        # Result history card
        history_card = self.make_card(right, "Result History")
        history_card.pack(fill="both", expand=True)

        hist_body = tk.Frame(history_card, bg=self.panel)
        hist_body.pack(fill="both", expand=True, padx=16, pady=(6, 16))

        cols = ("no", "kp", "ki", "ov", "settle", "err", "score", "result")
        self.result_tree = ttk.Treeview(hist_body, columns=cols, show="headings", height=9)
        headers = {
            "no": "#",
            "kp": "Kp",
            "ki": "Ki",
            "ov": "OS",
            "settle": "Ts",
            "err": "Err",
            "score": "Score",
            "result": "Result",
        }
        widths = {
            "no": 34,
            "kp": 62,
            "ki": 78,
            "ov": 56,
            "settle": 56,
            "err": 56,
            "score": 60,
            "result": 62,
        }
        for col in cols:
            self.result_tree.heading(col, text=headers[col])
            self.result_tree.column(col, width=widths[col], anchor="center", stretch=False)

        yscroll = ttk.Scrollbar(hist_body, orient="vertical", command=self.result_tree.yview)
        self.result_tree.configure(yscrollcommand=yscroll.set)
        self.result_tree.pack(side="left", fill="both", expand=True)
        yscroll.pack(side="right", fill="y")

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

            ret = self.wmx.SetDeviceName("KD240HeaterGuiV2")
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
        if self.write_output(CTRL_RESET_PULSE, log_tx=True):
            self.add_event_marker("RESET")
            self.root.after(80, self.clear_control)
            self.root.after(180, self.read_once)
            self.log("[CMD] RESET pulse sent.")

    def run_heater(self):
        self.clear_test_data()
        self.logging_enabled = True
        self.test_start_time = time.time()
        if self.write_output(CTRL_RUN, log_tx=True):
            self.add_event_marker("RUN")
            self.start_polling()
            self.log("[CMD] RUN sent. Logging started.")

    def stop_heater(self):
        self.add_event_marker("STOP")
        self.logging_enabled = False
        self.stop_auto_timer()
        if self.write_output(CTRL_STOP_PULSE, log_tx=True):
            self.root.after(80, self.clear_control)
            self.root.after(180, self.read_once)
            self.root.after(260, self.handle_stop_save_options)
            self.log("[CMD] STOP pulse sent. Logging stopped.")

    def clear_control(self):
        if self.is_connected():
            self.write_output(CTRL_CLEAR, log_tx=True)

    def handle_stop_save_options(self):
        if not self.log_rows:
            self.log("[SAVE] No log data. Auto save skipped.")
            return

        if self.var_save_csv_on_stop.get():
            self.save_csv(auto=True)

        if self.var_save_png_on_stop.get():
            self.save_png(auto=True)

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
        if status is not None and self.logging_enabled:
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
    # Auto tuning placeholder
    # =====================================================
    def auto_tuning_placeholder(self):
        msg = (
            "Auto Tuning은 v3.0에서 구현 예정입니다.\n\n"
            "구현 방향:\n"
            "- Gain Sweep 방식이 아니라 Ziegler-Nichols 기반으로 진행\n"
            "- 한계 이득 Ku / 한계 주기 Pu 측정 절차 추가\n"
            "- 측정 결과 기반 Kp/Ki 추천값 계산\n"
            "- 실제 히터 적용 전 안전 조건 추가"
        )
        messagebox.showinfo("Auto Tuning Placeholder", msg)
        self.log("[INFO] Auto Tuning placeholder clicked. Ziegler-Nichols implementation will be added later.")

    def apply_recommended_placeholder(self):
        messagebox.showinfo("Apply Recommended Gain", "아직 추천 Gain 계산 기능이 구현되지 않았습니다. v3.0에서 연결 예정입니다.")
        self.log("[INFO] Apply Recommended Gain placeholder clicked.")

    # =====================================================
    # Status / Plot
    # =====================================================
    def update_status_view(self, status):
        state = status["state"]
        state_name = status["state_name"]

        u_percent = status["u_ctrl"] * 100.0
        duty_percent = float(status["duty"]) / 1000.0

        self.lbl_state.config(text="{} ({})".format(state_name, state))
        self.lbl_status_word.config(text="0x{:04X}".format(status["status_word"]))
        self.lbl_current_t.config(text="{:.3f} °C".format(status["current_t"]))
        self.lbl_error.config(text="{:.3f} °C".format(status["error"]))
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
            "Status: SW=0x{:04X}, STATE={}({}), T={:.3f}, ERR={:.3f}, ControllerOutput={:.3f}, DUTY={}".format(
                status["status_word"], status["state"], status["state_name"],
                status["current_t"], status["error"], status["u_ctrl"], status["duty"]
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
            "kp": self.last_kp,
            "ki": self.last_ki,
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

        default_name = "kd240_heater_v2_1_log_{}.csv".format(now_timestamp())
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
                "state", "state_name", "status_word", "kp", "ki"
            ])
            for r in self.log_rows:
                writer.writerow([
                    r["time_sec"], r["target_temp"], r["current_temp"], r["error"],
                    r["u_ctrl"], r["u_percent"], r["duty_cnt"], r["duty_percent"],
                    r["state"], r["state_name"], r["status_word"], r.get("kp", self.last_kp), r.get("ki", self.last_ki)
                ])

        self.log("[SAVE] CSV saved: {}".format(os.path.abspath(filename)))
        return filename

    def save_png(self, auto=False):
        if not self.log_rows:
            if not auto:
                messagebox.showinfo("Save PNG", "저장할 그래프 데이터가 없습니다.")
            self.log("[INFO] No graph data to save.")
            return None

        default_name = "kd240_heater_v2_1_result_{}.png".format(now_timestamp())
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
        self.result_badge.config(text=result, bg=result_color, fg="white")

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

        self.lbl_metrics.config(text=metrics)
        self.log("")
        self.log("===== Test Result =====")
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
    app = KD240HeaterGuiV2(root)
    root.mainloop()


if __name__ == "__main__":
    main()
