#include "uart_debug.h"
#include "xil_printf.h"

static void UartDebug_PrintFloat3(float value)
{
    int negative;
    uint32_t whole;
    uint32_t frac;
    float abs_value;

    negative = 0;

    if (value < 0.0f)
    {
        negative = 1;
        abs_value = -value;
    }
    else
    {
        abs_value = value;
    }

    whole = (uint32_t)abs_value;
    frac = (uint32_t)((abs_value - (float)whole) * 1000.0f);

    if (frac >= 1000U)
    {
        whole++;
        frac = 0U;
    }

    if (negative != 0)
    {
        xil_printf("-");
    }

    xil_printf("%lu.%03lu",
               (unsigned long)whole,
               (unsigned long)frac);
}

void UartDebug_PrintBanner(void)
{
    xil_printf("\r\n====================================\r\n");
    xil_printf(" [R5][BOOT] Heater PI Control Test\r\n");
    xil_printf("====================================\r\n");
}

void UartDebug_PrintHeaterVersion(uint32_t version)
{
    R5_LOG_BOOT("heater version = 0x%08lx",
                (unsigned long)version);
}

void UartDebug_PrintTtcConfig(uint32_t config_id,
                              uint32_t raw_intr,
                              uint32_t gic_intr)
{
    R5_LOG_TTC("config=0x%08lx, raw_intr=0x%08lx, gic_intr=%lu",
               (unsigned long)config_id,
               (unsigned long)raw_intr,
               (unsigned long)gic_intr);
}

void UartDebug_PrintTtcStarted(uint16_t interval, uint8_t prescaler)
{
    R5_LOG_TTC("interval=%u, prescaler=%u",
               (unsigned int)interval,
               (unsigned int)prescaler);

    R5_LOG_TTC("timer started");
}

void UartDebug_PrintError(const char *msg)
{
    R5_LOG_ERR("%s", msg);
}

void UartDebug_PrintHeaterStatus(uint32_t step_count,
                                 uint32_t control_tick_count,
                                 uint32_t base_isr_count,
                                 uint32_t pending_count,
                                 uint32_t overrun_count,
                                 const HeaterApp_t *heater,
                                 uint32_t duty_count)
{
#if defined(R5_DBG_ENABLE) && defined(R5_DBG_CTRL_PERIODIC)

    if (heater == 0)
    {
        return;
    }

    DEBUG_LOG_PREFIX("CTRL");

    xil_printf("Step=%lu, CtrlTick=%lu, BaseIsr=%lu, Pending=%lu, Overrun=%lu, State=%lu, Temp=",
               (unsigned long)step_count,
               (unsigned long)control_tick_count,
               (unsigned long)base_isr_count,
               (unsigned long)pending_count,
               (unsigned long)overrun_count,
               (unsigned long)heater->state);

    UartDebug_PrintFloat3(heater->current_temp);

    xil_printf(", Err=");
    UartDebug_PrintFloat3(heater->error);

    xil_printf(", U=");
    UartDebug_PrintFloat3(heater->u_ctrl);

    xil_printf(", Duty=%lu\r\n", (unsigned long)duty_count);

#else
    (void)step_count;
    (void)control_tick_count;
    (void)base_isr_count;
    (void)pending_count;
    (void)overrun_count;
    (void)heater;
    (void)duty_count;
#endif
}

void UartDebug_PrintHeaterStateOnChange(const HeaterApp_t *heater)
{
    static uint32_t prev_state = 0U;
    static uint32_t initialized = 0U;

    if (heater == 0)
    {
        return;
    }

    if (initialized == 0U)
    {
        prev_state = heater->state;
        initialized = 1U;
        return;
    }

    if (heater->state != prev_state)
    {
        DEBUG_LOG_PREFIX("CTRL");

        xil_printf("State changed: %lu -> %lu, Temp=",
                   (unsigned long)prev_state,
                   (unsigned long)heater->state);

        UartDebug_PrintFloat3(heater->current_temp);

        xil_printf(", Err=");
        UartDebug_PrintFloat3(heater->error);

        xil_printf(", U=");
        UartDebug_PrintFloat3(heater->u_ctrl);

        xil_printf("\r\n");

        prev_state = heater->state;
    }
}