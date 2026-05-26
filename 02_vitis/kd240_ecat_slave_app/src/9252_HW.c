#include "ecat_def.h"
#include "ecatslv.h"
#include "ecatappl.h"
#include "SPIDriver.h"
#include "lan9252_spi.h"
#include "ecat_debug.h"
#include "xparameters.h"
#include "xil_io.h"

#define _9252_HW_ 1
#include "9252_HW.h"
#undef _9252_HW_
#define _9252_HW_ 0

static UINT16 EscALEvent = 0U;
static TSYNCMAN TmpSyncMan;

volatile unsigned int restore_intsts = 0U;

static UINT32 g_timer_origin_ticks = 0U;

#ifndef XPAR_ECAT_PL_IF_0_BASEADDR
#define XPAR_ECAT_PL_IF_0_BASEADDR    0x40000000U
#endif

#define ECAT_PL_IF_BASEADDR           XPAR_ECAT_PL_IF_0_BASEADDR
#define ECAT_PL_FREE_CNT_OFFSET       0x08U

/* PL free counter clock frequency */
#define ECAT_PL_FREE_CNT_HZ           100000000U
#define ECAT_PL_FREE_CNT_TICKS_PER_MS (ECAT_PL_FREE_CNT_HZ / 1000U)

#define LAN9252_BYTE_ORDER_REG      0x0064U
#define LAN9252_CSR_INT_CONF        0x0054U
#define LAN9252_CSR_INT_EN          0x005CU

static UINT32 PDI_ReadPlFreeCounter(void)
{
    return Xil_In32(ECAT_PL_IF_BASEADDR + ECAT_PL_FREE_CNT_OFFSET);
}

static void GetInterruptRegister(void)
{
    UINT32 int_status;

    int_status = PDI_Disable_Global_Interrupt();
    HW_EscReadIsr((MEM_ADDR *)&EscALEvent, ESC_AL_EVENT_OFFSET, 2U);
    PDI_Restore_Global_Interrupt(int_status);
}

static void ISR_GetInterruptRegister(void)
{
    HW_EscReadIsr((MEM_ADDR *)&EscALEvent, ESC_AL_EVENT_OFFSET, 2U);
}

UINT8 LAN9252_Init(void)
{
    UINT16 intMask;
    UINT16 readback;
    UINT32 data;
    UINT32 retry;

    PDI_Init();

    /*
     * BYTE_TEST check
     */
    retry = 1000000U;
    do {
        data = PDIReadLAN9252DirectReg(LAN9252_BYTE_ORDER_REG);
        retry--;
    } while ((data != LAN9252_BYTE_TEST_VALUE) && (retry > 0U));

    if (data != LAN9252_BYTE_TEST_VALUE)
    {
        DBG_HW("LAN9252_Init: BYTE_TEST failed, value=0x%08X",
               (unsigned int)data);
        return 1U;
    }

    /*
     * AL Event Mask write/readback check
     */
    retry = 100000U;
    do {
        intMask = 0x0093U;
        HW_EscWriteWord(intMask, ESC_AL_EVENTMASK_OFFSET);

        readback = 0U;
        HW_EscReadWord(readback, ESC_AL_EVENTMASK_OFFSET);

        retry--;
    } while ((readback != 0x0093U) && (retry > 0U));

    if (readback != 0x0093U)
    {
        DBG_HW("LAN9252_Init failed: AL_EVENTMASK rb=0x%04X",
            (unsigned int)readback);
        return 1U;
    }

    /*
     * LAN9252 interrupt configuration
     */
    PDIWriteLAN9252DirectReg(0x00000101U, LAN9252_CSR_INT_CONF);
    PDIWriteLAN9252DirectReg(0x00000001U, LAN9252_CSR_INT_EN);

    /*
     * PDI / SYNC / Timer / IRQ setup
     */
    PDI_Init_SYNC_Interrupts();
    PDI_Timer_Interrupt();

    HW_ResetALEventMask(0U);

    PDI_IRQ_Interrupt();
    PDI_Enable_Global_interrupt();

    return 0U;
}

void HW_Release(void)
{
}

UINT16 HW_GetALEventRegister(void)
{
    GetInterruptRegister();
    return EscALEvent;
}

UINT16 HW_GetALEventRegister_Isr(void)
{
    ISR_GetInterruptRegister();
    return EscALEvent;
}

void HW_ResetALEventMask(UINT16 intMask)
{
    UINT32 int_status;
    UINT16 mask;
    UINT16 readback;

    HW_EscReadWord(mask, ESC_AL_EVENTMASK_OFFSET);
    mask &= intMask;

    int_status = PDI_Disable_Global_Interrupt();
    HW_EscWriteWord(mask, ESC_AL_EVENTMASK_OFFSET);
    HW_EscReadWord(readback, ESC_AL_EVENTMASK_OFFSET);
    PDI_Restore_Global_Interrupt(int_status);

    (void)readback;
}

void HW_SetALEventMask(UINT16 intMask)
{
    UINT32 int_status;
    UINT16 mask;
    UINT16 readback;

    HW_EscReadWord(mask, ESC_AL_EVENTMASK_OFFSET);
    mask |= intMask;

    int_status = PDI_Disable_Global_Interrupt();
    HW_EscWriteWord(mask, ESC_AL_EVENTMASK_OFFSET);
    HW_EscReadWord(readback, ESC_AL_EVENTMASK_OFFSET);
    PDI_Restore_Global_Interrupt(int_status);

    (void)readback;
}

void HW_EscRead(MEM_ADDR *pData, UINT16 Address, UINT16 Len)
{
    volatile unsigned int int_status;
    UINT16 i;
    UINT8 *pTmpData = (UINT8 *)pData;

    while (Len > 0U) {
        if (Address >= MIN_PD_READ_ADDRESS) {
            i = Len;
        } else {
            i = (Len > 4U) ? 4U : Len;

            if ((Address & 0x01U) != 0U) {
                i = 1U;
            } else if ((Address & 0x02U) != 0U) {
                i = ((i & 0x01U) != 0U) ? 1U : 2U;
            } else if (i == 3U) {
                i = 1U;
            }
        }

        int_status = PDI_Disable_Global_Interrupt();
        PDIReadReg(pTmpData, Address, i);
        PDI_Restore_Global_Interrupt(int_status);

        Len -= i;
        pTmpData += i;
        Address += i;
    }
}

void HW_EscReadIsr(MEM_ADDR *pData, UINT16 Address, UINT16 Len)
{
    UINT16 i;
    UINT8 *pTmpData = (UINT8 *)pData;

    while (Len > 0U) {
        if (Address >= MIN_PD_READ_ADDRESS) {
            i = Len;
        } else {
            i = (Len > 4U) ? 4U : Len;

            if ((Address & 0x01U) != 0U) {
                i = 1U;
            } else if ((Address & 0x02U) != 0U) {
                i = ((i & 0x01U) != 0U) ? 1U : 2U;
            } else if (i == 3U) {
                i = 1U;
            }
        }

        PDIReadReg(pTmpData, Address, i);

        Len -= i;
        pTmpData += i;
        Address += i;
    }
}

void HW_EscWrite(MEM_ADDR *pData, UINT16 Address, UINT16 Len)
{
    volatile unsigned int int_status;
    UINT16 i;
    UINT8 *pTmpData = (UINT8 *)pData;

    while (Len > 0U) {
        if (Address >= MIN_PD_WRITE_ADDRESS) {
            i = Len;
        } else {
            i = (Len > 4U) ? 4U : Len;

            if ((Address & 0x01U) != 0U) {
                i = 1U;
            } else if ((Address & 0x02U) != 0U) {
                i = ((i & 0x01U) != 0U) ? 1U : 2U;
            } else if (i == 3U) {
                i = 1U;
            }
        }

        int_status = PDI_Disable_Global_Interrupt();
        PDIWriteReg(pTmpData, Address, i);
        PDI_Restore_Global_Interrupt(int_status);

        Len -= i;
        pTmpData += i;
        Address += i;
    }
}

void HW_EscWriteIsr(MEM_ADDR *pData, UINT16 Address, UINT16 Len)
{
    UINT16 i;
    UINT8 *pTmpData = (UINT8 *)pData;

    while (Len > 0U) {
        if (Address >= MIN_PD_WRITE_ADDRESS) {
            i = Len;
        } else {
            i = (Len > 4U) ? 4U : Len;

            if ((Address & 0x01U) != 0U) {
                i = 1U;
            } else if ((Address & 0x02U) != 0U) {
                i = ((i & 0x01U) != 0U) ? 1U : 2U;
            } else if (i == 3U) {
                i = 1U;
            }
        }

        PDIWriteReg(pTmpData, Address, i);

        Len -= i;
        pTmpData += i;
        Address += i;
    }
}

void HW_DisableSyncManChannel(UINT8 channel)
{
    UINT16 Offset;
    volatile UINT32 smStatus = SM_SETTING_PDI_DISABLE;

    smStatus = SWAPDWORD(smStatus);
    Offset = (UINT16)(ESC_SYNCMAN_CONTROL_OFFSET + (SIZEOF_SM_REGISTER * channel));

    HW_EscWriteDWord(smStatus, Offset);

    do {
        HW_EscReadDWord(smStatus, Offset);
        smStatus = SWAPDWORD(smStatus);
    } while ((smStatus & SM_SETTING_PDI_DISABLE) == 0U);
}

void HW_EnableSyncManChannel(UINT8 channel)
{
    UINT16 Offset;
    volatile UINT32 smStatus = 0U;

    Offset = (UINT16)(ESC_SYNCMAN_CONTROL_OFFSET + (SIZEOF_SM_REGISTER * channel));

    HW_EscWriteDWord(smStatus, Offset);

    do {
        HW_EscReadDWord(smStatus, Offset);
        smStatus = SWAPDWORD(smStatus);
    } while ((smStatus & SM_SETTING_PDI_DISABLE) != 0U);
}

TSYNCMAN ESCMEM *HW_GetSyncMan(UINT8 channel)
{
    HW_EscRead((MEM_ADDR *)&TmpSyncMan,
               (UINT16)(ESC_SYNCMAN_REG_OFFSET + (channel * SIZEOF_SM_REGISTER)),
               SIZEOF_SM_REGISTER);

    return &TmpSyncMan;
}

void HW_SetLed(UINT8 RunLed, UINT8 ErrLed)
{
    UINT8 run_value = 0U;
    UINT8 err_value = 0U;

    run_value = (RunLed != 0U) ? 0x1FU : 0x00U;
    err_value = (ErrLed != 0U) ? 0x1FU : 0x00U;

    HW_EscWriteByte(run_value, ESC_RUN_LED_OVERRIDE);
    HW_EscWriteByte(err_value, ESC_ERROR_LED_OVERRIDE);
}

UINT16 PDI_GetTimer(void)
{
    UINT32 now_ticks;
    UINT32 elapsed_ticks;
    UINT32 elapsed_ms;

    now_ticks = PDI_ReadPlFreeCounter();

    /* unsigned subtraction handles wraparound naturally */
    elapsed_ticks = now_ticks - g_timer_origin_ticks;

    elapsed_ms = elapsed_ticks / ECAT_PL_FREE_CNT_TICKS_PER_MS;

    return (UINT16)(elapsed_ms & 0xFFFFU);
}

void PDI_ClearTimer(void)
{
    g_timer_origin_ticks = PDI_ReadPlFreeCounter();
}

void PDI_Restore_Global_Interrupt(UINT32 int_sts)
{
    if (int_sts != 0U)
    {
        EcatPlInterruptEnable();
    }
}

UINT32 PDI_Disable_Global_Interrupt(void)
{
    EcatPlInterruptDisable();
    return 1U;
}
