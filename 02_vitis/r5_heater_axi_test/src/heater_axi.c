#include "heater_axi.h"
#include "xil_io.h"

#define HEATER_BASE_ADDR          0xA0020000U

#define HEATER_REG_CTRL           0x00U
#define HEATER_REG_CURRENT_T      0x10U
#define HEATER_REG_DUTY_CNT       0x24U
#define HEATER_REG_VERSION        0x2CU

#define HEATER_REG_CONTROL_MODE   0x30U
#define HEATER_REG_PS_U_CTRL      0x34U
#define HEATER_REG_PS_ERROR       0x38U
#define HEATER_REG_PS_STATE       0x3CU

uint32_t HeaterAxi_F32ToU32(float value)
{
    union
    {
        float f;
        uint32_t u;
    } conv;

    conv.f = value;
    return conv.u;
}

float HeaterAxi_U32ToF32(uint32_t value)
{
    union
    {
        float f;
        uint32_t u;
    } conv;

    conv.u = value;
    return conv.f;
}

uint32_t HeaterAxi_ReadVersion(void)
{
    return Xil_In32(HEATER_BASE_ADDR + HEATER_REG_VERSION);
}

float HeaterAxi_ReadCurrentTemp(void)
{
    uint32_t raw;

    raw = Xil_In32(HEATER_BASE_ADDR + HEATER_REG_CURRENT_T);
    return HeaterAxi_U32ToF32(raw);
}

uint32_t HeaterAxi_ReadDutyCount(void)
{
    return Xil_In32(HEATER_BASE_ADDR + HEATER_REG_DUTY_CNT);
}

void HeaterAxi_SetControlMode(uint32_t mode)
{
    Xil_Out32(HEATER_BASE_ADDR + HEATER_REG_CONTROL_MODE, mode);
}

void HeaterAxi_EnableRun(void)
{
    Xil_Out32(HEATER_BASE_ADDR + HEATER_REG_CTRL, 0x00000001U);
}

void HeaterAxi_DisableRun(void)
{
    Xil_Out32(HEATER_BASE_ADDR + HEATER_REG_CTRL, 0x00000000U);
}

void HeaterAxi_WriteControlOutput(float u_ctrl)
{
    Xil_Out32(HEATER_BASE_ADDR + HEATER_REG_PS_U_CTRL, HeaterAxi_F32ToU32(u_ctrl));
}

void HeaterAxi_WriteError(float error)
{
    Xil_Out32(HEATER_BASE_ADDR + HEATER_REG_PS_ERROR, HeaterAxi_F32ToU32(error));
}

void HeaterAxi_WriteState(uint32_t state)
{
    Xil_Out32(HEATER_BASE_ADDR + HEATER_REG_PS_STATE, state);
}

void HeaterAxi_WriteR5Status(float u_ctrl, float error, uint32_t state)
{
    HeaterAxi_SetControlMode(HEATER_CONTROL_MODE_R5);
    HeaterAxi_EnableRun();

    HeaterAxi_WriteControlOutput(u_ctrl);
    HeaterAxi_WriteError(error);
    HeaterAxi_WriteState(state);
}