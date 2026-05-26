#include "auto_tune.h"

#define AUTO_TUNE_U_MIN                  0.0f
#define AUTO_TUNE_U_MAX                  1.0f

#define AUTO_TUNE_DEFAULT_ALPHA          0.20f
#define AUTO_TUNE_DEFAULT_NOISE_BAND     0.20f
#define AUTO_TUNE_DEFAULT_SLOPE_BAND     0.02f
#define AUTO_TUNE_DEFAULT_MAX_TIME_MS    300000U

#define AUTO_TUNE_STABILIZE_COUNT        30U
#define AUTO_TUNE_FINAL_STEADY_COUNT     50U

#define AUTO_TUNE_MIN_L_SEC              0.001f
#define AUTO_TUNE_MIN_T_SEC              0.001f
#define AUTO_TUNE_MIN_K                  0.000001f
#define AUTO_TUNE_MIN_DELTA_PV_FIXED     0.10f
#define AUTO_TUNE_MIN_DELTA_PV_NOISE_MUL 3.0f

static float AutoTune_AbsF32(float value)
{
    if (value < 0.0f)
    {
        return -value;
    }

    return value;
}

static float AutoTune_ClampF32(float value, float min_value, float max_value)
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

static uint32_t AutoTune_ElapsedMs(uint32_t now_ms, uint32_t start_ms)
{
    return (uint32_t)(now_ms - start_ms);
}

static void AutoTune_SetFail(AutoTune_t *p, uint32_t error_code)
{
    if (p == 0)
    {
        return;
    }

    p->state = AUTO_TUNE_STATE_FAIL;
    p->error_code = error_code;
}

void AutoTune_Init(AutoTune_t *p)
{
    if (p == 0)
    {
        return;
    }

    p->state = AUTO_TUNE_STATE_IDLE;
    p->error_code = AUTO_TUNE_ERR_NONE;

    p->step_mv = 0.0f;
    p->pv_noise_band = AUTO_TUNE_DEFAULT_NOISE_BAND;
    p->slope_noise_band = AUTO_TUNE_DEFAULT_SLOPE_BAND;
    p->alpha = AUTO_TUNE_DEFAULT_ALPHA;
    p->max_time_ms = AUTO_TUNE_DEFAULT_MAX_TIME_MS;

    p->pv_base = 0.0f;
    p->pv_final = 0.0f;
    p->filtered_pv = 0.0f;
    p->last_pv = 0.0f;

    p->max_slope = 0.0f;
    p->pv_infl = 0.0f;

    p->t_start_ms = 0U;
    p->t_step_ms = 0U;
    p->t_infl_ms = 0U;
    p->last_time_ms = 0U;

    p->stable_count = 0U;

    p->K = 0.0f;
    p->L = 0.0f;
    p->T = 0.0f;

    p->result_kp = 0.0f;
    p->result_ki = 0.0f;
}

void AutoTune_Start(AutoTune_t *p,
                    float step_mv,
                    float pv_noise_band,
                    float slope_noise_band,
                    uint32_t max_time_ms,
                    uint32_t now_ms)
{
    if (p == 0)
    {
        return;
    }

    AutoTune_Init(p);

    if ((step_mv <= 0.0f) || (step_mv > AUTO_TUNE_U_MAX))
    {
        AutoTune_SetFail(p, AUTO_TUNE_ERR_INVALID_PARAM);
        return;
    }

    p->step_mv = AutoTune_ClampF32(step_mv, AUTO_TUNE_U_MIN, AUTO_TUNE_U_MAX);

    if (pv_noise_band > 0.0f)
    {
        p->pv_noise_band = pv_noise_band;
    }

    if (slope_noise_band > 0.0f)
    {
        p->slope_noise_band = slope_noise_band;
    }

    if (max_time_ms > 0U)
    {
        p->max_time_ms = max_time_ms;
    }

    p->alpha = AUTO_TUNE_DEFAULT_ALPHA;

    p->t_start_ms = now_ms;
    p->last_time_ms = now_ms;
    p->state = AUTO_TUNE_STATE_STABILIZE;
    p->error_code = AUTO_TUNE_ERR_NONE;
}

void AutoTune_Abort(AutoTune_t *p)
{
    if (p == 0)
    {
        return;
    }

    p->state = AUTO_TUNE_STATE_ABORT;
}

static void AutoTune_CalculateResult(AutoTune_t *p)
{
    float delta_pv;
    float min_delta_pv;
    float t_infl_sec;
    float Ti;

    if (p == 0)
    {
        return;
    }

    delta_pv = p->pv_final - p->pv_base;

    min_delta_pv = p->pv_noise_band * AUTO_TUNE_MIN_DELTA_PV_NOISE_MUL;
    if (min_delta_pv < AUTO_TUNE_MIN_DELTA_PV_FIXED)
    {
        min_delta_pv = AUTO_TUNE_MIN_DELTA_PV_FIXED;
    }

    if (delta_pv < min_delta_pv)
    {
        AutoTune_SetFail(p, AUTO_TUNE_ERR_SMALL_DELTA_PV);
        return;
    }

    if ((p->step_mv <= 0.0f) || (p->max_slope <= 0.0f))
    {
        AutoTune_SetFail(p, AUTO_TUNE_ERR_INVALID_PARAM);
        return;
    }

    p->K = delta_pv / p->step_mv;
    if (p->K < AUTO_TUNE_MIN_K)
    {
        AutoTune_SetFail(p, AUTO_TUNE_ERR_INVALID_PARAM);
        return;
    }

    t_infl_sec = (float)AutoTune_ElapsedMs(p->t_infl_ms, p->t_step_ms) / 1000.0f;

    /*
     * Maximum Slope Tangent Method.
     * L: x-axis crossing time of tangent line at PV_base.
     * T: time for the tangent line to move from PV_base to PV_final.
     */
    p->L = t_infl_sec - ((p->pv_infl - p->pv_base) / p->max_slope);
    if (p->L < AUTO_TUNE_MIN_L_SEC)
    {
        p->L = AUTO_TUNE_MIN_L_SEC;
    }

    p->T = delta_pv / p->max_slope;
    if (p->T < AUTO_TUNE_MIN_T_SEC)
    {
        AutoTune_SetFail(p, AUTO_TUNE_ERR_INVALID_PARAM);
        return;
    }

    /*
     * CHR 0% overshoot PI tuning rule for set-point response.
     * Parallel PI form:
     *     u = Kp * e + Ki * integral(e dt)
     */
    p->result_kp = (0.35f * p->T) / (p->K * p->L);

    Ti = 1.2f * p->T;
    if (Ti < AUTO_TUNE_MIN_T_SEC)
    {
        AutoTune_SetFail(p, AUTO_TUNE_ERR_INVALID_PARAM);
        return;
    }

    p->result_ki = p->result_kp / Ti;

    p->state = AUTO_TUNE_STATE_DONE;
    p->error_code = AUTO_TUNE_ERR_NONE;
}

float AutoTune_Update(AutoTune_t *p,
                      float current_pv,
                      uint32_t now_ms)
{
    float dt_sec;
    float current_slope;
    float abs_slope;
    float output_mv;

    if (p == 0)
    {
        return 0.0f;
    }

    output_mv = 0.0f;

    if ((p->state == AUTO_TUNE_STATE_IDLE) ||
        (p->state == AUTO_TUNE_STATE_DONE) ||
        (p->state == AUTO_TUNE_STATE_FAIL) ||
        (p->state == AUTO_TUNE_STATE_ABORT))
    {
        return 0.0f;
    }

    if (AutoTune_ElapsedMs(now_ms, p->t_start_ms) > p->max_time_ms)
    {
        AutoTune_SetFail(p, AUTO_TUNE_ERR_TIMEOUT);
        return 0.0f;
    }

    /*
     * First sample initialization after AutoTune_Start().
     */
    if ((p->state == AUTO_TUNE_STATE_STABILIZE) &&
        (p->stable_count == 0U) &&
        (p->last_time_ms == p->t_start_ms))
    {
        p->filtered_pv = current_pv;
        p->last_pv = current_pv;
        p->last_time_ms = now_ms;
        return 0.0f;
    }

    dt_sec = (float)AutoTune_ElapsedMs(now_ms, p->last_time_ms) / 1000.0f;
    if (dt_sec <= 0.0f)
    {
        dt_sec = 0.001f;
    }

    p->filtered_pv = (p->alpha * current_pv) + ((1.0f - p->alpha) * p->filtered_pv);
    current_slope = (p->filtered_pv - p->last_pv) / dt_sec;
    abs_slope = AutoTune_AbsF32(current_slope);

    switch (p->state)
    {
    case AUTO_TUNE_STATE_STABILIZE:
        output_mv = 0.0f;

        if (abs_slope <= p->slope_noise_band)
        {
            p->stable_count++;
        }
        else
        {
            p->stable_count = 0U;
        }

        if (p->stable_count >= AUTO_TUNE_STABILIZE_COUNT)
        {
            p->pv_base = p->filtered_pv;
            p->pv_final = p->filtered_pv;

            p->max_slope = 0.0f;
            p->pv_infl = p->filtered_pv;

            p->t_step_ms = now_ms;
            p->t_infl_ms = now_ms;
            p->stable_count = 0U;

            p->last_pv = p->filtered_pv;
            p->last_time_ms = now_ms;

            p->state = AUTO_TUNE_STATE_STEP_TEST;
            output_mv = p->step_mv;
        }
        break;

    case AUTO_TUNE_STATE_STEP_TEST:
        output_mv = p->step_mv;

        if (current_slope > p->max_slope)
        {
            p->max_slope = current_slope;
            p->pv_infl = p->filtered_pv;
            p->t_infl_ms = now_ms;
            p->stable_count = 0U;
        }
        else if ((p->max_slope > p->slope_noise_band) &&
                 (abs_slope <= p->slope_noise_band))
        {
            p->stable_count++;
        }
        else
        {
            /*
             * Keep previous steady count.
             */
        }

        p->pv_final = p->filtered_pv;

        if ((p->stable_count >= AUTO_TUNE_FINAL_STEADY_COUNT) &&
            (p->max_slope > p->slope_noise_band))
        {
            p->state = AUTO_TUNE_STATE_CALCULATE;
            AutoTune_CalculateResult(p);
            output_mv = 0.0f;
        }
        break;

    case AUTO_TUNE_STATE_CALCULATE:
        AutoTune_CalculateResult(p);
        output_mv = 0.0f;
        break;

    default:
        AutoTune_SetFail(p, AUTO_TUNE_ERR_INVALID_PARAM);
        output_mv = 0.0f;
        break;
    }

    p->last_pv = p->filtered_pv;
    p->last_time_ms = now_ms;

    return output_mv;
}

bool AutoTune_IsRunning(const AutoTune_t *p)
{
    if (p == 0)
    {
        return false;
    }

    return ((p->state == AUTO_TUNE_STATE_STABILIZE) ||
            (p->state == AUTO_TUNE_STATE_STEP_TEST) ||
            (p->state == AUTO_TUNE_STATE_CALCULATE));
}

bool AutoTune_IsDone(const AutoTune_t *p)
{
    if (p == 0)
    {
        return false;
    }

    return (p->state == AUTO_TUNE_STATE_DONE);
}

bool AutoTune_IsFailed(const AutoTune_t *p)
{
    if (p == 0)
    {
        return false;
    }

    return (p->state == AUTO_TUNE_STATE_FAIL);
}