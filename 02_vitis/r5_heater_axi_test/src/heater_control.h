#ifndef HEATER_CONTROL_H_
#define HEATER_CONTROL_H_

#include <stdint.h>
#include "r5_ttc_timer.h"

#define HEATER_STATE_IDLE        0U
#define HEATER_STATE_RUN         1U
#define HEATER_STATE_STABLE      2U
#define HEATER_STATE_FAULT       3U
#define HEATER_STATE_AUTO_TUNE   4U

#define HEATER_CONTROL_DT_SEC    R5_CONTROL_PERIOD_SEC

typedef struct
{
    uint32_t state;

    /*
     * Fault / filtering state
     */
    uint32_t fault_active;
    uint32_t filter_initialized;

    /*
     * Temperature / control variables
     */
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

    uint32_t duty_cnt;
} HeaterApp_t;

void Heater_Init(HeaterApp_t *p);
void Heater_ControlStep(HeaterApp_t *p, float dt_sec);
void Heater_ApplyOpenLoopOutput(HeaterApp_t *p, float u_ctrl, uint32_t state);

float Heater_AbsF32(float value);

#endif /* HEATER_CONTROL_H_ */