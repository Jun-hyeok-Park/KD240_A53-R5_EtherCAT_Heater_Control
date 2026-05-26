#include "r5_ttc_timer.h"

#include "xparameters.h"
#include "xstatus.h"
#include "xil_exception.h"
#include "xscugic.h"
#include "xttcps.h"

#define TTC_CONFIG_ID       XPAR_XTTCPS_6_BASEADDR
#define TTC_INTR_RAW        XPAR_XTTCPS_6_INTERRUPTS
#define GIC_CONFIG_ID       XPAR_XSCUGIC_0_BASEADDR

/*
 * xparameters.h interrupt value example:
 * XPAR_XTTCPS_0_INTERRUPTS = 0x4024
 *
 * Lower 12 bits: 0x24
 * GIC SPI offset: +32
 * Result: 68
 */
#define TTC_INTR_ID         (((TTC_INTR_RAW) & 0x0FFFU) + 32U)

/*
 * KD240 R5 TTC Timing Note
 *
 * Target control period:
 *   - 100 ms
 *   - 10 Hz
 *
 * Observed TTC setting:
 *   - interval  = 38528
 *   - prescaler = 16
 *
 * The actual TTC base ISR is observed to run close to:
 *
 *   Base ISR ~= 100,000,000 / 38,528
 *            ~= 2,595 Hz
 *
 * Therefore, to generate a 10 Hz control tick:
 *
 *   2,595 Hz / 260 ~= 9.98 Hz
 *   Control period ~= 100.2 ms
 *
 * LOG_EVERY_CONTROL_STEPS = 10 should print one log line
 * approximately every 1 second.
 *
 * TTC_REQUESTED_FREQ_HZ = 10U 라고 설정했지만, 
 * 현재 KD240 R5 BSP/Clock 설정에서는 실제 TTC Base ISR이 10 Hz로 나오지 않고, 
 * 실측상 약 2595 Hz 근처로 들어오고 있음
 */
#define TTC_REQUESTED_FREQ_HZ           10U
#define TTC_BASE_DIVIDER_FOR_CONTROL    260U

static XTtcPs g_ttc;
static XScuGic g_intc;

static volatile uint32_t g_control_pending = 0U;

static volatile uint32_t g_ttc_base_isr_count = 0U;
static volatile uint32_t g_ttc_base_div_count = 0U;
static volatile uint32_t g_control_tick_count = 0U;
static volatile uint32_t g_control_overrun_count = 0U;

static uint16_t g_ttc_interval = 0U;
static uint8_t  g_ttc_prescaler = 0U;

static void TtcTimerStatusHandler(void *CallBackRef, u32 StatusEvent)
{
    (void)CallBackRef;

    if ((StatusEvent & XTTCPS_IXR_INTERVAL_MASK) != 0U)
    {
        g_ttc_base_isr_count++;
        g_ttc_base_div_count++;

        if (g_ttc_base_div_count >= TTC_BASE_DIVIDER_FOR_CONTROL)
        {
            g_ttc_base_div_count = 0U;
            g_control_tick_count++;

            if (g_control_pending == 0U)
            {
                g_control_pending = 1U;
            }
            else
            {
                g_control_overrun_count++;
            }
        }
    }
}

int R5TtcTimer_Init(void)
{
    int status;

    XTtcPs_Config *ttc_cfg;
    XScuGic_Config *gic_cfg;

    u16 interval;
    u8 prescaler;

    ttc_cfg = XTtcPs_LookupConfig(TTC_CONFIG_ID);
    if (ttc_cfg == 0)
    {
        return XST_FAILURE;
    }

    status = XTtcPs_CfgInitialize(&g_ttc, ttc_cfg, ttc_cfg->BaseAddress);
    if (status != XST_SUCCESS)
    {
        return status;
    }

    XTtcPs_SetOptions(&g_ttc,
                      XTTCPS_OPTION_INTERVAL_MODE |
                      XTTCPS_OPTION_WAVE_DISABLE);

    XTtcPs_CalcIntervalFromFreq(&g_ttc,
                                TTC_REQUESTED_FREQ_HZ,
                                &interval,
                                &prescaler);

    XTtcPs_SetInterval(&g_ttc, interval);
    XTtcPs_SetPrescaler(&g_ttc, prescaler);

    g_ttc_interval = interval;
    g_ttc_prescaler = prescaler;

    gic_cfg = XScuGic_LookupConfig(GIC_CONFIG_ID);
    if (gic_cfg == 0)
    {
        return XST_FAILURE;
    }

    status = XScuGic_CfgInitialize(&g_intc,
                                   gic_cfg,
                                   gic_cfg->CpuBaseAddress);
    if (status != XST_SUCCESS)
    {
        return status;
    }

    Xil_ExceptionInit();

    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
                                 (Xil_ExceptionHandler)XScuGic_InterruptHandler,
                                 &g_intc);

    XTtcPs_SetStatusHandler(&g_ttc,
                            &g_ttc,
                            TtcTimerStatusHandler);

    status = XScuGic_Connect(&g_intc,
                             TTC_INTR_ID,
                             (Xil_InterruptHandler)XTtcPs_InterruptHandler,
                             &g_ttc);

    if (status != XST_SUCCESS)
    {
        return status;
    }

    XScuGic_Enable(&g_intc, TTC_INTR_ID);

    XTtcPs_EnableInterrupts(&g_ttc, XTTCPS_IXR_INTERVAL_MASK);

    Xil_ExceptionEnable();

    XTtcPs_Start(&g_ttc);

    return XST_SUCCESS;
}

uint32_t R5TtcTimer_ConsumeControlTick(void)
{
    uint32_t consumed;

    consumed = 0U;

    if (g_control_pending != 0U)
    {
        Xil_ExceptionDisable();

        if (g_control_pending != 0U)
        {
            g_control_pending = 0U;
            consumed = 1U;
        }

        Xil_ExceptionEnable();
    }

    return consumed;
}

uint32_t R5TtcTimer_GetBaseIsrCount(void)
{
    return g_ttc_base_isr_count;
}

uint32_t R5TtcTimer_GetControlTickCount(void)
{
    return g_control_tick_count;
}

uint32_t R5TtcTimer_GetPendingCount(void)
{
    return g_control_pending;
}

uint32_t R5TtcTimer_GetOverrunCount(void)
{
    return g_control_overrun_count;
}

uint32_t R5TtcTimer_GetConfigId(void)
{
    return TTC_CONFIG_ID;
}

uint32_t R5TtcTimer_GetIntrRaw(void)
{
    return TTC_INTR_RAW;
}

uint32_t R5TtcTimer_GetIntrId(void)
{
    return TTC_INTR_ID;
}

uint16_t R5TtcTimer_GetInterval(void)
{
    return g_ttc_interval;
}

uint8_t R5TtcTimer_GetPrescaler(void)
{
    return g_ttc_prescaler;
}