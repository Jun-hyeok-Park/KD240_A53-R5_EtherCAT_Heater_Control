#ifndef LAN9252_SPI_H
#define LAN9252_SPI_H

#include "xil_types.h"
#include "xstatus.h"
#include "xspi.h"

#ifdef __cplusplus
extern "C" {
#endif

/* =========================================================
 * SPI Commands
 * ========================================================= */
#define LAN9252_SPI_CMD_READ                 0x03U
#define LAN9252_SPI_CMD_WRITE                0x02U
#define LAN9252_SPI_CMD_FASTREAD             0x0BU
#define LAN9252_SPI_CMD_RSTQIO               0xFFU

/* =========================================================
 * LAN9252 Direct Access Registers
 * ========================================================= */
#define LAN9252_REG_BYTE_TEST                0x0064U
#define LAN9252_REG_HW_CFG                   0x0074U
#define LAN9252_REG_RESET_CTL                0x01F8U

#define LAN9252_BYTE_TEST_VALUE              0x87654321U
#define LAN9252_HW_CFG_READY_MASK            0x08000000U

/* =========================================================
 * LAN9252 CSR Window Registers
 * ========================================================= */
#define LAN9252_REG_CSR_DATA                 0x0300U
#define LAN9252_REG_CSR_CMD                  0x0304U

/* =========================================================
 * CSR Command Bits
 * ========================================================= */
#define LAN9252_CSR_BUSY                     0x80000000U
#define LAN9252_CSR_READ                     0x40000000U
#define LAN9252_CSR_SIZE_1                   0x00010000U
#define LAN9252_CSR_SIZE_2                   0x00020000U
#define LAN9252_CSR_SIZE_4                   0x00040000U

/* =========================================================
 * RESET_CTL Bits
 * ========================================================= */
#define LAN9252_RESET_CTL_DIGITAL_RST        0x00000001U
#define LAN9252_RESET_CTL_ETHERCAT_RST       0x00000040U

/* =========================================================
 * ESC CSR Registers used in labs / SSC glue
 * ========================================================= */
#define LAN9252_ESC_REG_AL_CONTROL           0x0120U
#define LAN9252_ESC_REG_AL_STATUS            0x0130U
#define LAN9252_ESC_REG_AL_STATUS_CODE       0x0134U
#define LAN9252_ESC_REG_RUN_LED_OVERRIDE     0x0138U
#define LAN9252_ESC_REG_ERR_LED_OVERRIDE     0x0139U
#define LAN9252_ESC_REG_AL_EVENT_MASK        0x0204U
#define LAN9252_ESC_REG_AL_EVENT             0x0220U

/* =========================================================
 * EtherCAT AL States
 * ========================================================= */
#define LAN9252_AL_STATE_INIT                0x0001U
#define LAN9252_AL_STATE_PREOP               0x0002U
#define LAN9252_AL_STATE_BOOT                0x0003U
#define LAN9252_AL_STATE_SAFEOP              0x0004U
#define LAN9252_AL_STATE_OP                  0x0008U
#define LAN9252_AL_STATE_MASK                0x000FU
#define LAN9252_AL_CONTROL_ACK_ERROR         0x0010U

/* =========================================================
 * Driver Context
 * ========================================================= */
typedef struct
{
    XSpi spi;
    u16  device_id;
    u32  slave_mask;

    int  use_external_reset;
    u32  reset_ctrl_baseaddr;
    u32  reset_ctrl_offset;
} lan9252_spi_t;

/* =========================================================
 * Basic Init / Transfer
 * ========================================================= */
int lan9252_spi_init(lan9252_spi_t *ctx, u16 device_id, u32 slave_mask);

/* KD240 / Vitis 2025.x SDT flow용 */
int lan9252_spi_init_by_baseaddr(lan9252_spi_t *ctx, UINTPTR baseaddr, u32 slave_mask);

int lan9252_spi_transfer(lan9252_spi_t *ctx, u8 *tx, u8 *rx, unsigned len);
int lan9252_spi_rstqio(lan9252_spi_t *ctx);

/* =========================================================
 * Direct Register Read
 * ========================================================= */
int lan9252_spi_read8 (lan9252_spi_t *ctx, u16 addr, u8  *val);
int lan9252_spi_read16(lan9252_spi_t *ctx, u16 addr, u16 *val);
int lan9252_spi_read32(lan9252_spi_t *ctx, u16 addr, u32 *val);

/* =========================================================
 * Direct Register Write
 * ========================================================= */
int lan9252_spi_write8 (lan9252_spi_t *ctx, u16 addr, u8  val);
int lan9252_spi_write16(lan9252_spi_t *ctx, u16 addr, u16 val);
int lan9252_spi_write32(lan9252_spi_t *ctx, u16 addr, u32 val);

/* =========================================================
 * Polling / Status Helpers
 * ========================================================= */
int lan9252_spi_check_byte_test(lan9252_spi_t *ctx, u32 *val);
int lan9252_spi_wait_byte_test(lan9252_spi_t *ctx,
                               u32 expected,
                               u32 timeout_ms,
                               u32 poll_interval_ms);
int lan9252_spi_wait_hw_ready(lan9252_spi_t *ctx,
                              u32 timeout_ms,
                              u32 poll_interval_ms);

/* =========================================================
 * Reset Helpers
 * ========================================================= */
void lan9252_spi_attach_external_reset(lan9252_spi_t *ctx,
                                       u32 baseaddr,
                                       u32 offset);
int  lan9252_spi_set_external_reset(lan9252_spi_t *ctx, int asserted);
int  lan9252_spi_hw_reset_sequence(lan9252_spi_t *ctx,
                                   u32 assert_ms,
                                   u32 release_delay_ms);
int  lan9252_spi_wait_reset_ctl_clear(lan9252_spi_t *ctx,
                                      u32 mask,
                                      u32 timeout_ms);
int  lan9252_spi_ethercat_reset(lan9252_spi_t *ctx, u32 timeout_ms);

/* =========================================================
 * Write / Readback Helpers
 * ========================================================= */
int lan9252_spi_write_readback32(lan9252_spi_t *ctx,
                                 u16 addr,
                                 u32 write_val,
                                 u32 *read_val);

/* =========================================================
 * CSR / ESC Indirect Access
 * ========================================================= */
int lan9252_spi_csr_wait_not_busy(lan9252_spi_t *ctx, u32 timeout_ms);
int lan9252_spi_csr_read(lan9252_spi_t *ctx, u16 esc_addr, u8 size, u32 *val);
int lan9252_spi_csr_write(lan9252_spi_t *ctx, u16 esc_addr, u8 size, u32 val);
int lan9252_spi_csr_write_readback(lan9252_spi_t *ctx,
                                   u16 esc_addr,
                                   u8 size,
                                   u32 write_val,
                                   u32 *read_val);

/* =========================================================
 * AL State Helpers (lab / debug)
 * ========================================================= */
int lan9252_spi_read_al_status(lan9252_spi_t *ctx, u16 *al_status);
int lan9252_spi_read_al_status_code(lan9252_spi_t *ctx, u16 *al_status_code);
int lan9252_spi_request_al_state(lan9252_spi_t *ctx, u16 requested_state);
int lan9252_spi_wait_al_state(lan9252_spi_t *ctx,
                              u16 expected_state,
                              u32 timeout_ms,
                              u32 poll_interval_ms,
                              u16 *final_status,
                              u16 *final_status_code);
int lan9252_spi_request_al_state_and_wait(lan9252_spi_t *ctx,
                                          u16 requested_state,
                                          u32 timeout_ms,
                                          u32 poll_interval_ms,
                                          u16 *final_status,
                                          u16 *final_status_code);

#ifdef __cplusplus
}
#endif

#endif
