#ifndef R5_TTC_TIMER_H_
#define R5_TTC_TIMER_H_

#include <stdint.h>

#define R5_CONTROL_PERIOD_MS    100U
#define R5_CONTROL_PERIOD_SEC   0.1f

int R5TtcTimer_Init(void);

uint32_t R5TtcTimer_ConsumeControlTick(void);

uint32_t R5TtcTimer_GetBaseIsrCount(void);
uint32_t R5TtcTimer_GetControlTickCount(void);
uint32_t R5TtcTimer_GetPendingCount(void);
uint32_t R5TtcTimer_GetOverrunCount(void);

uint32_t R5TtcTimer_GetConfigId(void);
uint32_t R5TtcTimer_GetIntrRaw(void);
uint32_t R5TtcTimer_GetIntrId(void);

uint16_t R5TtcTimer_GetInterval(void);
uint8_t  R5TtcTimer_GetPrescaler(void);

#endif /* R5_TTC_TIMER_H_ */