#include "heater_control.h"
#include "heater_axi.h"

/*
 * =========================================================
 * 1. Control limits
 * =========================================================
 */
#define HEATER_U_MIN                 0.0f
#define HEATER_U_MAX                 1.0f
#define HEATER_I_MIN                (-1.0f)
#define HEATER_I_MAX                 1.0f

/*
 * =========================================================
 * 2. Temperature / fault limits
 * =========================================================
 */
#define HEATER_TEMP_MIN_C            0.0f
#define HEATER_TEMP_MAX_C            150.0f

/*
 * =========================================================
 * 3. Stable judgement parameters
 *
 * Dispenser-oriented conservative stable condition:
 *   1. Temperature error is inside stable band.
 *   2. Temperature slope is sufficiently small.
 *   3. Output is not saturated near 0% or 100%.
 *   4. No fault is active.
 *   5. The above condition is maintained for hold time.
 * =========================================================
 */
#define HEATER_STABLE_BAND_C             1.0f
#define HEATER_STABLE_EXIT_BAND_C        2.0f

#define HEATER_STABLE_HOLD_SEC           10.0f
#define HEATER_STABLE_EXIT_HOLD_SEC      3.0f

#define HEATER_STABLE_SLOPE_LIMIT_C_S    0.10f

#define HEATER_U_SAT_LOW                 0.02f
#define HEATER_U_SAT_HIGH                0.98f

/*
 * Low-pass filter for temperature slope calculation.
 */
#define HEATER_FILTER_ALPHA              0.20f

/*
 * =========================================================
 * 4. dt_sec defensive handling
 *
 * Normal period is HEATER_CONTROL_DT_SEC.
 * If timer scheduling is abnormal, do not use an excessive dt
 * directly in integral calculation or stable timer accumulation.
 * =========================================================
 */
#define HEATER_DT_MIN_SEC                0.001f
#define HEATER_DT_MAX_SEC                0.200f
#define HEATER_DT_FALLBACK_SEC           HEATER_CONTROL_DT_SEC

/*
 * =========================================================
 * 5. Utility functions
 * =========================================================
 */
static float Heater_ClampF32(float value, float min_value, float max_value)
{
    if (value < min_value)
    {
        return min_value;
    }

    if (value > max_value)
    {
        return max_value;
    }

    return value;
}

float Heater_AbsF32(float value)
{
    if (value < 0.0f)
    {
        return -value;
    }

    return value;
}

static float Heater_SanitizeDtSec(float dt_sec)
{
    /*
     * Defensive dt handling:
     * - Normal dt is HEATER_CONTROL_DT_SEC.
     * - If dt is too small or too large, fall back to nominal period.
     * - This protects integral term and stable/unstable timers.
     */
    if (dt_sec < HEATER_DT_MIN_SEC)
    {
        return HEATER_DT_FALLBACK_SEC;
    }

    if (dt_sec > HEATER_DT_MAX_SEC)
    {
        return HEATER_DT_FALLBACK_SEC;
    }

    return dt_sec;
}

/*
 * =========================================================
 * 6. Initialization
 * =========================================================
 */
void Heater_Init(HeaterApp_t *p)
{
    if (p == 0)
    {
        return;
    }

    p->state = HEATER_STATE_IDLE;

    p->fault_active = 0U;
    p->filter_initialized = 0U;

    p->target_temp = 80.0f;
    p->current_temp = 25.0f;
    p->filtered_temp = 25.0f;
    p->prev_filtered_temp = 25.0f;
    p->error = 0.0f;
    p->temp_slope = 0.0f;

    p->kp = 0.040f;
    p->ki = 0.0030f;

    p->p_term = 0.0f;
    p->i_term = 0.0f;
    p->u_ctrl = 0.0f;

    p->stable_timer_sec = 0.0f;
    p->unstable_timer_sec = 0.0f;

    p->duty_cnt = 0U;
}

/*
 * =========================================================
 * 7. Measurement / fault update
 * =========================================================
 */
static void Heater_ResetRuntimeForNewRun(HeaterApp_t *p)
{
    p->fault_active = 0U;
    p->filter_initialized = 0U;

    p->filtered_temp = p->current_temp;
    p->prev_filtered_temp = p->current_temp;
    p->temp_slope = 0.0f;

    p->p_term = 0.0f;
    p->i_term = 0.0f;
    p->u_ctrl = 0.0f;

    p->stable_timer_sec = 0.0f;
    p->unstable_timer_sec = 0.0f;

    p->duty_cnt = 0U;
}

static void Heater_UpdateMeasuredTemperature(HeaterApp_t *p, float dt_sec)
{
    float current_temp;

    current_temp = HeaterAxi_ReadCurrentTemp();

    p->current_temp = current_temp;

    if (p->filter_initialized == 0U)
    {
        p->filtered_temp = current_temp;
        p->prev_filtered_temp = current_temp;
        p->temp_slope = 0.0f;
        p->filter_initialized = 1U;
    }
    else
    {
        p->prev_filtered_temp = p->filtered_temp;

        p->filtered_temp =
            (HEATER_FILTER_ALPHA * current_temp) +
            ((1.0f - HEATER_FILTER_ALPHA) * p->filtered_temp);

        p->temp_slope = (p->filtered_temp - p->prev_filtered_temp) / dt_sec;
    }

    /*
     * Control error uses filtered temperature.
     * current_temp remains raw measured temperature for monitoring.
     */
    p->error = p->target_temp - p->filtered_temp;
}

static void Heater_UpdateFault(HeaterApp_t *p)
{
    if ((p->current_temp < HEATER_TEMP_MIN_C) ||
        (p->current_temp > HEATER_TEMP_MAX_C))
    {
        p->fault_active = 1U;
    }
    else if (p->state == HEATER_STATE_FAULT)
    {
        /*
         * Fault is latched once state enters FAULT.
         * It should be cleared only by Heater_Init(), normally through RESET.
         */
        p->fault_active = 1U;
    }
    else
    {
        p->fault_active = 0U;
    }
}

/*
 * =========================================================
 * 8. PI control
 * =========================================================
 */
static void Heater_RunPI(HeaterApp_t *p, float dt_sec)
{
    float i_candidate;
    float u_unsat;
    float u_sat;
    uint32_t allow_integration;

    p->p_term = p->kp * p->error;

    /*
     * Industrial PI form:
     * I[k] = I[k-1] + Ki * error * dt
     */
    i_candidate = p->i_term + (p->ki * p->error * dt_sec);
    i_candidate = Heater_ClampF32(i_candidate, HEATER_I_MIN, HEATER_I_MAX);

    u_unsat = p->p_term + i_candidate;
    u_sat = Heater_ClampF32(u_unsat, HEATER_U_MIN, HEATER_U_MAX);

    /*
     * Anti-Windup:
     * - Integrate when output is not saturated.
     * - If saturated high, only integrate when error decreases output.
     * - If saturated low, only integrate when error increases output.
     */
    allow_integration = 0U;

    if (u_unsat == u_sat)
    {
        allow_integration = 1U;
    }
    else if ((u_sat >= HEATER_U_MAX) && (p->error < 0.0f))
    {
        allow_integration = 1U;
    }
    else if ((u_sat <= HEATER_U_MIN) && (p->error > 0.0f))
    {
        allow_integration = 1U;
    }
    else
    {
        allow_integration = 0U;
    }

    if (allow_integration != 0U)
    {
        p->i_term = i_candidate;
    }

    u_unsat = p->p_term + p->i_term;
    p->u_ctrl = Heater_ClampF32(u_unsat, HEATER_U_MIN, HEATER_U_MAX);
}

/*
 * =========================================================
 * 9. Stable judgement
 * =========================================================
 */
static void Heater_UpdateStableJudge(HeaterApp_t *p, float dt_sec)
{
    uint32_t stable_condition;
    uint32_t unstable_condition;

    stable_condition = 0U;
    unstable_condition = 0U;

    /*
     * Stable entry condition:
     * 1. Error is inside ±1.0 degC.
     * 2. Filtered temperature slope is smaller than 0.10 degC/sec.
     * 3. Control output is not saturated.
     * 4. No fault is active.
     */
    if ((Heater_AbsF32(p->error) <= HEATER_STABLE_BAND_C) &&
        (Heater_AbsF32(p->temp_slope) <= HEATER_STABLE_SLOPE_LIMIT_C_S) &&
        (p->u_ctrl > HEATER_U_SAT_LOW) &&
        (p->u_ctrl < HEATER_U_SAT_HIGH) &&
        (p->fault_active == 0U))
    {
        stable_condition = 1U;
    }

    if (stable_condition != 0U)
    {
        p->stable_timer_sec += dt_sec;
    }
    else
    {
        p->stable_timer_sec = 0.0f;
    }

    /*
     * Stable exit condition:
     * - Error escapes ±2.0 degC band.
     * - Or fault becomes active.
     *
     * The exit timer prevents instant mode toggling due to noise.
     */
    if ((Heater_AbsF32(p->error) > HEATER_STABLE_EXIT_BAND_C) ||
        (p->fault_active != 0U))
    {
        unstable_condition = 1U;
    }

    if (unstable_condition != 0U)
    {
        p->unstable_timer_sec += dt_sec;
    }
    else
    {
        p->unstable_timer_sec = 0.0f;
    }
}

/*
 * =========================================================
 * 10. Public control step
 * =========================================================
 */
void Heater_ControlStep(HeaterApp_t *p, float dt_sec)
{
    if (p == 0)
    {
        return;
    }

    dt_sec = Heater_SanitizeDtSec(dt_sec);

    Heater_UpdateMeasuredTemperature(p, dt_sec);
    Heater_UpdateFault(p);

    if (p->fault_active != 0U)
    {
        p->state = HEATER_STATE_FAULT;
        p->u_ctrl = 0.0f;
        p->p_term = 0.0f;
        p->i_term = 0.0f;
        p->stable_timer_sec = 0.0f;
    }
    else
    {
        switch (p->state)
        {
        case HEATER_STATE_IDLE:
            /*
             * First RUN tick:
             * Convert IDLE -> RUN and reset runtime variables.
             * Actual PI calculation starts from the next control tick.
             */
            p->state = HEATER_STATE_RUN;
            Heater_ResetRuntimeForNewRun(p);
            break;

        case HEATER_STATE_RUN:
            Heater_RunPI(p, dt_sec);
            Heater_UpdateStableJudge(p, dt_sec);

            if (p->stable_timer_sec >= HEATER_STABLE_HOLD_SEC)
            {
                p->state = HEATER_STATE_STABLE;
            }
            break;

        case HEATER_STATE_STABLE:
            Heater_RunPI(p, dt_sec);
            Heater_UpdateStableJudge(p, dt_sec);

            if (p->unstable_timer_sec >= HEATER_STABLE_EXIT_HOLD_SEC)
            {
                p->state = HEATER_STATE_RUN;
                p->stable_timer_sec = 0.0f;
            }
            break;

        case HEATER_STATE_FAULT:
        default:
            p->state = HEATER_STATE_FAULT;
            p->u_ctrl = 0.0f;
            p->p_term = 0.0f;
            p->i_term = 0.0f;
            p->stable_timer_sec = 0.0f;
            break;
        }
    }

    HeaterAxi_WriteR5Status(p->u_ctrl, p->error, p->state);
    p->duty_cnt = HeaterAxi_ReadDutyCount();
}

/*
 * =========================================================
 * 11. Open-loop output for Auto Tune
 * =========================================================
 */
void Heater_ApplyOpenLoopOutput(HeaterApp_t *p, float u_ctrl, uint32_t state)
{
    float dt_sec;

    if (p == 0)
    {
        return;
    }

    /*
     * Auto Tune path does not receive dt_sec from caller.
     * Use nominal control period for filter/slope update.
     */
    dt_sec = HEATER_CONTROL_DT_SEC;
    dt_sec = Heater_SanitizeDtSec(dt_sec);

    Heater_UpdateMeasuredTemperature(p, dt_sec);
    Heater_UpdateFault(p);

    if (p->fault_active != 0U)
    {
        p->state = HEATER_STATE_FAULT;
        p->u_ctrl = 0.0f;
        p->p_term = 0.0f;
        p->i_term = 0.0f;
        p->stable_timer_sec = 0.0f;
        p->unstable_timer_sec = 0.0f;
    }
    else
    {
        p->state = state;

        p->p_term = 0.0f;
        p->i_term = 0.0f;

        p->u_ctrl = Heater_ClampF32(u_ctrl, HEATER_U_MIN, HEATER_U_MAX);
    }

    HeaterAxi_WriteR5Status(p->u_ctrl, p->error, p->state);
    p->duty_cnt = HeaterAxi_ReadDutyCount();
}