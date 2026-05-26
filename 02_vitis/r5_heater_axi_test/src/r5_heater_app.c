#include "r5_heater_app.h"

#include "xil_types.h"

#include "heater_axi.h"
#include "heater_control.h"
#include "r5_ttc_timer.h"
#include "uart_debug.h"
#include "shared_memory.h"
#include "auto_tune.h"
#include "r5_shared_memory.h"

#define LOG_EVERY_CONTROL_STEPS  10U

static HeaterApp_t g_heater;
static AutoTune_t g_auto_tune;

static uint32_t g_log_div = 0U;
static uint32_t g_control_step_count = 0U;

static void R5_HandleStopOrNoCommand(HeaterApp_t *heater)
{
    if (heater == 0)
    {
        return;
    }

    heater->state = HEATER_STATE_IDLE;
    heater->u_ctrl = 0.0f;
    heater->p_term = 0.0f;
    heater->i_term = 0.0f;
    heater->stable_timer_sec = 0.0f;
    heater->unstable_timer_sec = 0.0f;

    heater->current_temp = HeaterAxi_ReadCurrentTemp();
    heater->error = heater->target_temp - heater->current_temp;

    HeaterAxi_SetControlMode(HEATER_CONTROL_MODE_R5);
    HeaterAxi_WriteControlOutput(0.0f);
    HeaterAxi_WriteError(heater->error);
    HeaterAxi_WriteState(heater->state);
    HeaterAxi_DisableRun();
}

static void R5_EnterPiRunFromAutoTuneIfNeeded(HeaterApp_t *heater)
{
    if (heater == 0)
    {
        return;
    }

    /*
     * Auto Tune finished state may remain in heater.state.
     * Normal PI control FSM expects IDLE/RUN/STABLE/FAULT.
     * Therefore, convert AUTO_TUNE -> IDLE once before entering PI RUN.
     */
    if (heater->state == HEATER_STATE_AUTO_TUNE)
    {
        heater->state = HEATER_STATE_IDLE;
        heater->u_ctrl = 0.0f;
        heater->p_term = 0.0f;
        heater->i_term = 0.0f;
        heater->stable_timer_sec = 0.0f;
        heater->unstable_timer_sec = 0.0f;

        HeaterAxi_WriteControlOutput(0.0f);
        HeaterAxi_WriteState(HEATER_STATE_IDLE);
    }
}

void R5_HeaterApp_Init(void)
{
    g_log_div = 0U;
    g_control_step_count = 0U;

    Heater_Init(&g_heater);
    AutoTune_Init(&g_auto_tune);

    /*
     * R5 may start before A53.
     * Clear stale A53 command block first.
     */
    R5_SharedMemory_ClearCommandOnBoot();

    UartDebug_PrintHeaterVersion(HeaterAxi_ReadVersion());

    /*
     * Initial hardware state.
     * R5 control mode is selected, but output remains OFF
     * until A53 sends a valid command.
     */
    HeaterAxi_SetControlMode(HEATER_CONTROL_MODE_R5);
    HeaterAxi_WriteControlOutput(0.0f);
    HeaterAxi_WriteState(HEATER_STATE_IDLE);
    HeaterAxi_DisableRun();

    /*
     * Write initial R5 status.
     * This allows A53 to observe R5 heartbeat/status even before RUN.
     */
    R5_SharedMemory_WriteStatus(&g_heater, &g_auto_tune);
}

void R5_HeaterApp_Step(void)
{
    R5_SharedMemoryCommand_t shm_cmd;

    uint32_t duty_count;
    uint32_t control_word;
    uint32_t now_ms;

    /*
     * A53 command / parameter read.
     * r5_shared_memory.c owns seqlock-based snapshot validation.
     */
    control_word = R5_SharedMemory_ReadCommand(&g_heater, &shm_cmd);

    if ((control_word & SHM_CONTROL_STOP) != 0U)
    {
        AutoTune_Init(&g_auto_tune);
        R5_HandleStopOrNoCommand(&g_heater);
    }
    else if ((shm_cmd.rising_edge & SHM_CONTROL_AUTO_TUNE_ABORT) != 0U)
    {
        AutoTune_Abort(&g_auto_tune);
        R5_HandleStopOrNoCommand(&g_heater);
    }
    else
    {
        if ((shm_cmd.rising_edge & SHM_CONTROL_AUTO_TUNE_START) != 0U)
        {
            now_ms = R5TtcTimer_GetControlTickCount() * R5_CONTROL_PERIOD_MS;

            AutoTune_Start(&g_auto_tune,
                           shm_cmd.auto_step_mv,
                           shm_cmd.auto_noise_band,
                           shm_cmd.auto_slope_band,
                           shm_cmd.auto_max_time_ms,
                           now_ms);

            g_heater.i_term = 0.0f;
            g_heater.p_term = 0.0f;
        }

        if (AutoTune_IsRunning(&g_auto_tune))
        {
            float open_loop_u;

            now_ms = R5TtcTimer_GetControlTickCount() * R5_CONTROL_PERIOD_MS;

            g_heater.current_temp = HeaterAxi_ReadCurrentTemp();

            open_loop_u = AutoTune_Update(&g_auto_tune,
                                          g_heater.current_temp,
                                          now_ms);

            Heater_ApplyOpenLoopOutput(&g_heater,
                                       open_loop_u,
                                       HEATER_STATE_AUTO_TUNE);
        }
        else if ((control_word & SHM_CONTROL_RUN) != 0U)
        {
            R5_EnterPiRunFromAutoTuneIfNeeded(&g_heater);

            /*
             * heater_control.c owns dt_sec sanitize/failsafe handling.
             */
            Heater_ControlStep(&g_heater, HEATER_CONTROL_DT_SEC);
        }
        else
        {
            R5_HandleStopOrNoCommand(&g_heater);
        }
    }

    UartDebug_PrintHeaterStateOnChange(&g_heater);

    /*
     * r5_shared_memory.c owns seqlock-based status write.
     */
    R5_SharedMemory_WriteStatus(&g_heater, &g_auto_tune);

    g_control_step_count++;

    g_log_div++;
    if (g_log_div >= LOG_EVERY_CONTROL_STEPS)
    {
        g_log_div = 0U;

        duty_count = HeaterAxi_ReadDutyCount();

        UartDebug_PrintHeaterStatus(g_control_step_count,
                                    R5TtcTimer_GetControlTickCount(),
                                    R5TtcTimer_GetBaseIsrCount(),
                                    R5TtcTimer_GetPendingCount(),
                                    R5TtcTimer_GetOverrunCount(),
                                    &g_heater,
                                    duty_count);
    }
}