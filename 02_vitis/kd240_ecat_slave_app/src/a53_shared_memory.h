#ifndef A53_SHARED_MEMORY_H_
#define A53_SHARED_MEMORY_H_

#include <stdint.h>

/*
 * A53-side Shared Memory interface.
 *
 * Ownership rule:
 *   - A53 writes command block only.
 *   - A53 reads status block only.
 *   - R5 reads command block only.
 *   - R5 writes status block only.
 *
 * Do not flush/invalidate the whole shared memory during cyclic operation.
 */

typedef struct
{
    uint32_t r5_status_seq;
    uint32_t r5_heartbeat;

    uint32_t state;
    float current_temp;
    float error;
    float u_ctrl;
    uint32_t duty_count;

    uint32_t auto_tune_state;
    uint32_t auto_tune_error;

    float tune_K;
    float tune_L;
    float tune_T;

    float tune_kp;
    float tune_ki;

    uint32_t tuned_gain_valid;
} A53_SharedMemoryStatus_t;

void A53_SharedMemory_Clear(void);

void A53_SharedMemory_InitIdle(void);
void A53_SharedMemory_InitCommand(void);

void A53_SharedMemory_SendRun(float target_temp,
                              float kp,
                              float ki);

void A53_SharedMemory_SendStop(void);

void A53_SharedMemory_SendAutoTuneStart(float step_mv,
                                        float noise_band,
                                        float slope_band,
                                        uint32_t max_time_ms);

void A53_SharedMemory_ClearControlWord(void);

void A53_SharedMemory_ReadStatus(A53_SharedMemoryStatus_t *status);
void A53_SharedMemory_PrintAutoTuneStatus(void);

void A53_SharedMemory_ApplyTunedGainAndRun(float target_temp);

#endif /* A53_SHARED_MEMORY_H_ */