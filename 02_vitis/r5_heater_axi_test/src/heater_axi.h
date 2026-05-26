#ifndef HEATER_AXI_H_
#define HEATER_AXI_H_

#include <stdint.h>

#define HEATER_CONTROL_MODE_PL    0U
#define HEATER_CONTROL_MODE_R5    1U

uint32_t HeaterAxi_ReadVersion(void);
float    HeaterAxi_ReadCurrentTemp(void);
uint32_t HeaterAxi_ReadDutyCount(void);

void HeaterAxi_SetControlMode(uint32_t mode);
void HeaterAxi_EnableRun(void);
void HeaterAxi_DisableRun(void);

void HeaterAxi_WriteControlOutput(float u_ctrl);
void HeaterAxi_WriteError(float error);
void HeaterAxi_WriteState(uint32_t state);
void HeaterAxi_WriteR5Status(float u_ctrl, float error, uint32_t state);

uint32_t HeaterAxi_F32ToU32(float value);
float    HeaterAxi_U32ToF32(uint32_t value);

#endif /* HEATER_AXI_H_ */