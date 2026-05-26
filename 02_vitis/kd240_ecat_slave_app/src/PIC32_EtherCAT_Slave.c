/*
* This source file is part of the EtherCAT Slave Stack Code licensed by Beckhoff Automation GmbH & Co KG, 33415 Verl, Germany.
* The corresponding license agreement applies. This hint shall not be removed.
*/

/**
\file PIC32_EtherCAT_Slave.c
\brief KD240 EtherCAT Slave Application - A53 Heater PI Control Mode
 Created with SSC Tool application parser 1.6.4.0
\version 0.0.0.1
*/

/* =========================================================
 * 1. Includes
 * ========================================================= */
#include "ecat_debug.h"
#include "ecat_def.h"

#include "applInterface.h"
#include "xil_io.h"
#include "xil_cache.h"
#include "xil_types.h"

#include "shared_memory.h"
#include "a53_shared_memory.h"

#define _PIC32__ETHER_CAT__SLAVE_ 1
#include "PIC32_EtherCAT_Slave.h"
#undef _PIC32__ETHER_CAT__SLAVE_

/* =========================================================
 * 2. Heater AXI Register Map
 * ========================================================= */
#define HEATER_BASE_ADDR             0xA0020000U

#define HEATER_REG_CTRL              0x00U
#define HEATER_REG_TARGET            0x04U
#define HEATER_REG_KP                0x08U
#define HEATER_REG_KI                0x0CU

#define HEATER_REG_CURRENT_T         0x10U
#define HEATER_REG_ERROR             0x14U
#define HEATER_REG_U_CTRL            0x18U
#define HEATER_REG_STATE             0x1CU
#define HEATER_REG_DUTY_CNT          0x24U

#define HEATER_REG_CONTROL_MODE      0x30U
#define HEATER_REG_PS_U_CTRL         0x34U
#define HEATER_REG_PS_ERROR          0x38U
#define HEATER_REG_PS_STATE          0x3CU

#define HEATER_CONTROL_MODE_PL       0U
#define HEATER_CONTROL_MODE_A53      1U

/* =========================================================
 * 3. Heater Application Constants
 * ========================================================= */
#define HEATER_STATE_IDLE            0U
#define HEATER_STATE_RUN             1U
#define HEATER_STATE_STABLE          2U
#define HEATER_STATE_FAULT           3U
#define HEATER_STATE_AUTO_TUNE       4U

#define CTRL_BIT_RUN                 0x0001U
#define CTRL_BIT_STOP                0x0002U
#define CTRL_BIT_RESET               0x0004U

#define CTRL_BIT_AUTO_TUNE_START     0x0008U
#define CTRL_BIT_APPLY_TUNED_GAIN    0x0010U

#define HEATER_CONTROL_PERIOD_SEC    0.1f
#define HEATER_CONTROL_PERIOD_MS     100U
#define HEATER_FILTER_ALPHA          0.2f

#define HEATER_TEMP_MIN_C            0.0f
#define HEATER_TEMP_MAX_C            150.0f

#define HEATER_STABLE_BAND_C            1.0f
#define HEATER_STABLE_EXIT_BAND_C       2.0f
#define HEATER_STABLE_HOLD_SEC          10.0f
#define HEATER_STABLE_EXIT_HOLD_SEC     3.0f
#define HEATER_STABLE_SLOPE_LIMIT_C_S   0.10f
#define HEATER_U_SAT_LOW                0.02f
#define HEATER_U_SAT_HIGH               0.98f

#define HEATER_U_MIN                 0.0f
#define HEATER_U_MAX                 1.0f
#define HEATER_I_MIN                (-1.0f)
#define HEATER_I_MAX                 1.0f

#define HEATER_DUTY_MAX_CNT          100000U

/* =========================================================
 * 4. External Time Base
 * =========================================================
 * Defined in SPIDriver.c.
 * This tick is incremented by the TTC 1 ms interrupt handler.
 */
extern volatile UINT32 g_heater_1ms_tick;

/* =========================================================
 * 5. Local Types / Variables
 * ========================================================= */
typedef struct
{
    UINT16 state;

    UINT16 control_word;
    UINT16 prev_control_word;

    UINT8 run_cmd;
    UINT8 stop_pulse;
    UINT8 reset_pulse;

    UINT8 fault_active;
    UINT8 filter_initialized;

    float target_temp;
    float current_temp;
    float filtered_temp;
    float prev_filtered_temp;
    float error;
    float temp_slope;

    float kp;
    float ki;

    float p_term;
    float i_term;
    float u_ctrl;

    float stable_timer_sec;
    float unstable_timer_sec;

    UINT32 duty_cnt;
} HeaterApp_t;

static HeaterApp_t g_heater =
{
    HEATER_STATE_IDLE,
    0U,
    0U,
    0U,
    0U,
    0U,
    0U,
    0U,
    80.0f,
    25.0f,
    25.0f,
    25.0f,
    0.0f,
    0.0f,
    0.03f,
    0.0001f,
    0.0f,
    0.0f,
    0.0f,
    0.0f,
    0.0f,
    0U
};

/* =========================================================
 * 6. Generic Little-Endian Helpers
 * ========================================================= */
static UINT16 ReadU16LE(const UINT8 *p)
{
    return (UINT16)(((UINT16)p[0]) |
                    ((UINT16)p[1] << 8));
}

static void WriteU16LE(UINT8 *p, UINT16 value)
{
    p[0] = (UINT8)(value & 0xFFU);
    p[1] = (UINT8)((value >> 8) & 0xFFU);
}

static UINT32 ReadU32LE(const UINT8 *p)
{
    return ((UINT32)p[0]) |
           ((UINT32)p[1] << 8) |
           ((UINT32)p[2] << 16) |
           ((UINT32)p[3] << 24);
}

static void WriteU32LE(UINT8 *p, UINT32 value)
{
    p[0] = (UINT8)(value & 0xFFU);
    p[1] = (UINT8)((value >> 8) & 0xFFU);
    p[2] = (UINT8)((value >> 16) & 0xFFU);
    p[3] = (UINT8)((value >> 24) & 0xFFU);
}

static float U32ToF32(UINT32 raw)
{
    union
    {
        UINT32 u32;
        float f32;
    } conv;

    conv.u32 = raw;
    return conv.f32;
}

static UINT32 F32ToU32(float value)
{
    union
    {
        UINT32 u32;
        float f32;
    } conv;

    conv.f32 = value;
    return conv.u32;
}

static float AbsF32(float value)
{
    return (value < 0.0f) ? -value : value;
}

static float ClampF32(float value, float minValue, float maxValue)
{
    if (value < minValue)
    {
        return minValue;
    }

    if (value > maxValue)
    {
        return maxValue;
    }

    return value;
}

/* =========================================================
 * 7. Heater AXI Access Helpers
 * ========================================================= */
static void Heater_WriteReg(UINT32 offset, UINT32 value)
{
    Xil_Out32(HEATER_BASE_ADDR + offset, value);
}

static UINT32 Heater_ReadReg(UINT32 offset)
{
    return Xil_In32(HEATER_BASE_ADDR + offset);
}

static UINT32 Heater_UCtrlToDutyCnt(float uCtrl)
{
    float clamped;
    float dutyFloat;

    clamped = ClampF32(uCtrl, HEATER_U_MIN, HEATER_U_MAX);
    dutyFloat = clamped * (float)HEATER_DUTY_MAX_CNT;

    if (dutyFloat <= 0.0f)
    {
        return 0U;
    }

    if (dutyFloat >= (float)HEATER_DUTY_MAX_CNT)
    {
        return HEATER_DUTY_MAX_CNT;
    }

    return (UINT32)(dutyFloat + 0.5f);
}

static void Heater_WriteA53ControlToPl(const HeaterApp_t *p)
{
    Heater_WriteReg(HEATER_REG_CONTROL_MODE, HEATER_CONTROL_MODE_A53);
    Heater_WriteReg(HEATER_REG_PS_U_CTRL,    F32ToU32(p->u_ctrl));
    Heater_WriteReg(HEATER_REG_PS_ERROR,     F32ToU32(p->error));
    Heater_WriteReg(HEATER_REG_PS_STATE,     (UINT32)p->state);
}

static void Heater_WriteA53OffToPl(const HeaterApp_t *p)
{
    Heater_WriteReg(HEATER_REG_CONTROL_MODE, HEATER_CONTROL_MODE_A53);
    Heater_WriteReg(HEATER_REG_PS_U_CTRL,    F32ToU32(0.0f));
    Heater_WriteReg(HEATER_REG_PS_ERROR,     F32ToU32(p->error));
    Heater_WriteReg(HEATER_REG_PS_STATE,     (UINT32)p->state);
}

/* =========================================================
 * 8. Heater Control Logic - A53 Actual Control Mode
 * ========================================================= */
static void Heater_ResetControl(HeaterApp_t *p)
{
    p->state = HEATER_STATE_IDLE;

    p->fault_active = 0U;
    p->filter_initialized = 0U;

    p->current_temp = 25.0f;
    p->filtered_temp = 25.0f;
    p->prev_filtered_temp = 25.0f;
    p->temp_slope = 0.0f;
    p->error = p->target_temp - p->filtered_temp;

    p->p_term = 0.0f;
    p->i_term = 0.0f;
    p->u_ctrl = 0.0f;

    p->stable_timer_sec = 0.0f;
    p->unstable_timer_sec = 0.0f;

    p->duty_cnt = 0U;
}

static void Heater_StopControl(HeaterApp_t *p)
{
    p->state = HEATER_STATE_IDLE;

    p->p_term = 0.0f;
    p->i_term = 0.0f;
    p->u_ctrl = 0.0f;

    p->stable_timer_sec = 0.0f;
    p->unstable_timer_sec = 0.0f;

    p->duty_cnt = 0U;
}

static void Heater_UpdateMeasuredTemperature(HeaterApp_t *p, float dtSec)
{
    UINT32 currentRaw;
    float currentTemp;

    currentRaw = Heater_ReadReg(HEATER_REG_CURRENT_T);
    currentTemp = U32ToF32(currentRaw);

    p->current_temp = currentTemp;

    if (p->filter_initialized == 0U)
    {
        p->filtered_temp = currentTemp;
        p->prev_filtered_temp = currentTemp;
        p->filter_initialized = 1U;
    }
    else
    {
        p->prev_filtered_temp = p->filtered_temp;
        p->filtered_temp =
            (HEATER_FILTER_ALPHA * currentTemp) +
            ((1.0f - HEATER_FILTER_ALPHA) * p->filtered_temp);
    }

    if (dtSec > 0.0f)
    {
        p->temp_slope = (p->filtered_temp - p->prev_filtered_temp) / dtSec;
    }
    else
    {
        p->temp_slope = 0.0f;
    }

    p->error = p->target_temp - p->filtered_temp;
}

static void Heater_UpdateFault(HeaterApp_t *p)
{
    if ((p->current_temp < HEATER_TEMP_MIN_C) ||
        (p->current_temp > HEATER_TEMP_MAX_C))
    {
        p->fault_active = 1U;
    }
    else
    {
        p->fault_active = 0U;
    }
}

static void Heater_RunPI(HeaterApp_t *p, float dtSec)
{
    float iCandidate;
    float uUnsat;
    float uSat;
    UINT8 allowIntegration;

    p->p_term = p->kp * p->error;

    /* Industrial-style integral calculation:
     * I[k] = I[k-1] + Ki * error * dt
     */
    iCandidate = p->i_term + (p->ki * p->error * dtSec);
    iCandidate = ClampF32(iCandidate, HEATER_I_MIN, HEATER_I_MAX);

    uUnsat = p->p_term + iCandidate;
    uSat = ClampF32(uUnsat, HEATER_U_MIN, HEATER_U_MAX);

    /* Conditional integration anti-windup. */
    allowIntegration = 0U;

    if (uUnsat == uSat)
    {
        allowIntegration = 1U;
    }
    else if ((uSat >= HEATER_U_MAX) && (p->error < 0.0f))
    {
        allowIntegration = 1U;
    }
    else if ((uSat <= HEATER_U_MIN) && (p->error > 0.0f))
    {
        allowIntegration = 1U;
    }
    else
    {
        allowIntegration = 0U;
    }

    if (allowIntegration != 0U)
    {
        p->i_term = iCandidate;
    }

    uUnsat = p->p_term + p->i_term;
    p->u_ctrl = ClampF32(uUnsat, HEATER_U_MIN, HEATER_U_MAX);
    p->duty_cnt = Heater_UCtrlToDutyCnt(p->u_ctrl);
}

static void Heater_UpdateStableJudge(HeaterApp_t *p, float dtSec)
{
    UINT8 stableCondition = 0U;
    UINT8 unstableCondition = 0U;

    /*
     * Stable 진입 조건:
     * 1. 목표 온도 ±1°C 이내
     * 2. 온도 변화율이 충분히 작음
     * 3. 출력이 0% 또는 100%에 붙어 있지 않음
     * 4. Fault 없음
     */
    if ((AbsF32(p->error) <= HEATER_STABLE_BAND_C) &&
        (AbsF32(p->temp_slope) <= HEATER_STABLE_SLOPE_LIMIT_C_S) &&
        (p->u_ctrl > HEATER_U_SAT_LOW) &&
        (p->u_ctrl < HEATER_U_SAT_HIGH) &&
        (p->fault_active == 0U))
    {
        stableCondition = 1U;
    }

    /*
     * Stable 이탈 조건:
     * 목표 온도 ±2°C를 벗어나면 일정 시간 후 RUN으로 복귀
     */
    if ((AbsF32(p->error) > HEATER_STABLE_EXIT_BAND_C) ||
        (p->fault_active != 0U))
    {
        unstableCondition = 1U;
    }

    if (stableCondition != 0U)
    {
        p->stable_timer_sec += dtSec;
    }
    else
    {
        p->stable_timer_sec = 0.0f;
    }

    if (unstableCondition != 0U)
    {
        p->unstable_timer_sec += dtSec;
    }
    else
    {
        p->unstable_timer_sec = 0.0f;
    }
}

static void Heater_ControlStep(HeaterApp_t *p, float dtSec)
{
    Heater_UpdateMeasuredTemperature(p, dtSec);
    Heater_UpdateFault(p);

    if (p->reset_pulse != 0U)
    {
        Heater_ResetControl(p);
        p->reset_pulse = 0U;
        p->stop_pulse = 0U;
        Heater_WriteA53OffToPl(p);
        return;
    }

    if (p->stop_pulse != 0U)
    {
        Heater_StopControl(p);
        p->stop_pulse = 0U;
        Heater_WriteA53OffToPl(p);
        return;
    }

    if (p->fault_active != 0U)
    {
        p->state = HEATER_STATE_FAULT;
        p->u_ctrl = 0.0f;
        p->duty_cnt = 0U;
        Heater_WriteA53OffToPl(p);
        return;
    }

    switch (p->state)
    {
    case HEATER_STATE_IDLE:
        p->u_ctrl = 0.0f;
        p->duty_cnt = 0U;
        p->stable_timer_sec = 0.0f;
        p->unstable_timer_sec = 0.0f;

        if (p->run_cmd != 0U)
        {
            p->state = HEATER_STATE_RUN;
        }
        break;

    case HEATER_STATE_RUN:
        if (p->run_cmd == 0U)
        {
            Heater_StopControl(p);
            break;
        }

        Heater_RunPI(p, dtSec);
        Heater_UpdateStableJudge(p, dtSec);

        if (p->stable_timer_sec >= HEATER_STABLE_HOLD_SEC)
        {
            p->state = HEATER_STATE_STABLE;
        }
        break;

    case HEATER_STATE_STABLE:
        if (p->run_cmd == 0U)
        {
            Heater_StopControl(p);
            break;
        }

        /* STABLE means stable maintenance, not control stop. */
        Heater_RunPI(p, dtSec);
        Heater_UpdateStableJudge(p, dtSec);

        if (p->unstable_timer_sec >= HEATER_STABLE_EXIT_HOLD_SEC)
        {
            p->state = HEATER_STATE_RUN;
        }
        break;

    case HEATER_STATE_FAULT:
        p->u_ctrl = 0.0f;
        p->duty_cnt = 0U;
        break;

    default:
        p->state = HEATER_STATE_FAULT;
        p->u_ctrl = 0.0f;
        p->duty_cnt = 0U;
        break;
    }

    Heater_WriteA53ControlToPl(p);
}

static UINT8 Heater_IsControlPeriodElapsed(float *pDtSec)
{
    static UINT8 initialized = 0U;
    static UINT32 lastTickMs = 0U;

    UINT32 nowTickMs;
    UINT32 elapsedMs;

    nowTickMs = g_heater_1ms_tick;

    if (initialized == 0U)
    {
        lastTickMs = nowTickMs;
        initialized = 1U;
        *pDtSec = HEATER_CONTROL_PERIOD_SEC;
        return 0U;
    }

    elapsedMs = nowTickMs - lastTickMs;

    if (elapsedMs >= HEATER_CONTROL_PERIOD_MS)
    {
        *pDtSec = ((float)elapsedMs) * 0.001f;

        if (*pDtSec > 0.5f)
        {
            *pDtSec = 0.5f;
        }

        lastTickMs = nowTickMs;
        return 1U;
    }

    return 0U;
}

void Heater_A53ControlTask(void)
{
    static UINT32 prevTick = 0U;
    UINT32 nowTick;
    UINT32 elapsedMs;

    nowTick = g_heater_1ms_tick;
    elapsedMs = nowTick - prevTick;

    if (elapsedMs >= HEATER_CONTROL_PERIOD_MS)
    {
        prevTick = nowTick;

        Heater_ControlStep(&g_heater,
                           ((float)elapsedMs) / 1000.0f);
    }
}

static void Heater_UpdateCommandFromRxPdo(UINT16 controlWord,
                                          UINT32 targetRaw,
                                          UINT32 kpRaw,
                                          UINT32 kiRaw)
{
    UINT16 prevControlWord;

    prevControlWord = g_heater.prev_control_word;

    g_heater.control_word = controlWord;
    g_heater.target_temp  = U32ToF32(targetRaw);
    g_heater.kp           = U32ToF32(kpRaw);
    g_heater.ki           = U32ToF32(kiRaw);

    g_heater.run_cmd = ((controlWord & CTRL_BIT_RUN) != 0U) ? 1U : 0U;

    if (((controlWord & CTRL_BIT_STOP) != 0U) &&
        ((prevControlWord & CTRL_BIT_STOP) == 0U))
    {
        g_heater.stop_pulse = 1U;
    }

    if (((controlWord & CTRL_BIT_RESET) != 0U) &&
        ((prevControlWord & CTRL_BIT_RESET) == 0U))
    {
        g_heater.reset_pulse = 1U;
    }

    g_heater.prev_control_word = controlWord;
}

static UINT32 Heater_MakeCtrlRegValue(UINT16 controlWord, UINT16 prevControlWord)
{
    UINT32 ctrlRegValue;

    ctrlRegValue = 0U;

    if ((controlWord & CTRL_BIT_RUN) != 0U)
    {
        ctrlRegValue |= 0x00000001U;
    }

    if (((controlWord & CTRL_BIT_STOP) != 0U) &&
        ((prevControlWord & CTRL_BIT_STOP) == 0U))
    {
        ctrlRegValue |= 0x00000002U;
    }

    if (((controlWord & CTRL_BIT_RESET) != 0U) &&
        ((prevControlWord & CTRL_BIT_RESET) == 0U))
    {
        ctrlRegValue |= 0x00000004U;
    }

    return ctrlRegValue;
}

static UINT16 Heater_MakeStatusWord(UINT16 packedState)
{
    UINT16 status;
    UINT16 heaterState;
    UINT16 autoTuneState;

    status = 0U;

    heaterState = (UINT16)(packedState & 0x00FFU);
    autoTuneState = (UINT16)((packedState >> 8) & 0x00FFU);

    /*
     * bit0: RUN
     * bit1: STABLE
     * bit2: FAULT
     * bit3: AUTO_TUNE heater state
     * bit4: AUTO_TUNE DONE
     * bit5: AUTO_TUNE FAIL/ABORT
     */
    if (heaterState == 1U)
    {
        status |= 0x0001U;
    }

    if (heaterState == 2U)
    {
        status |= 0x0002U;
    }

    if (heaterState == 3U)
    {
        status |= 0x0004U;
    }

    if (heaterState == HEATER_STATE_AUTO_TUNE)
    {
        status |= 0x0008U;
    }

    if (autoTuneState == 4U)
    {
        status |= 0x0010U;
    }

    if ((autoTuneState == 5U) || (autoTuneState == 6U))
    {
        status |= 0x0020U;
    }

    return status;
}

static void A53_WriteRxPdoToSharedMemory(UINT16 controlWord,
                                         UINT32 targetRaw,
                                         UINT32 kpRaw,
                                         UINT32 kiRaw)
{
    static UINT16 prevControlWord = 0U;
    static UINT8 pendingAutoTuneStartClear = 0U;

    UINT16 risingEdge;

    float targetTemp;
    float kp;
    float ki;

    A53_SharedMemoryStatus_t st;

    targetTemp = U32ToF32(targetRaw);
    kp = U32ToF32(kpRaw);
    ki = U32ToF32(kiRaw);

    risingEdge = (UINT16)(controlWord & ((UINT16)(~prevControlWord)));

    /*
     * AUTO_TUNE_START is a pulse command for R5.
     * After R5 confirms AUTO_TUNE state, clear shared memory control_word.
     */
    if (pendingAutoTuneStartClear != 0U)
    {
        A53_SharedMemory_ReadStatus(&st);

        if ((st.state == HEATER_STATE_AUTO_TUNE) || (st.auto_tune_state != 0U))
        {
            A53_SharedMemory_ClearControlWord();

            DBG_SM("[PDO] R5 AUTO_TUNE confirmed -> clear control_word");

            pendingAutoTuneStartClear = 0U;
        }
    }

    /*
     * STOP command.
     */
    if ((risingEdge & CTRL_BIT_STOP) != 0U)
    {
        A53_SharedMemory_SendStop();

        DBG_SM("[PDO] STOP command");
    }

    /*
     * RUN command.
     * RUN is sent only on rising edge.
     * Even if PC clears ControlWord later, A53 does not clear shared memory RUN.
     */
    if ((risingEdge & CTRL_BIT_RUN) != 0U)
    {
        A53_SharedMemory_SendRun(targetTemp,
                                 kp,
                                 ki);

        DBG_SM("[PDO] RUN command: target_x100=%ld, kp_x10000=%ld, ki_x1000000=%ld",
               (long)(targetTemp * 100.0f),
               (long)(kp * 10000.0f),
               (long)(ki * 1000000.0f));
    }

    /*
     * AUTO_TUNE_START command.
     * Current test version uses fixed Auto Tune parameters.
     */
    if ((risingEdge & CTRL_BIT_AUTO_TUNE_START) != 0U)
    {
        A53_SharedMemory_SendAutoTuneStart(0.20f,
                                           0.2f,
                                           0.02f,
                                           300000U);

        DBG_SM("[PDO] AUTO_TUNE_START command");

        pendingAutoTuneStartClear = 1U;
    }

    /*
     * Apply tuned gain and run.
     * Target temperature is taken from RxPDO TargetTempRaw.
     */
    if ((risingEdge & CTRL_BIT_APPLY_TUNED_GAIN) != 0U)
    {
        A53_SharedMemory_ApplyTunedGainAndRun(targetTemp);

        DBG_SM("[PDO] APPLY_TUNED_GAIN_AND_RUN command: target_x100=%ld",
               (long)(targetTemp * 100.0f));
    }

    /*
     * RESET is not used yet for R5 path.
     * It can be connected later if needed.
     */
    if ((risingEdge & CTRL_BIT_RESET) != 0U)
    {
        DBG_SM("[PDO] RESET command received, not implemented yet");
    }

    prevControlWord = controlWord;
}

static void A53_ReadR5StatusFromSharedMemory(UINT16 *pState,
                                             UINT32 *pCurrentTempRaw,
                                             UINT32 *pErrorRaw,
                                             UINT32 *pUCtrlRaw,
                                             UINT32 *pDutyCnt,
                                             UINT32 *pTuneKRaw,
                                             UINT32 *pTuneLRaw,
                                             UINT32 *pTuneTRaw,
                                             UINT32 *pTuneKpRaw,
                                             UINT32 *pTuneKiRaw,
                                             UINT32 *pTunedGainValid,
                                             UINT32 *pAutoTuneError)
{
    A53_SharedMemoryStatus_t st;
    UINT16 packedState;

    A53_SharedMemory_ReadStatus(&st);

    /*
     * State packing:
     *   low byte  = heater_state
     *   high byte = auto_tune_state
     */
    packedState = (UINT16)((st.state & 0x00FFU) |
                           ((st.auto_tune_state & 0x00FFU) << 8));

    *pState = packedState;
    *pCurrentTempRaw = F32ToU32(st.current_temp);
    *pErrorRaw = F32ToU32(st.error);
    *pUCtrlRaw = F32ToU32(st.u_ctrl);
    *pDutyCnt = st.duty_count;

    /* Auto Tune result fields */
    *pTuneKRaw = F32ToU32(st.tune_K);
    *pTuneLRaw = F32ToU32(st.tune_L);
    *pTuneTRaw = F32ToU32(st.tune_T);
    *pTuneKpRaw = F32ToU32(st.tune_kp);
    *pTuneKiRaw = F32ToU32(st.tune_ki);
    *pTunedGainValid = st.tuned_gain_valid;
    *pAutoTuneError = st.auto_tune_error;
}

void APPL_HeaterControlTask(void)
{
    // Heater_A53ControlTask();
    /*
     * Disabled.
     * Heater PI/FSM control is now handled by R5.
     * A53 only bridges EtherCAT PDO <-> Shared Memory.
     */
}

/* =========================================================
 * 9. SSC Application State Hooks
 * ========================================================= */
void APPL_AckErrorInd(UINT16 stateTrans)
{
    (void)stateTrans;
}

UINT16 APPL_StartMailboxHandler(void)
{
    return ALSTATUSCODE_NOERROR;
}

UINT16 APPL_StopMailboxHandler(void)
{
    return ALSTATUSCODE_NOERROR;
}

UINT16 APPL_StartInputHandler(UINT16 *pIntMask)
{
    (void)pIntMask;
    return ALSTATUSCODE_NOERROR;
}

UINT16 APPL_StopInputHandler(void)
{
    return ALSTATUSCODE_NOERROR;
}

UINT16 APPL_StartOutputHandler(void)
{
    return ALSTATUSCODE_NOERROR;
}

UINT16 APPL_StopOutputHandler(void)
{
    return ALSTATUSCODE_NOERROR;
}

/* =========================================================
 * 10. PDO Mapping
 * ========================================================= */
UINT16 APPL_GenerateMapping(UINT16 *pInputSize, UINT16 *pOutputSize)
{
    *pInputSize  = 48U;  /* TxPDO, Slave -> Master */
    *pOutputSize = 14U;  /* RxPDO, Master -> Slave */

    DBG_APP("PDO fixed size: Input=%u bytes, Output=%u bytes",
            (unsigned int)(*pInputSize),
            (unsigned int)(*pOutputSize));

    return ALSTATUSCODE_NOERROR;
}

void APPL_InputMapping(UINT16* pData)
{
    UINT8 *pTxPdo;
    UINT16 state;
    UINT16 statusWord;

    UINT32 currentTempRaw;
    UINT32 errorRaw;
    UINT32 uCtrlRaw;
    UINT32 dutyCnt;

    UINT32 tuneKRaw;
    UINT32 tuneLRaw;
    UINT32 tuneTRaw;
    UINT32 tuneKpRaw;
    UINT32 tuneKiRaw;
    UINT32 tunedGainValid;
    UINT32 autoTuneError;

    pTxPdo = (UINT8 *)pData;

    /*
     * R5 -> Shared Memory -> A53 -> TxPDO
     */
    A53_ReadR5StatusFromSharedMemory(&state,
                                     &currentTempRaw,
                                     &errorRaw,
                                     &uCtrlRaw,
                                     &dutyCnt,
                                     &tuneKRaw,
                                     &tuneLRaw,
                                     &tuneTRaw,
                                     &tuneKpRaw,
                                     &tuneKiRaw,
                                     &tunedGainValid,
                                     &autoTuneError);

    statusWord = Heater_MakeStatusWord(state);

    if (tunedGainValid != 0U)
    {
        statusWord |= 0x0040U;
    }

    Results0x6000.StatusWord     = statusWord;
    Results0x6000.State          = state;
    Results0x6000.CurrentTempRaw = currentTempRaw;
    Results0x6000.ErrorRaw       = errorRaw;
    Results0x6000.UCtrlRaw       = uCtrlRaw;
    Results0x6000.DutyCnt        = dutyCnt;

    /*
     * TxPDO layout, Slave -> Master, 48 bytes
     * offset 0  : StatusWord      UINT16
     * offset 2  : State           UINT16
     *             low byte  = heater_state
     *             high byte = auto_tune_state
     * offset 4  : CurrentTempRaw  UINT32, IEEE754 float raw
     * offset 8  : ErrorRaw        UINT32, IEEE754 float raw
     * offset 12 : UCtrlRaw        UINT32, IEEE754 float raw
     * offset 16 : DutyCnt         UINT32
     * offset 20 : TuneKRaw        UINT32, IEEE754 float raw
     * offset 24 : TuneLRaw        UINT32, IEEE754 float raw
     * offset 28 : TuneTRaw        UINT32, IEEE754 float raw
     * offset 32 : TuneKpRaw       UINT32, IEEE754 float raw
     * offset 36 : TuneKiRaw       UINT32, IEEE754 float raw
     * offset 40 : TunedGainValid  UINT32
     * offset 44 : AutoTuneError   UINT32
     */
    WriteU16LE(&pTxPdo[0],  Results0x6000.StatusWord);
    WriteU16LE(&pTxPdo[2],  Results0x6000.State);
    WriteU32LE(&pTxPdo[4],  Results0x6000.CurrentTempRaw);
    WriteU32LE(&pTxPdo[8],  Results0x6000.ErrorRaw);
    WriteU32LE(&pTxPdo[12], Results0x6000.UCtrlRaw);
    WriteU32LE(&pTxPdo[16], Results0x6000.DutyCnt);
    WriteU32LE(&pTxPdo[20], tuneKRaw);
    WriteU32LE(&pTxPdo[24], tuneLRaw);
    WriteU32LE(&pTxPdo[28], tuneTRaw);
    WriteU32LE(&pTxPdo[32], tuneKpRaw);
    WriteU32LE(&pTxPdo[36], tuneKiRaw);
    WriteU32LE(&pTxPdo[40], tunedGainValid);
    WriteU32LE(&pTxPdo[44], autoTuneError);

    DBG_INC(g_dbg_in_map_count);
}

void APPL_OutputMapping(UINT16* pData)
{
    UINT8 *pRxPdo;

    pRxPdo = (UINT8 *)pData;

    /*
     * RxPDO layout, Master -> Slave, 14 bytes
     * offset 0  : ControlWord   UINT16
     * offset 2  : TargetTempRaw UINT32, IEEE754 float raw
     * offset 6  : KpRaw         UINT32, IEEE754 float raw
     * offset 10 : KiRaw         UINT32, IEEE754 float raw
     */
    SetpointValues0x7000.ControlWord   = ReadU16LE(&pRxPdo[0]);
    SetpointValues0x7000.TargetTempRaw = ReadU32LE(&pRxPdo[2]);
    SetpointValues0x7000.KpRaw         = ReadU32LE(&pRxPdo[6]);
    SetpointValues0x7000.KiRaw         = ReadU32LE(&pRxPdo[10]);

    /*
     * A53 no longer controls heater_axi directly.
     * RxPDO command is forwarded to R5 through Shared Memory.
     */
    A53_WriteRxPdoToSharedMemory(SetpointValues0x7000.ControlWord,
                                 SetpointValues0x7000.TargetTempRaw,
                                 SetpointValues0x7000.KpRaw,
                                 SetpointValues0x7000.KiRaw);

    DBG_INC(g_dbg_out_map_count);
}

void APPL_Application(void)
{
    /*
     * A53 role:
     * - RxPDO -> Shared Memory
     * - Shared Memory -> TxPDO
     *
     * R5 role:
     * - Timer based PI/FSM control
     * - heater_axi control
     */
    DBG_INC(g_dbg_app_count);
}

#if EXPLICIT_DEVICE_ID
UINT16 APPL_GetDeviceID()
{
#if _WIN32
   #pragma message ("Warning: Implement explicit Device ID latching")
#else
    #warning "Implement explicit Device ID latching"
#endif
    return 0x5;
}
#endif

#if USE_DEFAULT_MAIN
#if _PIC24 && EL9800_HW
int main(void)
#elif _WIN32
int main(int argc, char* argv[])
#else
void main(void)
#endif
{
#if FC1100_HW
#if _WIN32
    u16FcInstance = 0;
    if (argc > 1)
    {
        u16FcInstance = atoi(argv[1]);
    }
#endif
    if(HW_Init())
    {
        HW_Release();
        return;
    }
#else
    HW_Init();
#endif
    MainInit();

    bRunApplication = TRUE;
    do
    {
        MainLoop();
    } while (bRunApplication == TRUE);

    HW_Release();
#if _PIC24
    return 0;
#endif
}
#endif /* USE_DEFAULT_MAIN */
