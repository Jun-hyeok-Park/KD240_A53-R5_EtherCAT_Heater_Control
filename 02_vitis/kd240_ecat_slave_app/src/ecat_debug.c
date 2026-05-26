#include "ecat_debug.h"

#if defined(ECAT_DBG_ENABLE) && defined(ECAT_DBG_COUNTER)

volatile unsigned int g_dbg_timer_1ms_count = 0;
volatile unsigned int g_dbg_pdi_irq_count = 0;
volatile unsigned int g_dbg_sync0_irq_count = 0;
volatile unsigned int g_dbg_sync1_irq_count = 0;

volatile unsigned int g_dbg_out_map_count = 0;
volatile unsigned int g_dbg_app_count = 0;
volatile unsigned int g_dbg_in_map_count = 0;

void ECAT_DBG_PrintCounters(void)
{
    DEBUG_LOG("CNT",
              "timer=%u, pdi=%u, sync0=%u, sync1=%u, outMap=%u, app=%u, inMap=%u",
              g_dbg_timer_1ms_count,
              g_dbg_pdi_irq_count,
              g_dbg_sync0_irq_count,
              g_dbg_sync1_irq_count,
              g_dbg_out_map_count,
              g_dbg_app_count,
              g_dbg_in_map_count);
}

#endif