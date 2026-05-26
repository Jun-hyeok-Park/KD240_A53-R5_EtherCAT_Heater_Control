#include "SPIDriver.h"
#include "9252_HW.h"
#include "lan9252_spi.h"

#include "ecatappl.h"

#include "xparameters.h"
#include "xstatus.h"
#include "xil_types.h"
#include "xil_io.h"
#include "xil_printf.h"
#include "xil_exception.h"
#include "xscugic.h"

#include <string.h>

static lan9252_spi_t g_lan9252;
static lan9252_spi_t *g_pdi_ctx = 0;

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

/*
 * xparameters.h generated in this project does not expose XPAR_FABRIC_* interrupt IDs.
 * Zynq-7000 PL-to-PS IRQ_F2P[0], [1], [2] are normally mapped to GIC IDs 61, 62, 63.
 *
 * xlconcat mapping:
 *   In0 -> IRQ_F2P[0] -> LAN9252 IRQ
 *   In1 -> IRQ_F2P[1] -> LAN9252 SYNC0
 *   In2 -> IRQ_F2P[2] -> LAN9252 SYNC1
 */
#ifndef ECAT_PL_IRQ_INTR_ID
#define ECAT_PL_IRQ_INTR_ID         61U
#endif

#ifndef ECAT_PL_SYNC0_INTR_ID
#define ECAT_PL_SYNC0_INTR_ID       62U
#endif

#ifndef ECAT_PL_SYNC1_INTR_ID
#define ECAT_PL_SYNC1_INTR_ID       63U
#endif

#ifndef XPAR_SCUGIC_SINGLE_DEVICE_ID
#define XPAR_SCUGIC_SINGLE_DEVICE_ID 0U
#endif

static XScuGic g_ecat_gic;
static int g_ecat_gic_initialized = 0;

volatile UINT32 g_pl_irq_isr_cnt = 0;
volatile UINT32 g_pl_sync0_isr_cnt = 0;
volatile UINT32 g_pl_sync1_isr_cnt = 0;
volatile UINT32 g_pl_intr_status_last = 0;

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

/*
 * PRAM debug log is intentionally disabled here.
 * In DC mode, repeated UART prints can break timing.
 */
static int pram_rd_cnt = 1000;
static int pram_wr_cnt = 1000;

void SPIReadPDRamRegister(UINT8 *read_buffer, UINT16 address, UINT16 count)
{
    UINT32 reg_val;
    UINT8 first_copy;
    UINT8 pos;
    UINT16 copied = 0U;
    UINT8 addr_len_buf[8];

    if (pram_rd_cnt < 10) {
        xil_printf("PRAM READ: addr=0x%04X count=%u\r\n",
                   (unsigned int)address,
                   (unsigned int)count);
        pram_rd_cnt++;
    }

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

    if (pram_wr_cnt < 10) {
        xil_printf("PRAM WRITE: addr=0x%04X count=%u\r\n",
                   (unsigned int)address,
                   (unsigned int)count);
        pram_wr_cnt++;
    }

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

static void EcatPlInterruptHandler(void *CallbackRef)
{
    UINT32 status;

    (void)CallbackRef;

    status = Xil_In32(ECAT_PL_IF_BASEADDR + ECAT_PL_IF_INTR_OFFSET);
    status &= ECAT_PL_INTR_ALL_MASK;

    if (status == 0U) {
        return;
    }

    g_pl_intr_status_last = status;

    /*
     * SYNC0/SYNC1 are edge-latched events.
     * Clear them before calling handlers.
     */
    if ((status & ECAT_PL_INTR_SYNC0_MASK) != 0U) {
        Xil_Out32(ECAT_PL_IF_BASEADDR + ECAT_PL_IF_INTR_OFFSET,
                  ECAT_PL_INTR_SYNC0_MASK);
        g_pl_sync0_isr_cnt++;
        Sync0_Isr();
    }

    if ((status & ECAT_PL_INTR_SYNC1_MASK) != 0U) {
        Xil_Out32(ECAT_PL_IF_BASEADDR + ECAT_PL_IF_INTR_OFFSET,
                  ECAT_PL_INTR_SYNC1_MASK);
        g_pl_sync1_isr_cnt++;
        Sync1_Isr();
    }

    /*
     * IRQ is level-style.
     * First service LAN9252 AL event, then clear PL irq latch.
     */
    if ((status & ECAT_PL_INTR_IRQ_MASK) != 0U) {
        g_pl_irq_isr_cnt++;
        PDI_Isr();

        Xil_Out32(ECAT_PL_IF_BASEADDR + ECAT_PL_IF_INTR_OFFSET,
                  ECAT_PL_INTR_IRQ_MASK);
    }
}

static int EcatPlInterruptConnectOne(u32 IntrId, u8 Priority)
{
    int status;

    XScuGic_SetPriorityTriggerType(&g_ecat_gic,
                                   IntrId,
                                   Priority,
                                   0x3U); /* rising edge */

    status = XScuGic_Connect(&g_ecat_gic,
                             IntrId,
                             (Xil_ExceptionHandler)EcatPlInterruptHandler,
                             NULL);
    if (status != XST_SUCCESS) {
        xil_printf("ECAT GIC: Connect failed, IntrId=%d status=%d\r\n",
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

    if (g_ecat_gic_initialized) {
        return XST_SUCCESS;
    }

    CfgPtr = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
    if (CfgPtr == NULL) {
        xil_printf("ECAT GIC: LookupConfig failed\r\n");
        return XST_FAILURE;
    }

    status = XScuGic_CfgInitialize(&g_ecat_gic, CfgPtr, CfgPtr->CpuBaseAddress);
    if (status != XST_SUCCESS) {
        xil_printf("ECAT GIC: CfgInitialize failed=%d\r\n", status);
        return status;
    }

    Xil_ExceptionInit();

    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
                                 (Xil_ExceptionHandler)XScuGic_InterruptHandler,
                                 &g_ecat_gic);

    /*
     * Priority: lower value means higher priority.
     * IRQ gets higher priority than SYNC lines, matching the STM32 version.
     */
    status = EcatPlInterruptConnectOne(ECAT_PL_IRQ_INTR_ID, 0x20U);
    if (status != XST_SUCCESS) {
        return status;
    }

    status = EcatPlInterruptConnectOne(ECAT_PL_SYNC0_INTR_ID, 0x40U);
    if (status != XST_SUCCESS) {
        return status;
    }

    status = EcatPlInterruptConnectOne(ECAT_PL_SYNC1_INTR_ID, 0x50U);
    if (status != XST_SUCCESS) {
        return status;
    }

    Xil_ExceptionEnable();

    g_ecat_gic_initialized = 1;

    xil_printf("ECAT GIC: initialized IRQ=%d SYNC0=%d SYNC1=%d\r\n",
            (int)ECAT_PL_IRQ_INTR_ID,
            (int)ECAT_PL_SYNC0_INTR_ID,
            (int)ECAT_PL_SYNC1_INTR_ID);
    return XST_SUCCESS;
}

void EcatPlInterruptDisable(void)
{
    if (g_ecat_gic_initialized) {
        XScuGic_Disable(&g_ecat_gic, ECAT_PL_IRQ_INTR_ID);
        XScuGic_Disable(&g_ecat_gic, ECAT_PL_SYNC0_INTR_ID);
        XScuGic_Disable(&g_ecat_gic, ECAT_PL_SYNC1_INTR_ID);
    }
}

void EcatPlInterruptEnable(void)
{
    if (g_ecat_gic_initialized) {
        XScuGic_Enable(&g_ecat_gic, ECAT_PL_IRQ_INTR_ID);
        XScuGic_Enable(&g_ecat_gic, ECAT_PL_SYNC0_INTR_ID);
        XScuGic_Enable(&g_ecat_gic, ECAT_PL_SYNC1_INTR_ID);
    }
}

void PDI_Init(void)
{
    int status;

    xil_printf("PDI_Init: lan9252_spi_init start\r\n");

    status = lan9252_spi_init(&g_lan9252,
                              AXI_QUAD_SPI_DEVICE_ID,
                              AXI_QUAD_SPI_SS0_MASK);
    xil_printf("PDI_Init: lan9252_spi_init status=%d\r\n", status);
    if (status != XST_SUCCESS) {
        while (1) {}
    }

    PDI_RegisterLan9252Context(&g_lan9252);

    lan9252_spi_attach_external_reset(&g_lan9252,
                                      ECAT_PL_IF_BASEADDR,
                                      ECAT_PL_IF_RST_CTRL_OFFSET);

    status = lan9252_spi_hw_reset_sequence(&g_lan9252, 10U, 50U);
    xil_printf("PDI_Init: hw_reset status=%d\r\n", status);
    if (status != XST_SUCCESS) {
        while (1) {}
    }

    status = lan9252_spi_rstqio(&g_lan9252);
    xil_printf("PDI_Init: rstqio status=%d\r\n", status);
    if (status != XST_SUCCESS) {
        while (1) {}
    }

    status = lan9252_spi_wait_byte_test(&g_lan9252,
                                        LAN9252_BYTE_TEST_VALUE,
                                        1000U,
                                        10U);
    xil_printf("PDI_Init: wait_byte_test status=%d\r\n", status);
    if (status != XST_SUCCESS) {
        while (1) {}
    }

    status = lan9252_spi_wait_hw_ready(&g_lan9252, 1000U, 10U);
    xil_printf("PDI_Init: wait_hw_ready status=%d\r\n", status);
    if (status != XST_SUCCESS) {
        while (1) {}
    }

    status = lan9252_spi_ethercat_reset(&g_lan9252, 1000U);
    xil_printf("PDI_Init: ethercat_reset status=%d\r\n", status);
    if (status != XST_SUCCESS) {
        while (1) {}
    }

    /*
     * Clear any stale PL interrupt latch after LAN9252 reset.
     */
    Xil_Out32(ECAT_PL_IF_BASEADDR + ECAT_PL_IF_INTR_OFFSET, ECAT_PL_INTR_ALL_MASK);

    xil_printf("PDI_Init: done\r\n");
}

void PDI_Enable_Global_interrupt(void)
{
    if (EcatPlInterruptInit() == XST_SUCCESS) {
        EcatPlInterruptEnable();
        Xil_ExceptionEnable();
        xil_printf("PDI_Enable_Global_interrupt: enabled\r\n");
    } else {
        xil_printf("PDI_Enable_Global_interrupt: failed\r\n");
    }
}

void PDI_Init_SYNC_Interrupts(void)
{
    if (EcatPlInterruptInit() == XST_SUCCESS) {
        xil_printf("PDI_Init_SYNC_Interrupts: enabled\r\n");
    } else {
        xil_printf("PDI_Init_SYNC_Interrupts: failed\r\n");
    }
}

void PDI_Timer_Interrupt(void)
{
    /*
     * Timer interrupt is not moved yet.
     * Keep ECAT_CheckTimer() in main loop for this stage.
     */
    xil_printf("PDI_Timer_Interrupt: deferred, ECAT_CheckTimer still in main loop\r\n");
}

void PDI_IRQ_Interrupt(void)
{
    if (EcatPlInterruptInit() == XST_SUCCESS) {
        xil_printf("PDI_IRQ_Interrupt: enabled\r\n");
    } else {
        xil_printf("PDI_IRQ_Interrupt: failed\r\n");
    }
}
