#include "r5_shared_memory.h"

#include "xil_cache.h"
#include "xil_types.h"

#include "shared_memory.h"
#include "heater_axi.h"

#define R5_SHM_SNAPSHOT_RETRY_COUNT  3U

static uint32_t g_prev_control_word = 0U;
static R5_SharedMemoryCommand_t g_last_valid_cmd;
static uint32_t g_last_valid_cmd_valid = 0U;

static void R5_SharedMemory_ClearCommandStruct(R5_SharedMemoryCommand_t *cmd)
{
    if (cmd == 0)
    {
        return;
    }

    cmd->control_word = 0U;
    cmd->rising_edge = 0U;

    cmd->target_temp = 0.0f;
    cmd->kp = 0.0f;
    cmd->ki = 0.0f;

    cmd->auto_step_mv = 0.0f;
    cmd->auto_noise_band = 0.0f;
    cmd->auto_slope_band = 0.0f;
    cmd->auto_max_time_ms = 0U;
}

static uint32_t R5_SharedMemory_MakeOddSeq(uint32_t seq)
{
    if ((seq & 1U) != 0U)
    {
        return seq + 2U;
    }

    return seq + 1U;
}

static uint32_t R5_SharedMemory_BeginStatusWrite(SharedMemory_t *shm)
{
    uint32_t odd_seq;

    odd_seq = R5_SharedMemory_MakeOddSeq(shm->r5_status_seq);

    /*
     * Odd seq means R5 is updating status block.
     * Flush first status cache line first so A53 rejects in-progress data.
     */
    shm->r5_status_seq = odd_seq;
    Xil_DCacheFlushRange((UINTPTR)SHM_BASE_ADDR + SHM_STATUS_OFFSET,
                         SHM_CACHE_LINE_SIZE);

    return odd_seq;
}

static void R5_SharedMemory_EndStatusWrite(SharedMemory_t *shm,
                                           uint32_t odd_seq)
{
    /*
     * Publish payload while seq is still odd.
     * A53 will reject it until final even seq is flushed.
     */
    Xil_DCacheFlushRange((UINTPTR)SHM_BASE_ADDR + SHM_STATUS_OFFSET,
                         SHM_STATUS_SIZE_BYTES);

    shm->r5_status_seq = odd_seq + 1U;
    shm->r5_heartbeat++;

    /*
     * Final publish: even seq + heartbeat in first status cache line.
     */
    Xil_DCacheFlushRange((UINTPTR)SHM_BASE_ADDR + SHM_STATUS_OFFSET,
                         SHM_CACHE_LINE_SIZE);
}

static uint32_t R5_SharedMemory_TryReadCommandSnapshot(R5_SharedMemoryCommand_t *snapshot)
{
    SharedMemory_t *shm;
    uint32_t seq_before;
    uint32_t seq_after;
    uint32_t retry;

    if (snapshot == 0)
    {
        return 0U;
    }

    shm = SHM_PTR;

    for (retry = 0U; retry < R5_SHM_SNAPSHOT_RETRY_COUNT; retry++)
    {
        /*
         * R5 only reads A53 command block.
         */
        Xil_DCacheInvalidateRange((UINTPTR)SHM_BASE_ADDR + SHM_CMD_OFFSET,
                                  SHM_CMD_SIZE_BYTES);

        seq_before = shm->a53_command_seq;

        /* Odd seq means A53 is writing command block. */
        if ((seq_before & 1U) != 0U)
        {
            continue;
        }

        if (shm->magic != SHM_MAGIC_VALUE)
        {
            return 0U;
        }

        if (shm->version != SHM_VERSION)
        {
            return 0U;
        }

        snapshot->control_word = shm->control_word;
        snapshot->rising_edge = 0U;

        snapshot->target_temp = shm->target_temp;
        snapshot->kp = shm->kp;
        snapshot->ki = shm->ki;

        snapshot->auto_step_mv = shm->auto_step_mv;
        snapshot->auto_noise_band = shm->auto_noise_band;
        snapshot->auto_slope_band = shm->auto_slope_band;
        snapshot->auto_max_time_ms = shm->auto_max_time_ms;

        /* Re-read seq after copying payload. */
        Xil_DCacheInvalidateRange((UINTPTR)SHM_BASE_ADDR + SHM_CMD_OFFSET,
                                  SHM_CMD_SIZE_BYTES);

        seq_after = shm->a53_command_seq;

        if ((seq_before == seq_after) && ((seq_after & 1U) == 0U))
        {
            return 1U;
        }
    }

    return 0U;
}

static void R5_SharedMemory_ApplyCommandToHeater(HeaterApp_t *heater,
                                                 const R5_SharedMemoryCommand_t *cmd)
{
    if ((heater == 0) || (cmd == 0))
    {
        return;
    }

    heater->target_temp = cmd->target_temp;
    heater->kp = cmd->kp;
    heater->ki = cmd->ki;

    if ((cmd->rising_edge & SHM_CONTROL_RESET) != 0U)
    {
        Heater_Init(heater);
    }
}

void R5_SharedMemory_ClearCommandOnBoot(void)
{
    volatile uint32_t *p;
    uint32_t i;
    uint32_t word_count;

    /*
     * R5 starts earlier than A53 in the current test sequence.
     * Clear only A53 -> R5 command block to prevent stale command consumption
     * after warm reboot or repeated test runs.
     */
    Xil_DCacheInvalidateRange((UINTPTR)SHM_BASE_ADDR + SHM_CMD_OFFSET,
                              SHM_CMD_SIZE_BYTES);

    p = (volatile uint32_t *)(SHM_BASE_ADDR + SHM_CMD_OFFSET);
    word_count = (uint32_t)(SHM_CMD_SIZE_BYTES / sizeof(uint32_t));

    for (i = 0U; i < word_count; i++)
    {
        p[i] = 0U;
    }

    Xil_DCacheFlushRange((UINTPTR)SHM_BASE_ADDR + SHM_CMD_OFFSET,
                         SHM_CMD_SIZE_BYTES);

    g_prev_control_word = 0U;
    g_last_valid_cmd_valid = 0U;
    R5_SharedMemory_ClearCommandStruct(&g_last_valid_cmd);
}

uint32_t R5_SharedMemory_ReadCommand(HeaterApp_t *heater,
                                     R5_SharedMemoryCommand_t *cmd)
{
    R5_SharedMemoryCommand_t snapshot;
    uint32_t valid;
    uint32_t control_word;
    uint32_t rising_edge;

    R5_SharedMemory_ClearCommandStruct(cmd);
    R5_SharedMemory_ClearCommandStruct(&snapshot);

    valid = R5_SharedMemory_TryReadCommandSnapshot(&snapshot);

    if (valid == 0U)
    {
        /*
         * If snapshot fails while A53 is updating, keep previous valid command.
         * Do not generate a new rising edge from cached command.
         */
        if (g_last_valid_cmd_valid != 0U)
        {
            snapshot = g_last_valid_cmd;
            snapshot.rising_edge = 0U;

            if (cmd != 0)
            {
                *cmd = snapshot;
            }

            R5_SharedMemory_ApplyCommandToHeater(heater, &snapshot);
            return snapshot.control_word;
        }

        g_prev_control_word = 0U;
        return 0U;
    }

    control_word = snapshot.control_word;
    rising_edge = control_word & (~g_prev_control_word);

    snapshot.rising_edge = rising_edge;

    if (cmd != 0)
    {
        *cmd = snapshot;
    }

    R5_SharedMemory_ApplyCommandToHeater(heater, &snapshot);

    g_prev_control_word = control_word;
    g_last_valid_cmd = snapshot;
    g_last_valid_cmd.rising_edge = 0U;
    g_last_valid_cmd_valid = 1U;

    return control_word;
}

void R5_SharedMemory_WriteStatus(const HeaterApp_t *heater,
                                 const AutoTune_t *auto_tune)
{
    SharedMemory_t *shm;
    uint32_t odd_seq;

    if (heater == 0)
    {
        return;
    }

    shm = SHM_PTR;

    odd_seq = R5_SharedMemory_BeginStatusWrite(shm);

    shm->state = heater->state;
    shm->current_temp = heater->current_temp;
    shm->error = heater->error;
    shm->u_ctrl = heater->u_ctrl;
    shm->duty_count = HeaterAxi_ReadDutyCount();

    if (auto_tune != 0)
    {
        shm->auto_tune_state = auto_tune->state;
        shm->auto_tune_error = auto_tune->error_code;

        shm->tune_K = auto_tune->K;
        shm->tune_L = auto_tune->L;
        shm->tune_T = auto_tune->T;

        shm->tune_kp = auto_tune->result_kp;
        shm->tune_ki = auto_tune->result_ki;

        shm->tuned_gain_valid = AutoTune_IsDone(auto_tune) ? 1U : 0U;
    }
    else
    {
        shm->auto_tune_state = 0U;
        shm->auto_tune_error = 0U;

        shm->tune_K = 0.0f;
        shm->tune_L = 0.0f;
        shm->tune_T = 0.0f;

        shm->tune_kp = 0.0f;
        shm->tune_ki = 0.0f;

        shm->tuned_gain_valid = 0U;
    }

    R5_SharedMemory_EndStatusWrite(shm, odd_seq);
}

void R5_SharedMemory_WriteSafeDefaultStatus(const HeaterApp_t *heater)
{
    R5_SharedMemory_WriteStatus(heater, 0);
}
