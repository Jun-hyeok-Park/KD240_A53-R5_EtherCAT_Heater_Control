#include "a53_shared_memory.h"

#include "xil_cache.h"
#include "xil_types.h"

#include "shared_memory.h"
#include "ecat_debug.h"

#define A53_SHM_SNAPSHOT_RETRY_COUNT  3U

static A53_SharedMemoryStatus_t g_a53_last_status;
static uint32_t g_a53_last_status_valid = 0U;

static const char *A53_SharedMemory_AutoTuneStateName(uint32_t state)
{
    switch (state)
    {
    case 0U:
        return "IDLE";
    case 1U:
        return "STABILIZE";
    case 2U:
        return "STEP_TEST";
    case 3U:
        return "CALCULATE";
    case 4U:
        return "DONE";
    case 5U:
        return "FAIL";
    case 6U:
        return "ABORT";
    default:
        return "UNKNOWN";
    }
}

static uint32_t A53_SharedMemory_MakeOddSeq(uint32_t seq)
{
    if ((seq & 1U) != 0U)
    {
        return seq + 2U;
    }

    return seq + 1U;
}

static uint32_t A53_SharedMemory_BeginCommandWrite(SharedMemory_t *shm)
{
    uint32_t odd_seq;

    /*
     * A53 owns the command block, but invalidate before reading seq to avoid
     * stale cache contents after warm reboot or R5 boot-time command clear.
     */
    Xil_DCacheInvalidateRange((UINTPTR)SHM_BASE_ADDR + SHM_CMD_OFFSET,
                              SHM_CMD_SIZE_BYTES);

    odd_seq = A53_SharedMemory_MakeOddSeq(shm->a53_command_seq);

    /*
     * Odd seq means writer is updating command block.
     * Flush it first so R5 can reject an in-progress snapshot.
     */
    shm->a53_command_seq = odd_seq;
    Xil_DCacheFlushRange((UINTPTR)SHM_BASE_ADDR + SHM_CMD_OFFSET,
                         SHM_CMD_SIZE_BYTES);

    return odd_seq;
}

static void A53_SharedMemory_EndCommandWrite(SharedMemory_t *shm,
                                             uint32_t odd_seq)
{
    /*
     * Even seq means command block is stable.
     * Command block is 1 cache line, so final flush publishes payload + even seq.
     */
    shm->a53_command_seq = odd_seq + 1U;

    Xil_DCacheFlushRange((UINTPTR)SHM_BASE_ADDR + SHM_CMD_OFFSET,
                         SHM_CMD_SIZE_BYTES);
}

static void A53_SharedMemory_ClearStatusStruct(A53_SharedMemoryStatus_t *status)
{
    status->r5_status_seq = 0U;
    status->r5_heartbeat = 0U;

    status->state = 0U;
    status->current_temp = 0.0f;
    status->error = 0.0f;
    status->u_ctrl = 0.0f;
    status->duty_count = 0U;

    status->auto_tune_state = 0U;
    status->auto_tune_error = 0U;

    status->tune_K = 0.0f;
    status->tune_L = 0.0f;
    status->tune_T = 0.0f;

    status->tune_kp = 0.0f;
    status->tune_ki = 0.0f;

    status->tuned_gain_valid = 0U;
}

void A53_SharedMemory_Clear(void)
{
    volatile uint32_t *p;
    uint32_t i;
    uint32_t word_count;

    p = (volatile uint32_t *)SHM_BASE_ADDR;
    word_count = (uint32_t)(SHM_SIZE_BYTES / sizeof(uint32_t));

    for (i = 0U; i < word_count; i++)
    {
        p[i] = 0U;
    }

    g_a53_last_status_valid = 0U;
    A53_SharedMemory_ClearStatusStruct(&g_a53_last_status);

    /*
     * Full shared memory clear is allowed only during initialization.
     * Do not do this cyclically.
     */
    Xil_DCacheFlushRange((UINTPTR)SHM_BASE_ADDR, SHM_SIZE_BYTES);

    DBG_SM("Clear shared memory");
}

void A53_SharedMemory_InitIdle(void)
{
    SharedMemory_t *shm;
    uint32_t odd_seq;

    shm = SHM_PTR;

    odd_seq = A53_SharedMemory_BeginCommandWrite(shm);

    shm->magic = SHM_MAGIC_VALUE;
    shm->version = SHM_VERSION;

    shm->control_word = 0U;

    shm->target_temp = 80.0f;
    shm->kp = 0.040f;
    shm->ki = 0.0030f;

    shm->auto_step_mv = 0.20f;        /* 20% output, u_ctrl range: 0.0 ~ 1.0 */
    shm->auto_noise_band = 0.2f;      /* degC */
    shm->auto_slope_band = 0.02f;     /* degC/sec */
    shm->auto_max_time_ms = 300000U;  /* 300 sec */

    shm->a53_heartbeat = 0U;

    A53_SharedMemory_EndCommandWrite(shm, odd_seq);

    DBG_SM("Init IDLE command");
}

void A53_SharedMemory_InitCommand(void)
{
    SharedMemory_t *shm;
    uint32_t odd_seq;

    shm = SHM_PTR;

    odd_seq = A53_SharedMemory_BeginCommandWrite(shm);

    /*
     * A53 -> R5 initial command.
     * Normal PI RUN test.
     */
    shm->magic = SHM_MAGIC_VALUE;
    shm->version = SHM_VERSION;

    shm->control_word = SHM_CONTROL_RUN;

    shm->target_temp = 80.0f;
    shm->kp = 0.040f;
    shm->ki = 0.0030f;

    shm->auto_step_mv = 0.20f;
    shm->auto_noise_band = 0.2f;
    shm->auto_slope_band = 0.02f;
    shm->auto_max_time_ms = 300000U;

    shm->a53_heartbeat = 0U;

    A53_SharedMemory_EndCommandWrite(shm, odd_seq);

    DBG_SM("Init command: RUN, target_x100=%ld, kp_x10000=%ld, ki_x1000000=%ld",
           (long)(shm->target_temp * 100.0f),
           (long)(shm->kp * 10000.0f),
           (long)(shm->ki * 1000000.0f));
}

void A53_SharedMemory_SendRun(float target_temp,
                              float kp,
                              float ki)
{
    SharedMemory_t *shm;
    uint32_t odd_seq;

    shm = SHM_PTR;

    odd_seq = A53_SharedMemory_BeginCommandWrite(shm);

    shm->magic = SHM_MAGIC_VALUE;
    shm->version = SHM_VERSION;

    shm->target_temp = target_temp;
    shm->kp = kp;
    shm->ki = ki;

    shm->control_word = SHM_CONTROL_RUN;
    shm->a53_heartbeat++;

    A53_SharedMemory_EndCommandWrite(shm, odd_seq);

    DBG_SM("Send RUN: target_x100=%ld, kp_x10000=%ld, ki_x1000000=%ld",
           (long)(target_temp * 100.0f),
           (long)(kp * 10000.0f),
           (long)(ki * 1000000.0f));
}

void A53_SharedMemory_SendStop(void)
{
    SharedMemory_t *shm;
    uint32_t odd_seq;

    shm = SHM_PTR;

    odd_seq = A53_SharedMemory_BeginCommandWrite(shm);

    shm->magic = SHM_MAGIC_VALUE;
    shm->version = SHM_VERSION;

    shm->control_word = SHM_CONTROL_STOP;
    shm->a53_heartbeat++;

    A53_SharedMemory_EndCommandWrite(shm, odd_seq);

    DBG_SM("Send STOP");
}

void A53_SharedMemory_SendAutoTuneStart(float step_mv,
                                        float noise_band,
                                        float slope_band,
                                        uint32_t max_time_ms)
{
    SharedMemory_t *shm;
    uint32_t odd_seq;

    shm = SHM_PTR;

    odd_seq = A53_SharedMemory_BeginCommandWrite(shm);

    shm->magic = SHM_MAGIC_VALUE;
    shm->version = SHM_VERSION;

    shm->auto_step_mv = step_mv;
    shm->auto_noise_band = noise_band;
    shm->auto_slope_band = slope_band;
    shm->auto_max_time_ms = max_time_ms;

    /*
     * Start Auto Tune without RUN bit.
     * R5 detects AUTO_TUNE_START by rising edge.
     */
    shm->control_word = SHM_CONTROL_AUTO_TUNE_START;
    shm->a53_heartbeat++;

    A53_SharedMemory_EndCommandWrite(shm, odd_seq);

    DBG_SM("Send AUTO_TUNE_START: step_x100=%ld, noise_x100=%ld, slope_x1000=%ld, max_time_ms=%lu",
           (long)(step_mv * 100.0f),
           (long)(noise_band * 100.0f),
           (long)(slope_band * 1000.0f),
           (unsigned long)max_time_ms);
}

void A53_SharedMemory_ClearControlWord(void)
{
    SharedMemory_t *shm;
    uint32_t odd_seq;

    shm = SHM_PTR;

    odd_seq = A53_SharedMemory_BeginCommandWrite(shm);

    shm->magic = SHM_MAGIC_VALUE;
    shm->version = SHM_VERSION;

    shm->control_word = 0U;
    shm->a53_heartbeat++;

    A53_SharedMemory_EndCommandWrite(shm, odd_seq);

    DBG_SM("Clear control_word");
}

void A53_SharedMemory_ReadStatus(A53_SharedMemoryStatus_t *status)
{
    SharedMemory_t *shm;
    A53_SharedMemoryStatus_t snapshot;
    uint32_t seq_before;
    uint32_t seq_after;
    uint32_t retry;

    if (status == 0)
    {
        return;
    }

    shm = SHM_PTR;

    for (retry = 0U; retry < A53_SHM_SNAPSHOT_RETRY_COUNT; retry++)
    {
        /*
         * A53 reads only R5 status block.
         */
        Xil_DCacheInvalidateRange((UINTPTR)SHM_BASE_ADDR + SHM_STATUS_OFFSET,
                                  SHM_STATUS_SIZE_BYTES);

        seq_before = shm->r5_status_seq;

        /* Odd seq means R5 is writing status block. Try again later. */
        if ((seq_before & 1U) != 0U)
        {
            continue;
        }

        snapshot.r5_status_seq = seq_before;
        snapshot.r5_heartbeat = shm->r5_heartbeat;

        snapshot.state = shm->state;
        snapshot.current_temp = shm->current_temp;
        snapshot.error = shm->error;
        snapshot.u_ctrl = shm->u_ctrl;
        snapshot.duty_count = shm->duty_count;

        snapshot.auto_tune_state = shm->auto_tune_state;
        snapshot.auto_tune_error = shm->auto_tune_error;

        snapshot.tune_K = shm->tune_K;
        snapshot.tune_L = shm->tune_L;
        snapshot.tune_T = shm->tune_T;

        snapshot.tune_kp = shm->tune_kp;
        snapshot.tune_ki = shm->tune_ki;

        snapshot.tuned_gain_valid = shm->tuned_gain_valid;

        /* Re-read seq after copying payload. */
        Xil_DCacheInvalidateRange((UINTPTR)SHM_BASE_ADDR + SHM_STATUS_OFFSET,
                                  SHM_STATUS_SIZE_BYTES);

        seq_after = shm->r5_status_seq;

        if ((seq_before == seq_after) && ((seq_after & 1U) == 0U))
        {
            snapshot.r5_status_seq = seq_after;

            *status = snapshot;
            g_a53_last_status = snapshot;
            g_a53_last_status_valid = 1U;
            return;
        }
    }

    /*
     * Snapshot failed.
     * Keep previous valid status instead of returning a mixed/new partial value.
     */
    if (g_a53_last_status_valid != 0U)
    {
        *status = g_a53_last_status;
    }
    else
    {
        A53_SharedMemory_ClearStatusStruct(status);
    }
}

void A53_SharedMemory_PrintAutoTuneStatus(void)
{
    A53_SharedMemoryStatus_t st;

    A53_SharedMemory_ReadStatus(&st);

    DBG_SM("AUTO status: heater_state=%lu, auto=%s(%lu), err=%lu, temp_x100=%ld, u_x1000=%ld, duty=%lu, valid=%lu",
           (unsigned long)st.state,
           A53_SharedMemory_AutoTuneStateName(st.auto_tune_state),
           (unsigned long)st.auto_tune_state,
           (unsigned long)st.auto_tune_error,
           (long)(st.current_temp * 100.0f),
           (long)(st.u_ctrl * 1000.0f),
           (unsigned long)st.duty_count,
           (unsigned long)st.tuned_gain_valid);

    if ((st.auto_tune_state == 4U) || (st.auto_tune_state == 5U))
    {
        DBG_SM("AUTO result: K_x1000=%ld, L_x1000=%ld, T_x1000=%ld, Kp_x10000=%ld, Ki_x1000000=%ld",
               (long)(st.tune_K * 1000.0f),
               (long)(st.tune_L * 1000.0f),
               (long)(st.tune_T * 1000.0f),
               (long)(st.tune_kp * 10000.0f),
               (long)(st.tune_ki * 1000000.0f));
    }
}

void A53_SharedMemory_ApplyTunedGainAndRun(float target_temp)
{
    SharedMemory_t *shm;
    A53_SharedMemoryStatus_t st;
    uint32_t odd_seq;
    float tuned_kp;
    float tuned_ki;

    shm = SHM_PTR;

    /*
     * Read tuned gain through validated status snapshot.
     */
    A53_SharedMemory_ReadStatus(&st);

    if (st.tuned_gain_valid == 0U)
    {
        DBG_SM("Apply tuned gain failed: tuned_gain_valid=0");
        return;
    }

    tuned_kp = st.tune_kp;
    tuned_ki = st.tune_ki;

    odd_seq = A53_SharedMemory_BeginCommandWrite(shm);

    shm->magic = SHM_MAGIC_VALUE;
    shm->version = SHM_VERSION;

    shm->target_temp = target_temp;
    shm->kp = tuned_kp;
    shm->ki = tuned_ki;

    shm->control_word = SHM_CONTROL_RUN;
    shm->a53_heartbeat++;

    A53_SharedMemory_EndCommandWrite(shm, odd_seq);

    DBG_SM("Apply tuned gain and RUN: target_x100=%ld, kp_x10000=%ld, ki_x1000000=%ld",
           (long)(target_temp * 100.0f),
           (long)(tuned_kp * 10000.0f),
           (long)(tuned_ki * 1000000.0f));
}
