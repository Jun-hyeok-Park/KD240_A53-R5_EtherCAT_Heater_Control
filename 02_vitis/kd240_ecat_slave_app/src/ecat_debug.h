#ifndef ECAT_DEBUG_H_
#define ECAT_DEBUG_H_

/* =========================================================
 * A53 EtherCAT debug configuration
 * ========================================================= */
#define DEBUG_LOG_ENABLE
#define DEBUG_LOG_CPU_TAG    "A53"

#include "debug_log.h"

/* =========================================================
 * Debug enable switches
 * ========================================================= */
#define ECAT_DBG_ENABLE

#define ECAT_DBG_BOOT
#define ECAT_DBG_APP
#define ECAT_DBG_SM
#define ECAT_DBG_ECAT

/* Bring-up/debug only */
#define ECAT_DBG_HW
#define ECAT_DBG_SPI
#define ECAT_DBG_ISR
#define ECAT_DBG_COUNTER



/* =========================================================
 * A53 print macros
 * Format:
 *   [A53][MODULE] message
 * ========================================================= */
#if defined(ECAT_DBG_ENABLE) && defined(ECAT_DBG_BOOT)
#define DBG_BOOT(fmt, ...)    DEBUG_LOG("BOOT", fmt, ##__VA_ARGS__)
#else
#define DBG_BOOT(fmt, ...)    do { } while (0)
#endif

#if defined(ECAT_DBG_ENABLE) && defined(ECAT_DBG_HW)
#define DBG_HW(fmt, ...)      DEBUG_LOG("HW", fmt, ##__VA_ARGS__)
#else
#define DBG_HW(fmt, ...)      do { } while (0)
#endif

#if defined(ECAT_DBG_ENABLE) && defined(ECAT_DBG_SPI)
#define DBG_SPI(fmt, ...)     DEBUG_LOG("SPI", fmt, ##__VA_ARGS__)
#else
#define DBG_SPI(fmt, ...)     do { } while (0)
#endif

#if defined(ECAT_DBG_ENABLE) && defined(ECAT_DBG_ISR)
#define DBG_ISR(fmt, ...)     DEBUG_LOG("ISR", fmt, ##__VA_ARGS__)
#else
#define DBG_ISR(fmt, ...)     do { } while (0)
#endif

#if defined(ECAT_DBG_ENABLE) && defined(ECAT_DBG_APP)
#define DBG_APP(fmt, ...)     DEBUG_LOG("APP", fmt, ##__VA_ARGS__)
#else
#define DBG_APP(fmt, ...)     do { } while (0)
#endif

#if defined(ECAT_DBG_ENABLE) && defined(ECAT_DBG_SM)
#define DBG_SM(fmt, ...)      DEBUG_LOG("SM", fmt, ##__VA_ARGS__)
#else
#define DBG_SM(fmt, ...)      do { } while (0)
#endif

#if defined(ECAT_DBG_ENABLE) && defined(ECAT_DBG_ECAT)
#define DBG_ECAT(fmt, ...)    DEBUG_LOG("ECAT", fmt, ##__VA_ARGS__)
#else
#define DBG_ECAT(fmt, ...)    do { } while (0)
#endif


/* =========================================================
 * Debug counters
 * ========================================================= */
#if defined(ECAT_DBG_ENABLE) && defined(ECAT_DBG_COUNTER)

extern volatile unsigned int g_dbg_timer_1ms_count;
extern volatile unsigned int g_dbg_pdi_irq_count;
extern volatile unsigned int g_dbg_sync0_irq_count;
extern volatile unsigned int g_dbg_sync1_irq_count;

extern volatile unsigned int g_dbg_out_map_count;
extern volatile unsigned int g_dbg_app_count;
extern volatile unsigned int g_dbg_in_map_count;

#define DBG_INC(counter) do { (counter)++; } while (0)

void ECAT_DBG_PrintCounters(void);

#else

#define DBG_INC(counter) do { } while (0)
#define ECAT_DBG_PrintCounters() do { } while (0)

#endif

#endif /* ECAT_DEBUG_H_ */