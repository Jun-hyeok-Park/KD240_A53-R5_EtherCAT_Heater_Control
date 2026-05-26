#include "xstatus.h"
#include "sleep.h"
#include "xparameters.h"
#include "xil_types.h"

#include "9252_HW.h"
#include "ecatslv.h"
#include "ecatappl.h"
#include "ecatcoe.h"
#include "coeappl.h"
#include "applInterface.h"
#include "ecat_debug.h"
#include "SPIDriver.h"

#include "a53_shared_memory.h"
#include "a53_auto_tune_test.h"
#include "a53_ecat_monitor.h"

int main(void)
{
    UINT8 hw_status;

    DBG_BOOT("Calling LAN9252_Init()");

    hw_status = LAN9252_Init();

    DBG_BOOT("LAN9252_Init() returned %u", (unsigned int)hw_status);

    if (hw_status != 0U)
    {
        DBG_BOOT("LAN9252_Init() failed");
        return XST_FAILURE;
    }

    DBG_BOOT("LAN9252_Init() OK");

    /*
     * A53 EtherCAT app starts after R5 app.
     * Initialize shared memory once.
     * Do not clear shared memory cyclically.
     */
    A53_SharedMemory_Clear();
    A53_SharedMemory_InitIdle();

    DBG_BOOT("Shared Memory Init OK");

    DBG_BOOT("Calling MainInit()");
    MainInit();
    DBG_BOOT("MainInit() done");
    DBG_BOOT("Enter MainLoop()");

    while (1)
    {
        EcatPlProcessPendingEvents();

        EcatProcessTimerPending();

        MainLoop();

        /*
         * Heater PI/FSM control is handled by R5.
         * Do not call APPL_HeaterControlTask() on A53.
         */

        A53_EcatMonitor_PrintAlStatusOnChange();

#if (A53_AUTOTUNE_TEST_ENABLE != 0U)
        A53_AutoTuneTestTask();
#endif

        usleep(100U);
    }

    return XST_SUCCESS;
}