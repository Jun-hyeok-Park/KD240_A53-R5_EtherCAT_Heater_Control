#include "a53_auto_tune_test.h"

#include <stdint.h>

#include "a53_shared_memory.h"
#include "ecat_debug.h"

typedef enum
{
    A53_AT_TEST_INIT = 0,
    A53_AT_TEST_WAIT_IDLE,
    A53_AT_TEST_SEND_START,
    A53_AT_TEST_WAIT_R5_AUTO,
    A53_AT_TEST_MONITOR,
    A53_AT_TEST_APPLY_GAIN_AND_RUN,
    A53_AT_TEST_RUN_MONITOR,
    A53_AT_TEST_FINISHED
} A53_AutoTuneTestState_t;

static const char *A53_Test_HeaterStateName(uint32_t state)
{
    switch (state)
    {
    case 0U:
        return "IDLE";
    case 1U:
        return "RUN";
    case 2U:
        return "STABLE";
    case 3U:
        return "FAULT";
    case 4U:
        return "AUTO_TUNE";
    default:
        return "UNKNOWN";
    }
}

static const char *A53_Test_AutoTuneStateName(uint32_t state)
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

static void A53_Test_PrintAutoTuneProgress(const A53_SharedMemoryStatus_t *st)
{
    long temp_int;
    long temp_frac;
    long u_int;
    long u_frac;

    if (st == 0)
    {
        return;
    }

    temp_int = (long)st->current_temp;
    temp_frac = (long)((st->current_temp - (float)temp_int) * 100.0f);
    if (temp_frac < 0)
    {
        temp_frac = -temp_frac;
    }

    u_int = (long)st->u_ctrl;
    u_frac = (long)((st->u_ctrl - (float)u_int) * 1000.0f);
    if (u_frac < 0)
    {
        u_frac = -u_frac;
    }

    DBG_SM("[AUTO] phase=%s(%lu), heater=%s(%lu), seq=%lu, temp=%ld.%02ld C, u=%ld.%03ld, duty=%lu, valid=%lu",
           A53_Test_AutoTuneStateName(st->auto_tune_state),
           (unsigned long)st->auto_tune_state,
           A53_Test_HeaterStateName(st->state),
           (unsigned long)st->state,
           (unsigned long)st->r5_status_seq,
           temp_int,
           temp_frac,
           u_int,
           u_frac,
           (unsigned long)st->duty_count,
           (unsigned long)st->tuned_gain_valid);
}

void A53_AutoTuneTestTask(void)
{
#if (A53_AUTOTUNE_TEST_ENABLE != 0U)

    static A53_AutoTuneTestState_t test_state = A53_AT_TEST_INIT;

    static uint32_t prev_auto_state = 0xFFFFFFFFU;
    static uint32_t prev_heater_state = 0xFFFFFFFFU;

    static uint32_t last_auto_print_seq = 0U;
    static uint32_t last_run_print_seq = 0U;

    A53_SharedMemoryStatus_t st;

    A53_SharedMemory_ReadStatus(&st);

    switch (test_state)
    {
    case A53_AT_TEST_INIT:
        /*
         * Force R5 output off first.
         * The next step waits until R5 reports IDLE.
         */
        A53_SharedMemory_SendStop();

        DBG_SM("[TEST] STOP sent -> wait R5 IDLE");

        prev_auto_state = 0xFFFFFFFFU;
        prev_heater_state = 0xFFFFFFFFU;
        last_auto_print_seq = st.r5_status_seq;
        last_run_print_seq = st.r5_status_seq;

        test_state = A53_AT_TEST_WAIT_IDLE;
        break;

    case A53_AT_TEST_WAIT_IDLE:
        /*
         * Wait until R5 actually reports heater_state == IDLE.
         */
        if (st.state == 0U)
        {
            DBG_SM("[TEST] R5 IDLE confirmed");

            test_state = A53_AT_TEST_SEND_START;
        }
        break;

    case A53_AT_TEST_SEND_START:
        /*
         * Auto Tune test condition:
         *   step_mv = 0.20  -> 20% open-loop output
         *   noise   = 0.2 C
         *   slope   = 0.02 C/sec
         *   timeout = 300 sec
         */
        A53_SharedMemory_SendAutoTuneStart(0.20f,
                                           0.2f,
                                           0.02f,
                                           300000U);

        DBG_SM("[TEST] AUTO_TUNE_START sent -> wait R5 AUTO_TUNE");

        test_state = A53_AT_TEST_WAIT_R5_AUTO;
        break;

    case A53_AT_TEST_WAIT_R5_AUTO:
        /*
         * Clear START only after R5 enters AUTO_TUNE state.
         */
        if ((st.state == 4U) || (st.auto_tune_state != 0U))
        {
            A53_SharedMemory_ClearControlWord();

            DBG_SM("[TEST] R5 AUTO_TUNE confirmed -> START cleared");

            prev_auto_state = 0xFFFFFFFFU;
            prev_heater_state = 0xFFFFFFFFU;
            last_auto_print_seq = st.r5_status_seq;

            test_state = A53_AT_TEST_MONITOR;
        }
        break;

    case A53_AT_TEST_MONITOR:
        /*
         * Print when:
         *   1) auto tune phase changes
         *   2) heater state changes
         *   3) every 10 R5 control ticks
         *
         * R5 control tick is about 100 ms,
         * so 10 ticks is about 1 second.
         */
        if ((st.state != prev_heater_state) ||
            (st.auto_tune_state != prev_auto_state) ||
            ((st.r5_status_seq - last_auto_print_seq) >= 10U))
        {
            A53_Test_PrintAutoTuneProgress(&st);

            prev_heater_state = st.state;
            prev_auto_state = st.auto_tune_state;
            last_auto_print_seq = st.r5_status_seq;
        }

        if (st.auto_tune_state == 4U)
        {
            DBG_SM("[AUTO] DONE: K_x1000=%ld, L_x1000=%ld, T_x1000=%ld, Kp_x10000=%ld, Ki_x1000000=%ld",
                   (long)(st.tune_K * 1000.0f),
                   (long)(st.tune_L * 1000.0f),
                   (long)(st.tune_T * 1000.0f),
                   (long)(st.tune_kp * 10000.0f),
                   (long)(st.tune_ki * 1000000.0f));

            DBG_SM("[TEST] Auto Tune DONE -> apply tuned gain");

            test_state = A53_AT_TEST_APPLY_GAIN_AND_RUN;
        }
        else if ((st.auto_tune_state == 5U) ||
                 (st.auto_tune_state == 6U))
        {
            DBG_SM("[AUTO] FAIL/ABORT: phase=%s(%lu), err=%lu",
                   A53_Test_AutoTuneStateName(st.auto_tune_state),
                   (unsigned long)st.auto_tune_state,
                   (unsigned long)st.auto_tune_error);

            test_state = A53_AT_TEST_FINISHED;
        }
        break;

    case A53_AT_TEST_APPLY_GAIN_AND_RUN:
        /*
         * Apply Auto Tune result and run normal PI control.
         */
        A53_SharedMemory_ApplyTunedGainAndRun(80.0f);

        DBG_SM("[TEST] RUN with tuned gain");

        prev_heater_state = 0xFFFFFFFFU;
        prev_auto_state = 0xFFFFFFFFU;
        last_run_print_seq = st.r5_status_seq;

        test_state = A53_AT_TEST_RUN_MONITOR;
        break;

    case A53_AT_TEST_RUN_MONITOR:
        /*
         * Print RUN progress every 10 R5 control ticks
         * or whenever heater FSM state changes.
         */
        if ((st.state != prev_heater_state) ||
            ((st.r5_status_seq - last_run_print_seq) >= 10U))
        {
            DBG_SM("[RUN] heater=%s(%lu), seq=%lu, temp_x100=%ld, err_x100=%ld, u_x1000=%ld, duty=%lu",
                   A53_Test_HeaterStateName(st.state),
                   (unsigned long)st.state,
                   (unsigned long)st.r5_status_seq,
                   (long)(st.current_temp * 100.0f),
                   (long)(st.error * 100.0f),
                   (long)(st.u_ctrl * 1000.0f),
                   (unsigned long)st.duty_count);

            prev_heater_state = st.state;
            last_run_print_seq = st.r5_status_seq;
        }

        if (st.state == 2U)
        {
            DBG_SM("[TEST] Tuned PI reached STABLE");

            test_state = A53_AT_TEST_FINISHED;
        }
        break;

    case A53_AT_TEST_FINISHED:
    default:
        break;
    }

#else
    return;
#endif
}