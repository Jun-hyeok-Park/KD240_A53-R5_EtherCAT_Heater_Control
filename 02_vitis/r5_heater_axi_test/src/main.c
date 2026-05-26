#include "xstatus.h"

#include "r5_ttc_timer.h"
#include "uart_debug.h"
#include "r5_heater_app.h"

int main(void)
{
    int status;

    UartDebug_PrintBanner();

    R5_HeaterApp_Init();

    UartDebug_PrintTtcConfig(R5TtcTimer_GetConfigId(),
                             R5TtcTimer_GetIntrRaw(),
                             R5TtcTimer_GetIntrId());

    status = R5TtcTimer_Init();
    if (status != XST_SUCCESS)
    {
        UartDebug_PrintError("R5TtcTimer_Init failed");

        while (1)
        {
        }
    }

    UartDebug_PrintTtcStarted(R5TtcTimer_GetInterval(),
                              R5TtcTimer_GetPrescaler());

    while (1)
    {
        if (R5TtcTimer_ConsumeControlTick() != 0U)
        {
            R5_HeaterApp_Step();
        }
    }

    return 0;
}