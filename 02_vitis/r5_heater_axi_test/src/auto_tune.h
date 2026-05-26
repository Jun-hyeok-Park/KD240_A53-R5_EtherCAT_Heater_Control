#ifndef AUTO_TUNE_H_
#define AUTO_TUNE_H_

#include <stdint.h>
#include <stdbool.h>

#define AUTO_TUNE_STATE_IDLE        0U
#define AUTO_TUNE_STATE_STABILIZE   1U
#define AUTO_TUNE_STATE_STEP_TEST   2U
#define AUTO_TUNE_STATE_CALCULATE   3U
#define AUTO_TUNE_STATE_DONE        4U
#define AUTO_TUNE_STATE_FAIL        5U
#define AUTO_TUNE_STATE_ABORT       6U

#define AUTO_TUNE_ERR_NONE              0U
#define AUTO_TUNE_ERR_TIMEOUT           1U
#define AUTO_TUNE_ERR_SMALL_DELTA_PV    2U
#define AUTO_TUNE_ERR_INVALID_PARAM     3U

typedef struct
{
    uint32_t state;
    uint32_t error_code;

    float step_mv;
    float pv_noise_band;
    float slope_noise_band;
    float alpha;
    uint32_t max_time_ms;

    float pv_base;
    float pv_final;
    float filtered_pv;
    float last_pv;

    float max_slope;
    float pv_infl;

    uint32_t t_start_ms;
    uint32_t t_step_ms;
    uint32_t t_infl_ms;
    uint32_t last_time_ms;

    uint32_t stable_count;

    float K;
    float L;
    float T;

    float result_kp;
    float result_ki;
} AutoTune_t;

void AutoTune_Init(AutoTune_t *p);

void AutoTune_Start(AutoTune_t *p,
                    float step_mv,
                    float pv_noise_band,
                    float slope_noise_band,
                    uint32_t max_time_ms,
                    uint32_t now_ms);

void AutoTune_Abort(AutoTune_t *p);

float AutoTune_Update(AutoTune_t *p,
                      float current_pv,
                      uint32_t now_ms);

bool AutoTune_IsRunning(const AutoTune_t *p);
bool AutoTune_IsDone(const AutoTune_t *p);
bool AutoTune_IsFailed(const AutoTune_t *p);

#endif