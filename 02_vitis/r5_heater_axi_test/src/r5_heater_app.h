#ifndef R5_HEATER_APP_H_
#define R5_HEATER_APP_H_

#ifdef __cplusplus
extern "C" {
#endif

/*
 * R5 Heater Application layer
 *
 * Responsibility:
 *   - Own HeaterApp_t / AutoTune_t runtime objects
 *   - Initialize heater control application state
 *   - Execute one control step per TTC control tick
 */

void R5_HeaterApp_Init(void);
void R5_HeaterApp_Step(void);

#ifdef __cplusplus
}
#endif

#endif /* R5_HEATER_APP_H_ */