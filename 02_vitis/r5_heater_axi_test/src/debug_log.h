#ifndef DEBUG_LOG_H_
#define DEBUG_LOG_H_

#include "xil_printf.h"

/*
 * Common debug log format:
 *
 *   [CPU][MODULE] message
 *
 * Examples:
 *   [A53][BOOT] Calling LAN9252_Init()
 *   [A53][ECAT] AL_STATUS=0x0001
 *   [R5][TTC]  interval=38528, prescaler=16
 *   [R5][CTRL] Step=10, Temp=25.000
 */

#ifndef DEBUG_LOG_CPU_TAG
#define DEBUG_LOG_CPU_TAG    "CPU"
#endif

#ifdef DEBUG_LOG_ENABLE

#define DEBUG_LOG(module, fmt, ...) \
    xil_printf("[%s][%s] " fmt "\r\n", DEBUG_LOG_CPU_TAG, module, ##__VA_ARGS__)

#define DEBUG_LOG_PREFIX(module) \
    xil_printf("[%s][%s] ", DEBUG_LOG_CPU_TAG, module)

#else

#define DEBUG_LOG(module, fmt, ...)   do { } while (0)
#define DEBUG_LOG_PREFIX(module)      do { } while (0)

#endif

#endif /* DEBUG_LOG_H_ */