#ifndef R5_SHARED_MEMORY_H_
#define R5_SHARED_MEMORY_H_

#include <stdint.h>

#include "heater_control.h"
#include "auto_tune.h"

/*
 * R5-side Shared Memory interface.
 *
 * Ownership rule:
 *   - R5 reads A53 command block only.
 *   - R5 writes R5 status block only.
 *
 * Do not flush/invalidate the whole shared memory during cyclic operation.
 */

typedef struct
{
    uint32_t control_word;
    uint32_t rising_edge;

    float target_temp;
    float kp;
    float ki;

    float auto_step_mv;
    float auto_noise_band;
    float auto_slope_band;
    uint32_t auto_max_time_ms;
} R5_SharedMemoryCommand_t;

void R5_SharedMemory_ClearCommandOnBoot(void);

uint32_t R5_SharedMemory_ReadCommand(HeaterApp_t *heater,
                                     R5_SharedMemoryCommand_t *cmd);

void R5_SharedMemory_WriteStatus(const HeaterApp_t *heater,
                                 const AutoTune_t *auto_tune);

void R5_SharedMemory_WriteSafeDefaultStatus(const HeaterApp_t *heater);

#endif /* R5_SHARED_MEMORY_H_ */