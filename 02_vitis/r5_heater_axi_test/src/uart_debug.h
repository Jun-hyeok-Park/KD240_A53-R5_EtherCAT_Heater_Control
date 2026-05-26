#ifndef UART_DEBUG_H_
#define UART_DEBUG_H_

#include <stdint.h>
#include "heater_control.h"

/* =========================================================
 * R5 debug configuration
 * ========================================================= */
#define DEBUG_LOG_ENABLE
#define DEBUG_LOG_CPU_TAG    "R5"

// #define R5_DBG_CTRL_PERIODIC

#include "debug_log.h"

/* =========================================================
 * R5 module log macros
 * ========================================================= */
#define R5_LOG_BOOT(fmt, ...)    DEBUG_LOG("BOOT", fmt, ##__VA_ARGS__)
#define R5_LOG_TTC(fmt, ...)     DEBUG_LOG("TTC",  fmt, ##__VA_ARGS__)
#define R5_LOG_CTRL(fmt, ...)    DEBUG_LOG("CTRL", fmt, ##__VA_ARGS__)
#define R5_LOG_SM(fmt, ...)      DEBUG_LOG("SM",   fmt, ##__VA_ARGS__)
#define R5_LOG_AUTO(fmt, ...)    DEBUG_LOG("AUTO", fmt, ##__VA_ARGS__)
#define R5_LOG_ERR(fmt, ...)     DEBUG_LOG("ERR",  fmt, ##__VA_ARGS__)


void UartDebug_PrintBanner(void);
void UartDebug_PrintHeaterVersion(uint32_t version);
void UartDebug_PrintTtcConfig(uint32_t config_id, uint32_t raw_intr, uint32_t gic_intr);
void UartDebug_PrintTtcStarted(uint16_t interval, uint8_t prescaler);
void UartDebug_PrintError(const char *msg);
void UartDebug_PrintHeaterStateOnChange(const HeaterApp_t *heater);

void UartDebug_PrintHeaterStatus(uint32_t step_count,
                                 uint32_t control_tick_count,
                                 uint32_t base_isr_count,
                                 uint32_t pending_count,
                                 uint32_t overrun_count,
                                 const HeaterApp_t *heater,
                                 uint32_t duty_count);

#endif /* UART_DEBUG_H_ */