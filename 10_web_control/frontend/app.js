const CHANNEL_COUNT = 8;

const state = {
  selectedChannel: 1,
  status: null,
  health: null,
  samples: [],
  events: [],
  ws: null,
  latestSeq: 0,
  autoApply: false,
};

const $ = (id) => document.getElementById(id);

const el = {
  adapterBadge: $("adapterBadge"),
  wsBadge: $("wsBadge"),
  channelSelect: $("channelSelect"),
  headerStartBtn: $("headerStartBtn"),
  headerStopBtn: $("headerStopBtn"),
  serverName: $("serverName"),
  serverVersion: $("serverVersion"),
  adapterMode: $("adapterMode"),
  channelCount: $("channelCount"),
  rxpdoBytes: $("rxpdoBytes"),
  txpdoBytes: $("txpdoBytes"),
  wsPeriod: $("wsPeriod"),
  sequenceNo: $("sequenceNo"),
  backendState: $("backendState"),
  selectedChannelPill: $("selectedChannelPill"),
  channelSummary: $("channelSummary"),
  detailSubtitle: $("detailSubtitle"),
  detailState: $("detailState"),
  pvCurrent: $("pvCurrent"),
  svTarget: $("svTarget"),
  errorValue: $("errorValue"),
  outputPercent: $("outputPercent"),
  dutyPercent: $("dutyPercent"),
  statusWord: $("statusWord"),
  targetTemp: $("targetTemp"),
  kp: $("kp"),
  ki: $("ki"),
  channelEnable: $("channelEnable"),
  applyParamsBtn: $("applyParamsBtn"),
  runBtn: $("runBtn"),
  stopBtn: $("stopBtn"),
  resetBtn: $("resetBtn"),
  autoTuneBtn: $("autoTuneBtn"),
  applyTuneBtn: $("applyTuneBtn"),
  autoApply: $("autoApply"),
  autoTuneState: $("autoTuneState"),
  tuneK: $("tuneK"),
  tuneL: $("tuneL"),
  tuneT: $("tuneT"),
  tuneKp: $("tuneKp"),
  tuneKi: $("tuneKi"),
  autoTuneError: $("autoTuneError"),
  tunedValid: $("tunedValid"),
  heaterState: $("heaterState"),
  trendChart: $("trendChart"),
  sampleCount: $("sampleCount"),
  clearLogBtn: $("clearLogBtn"),
  eventLog: $("eventLog"),
};

function buildChannels() {
  const active = channelFromStatus();
  const channels = [active];
  for (let ch = 2; ch <= CHANNEL_COUNT; ch += 1) {
    channels.push({
      ch,
      name: `CH${ch}`,
      role: "Future placeholder",
      active: false,
      enable: false,
      pv: null,
      sv: null,
      out: null,
      duty: null,
      error: null,
      kp: null,
      ki: null,
      state: "DISABLED",
      autoTuneState: "IDLE",
    });
  }
  return channels;
}

function channelFromStatus() {
  const status = state.status || {};
  return {
    ch: 1,
    name: "CH1",
    role: "KD240 active PDO channel",
    active: true,
    enable: true,
    pv: status.current_temp,
    sv: status.target_temp,
    out: status.u_percent,
    duty: status.duty_percent,
    error: status.error,
    kp: status.kp,
    ki: status.ki,
    state: status.heater_state_name || "IDLE",
    autoTuneState: status.auto_tune_state_name || "IDLE",
  };
}

function setupChannelSelect() {
  el.channelSelect.innerHTML = "";
  for (let ch = 1; ch <= CHANNEL_COUNT; ch += 1) {
    const option = document.createElement("option");
    option.value = String(ch);
    option.textContent = ch === 1 ? "CH1 active" : `CH${ch} future`;
    option.disabled = ch !== 1;
    el.channelSelect.append(option);
  }
  el.channelSelect.value = "1";
  el.channelSelect.addEventListener("change", () => {
    selectChannel(Number(el.channelSelect.value));
  });
}

function selectChannel(ch) {
  if (ch !== 1) {
    addLog(localLog("warn", `CH${ch} is disabled in the current 1-channel PDO phase`));
    el.channelSelect.value = "1";
    state.selectedChannel = 1;
    return;
  }
  state.selectedChannel = 1;
  renderAll();
}

function commandPayload() {
  return {
    target_temp: numeric(el.targetTemp, 80),
    kp: numeric(el.kp, 0.04),
    ki: numeric(el.ki, 0.003),
  };
}

function numeric(input, fallback) {
  const parsed = Number(input.value);
  return Number.isFinite(parsed) ? parsed : fallback;
}

async function postJson(path, body = {}) {
  addLog(localLog("info", `REST POST ${path}`));
  const response = await fetch(path, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(body),
  });
  const payload = await response.json();
  if (!response.ok || payload.ok === false) {
    addLog(localLog("warn", payload.message || `${path} failed`));
    return payload;
  }
  if (typeof payload.auto_apply_after_done === "boolean") {
    state.autoApply = payload.auto_apply_after_done;
  }
  if (payload.status) {
    applyStatus(payload.status);
  }
  if (payload.message) {
    addLog(localLog("info", payload.message));
  }
  return payload;
}

async function loadHealth() {
  try {
    const response = await fetch("/api/health");
    state.health = await response.json();
    renderCommon();
  } catch (error) {
    setPill(el.backendState, "Backend: unavailable", "fault");
  }
}

function connectWebSocket() {
  const protocol = window.location.protocol === "https:" ? "wss:" : "ws:";
  const ws = new WebSocket(`${protocol}//${window.location.host}/ws`);
  state.ws = ws;

  ws.addEventListener("open", () => {
    setPill(el.wsBadge, "WS: connected", "ready");
    addLog(localLog("info", "WebSocket connected"));
  });

  ws.addEventListener("message", (event) => {
    handleWsMessage(JSON.parse(event.data));
  });

  ws.addEventListener("close", () => {
    setPill(el.wsBadge, "WS: reconnecting", "warn");
    addLog(localLog("warn", "WebSocket disconnected. Reconnecting..."));
    window.setTimeout(connectWebSocket, 1500);
  });

  ws.addEventListener("error", () => {
    setPill(el.wsBadge, "WS: error", "fault");
  });
}

function handleWsMessage(message) {
  if (message.seq) {
    state.latestSeq = message.seq;
  }

  if (message.type === "status.snapshot") {
    if (!state.health) {
      state.health = {
        server: message.server,
        version: message.version,
        adapter: message.adapter,
        connected: message.connected,
        channel_count: message.channel_count,
        rxpdo_bytes: message.rxpdo_bytes,
        txpdo_bytes: message.txpdo_bytes,
        ws_period_ms: message.ws_period_ms,
      };
    }
    state.autoApply = Boolean(message.auto_apply_after_done);
    applyStatus(message.status);
  } else if (message.type === "history.batch") {
    state.samples = message.samples || [];
    renderChart();
  } else if (message.type === "event.log") {
    addLog(message);
  } else if (message.type === "adapter.state") {
    const faultText = message.fault ? ` fault: ${message.fault}` : "";
    setPill(
      el.adapterBadge,
      `Adapter: ${message.adapter}${faultText}`,
      message.fault ? "fault" : message.connected ? "ready" : "warn",
    );
    setPill(
      el.backendState,
      message.fault ? `Backend: fault` : `Backend: ${message.connected ? "connected" : "disconnected"}`,
      message.fault ? "fault" : message.connected ? "ready" : "warn",
    );
  } else if (message.type === "autotune.event") {
    addLog({
      timestamp: message.timestamp || new Date().toISOString(),
      level: "info",
      message: message.message || `Auto Tune: ${message.auto_tune_state_name}`,
    });
  }
}

function applyStatus(status) {
  state.status = status;
  renderAll();
}

function renderAll() {
  renderCommon();
  renderChannelSummary();
  renderDetail();
  renderAutoTune();
  renderChart();
}

function renderCommon() {
  const health = state.health || {};
  const status = state.status || {};
  const adapter = health.adapter || "mock";
  const connected = health.connected !== false;

  el.serverName.textContent = health.server || "KD240 Heater Control Server";
  el.serverVersion.textContent = health.version || "0.1.0-mock";
  el.adapterMode.textContent = adapter;
  el.channelCount.textContent = `${health.channel_count || CHANNEL_COUNT} CH`;
  el.rxpdoBytes.textContent = `${health.rxpdo_bytes || 14} bytes`;
  el.txpdoBytes.textContent = `${health.txpdo_bytes || 48} bytes`;
  el.wsPeriod.textContent = `${health.ws_period_ms || 500} ms`;
  el.sequenceNo.textContent = state.latestSeq ? String(state.latestSeq) : "-";
  setPill(el.adapterBadge, `Adapter: ${adapter}`, connected ? "ready" : "warn");
  setPill(el.backendState, `Backend: ${connected ? "connected" : "disconnected"}`, connected ? "ready" : "warn");

  if (status.heater_state_name) {
    setPill(el.heaterState, `Heater: ${status.heater_state_name}`, stateClass(status.heater_state_name));
  }
}

function renderChannelSummary() {
  const channels = buildChannels();
  el.channelSummary.innerHTML = "";
  for (const ch of channels) {
    const card = document.createElement("button");
    card.type = "button";
    card.className = `channel-card ${ch.ch === state.selectedChannel ? "selected" : ""} ${ch.active ? "" : "disabled"}`;
    card.disabled = !ch.active;
    card.addEventListener("click", () => selectChannel(ch.ch));
    card.innerHTML = `
      <div class="channel-title">
        <span>${ch.name}</span>
        <span class="pill ${ch.active ? "ready" : "future"}">${ch.active ? "ACTIVE" : "FUTURE"}</span>
      </div>
      <div class="channel-role">${ch.role}</div>
      <div class="mini-grid">
        ${mini("PV", tempText(ch.pv))}
        ${mini("SV", tempText(ch.sv))}
        ${mini("OUT", percentText(ch.out))}
        ${mini("Kp", ch.kp == null ? "--" : trimNumber(ch.kp, 4))}
        ${mini("State", ch.state)}
      </div>
    `;
    el.channelSummary.append(card);
  }
  el.selectedChannelPill.textContent = `Selected CH${state.selectedChannel}`;
}

function mini(label, value) {
  return `<div class="mini"><div class="label">${label}</div><div class="value">${value}</div></div>`;
}

function renderDetail() {
  const status = state.status || {};
  const selectedActive = state.selectedChannel === 1;
  el.detailSubtitle.textContent = selectedActive
    ? "CH1 active mock channel mapped to KD240 RxPDO 14 bytes / TxPDO 48 bytes"
    : `CH${state.selectedChannel} future placeholder`;

  el.pvCurrent.textContent = tempText(status.current_temp);
  el.svTarget.textContent = tempText(status.target_temp);
  el.errorValue.textContent = tempText(status.error);
  el.outputPercent.textContent = percentText(status.u_percent);
  el.dutyPercent.textContent = percentText(status.duty_percent);
  el.statusWord.textContent = `0x${Number(status.status_word || 0).toString(16).padStart(4, "0").toUpperCase()}`;

  setPill(el.detailState, status.heater_state_name || "IDLE", stateClass(status.heater_state_name));

  if (document.activeElement !== el.targetTemp && status.target_temp != null) el.targetTemp.value = trimNumber(status.target_temp, 2);
  if (document.activeElement !== el.kp && status.kp != null) el.kp.value = trimNumber(status.kp, 6);
  if (document.activeElement !== el.ki && status.ki != null) el.ki.value = trimNumber(status.ki, 6);

  el.channelEnable.checked = selectedActive;
}

function renderAutoTune() {
  const status = state.status || {};
  setPill(el.autoTuneState, status.auto_tune_state_name || "IDLE", autoTuneClass(status.auto_tune_state_name));
  el.tuneK.textContent = valueOrDash(status.tune_k, 3);
  el.tuneL.textContent = valueOrDash(status.tune_l, 3);
  el.tuneT.textContent = valueOrDash(status.tune_t, 3);
  el.tuneKp.textContent = status.tuned_gain_valid ? valueOrDash(status.tune_kp, 6) : "--";
  el.tuneKi.textContent = status.tuned_gain_valid ? valueOrDash(status.tune_ki, 6) : "--";
  el.autoTuneError.textContent = String(status.auto_tune_error ?? 0);
  setPill(
    el.tunedValid,
    status.tuned_gain_valid ? "Tuned Gain: valid" : "Tuned Gain: invalid",
    status.tuned_gain_valid ? "ready" : "warn",
  );
  setPill(el.heaterState, `Heater: ${status.heater_state_name || "IDLE"}`, stateClass(status.heater_state_name));
  el.autoApply.checked = state.autoApply;
}

function renderChart() {
  const canvas = el.trendChart;
  const rect = canvas.getBoundingClientRect();
  const dpr = window.devicePixelRatio || 1;
  canvas.width = Math.max(360, Math.floor(rect.width * dpr));
  canvas.height = Math.max(240, Math.floor(rect.height * dpr));

  const ctx = canvas.getContext("2d");
  ctx.setTransform(dpr, 0, 0, dpr, 0, 0);

  const width = rect.width || 900;
  const height = rect.height || 380;
  const pad = { left: 50, right: 24, top: 18, bottom: 34 };
  const plotW = Math.max(1, width - pad.left - pad.right);
  const plotH = Math.max(1, height - pad.top - pad.bottom);
  const samples = state.samples.slice(-360);

  ctx.clearRect(0, 0, width, height);
  ctx.fillStyle = "#ffffff";
  ctx.fillRect(0, 0, width, height);
  drawGrid(ctx, pad, plotW, plotH, width, height);

  el.sampleCount.textContent = `${samples.length} samples`;
  if (samples.length < 2) return;

  const temps = samples.flatMap((sample) => [
    sample.current_temp,
    sample.target_temp,
    sample.error,
  ]).filter((value) => Number.isFinite(Number(value)));
  const minTemp = Math.floor(Math.min(0, 20, ...temps) / 5) * 5;
  const maxTemp = Math.ceil(Math.max(100, ...temps) / 5) * 5;
  const t0 = samples[0].time_sec;
  const t1 = samples[samples.length - 1].time_sec;
  const span = Math.max(1, t1 - t0);

  const x = (sample) => pad.left + ((sample.time_sec - t0) / span) * plotW;
  const yTemp = (value) => pad.top + (1 - (value - minTemp) / (maxTemp - minTemp || 1)) * plotH;
  const yPercent = (value) => pad.top + (1 - clamp(Number(value), 0, 100) / 100) * plotH;

  drawSeries(ctx, samples, x, (sample) => yTemp(sample.target_temp), "#ca8a04", 2);
  drawSeries(ctx, samples, x, (sample) => yTemp(sample.current_temp), "#0891b2", 2.5);
  drawSeries(ctx, samples, x, (sample) => yPercent(sample.u_percent), "#2563eb", 1.8);
  drawSeries(ctx, samples, x, (sample) => yPercent(sample.duty_percent), "#16a34a", 1.8);
  drawSeries(ctx, samples, x, (sample) => yTemp(sample.error), "#dc2626", 1.5);
}

function drawGrid(ctx, pad, plotW, plotH, width, height) {
  ctx.strokeStyle = "#e2e8f0";
  ctx.lineWidth = 1;
  ctx.strokeRect(pad.left, pad.top, plotW, plotH);
  ctx.fillStyle = "#64748b";
  ctx.font = "12px Segoe UI, Arial, sans-serif";
  ctx.textAlign = "right";
  ctx.textBaseline = "middle";

  for (let i = 0; i <= 4; i += 1) {
    const y = pad.top + (plotH / 4) * i;
    ctx.beginPath();
    ctx.moveTo(pad.left, y);
    ctx.lineTo(width - pad.right, y);
    ctx.stroke();
    ctx.fillText(`${100 - i * 25}`, pad.left - 8, y);
  }

  ctx.textAlign = "center";
  ctx.textBaseline = "top";
  ctx.fillText("time", pad.left + plotW / 2, height - 22);
}

function drawSeries(ctx, samples, x, y, color, width) {
  ctx.strokeStyle = color;
  ctx.lineWidth = width;
  ctx.lineJoin = "round";
  ctx.lineCap = "round";
  ctx.beginPath();
  samples.forEach((sample, index) => {
    const px = x(sample);
    const py = y(sample);
    if (!Number.isFinite(px) || !Number.isFinite(py)) return;
    if (index === 0) ctx.moveTo(px, py);
    else ctx.lineTo(px, py);
  });
  ctx.stroke();
}

function addLog(message) {
  state.events.unshift(message);
  state.events = state.events.slice(0, 160);
  renderLog();
}

function renderLog() {
  el.eventLog.innerHTML = "";
  for (const item of state.events) {
    const li = document.createElement("li");
    const time = document.createElement("time");
    time.textContent = formatTime(item.timestamp);
    const body = document.createElement("div");
    body.className = item.level || "info";
    body.textContent = item.message || JSON.stringify(item);
    li.append(time, body);
    el.eventLog.append(li);
  }
}

function localLog(level, message) {
  return {
    type: "event.log",
    timestamp: new Date().toISOString(),
    level,
    message,
  };
}

function setPill(node, text, className) {
  node.textContent = text;
  node.className = `pill ${className || ""}`.trim();
}

function stateClass(name) {
  if (name === "FAULT") return "fault";
  if (name === "RUN" || name === "STABLE" || name === "AUTO_TUNE") return "ready";
  return "warn";
}

function autoTuneClass(name) {
  if (name === "FAIL" || name === "ABORT") return "fault";
  if (name === "DONE") return "ready";
  if (name && name !== "IDLE") return "ready";
  return "warn";
}

function valueOrDash(value, digits) {
  const number = Number(value);
  return Number.isFinite(number) ? number.toFixed(digits) : "--";
}

function tempText(value) {
  const number = Number(value);
  return Number.isFinite(number) ? `${number.toFixed(1)} C` : "--";
}

function percentText(value) {
  const number = Number(value);
  return Number.isFinite(number) ? `${number.toFixed(1)} %` : "--";
}

function trimNumber(value, digits) {
  const number = Number(value);
  if (!Number.isFinite(number)) return "";
  return Number(number.toFixed(digits)).toString();
}

function formatTime(value) {
  if (!value) return "";
  const date = new Date(value);
  if (Number.isNaN(date.getTime())) return value;
  return date.toLocaleTimeString();
}

function clamp(value, low, high) {
  return Math.max(low, Math.min(high, value));
}

el.headerStartBtn.addEventListener("click", () => postJson("/api/control/run", commandPayload()));
el.headerStopBtn.addEventListener("click", () => postJson("/api/control/stop"));
el.applyParamsBtn.addEventListener("click", () => postJson("/api/control/params", commandPayload()));
el.runBtn.addEventListener("click", () => postJson("/api/control/run", commandPayload()));
el.stopBtn.addEventListener("click", () => postJson("/api/control/stop"));
el.resetBtn.addEventListener("click", () => postJson("/api/control/reset"));
el.autoTuneBtn.addEventListener("click", () => postJson("/api/autotune/start", commandPayload()));
el.applyTuneBtn.addEventListener("click", () => postJson("/api/autotune/apply", commandPayload()));
el.autoApply.addEventListener("change", () => {
  state.autoApply = el.autoApply.checked;
  postJson("/api/autotune/auto-apply", { enabled: state.autoApply });
});
el.clearLogBtn.addEventListener("click", () => {
  state.events = [];
  renderLog();
});
window.addEventListener("resize", renderChart);

setupChannelSelect();
loadHealth();
fetch("/api/status")
  .then((response) => response.json())
  .then((payload) => {
    if (payload.status) applyStatus(payload.status);
  })
  .catch(() => {
    setPill(el.backendState, "Backend: unavailable", "fault");
  });
connectWebSocket();
renderAll();
