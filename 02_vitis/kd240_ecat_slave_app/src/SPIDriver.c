/* =========================================================
 * 1. Includes
 * ========================================================= */
#include "SPIDriver.h"
#include "9252_HW.h"
#include "ecat_debug.h"
#include "lan9252_spi.h"

#include "ecatappl.h"

#include "xparameters.h"
#include "xstatus.h"
#include "xil_types.h"
#include "xil_io.h"
#include "xil_exception.h"
#include "xscugic.h"
#include "xttcps.h"

#include <string.h>

/* =========================================================
 * 2. Macros / Constants
 * ========================================================= */
#define AXI_QUAD_SPI_DEVICE_ID      0
#define AXI_QUAD_SPI_SS0_MASK       0x01U

#ifndef XPAR_ECAT_PL_IF_0_BASEADDR
#define XPAR_ECAT_PL_IF_0_BASEADDR  0x40000000U
#endif

#define ECAT_PL_IF_BASEADDR         XPAR_ECAT_PL_IF_0_BASEADDR
#define ECAT_PL_IF_RST_CTRL_OFFSET  0x18U
#define ECAT_PL_IF_INTR_OFFSET      0x1CU

#define ECAT_PL_INTR_IRQ_MASK       0x00000001U
#define ECAT_PL_INTR_SYNC0_MASK     0x00000002U
#define ECAT_PL_INTR_SYNC1_MASK     0x00000004U
#define ECAT_PL_INTR_ALL_MASK       0x00000007U

#define ADDRESS_AUTO_INCREMENT      0x40U

#define ECAT_GIC_TRIGGER_LEVEL_HIGH  0x1U
#define ECAT_GIC_TRIGGER_RISING_EDGE 0x3U

/*
 * KD240 / Zynq UltraScale+ MPSoC
 *
 * xlconcat mapping:
 *   In0 -> pl_ps_irq0[0] -> GIC ID 121 -> LAN9252 IRQ
 *   In1 -> pl_ps_irq0[1] -> GIC ID 122 -> LAN9252 SYNC0
 *   In2 -> pl_ps_irq0[2] -> GIC ID 123 -> LAN9252 SYNC1
 */
#define ECAT_PL_IRQ_INTR_ID      121U
#define ECAT_PL_SYNC0_INTR_ID    122U
#define ECAT_PL_SYNC1_INTR_ID    123U

#define ECAT_USE_SYNC0_INTERRUPT 1
#define ECAT_USE_SYNC1_INTERRUPT 0

#define ECAT_PL_INTR_ACTIVE_MASK (ECAT_PL_INTR_IRQ_MASK | ECAT_PL_INTR_SYNC0_MASK)

#ifndef XPAR_SCUGIC_SINGLE_DEVICE_ID
#define XPAR_SCUGIC_SINGLE_DEVICE_ID 0U
#endif

#define ECAT_TIMER_HZ 1000U

#if defined(XPAR_XTTCPS_0_DEVICE_ID)
#define ECAT_TTC_LOOKUP_ID XPAR_XTTCPS_0_DEVICE_ID
#else
#define ECAT_TTC_LOOKUP_ID XPAR_XTTCPS_0_BASEADDR
#endif

/*
 * SDT-style xparameters may encode TTC interrupt as 0x4024.
 * Low byte 0x24 is SPI interrupt number 36.
 * XScuGic_Connect expects GIC ID = 32 + SPI number = 68.
 */
#define ECAT_DT_SPI_TO_GIC_ID(x) (((x) & 0xFFU) + 32U)

#if defined(XPAR_XTTCPS_0_INTR)
#define ECAT_TTC_INTR_ID XPAR_XTTCPS_0_INTR
#elif defined(XPAR_XTTCPS_0_INTERRUPTS)
#define ECAT_TTC_INTR_ID ECAT_DT_SPI_TO_GIC_ID(XPAR_XTTCPS_0_INTERRUPTS)
#else
#error "No TTC interrupt ID definition found"
#endif

/* =========================================================
 * 3. Static Global Variables
 * ========================================================= */
static lan9252_spi_t g_lan9252;
static lan9252_spi_t *g_pdi_ctx = 0;

static XTtcPs g_ecat_ttc_timer;
static int g_ecat_ttc_timer_initialized = 0;
static volatile UINT32 g_ecat_ssc_timer_pending = 0U;

/*
 * 1 ms TTC time base for A53 heater control.
 * PIC32_EtherCAT_Slave.c should use:
 *   extern volatile UINT32 g_heater_1ms_tick;
 */
volatile UINT32 g_heater_1ms_tick = 0U;

static XScuGic g_ecat_gic;
static int g_ecat_gic_initialized = 0;

static volatile UINT32 g_ecat_pl_pending_events = 0U;
static volatile UINT8  g_ecat_pl_intr_suspended = 0U;

/* =========================================================
 * 4. Static Function Prototypes
 * ========================================================= */
/* PDI context / direct SPI helpers */
static int pdi_check_ctx(void);
static int spi_direct_fast_read_bytes(UINT16 address, UINT8 *data, UINT16 length);
static int spi_direct_write_bytes(UINT16 address, const UINT8 *data, UINT16 length);

/* PL interrupt helpers */
static void EcatPlIrqLinesDisable(void);
static void EcatPlIrqLinesEnable(void);
static void EcatPlInterruptHandler(void *CallbackRef);
static int  EcatPlInterruptConnectOne(u32 IntrId, u8 Priority);
static int  EcatPlInterruptInit(void);
// static UINT32 EcatPlSelectPendingEvent(UINT32 pending);

/* TTC timer helpers */
static void EcatTtcTimerInterruptHandler(void *CallbackRef);
static int  EcatTtcTimerInterruptInit(void);

/* =========================================================
 * 5. Debug/Public Helper Functions
 * ========================================================= */
UINT32 EcatPlInterruptGetRawStatus(void)
{
    return Xil_In32(ECAT_PL_IF_BASEADDR + ECAT_PL_IF_INTR_OFFSET) & ECAT_PL_INTR_ACTIVE_MASK;
}

void EcatDbgPrintAlStatus(void)
{
    UINT32 al_status = 0U;
    UINT32 al_code = 0U;

    if (lan9252_spi_csr_read(&g_lan9252, 0x0130U, 2U, &al_status) != XST_SUCCESS)
    {
        DBG_HW("AL_STATUS read failed");
        return;
    }

    if (lan9252_spi_csr_read(&g_lan9252, 0x0134U, 2U, &al_code) != XST_SUCCESS)
    {
        DBG_HW("AL_STATUS_CODE read failed");
        return;
    }

    DBG_BOOT("AL_STATUS=0x%04X, AL_CODE=0x%04X",
             (unsigned int)(al_status & 0xFFFFU),
             (unsigned int)(al_code & 0xFFFFU));
}

/* =========================================================
 * 6. SPI Low-Level Access Functions
 * ========================================================= */
static int pdi_check_ctx(void)
{
    return (g_pdi_ctx != 0);
}

void PDI_RegisterLan9252Context(lan9252_spi_t *ctx)
{
    g_pdi_ctx = ctx;
}

static int spi_direct_fast_read_bytes(UINT16 address, UINT8 *data, UINT16 length)
{
    u8 tx[64];
    u8 rx[64];
    UINT16 i;
    unsigned total_len;

    if ((!pdi_check_ctx()) || (data == 0) || (length == 0U) || (length > 60U)) {
        return XST_FAILURE;
    }

    total_len = (unsigned)(4U + length);

    tx[0] = CMD_FAST_READ;
    tx[1] = (u8)((address >> 8) & 0xFFU);
    tx[2] = (u8)(address & 0xFFU);
    tx[3] = CMD_FAST_READ_DUMMY;

    for (i = 4U; i < total_len; i++) {
        tx[i] = 0U;
    }

    memset(rx, 0, total_len);

    if (lan9252_spi_transfer(g_pdi_ctx, tx, rx, total_len) != XST_SUCCESS) {
        return XST_FAILURE;
    }

    for (i = 0U; i < length; i++) {
        data[i] = rx[4U + i];
    }

    return XST_SUCCESS;
}

static int spi_direct_write_bytes(UINT16 address, const UINT8 *data, UINT16 length)
{
    u8 tx[64];
    u8 rx[64];
    UINT16 i;
    unsigned total_len;

    if ((!pdi_check_ctx()) || (data == 0) || (length == 0U) || (length > 61U)) {
        return XST_FAILURE;
    }

    total_len = (unsigned)(3U + length);

    tx[0] = CMD_SERIAL_WRITE;
    tx[1] = (u8)(((address >> 8) & 0xFFU) | ADDRESS_AUTO_INCREMENT);
    tx[2] = (u8)(address & 0xFFU);

    for (i = 0U; i < length; i++) {
        tx[3U + i] = data[i];
    }

    memset(rx, 0, total_len);

    if (lan9252_spi_transfer(g_pdi_ctx, tx, rx, total_len) != XST_SUCCESS) {
        return XST_FAILURE;
    }

    return XST_SUCCESS;
}

UINT32 SPIReadDWord(UINT16 address)
{
    UINT32 value = 0U;

    if (!pdi_check_ctx()) {
        return 0U;
    }

    (void)lan9252_spi_read32(g_pdi_ctx, address, &value);
    return value;
}

void SPIWriteDWord(UINT16 address, UINT32 val)
{
    if (!pdi_check_ctx()) {
        return;
    }

    (void)lan9252_spi_write32(g_pdi_ctx, address, val);
}

void SPIReadRegUsingCSR(UINT8 *ReadBuffer, UINT16 Address, UINT8 Count)
{
    UINT32 val = 0U;
    UINT8 i;

    if (lan9252_spi_csr_read(&g_lan9252, Address, Count, &val) != XST_SUCCESS) {
        memset(ReadBuffer, 0, Count);
        return;
    }

    for (i = 0; i < Count; i++) {
        ReadBuffer[i] = (UINT8)((val >> (8U * i)) & 0xFFU);
    }
}

void SPIWriteRegUsingCSR(UINT8 *WriteBuffer, UINT16 Address, UINT8 Count)
{
    UINT32 val = 0U;
    UINT8 i;

    for (i = 0; i < Count; i++) {
        val |= ((UINT32)WriteBuffer[i] << (8U * i));
    }

    (void)lan9252_spi_csr_write(&g_lan9252, Address, Count, val);
}

void SPIReadPDRamRegister(UINT8 *read_buffer, UINT16 address, UINT16 count)
{
    UINT32 reg_val;
    UINT8 first_copy;
    UINT8 pos;
    UINT16 copied = 0U;
    UINT8 addr_len_buf[8];

    if ((!pdi_check_ctx()) || (read_buffer == 0) || (count == 0U)) {
        return;
    }

    PDIWriteLAN9252DirectReg(PRAM_RW_ABORT_MASK, PRAM_READ_CMD_REG);

    do {
        reg_val = PDIReadLAN9252DirectReg(PRAM_READ_CMD_REG);
    } while ((reg_val & PRAM_RW_BUSY_32B) != 0U);

    addr_len_buf[0] = (UINT8)(address & 0xFFU);
    addr_len_buf[1] = (UINT8)((address >> 8) & 0xFFU);
    addr_len_buf[2] = (UINT8)(count & 0xFFU);
    addr_len_buf[3] = (UINT8)((count >> 8) & 0xFFU);
    addr_len_buf[4] = 0U;
    addr_len_buf[5] = 0U;
    addr_len_buf[6] = 0x00U;
    addr_len_buf[7] = 0x80U;

    (void)spi_direct_write_bytes(PRAM_READ_ADDR_LEN_REG, addr_len_buf, 8U);

    do {
        reg_val = PDIReadLAN9252DirectReg(PRAM_READ_CMD_REG);
    } while ((reg_val & IS_PRAM_SPACE_AVBL_MASK) == 0U);

    reg_val = SPIReadDWord(PRAM_READ_FIFO_REG);

    pos = (UINT8)(address & 0x03U);
    first_copy = (UINT8)(((4U - pos) > count) ? count : (4U - pos));
    memcpy(read_buffer, ((UINT8 *)&reg_val) + pos, first_copy);

    copied = first_copy;

    while (copied < count) {
        reg_val = SPIReadDWord(PRAM_READ_FIFO_REG);
        first_copy = (UINT8)(((count - copied) > 4U) ? 4U : (count - copied));
        memcpy(&read_buffer[copied], &reg_val, first_copy);
        copied += first_copy;
    }
}

void SPIWritePDRamRegister(UINT8 *write_buffer, UINT16 address, UINT16 count)
{
    UINT32 reg_val;
    UINT32 fifo_word;
    UINT8 first_copy;
    UINT8 pos;
    UINT16 copied = 0U;
    UINT8 addr_len_buf[8];

    if ((!pdi_check_ctx()) || (write_buffer == 0) || (count == 0U)) {
        return;
    }

    PDIWriteLAN9252DirectReg(PRAM_RW_ABORT_MASK, PRAM_WRITE_CMD_REG);

    do {
        reg_val = PDIReadLAN9252DirectReg(PRAM_WRITE_CMD_REG);
    } while ((reg_val & PRAM_RW_BUSY_32B) != 0U);

    addr_len_buf[0] = (UINT8)(address & 0xFFU);
    addr_len_buf[1] = (UINT8)((address >> 8) & 0xFFU);
    addr_len_buf[2] = (UINT8)(count & 0xFFU);
    addr_len_buf[3] = (UINT8)((count >> 8) & 0xFFU);
    addr_len_buf[4] = 0U;
    addr_len_buf[5] = 0U;
    addr_len_buf[6] = 0x00U;
    addr_len_buf[7] = 0x80U;

    (void)spi_direct_write_bytes(PRAM_WRITE_ADDR_LEN_REG, addr_len_buf, 8U);

    do {
        reg_val = PDIReadLAN9252DirectReg(PRAM_WRITE_CMD_REG);
    } while ((reg_val & IS_PRAM_SPACE_AVBL_MASK) == 0U);

    pos = (UINT8)(address & 0x03U);
    first_copy = (UINT8)(((4U - pos) > count) ? count : (4U - pos));

    fifo_word = 0U;
    memcpy(((UINT8 *)&fifo_word) + pos, write_buffer, first_copy);
    SPIWriteDWord(PRAM_WRITE_FIFO_REG, fifo_word);
    copied = first_copy;

    while (copied < count) {
        first_copy = (UINT8)(((count - copied) > 4U) ? 4U : (count - copied));
        fifo_word = 0U;
        memcpy(&fifo_word, &write_buffer[copied], first_copy);
        SPIWriteDWord(PRAM_WRITE_FIFO_REG, fifo_word);
        copied += first_copy;
    }
}

/* =========================================================
 * 7. PDI Register Access Functions
 * ========================================================= */
void PDIReadReg(UINT8 *read_buffer, UINT16 address, UINT16 count)
{
    if (address >= 0x1000U) {
        SPIReadPDRamRegister(read_buffer, address, count);
    } else {
        SPIReadRegUsingCSR(read_buffer, address, (UINT8)count);
    }
}

void PDIWriteReg(UINT8 *write_buffer, UINT16 address, UINT16 count)
{
    if (address >= 0x1000U) {
        SPIWritePDRamRegister(write_buffer, address, count);
    } else {
        SPIWriteRegUsingCSR(write_buffer, address, (UINT8)count);
    }
}

UINT32 PDIReadLAN9252DirectReg(UINT16 Address)
{
    UINT32 data = 0U;

    if (lan9252_spi_read32(&g_lan9252, Address, &data) != XST_SUCCESS) {
        return 0U;
    }

    return data;
}

void PDIWriteLAN9252DirectReg(UINT32 Val, UINT16 Address)
{
    (void)lan9252_spi_write32(&g_lan9252, Address, Val);
}

/* =========================================================
 * 8. PL Interrupt Deferred Handling
 * ========================================================= */
static void EcatPlIrqLinesDisable(void)
{
    if (g_ecat_gic_initialized)
    {
        XScuGic_Disable(&g_ecat_gic, ECAT_PL_IRQ_INTR_ID);

#if ECAT_USE_SYNC0_INTERRUPT
        XScuGic_Disable(&g_ecat_gic, ECAT_PL_SYNC0_INTR_ID);
#endif

#if ECAT_USE_SYNC1_INTERRUPT
        XScuGic_Disable(&g_ecat_gic, ECAT_PL_SYNC1_INTR_ID);
#endif
    }
}

static void EcatPlIrqLinesEnable(void)
{
    if (g_ecat_gic_initialized)
    {
        XScuGic_Enable(&g_ecat_gic, ECAT_PL_IRQ_INTR_ID);

#if ECAT_USE_SYNC0_INTERRUPT
        XScuGic_Enable(&g_ecat_gic, ECAT_PL_SYNC0_INTR_ID);
#endif

#if ECAT_USE_SYNC1_INTERRUPT
        XScuGic_Enable(&g_ecat_gic, ECAT_PL_SYNC1_INTR_ID);
#endif
    }
}

static void EcatPlInterruptHandler(void *CallbackRef)
{
    UINT32 status;

    (void)CallbackRef;

    status = Xil_In32(ECAT_PL_IF_BASEADDR + ECAT_PL_IF_INTR_OFFSET);
    status &= ECAT_PL_INTR_ACTIVE_MASK;

    if (status == 0U)
    {
        return;
    }

    if ((status & ECAT_PL_INTR_IRQ_MASK) != 0U)
    {
        DBG_INC(g_dbg_pdi_irq_count);
    }

#if ECAT_USE_SYNC0_INTERRUPT
    if ((status & ECAT_PL_INTR_SYNC0_MASK) != 0U)
    {
        DBG_INC(g_dbg_sync0_irq_count);
    }
#endif

#if ECAT_USE_SYNC1_INTERRUPT
    if ((status & ECAT_PL_INTR_SYNC1_MASK) != 0U)
    {
        DBG_INC(g_dbg_sync1_irq_count);
    }
#endif

    /*
     * Clear PL latch first.
     */
    Xil_Out32(ECAT_PL_IF_BASEADDR + ECAT_PL_IF_INTR_OFFSET, status);

    /*
     * Store pending events only.
     * Do not call PDI_Isr() / Sync0_Isr() here.
     */
    g_ecat_pl_pending_events |= status;

    /*
     * Prevent interrupt storm.
     * Events will be serviced in main context.
     */
    EcatPlIrqLinesDisable();
    g_ecat_pl_intr_suspended = 1U;
}

static int EcatPlInterruptConnectOne(u32 IntrId, u8 Priority)
{
    int status;

    XScuGic_SetPriorityTriggerType(&g_ecat_gic,
                                   IntrId,
                                   Priority,
                                   ECAT_GIC_TRIGGER_RISING_EDGE);

    status = XScuGic_Connect(&g_ecat_gic,
                             IntrId,
                             (Xil_ExceptionHandler)EcatPlInterruptHandler,
                             NULL);
    if (status != XST_SUCCESS)
    {
        DBG_ISR("GIC connect failed, IntrId=%d status=%d",
                (int)IntrId,
                status);
        return status;
    }

    XScuGic_Enable(&g_ecat_gic, IntrId);

    return XST_SUCCESS;
}

static int EcatPlInterruptInit(void)
{
    XScuGic_Config *CfgPtr;
    int status;

    if (g_ecat_gic_initialized)
    {
        return XST_SUCCESS;
    }

    CfgPtr = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
    if (CfgPtr == NULL)
    {
        DBG_ISR("GIC LookupConfig failed");
        return XST_FAILURE;
    }

    status = XScuGic_CfgInitialize(&g_ecat_gic, CfgPtr, CfgPtr->CpuBaseAddress);
    if (status != XST_SUCCESS)
    {
        DBG_ISR("GIC CfgInitialize failed=%d", status);
        return status;
    }

    Xil_ExceptionInit();

    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
                                 (Xil_ExceptionHandler)XScuGic_InterruptHandler,
                                 &g_ecat_gic);

    status = EcatPlInterruptConnectOne(ECAT_PL_IRQ_INTR_ID, 0x20U);
    if (status != XST_SUCCESS)
    {
        return status;
    }

#if ECAT_USE_SYNC0_INTERRUPT
    status = EcatPlInterruptConnectOne(ECAT_PL_SYNC0_INTR_ID, 0x40U);
    if (status != XST_SUCCESS)
    {
        return status;
    }
#endif

#if ECAT_USE_SYNC1_INTERRUPT
    status = EcatPlInterruptConnectOne(ECAT_PL_SYNC1_INTR_ID, 0x50U);
    if (status != XST_SUCCESS)
    {
        return status;
    }
#endif

    Xil_ExceptionEnable();

    g_ecat_gic_initialized = 1;

    DBG_ISR("PL interrupts initialized: IRQ=%u SYNC0=%u SYNC1=%u",
            (unsigned int)ECAT_PL_IRQ_INTR_ID,
            (unsigned int)ECAT_PL_SYNC0_INTR_ID,
            (unsigned int)ECAT_PL_SYNC1_INTR_ID);

    return XST_SUCCESS;
}

// static UINT32 EcatPlSelectPendingEvent(UINT32 pending)
// {
    // UINT32 has_pdi   = pending & ECAT_PL_INTR_IRQ_MASK;
    // UINT32 has_sync0 = pending & ECAT_PL_INTR_SYNC0_MASK;
    // UINT32 has_sync1 = pending & ECAT_PL_INTR_SYNC1_MASK;

    // /*
    //  * If PDI and SYNC0 are both pending, alternate them.
    //  * This avoids:
    //  * - PDI + Sync0 direct consecutive call
    //  * - Sync0 starvation
    //  */
    // if ((has_pdi != 0U) && (has_sync0 != 0U))
    // {
    //     if (g_ecat_last_served_event == ECAT_EVENT_PDI)
    //     {
    //         return ECAT_PL_INTR_SYNC0_MASK;
    //     }
    //     else
    //     {
    //         return ECAT_PL_INTR_IRQ_MASK;
    //     }
    // }

    // if (has_pdi != 0U)
    // {
    //     return ECAT_PL_INTR_IRQ_MASK;
    // }

    // if (has_sync0 != 0U)
    // {
    //     return ECAT_PL_INTR_SYNC0_MASK;
    // }

    // if (has_sync1 != 0U)
    // {
    //     return ECAT_PL_INTR_SYNC1_MASK;
    // }

    // return 0U;
// }

// void EcatPlProcessPendingEvents(void)
// {
    // UINT32 raw_status;
    // UINT32 pending;
    // UINT32 selected;

    // /*
    //  * Capture any event latched while PL GIC lines were disabled.
    //  */
    // raw_status = Xil_In32(ECAT_PL_IF_BASEADDR + ECAT_PL_IF_INTR_OFFSET);
    // raw_status &= ECAT_PL_INTR_ALL_MASK;

    // if (raw_status != 0U)
    // {
    //     Xil_Out32(ECAT_PL_IF_BASEADDR + ECAT_PL_IF_INTR_OFFSET, raw_status);
    //     g_ecat_pl_pending_events |= raw_status;
    // }

    // pending = g_ecat_pl_pending_events & ECAT_PL_INTR_ALL_MASK;

    // if (pending == 0U)
    // {
    //     if (g_ecat_pl_intr_suspended != 0U)
    //     {
    //         g_ecat_pl_intr_suspended = 0U;
    //         EcatPlIrqLinesEnable();
    //     }

    //     return;
    // }

    // selected = EcatPlSelectPendingEvent(pending);

    // if (selected == 0U)
    // {
    //     return;
    // }

    // /*
    //  * Remove selected event from pending before servicing it.
    //  */
    // g_ecat_pl_pending_events &= ~selected;

    // if ((selected & ECAT_PL_INTR_IRQ_MASK) != 0U)
    // {
    //     g_ecat_last_served_event = ECAT_EVENT_PDI;

    //     DBG_INC(g_dbg_pdi_irq_count);
    //     PDI_Isr();

    //     return;
    // }

    // if ((selected & ECAT_PL_INTR_SYNC0_MASK) != 0U)
    // {
    //     g_ecat_last_served_event = ECAT_EVENT_SYNC0;

    //     DBG_INC(g_dbg_sync0_irq_count);
    //     Sync0_Isr();

    //     return;
    // }

    // if ((selected & ECAT_PL_INTR_SYNC1_MASK) != 0U)
    // {
    //     g_ecat_last_served_event = ECAT_EVENT_SYNC1;

    //     DBG_INC(g_dbg_sync1_irq_count);
    //     Sync1_Isr();

    //     return;
    // }
// }

void EcatPlProcessPendingEvents(void)
{
    UINT32 raw_status;
    UINT32 pending;

    /*
     * Capture any event latched while PL GIC lines were disabled.
     */
    raw_status = Xil_In32(ECAT_PL_IF_BASEADDR + ECAT_PL_IF_INTR_OFFSET);
    raw_status &= ECAT_PL_INTR_ACTIVE_MASK;

    if (raw_status != 0U)
    {
        /*
         * Clear PL latch first, then store event.
         */
        Xil_Out32(ECAT_PL_IF_BASEADDR + ECAT_PL_IF_INTR_OFFSET, raw_status);
        g_ecat_pl_pending_events |= raw_status;
    }

    pending = g_ecat_pl_pending_events & ECAT_PL_INTR_ACTIVE_MASK;

    if (pending == 0U)
    {
        if (g_ecat_pl_intr_suspended != 0U)
        {
            g_ecat_pl_intr_suspended = 0U;
            EcatPlIrqLinesEnable();
        }

        return;
    }

#if ECAT_USE_SYNC0_INTERRUPT
    /*
     * DC mode priority:
     * Service SYNC0 before PDI event.
     */
    if ((pending & ECAT_PL_INTR_SYNC0_MASK) != 0U)
    {
        g_ecat_pl_pending_events &= ~ECAT_PL_INTR_SYNC0_MASK;
        Sync0_Isr();
    }
#endif

    /*
     * PDI event: LAN9252 IRQ.
     */
    if ((pending & ECAT_PL_INTR_IRQ_MASK) != 0U)
    {
        g_ecat_pl_pending_events &= ~ECAT_PL_INTR_IRQ_MASK;
        PDI_Isr();
    }

#if ECAT_USE_SYNC1_INTERRUPT
    if ((pending & ECAT_PL_INTR_SYNC1_MASK) != 0U)
    {
        g_ecat_pl_pending_events &= ~ECAT_PL_INTR_SYNC1_MASK;
        Sync1_Isr();
    }
#endif

    /*
     * Re-enable PL IRQ after all active pending events have been serviced.
     */
    if ((g_ecat_pl_pending_events & ECAT_PL_INTR_ACTIVE_MASK) == 0U)
    {
        if (g_ecat_pl_intr_suspended != 0U)
        {
            g_ecat_pl_intr_suspended = 0U;
            EcatPlIrqLinesEnable();
        }
    }
}

void EcatPlInterruptDisable(void)
{
    EcatPlIrqLinesDisable();
}

void EcatPlInterruptEnable(void)
{
    /*
     * If PL event handling is suspended by deferred ISR,
     * do not re-enable PL IRQ lines here.
     * They will be re-enabled after pending events are drained.
     */
    if (g_ecat_pl_intr_suspended == 0U)
    {
        EcatPlIrqLinesEnable();
    }
}

/* =========================================================
 * 9. TTC Timer Handling
 * ========================================================= */
static void EcatTtcTimerInterruptHandler(void *CallbackRef)
{
    XTtcPs *TimerPtr = (XTtcPs *)CallbackRef;
    u32 status;

    status = XTtcPs_GetInterruptStatus(TimerPtr);
    XTtcPs_ClearInterruptStatus(TimerPtr, status);

    if ((status & XTTCPS_IXR_INTERVAL_MASK) != 0U)
    {
        DBG_INC(g_dbg_timer_1ms_count);

        /*
         * Common 1 ms time base for heater control.
         * This counter is intentionally independent from SSC timer pending flag.
         */
        g_heater_1ms_tick++;

        /*
         * Do not call ECAT_CheckTimer() inside ISR.
         * Defer SSC timer handling to main context.
         */
        g_ecat_ssc_timer_pending = 1U;
    }
}

static int EcatTtcTimerInterruptInit(void)
{
    int status;
    XTtcPs_Config *TimerConfig;
    u16 interval;
    u8 prescaler;

    if (g_ecat_ttc_timer_initialized)
    {
        return XST_SUCCESS;
    }

    /*
     * Reuse existing GIC initialization.
     */
    status = EcatPlInterruptInit();
    if (status != XST_SUCCESS)
    {
        DBG_HW("TTC Timer: GIC init failed=%d", status);
        return status;
    }

    TimerConfig = XTtcPs_LookupConfig(ECAT_TTC_LOOKUP_ID);
    if (TimerConfig == NULL)
    {
        DBG_HW("TTC Timer: LookupConfig failed");
        return XST_FAILURE;
    }

    status = XTtcPs_CfgInitialize(&g_ecat_ttc_timer,
                                  TimerConfig,
                                  TimerConfig->BaseAddress);
    if (status != XST_SUCCESS)
    {
        DBG_HW("TTC Timer: CfgInitialize failed=%d", status);
        return status;
    }

    XTtcPs_SetOptions(&g_ecat_ttc_timer,
                      XTTCPS_OPTION_INTERVAL_MODE |
                      XTTCPS_OPTION_WAVE_DISABLE);

    XTtcPs_CalcIntervalFromFreq(&g_ecat_ttc_timer,
                                ECAT_TIMER_HZ,
                                &interval,
                                &prescaler);

    XTtcPs_SetInterval(&g_ecat_ttc_timer, interval);
    XTtcPs_SetPrescaler(&g_ecat_ttc_timer, prescaler);

    XScuGic_SetPriorityTriggerType(&g_ecat_gic,
                                ECAT_TTC_INTR_ID,
                                0x30U,
                                ECAT_GIC_TRIGGER_LEVEL_HIGH);
                                
    status = XScuGic_Connect(&g_ecat_gic,
                             ECAT_TTC_INTR_ID,
                             (Xil_ExceptionHandler)EcatTtcTimerInterruptHandler,
                             &g_ecat_ttc_timer);
    if (status != XST_SUCCESS)
    {
        DBG_HW("TTC Timer: GIC connect failed=%d", status);
        return status;
    }

    XScuGic_Enable(&g_ecat_gic, ECAT_TTC_INTR_ID);

    XTtcPs_EnableInterrupts(&g_ecat_ttc_timer, XTTCPS_IXR_INTERVAL_MASK);
    XTtcPs_Start(&g_ecat_ttc_timer);

    g_ecat_ttc_timer_initialized = 1;

    DBG_HW("TTC Timer init OK, IntrId=%u, interval=%u, prescaler=%u",
           (unsigned int)ECAT_TTC_INTR_ID,
           (unsigned int)interval,
           (unsigned int)prescaler);

    return XST_SUCCESS;
}

void EcatProcessTimerPending(void)
{
    if (g_ecat_ssc_timer_pending != 0U)
    {
        g_ecat_ssc_timer_pending = 0U;
        ECAT_CheckTimer();
    }
}

/* =========================================================
 * 10. SSC PDI Hook Functions
 * ========================================================= */
void PDI_Init(void)
{
    int status;

    // status = lan9252_spi_init(&g_lan9252, AXI_QUAD_SPI_DEVICE_ID, AXI_QUAD_SPI_SS0_MASK);
    status = lan9252_spi_init_by_baseaddr(&g_lan9252, XPAR_AXI_QUAD_SPI_0_BASEADDR, AXI_QUAD_SPI_SS0_MASK);
    if (status != XST_SUCCESS) {
        DBG_HW("PDI_Init failed: spi_init status=%d", status);
        while (1) {}
    }

    PDI_RegisterLan9252Context(&g_lan9252);

    lan9252_spi_attach_external_reset(&g_lan9252, ECAT_PL_IF_BASEADDR, ECAT_PL_IF_RST_CTRL_OFFSET);

    status = lan9252_spi_hw_reset_sequence(&g_lan9252, 10U, 50U);
    if (status != XST_SUCCESS) {
        DBG_HW("PDI_Init failed: hw_reset status=%d", status);
        while (1) {}
    }

    status = lan9252_spi_rstqio(&g_lan9252);
    if (status != XST_SUCCESS) {
        DBG_HW("PDI_Init failed: rstqio status=%d", status);
        while (1) {}
    }

    status = lan9252_spi_wait_byte_test(&g_lan9252, LAN9252_BYTE_TEST_VALUE, 1000U, 10U);
    if (status != XST_SUCCESS) {
        DBG_HW("PDI_Init failed: BYTE_TEST timeout");
        DBG_HW("LAN9252 ESC 보드 연결 확인 필요");
        while (1) {}
    }

    status = lan9252_spi_wait_hw_ready(&g_lan9252, 1000U, 10U);
    if (status != XST_SUCCESS) {
        DBG_HW("PDI_Init failed: HW_READY timeout");
        while (1) {}
    }

    status = lan9252_spi_ethercat_reset(&g_lan9252, 1000U);
    if (status != XST_SUCCESS) {
        DBG_HW("PDI_Init failed: ethercat_reset status=%d", status);
        while (1) {}
    }

    /*
     * Clear any stale PL interrupt latch after LAN9252 reset.
     */
    Xil_Out32(ECAT_PL_IF_BASEADDR + ECAT_PL_IF_INTR_OFFSET, ECAT_PL_INTR_ALL_MASK);
}

void PDI_Enable_Global_interrupt(void)
{
    EcatPlInterruptEnable();
    DBG_HW("PDI_Enable_Global_interrupt OK");
    // if (EcatPlInterruptInit() == XST_SUCCESS) 
    // {
    //     EcatPlInterruptEnable();
    //     Xil_ExceptionEnable();
    // } 
    // else 
    // {
    //     DBG_ISR("PDI_Enable_Global_interrupt: failed");
    // }
}

void PDI_Init_SYNC_Interrupts(void)
{
    int status;

    status = EcatPlInterruptInit();

    if (status != XST_SUCCESS)
    {
        DBG_ISR("PDI_Init_SYNC_Interrupts failed, status=%d", status);
    }
    else
    {
        DBG_ISR("PDI_Init_SYNC_Interrupts OK");
    }
}

void PDI_Timer_Interrupt(void)
{
    int status;

    status = EcatTtcTimerInterruptInit();

    if (status != XST_SUCCESS)
    {
        DBG_HW("PDI_Timer_Interrupt init failed, status=%d", status);
    }
    else
    {
        DBG_HW("PDI_Timer_Interrupt init OK");
    }
}

void PDI_IRQ_Interrupt(void)
{
    int status;

    status = EcatPlInterruptInit();

    if (status != XST_SUCCESS)
    {
        DBG_ISR("PDI_IRQ_Interrupt init failed, status=%d", status);
    }
    else
    {
        DBG_ISR("PDI_IRQ_Interrupt init OK");
    }
}