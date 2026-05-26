#include "a53_ecat_monitor.h"

#include "9252_HW.h"
#include "ecatslv.h"
#include "ecat_debug.h"

void A53_EcatMonitor_PrintAlStatusOnChange(void)
{
    static UINT16 prev_al_status = 0xFFFFU;
    static UINT16 prev_al_code = 0xFFFFU;

    UINT16 al_status = 0U;
    UINT16 al_code = 0U;
    UINT16 al_event = 0U;

    HW_EscReadWord(al_status, 0x0130U);
    HW_EscReadWord(al_code, 0x0134U);
    HW_EscReadWord(al_event, ESC_AL_EVENT_OFFSET);

    if ((al_status != prev_al_status) ||
        (al_code != prev_al_code))
    {
        DBG_ECAT("AL_STATUS=0x%04x, AL_CODE=0x%04x, AL_EVENT=0x%04x",
                 (unsigned int)al_status,
                 (unsigned int)al_code,
                 (unsigned int)al_event);

        prev_al_status = al_status;
        prev_al_code = al_code;
    }
}