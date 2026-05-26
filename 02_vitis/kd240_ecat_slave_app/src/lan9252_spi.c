#include "lan9252_spi.h"

#include "xil_io.h"
#include "sleep.h"

#include <string.h>

static int lan9252_spi_set_ss(lan9252_spi_t *ctx)
{
    return XSpi_SetSlaveSelect(&ctx->spi, ctx->slave_mask);
}

static u32 lan9252_csr_size_to_cmd(u8 size)
{
    switch (size) {
    case 1U: return LAN9252_CSR_SIZE_1;
    case 2U: return LAN9252_CSR_SIZE_2;
    case 4U: return LAN9252_CSR_SIZE_4;
    default: return 0xFFFFFFFFU;
    }
}

static int lan9252_spi_is_valid_csr_size_addr(u16 addr, u8 size)
{
    if (!((size == 1U) || (size == 2U) || (size == 4U))) {
        return 0;
    }

    if ((size == 2U) && ((addr & 0x1U) != 0U)) {
        return 0;
    }

    if ((size == 4U) && ((addr & 0x3U) != 0U)) {
        return 0;
    }

    return 1;
}

int lan9252_spi_init(lan9252_spi_t *ctx, u16 device_id, u32 slave_mask)
{
    XSpi_Config *cfg;
    int status;

    if (ctx == 0) {
        return XST_FAILURE;
    }

    memset(ctx, 0, sizeof(*ctx));
    ctx->device_id  = device_id;
    ctx->slave_mask = slave_mask;

    cfg = XSpi_LookupConfig(device_id);
    if (cfg == 0) {
        return XST_FAILURE;
    }

    status = XSpi_CfgInitialize(&ctx->spi, cfg, cfg->BaseAddress);
    if (status != XST_SUCCESS) {
        return status;
    }

    status = XSpi_SetOptions(&ctx->spi,
                             XSP_MASTER_OPTION |
                             XSP_MANUAL_SSELECT_OPTION);
    if (status != XST_SUCCESS) {
        return status;
    }

    XSpi_Start(&ctx->spi);
    XSpi_IntrGlobalDisable(&ctx->spi);

    status = lan9252_spi_set_ss(ctx);
    if (status != XST_SUCCESS) {
        return status;
    }

    return XST_SUCCESS;
}

int lan9252_spi_init_by_baseaddr(lan9252_spi_t *ctx, UINTPTR baseaddr, u32 slave_mask)
{
    XSpi_Config *cfg;
    int status;

    if (ctx == 0) {
        return XST_FAILURE;
    }

    memset(ctx, 0, sizeof(*ctx));
    ctx->device_id  = 0U;
    ctx->slave_mask = slave_mask;

    /*
     * Vitis 2025.x / SDT xparameters.h에서는 DEVICE_ID가 없고
     * BASEADDR만 생성되는 경우가 있다.
     * 이 경우 XSpi_LookupConfig()에 BASEADDR을 넣어 초기화한다.
     */
    cfg = XSpi_LookupConfig(baseaddr);
    if (cfg == 0) {
        return XST_FAILURE;
    }

    status = XSpi_CfgInitialize(&ctx->spi, cfg, cfg->BaseAddress);
    if (status != XST_SUCCESS) {
        return status;
    }

    status = XSpi_SetOptions(&ctx->spi,
                             XSP_MASTER_OPTION |
                             XSP_MANUAL_SSELECT_OPTION);
    if (status != XST_SUCCESS) {
        return status;
    }

    XSpi_Start(&ctx->spi);
    XSpi_IntrGlobalDisable(&ctx->spi);

    status = lan9252_spi_set_ss(ctx);
    if (status != XST_SUCCESS) {
        return status;
    }

    return XST_SUCCESS;
}

int lan9252_spi_transfer(lan9252_spi_t *ctx, u8 *tx, u8 *rx, unsigned len)
{
    int status;

    if ((ctx == 0) || (tx == 0) || (rx == 0) || (len == 0U)) {
        return XST_FAILURE;
    }

    status = lan9252_spi_set_ss(ctx);
    if (status != XST_SUCCESS) {
        return status;
    }

    return XSpi_Transfer(&ctx->spi, tx, rx, len);
}

int lan9252_spi_rstqio(lan9252_spi_t *ctx)
{
    u8 tx[1] = { LAN9252_SPI_CMD_RSTQIO };
    u8 rx[1] = { 0 };

    return lan9252_spi_transfer(ctx, tx, rx, 1U);
}

int lan9252_spi_read8(lan9252_spi_t *ctx, u16 addr, u8 *val)
{
    int status;
    u8 tx[4];
    u8 rx[4];

    if (val == 0) {
        return XST_FAILURE;
    }

    tx[0] = LAN9252_SPI_CMD_READ;
    tx[1] = (u8)((addr >> 8) & 0xFFU);
    tx[2] = (u8)(addr & 0xFFU);
    tx[3] = 0x00U;

    memset(rx, 0, sizeof(rx));

    status = lan9252_spi_transfer(ctx, tx, rx, 4U);
    if (status != XST_SUCCESS) {
        return status;
    }

    *val = rx[3];
    return XST_SUCCESS;
}

int lan9252_spi_read16(lan9252_spi_t *ctx, u16 addr, u16 *val)
{
    int status;
    u8 tx[5];
    u8 rx[5];

    if (val == 0) {
        return XST_FAILURE;
    }

    tx[0] = LAN9252_SPI_CMD_READ;
    tx[1] = (u8)((addr >> 8) & 0xFFU);
    tx[2] = (u8)(addr & 0xFFU);
    tx[3] = 0x00U;
    tx[4] = 0x00U;

    memset(rx, 0, sizeof(rx));

    status = lan9252_spi_transfer(ctx, tx, rx, 5U);
    if (status != XST_SUCCESS) {
        return status;
    }

    *val = (u16)(((u16)rx[3]) | ((u16)rx[4] << 8));
    return XST_SUCCESS;
}

int lan9252_spi_read32(lan9252_spi_t *ctx, u16 addr, u32 *val)
{
    int status;
    u8 tx[7];
    u8 rx[7];

    if (val == 0) {
        return XST_FAILURE;
    }

    tx[0] = LAN9252_SPI_CMD_READ;
    tx[1] = (u8)((addr >> 8) & 0xFFU);
    tx[2] = (u8)(addr & 0xFFU);
    tx[3] = 0x00U;
    tx[4] = 0x00U;
    tx[5] = 0x00U;
    tx[6] = 0x00U;

    memset(rx, 0, sizeof(rx));

    status = lan9252_spi_transfer(ctx, tx, rx, 7U);
    if (status != XST_SUCCESS) {
        return status;
    }

    *val = ((u32)rx[3]) |
           ((u32)rx[4] << 8) |
           ((u32)rx[5] << 16) |
           ((u32)rx[6] << 24);

    return XST_SUCCESS;
}

int lan9252_spi_write8(lan9252_spi_t *ctx, u16 addr, u8 val)
{
    u8 tx[4];
    u8 rx[4];

    tx[0] = LAN9252_SPI_CMD_WRITE;
    tx[1] = (u8)((addr >> 8) & 0xFFU);
    tx[2] = (u8)(addr & 0xFFU);
    tx[3] = val;

    memset(rx, 0, sizeof(rx));
    return lan9252_spi_transfer(ctx, tx, rx, 4U);
}

int lan9252_spi_write16(lan9252_spi_t *ctx, u16 addr, u16 val)
{
    u8 tx[5];
    u8 rx[5];

    tx[0] = LAN9252_SPI_CMD_WRITE;
    tx[1] = (u8)((addr >> 8) & 0xFFU);
    tx[2] = (u8)(addr & 0xFFU);
    tx[3] = (u8)(val & 0xFFU);
    tx[4] = (u8)((val >> 8) & 0xFFU);

    memset(rx, 0, sizeof(rx));
    return lan9252_spi_transfer(ctx, tx, rx, 5U);
}

int lan9252_spi_write32(lan9252_spi_t *ctx, u16 addr, u32 val)
{
    u8 tx[7];
    u8 rx[7];

    tx[0] = LAN9252_SPI_CMD_WRITE;
    tx[1] = (u8)((addr >> 8) & 0xFFU);
    tx[2] = (u8)(addr & 0xFFU);
    tx[3] = (u8)(val & 0xFFU);
    tx[4] = (u8)((val >> 8) & 0xFFU);
    tx[5] = (u8)((val >> 16) & 0xFFU);
    tx[6] = (u8)((val >> 24) & 0xFFU);

    memset(rx, 0, sizeof(rx));
    return lan9252_spi_transfer(ctx, tx, rx, 7U);
}

int lan9252_spi_check_byte_test(lan9252_spi_t *ctx, u32 *val)
{
    int status;

    status = lan9252_spi_rstqio(ctx);
    if (status != XST_SUCCESS) {
        return status;
    }

    usleep(1000);
    return lan9252_spi_read32(ctx, LAN9252_REG_BYTE_TEST, val);
}

int lan9252_spi_wait_byte_test(lan9252_spi_t *ctx,
                               u32 expected,
                               u32 timeout_ms,
                               u32 poll_interval_ms)
{
    u32 val = 0;
    u32 elapsed = 0;
    int status;

    if (poll_interval_ms == 0U) {
        poll_interval_ms = 1U;
    }

    while (elapsed <= timeout_ms) {
        status = lan9252_spi_read32(ctx, LAN9252_REG_BYTE_TEST, &val);
        if ((status == XST_SUCCESS) && (val == expected)) {
            return XST_SUCCESS;
        }

        usleep(poll_interval_ms * 1000U);
        elapsed += poll_interval_ms;
    }

    return XST_FAILURE;
}

int lan9252_spi_wait_hw_ready(lan9252_spi_t *ctx,
                              u32 timeout_ms,
                              u32 poll_interval_ms)
{
    u32 hw_cfg = 0;
    u32 elapsed = 0;
    int status;

    if (poll_interval_ms == 0U) {
        poll_interval_ms = 1U;
    }

    while (elapsed <= timeout_ms) {
        status = lan9252_spi_read32(ctx, LAN9252_REG_HW_CFG, &hw_cfg);
        if ((status == XST_SUCCESS) && ((hw_cfg & LAN9252_HW_CFG_READY_MASK) != 0U)) {
            return XST_SUCCESS;
        }

        usleep(poll_interval_ms * 1000U);
        elapsed += poll_interval_ms;
    }

    return XST_FAILURE;
}

void lan9252_spi_attach_external_reset(lan9252_spi_t *ctx,
                                       u32 baseaddr,
                                       u32 offset)
{
    if (ctx == 0) {
        return;
    }

    ctx->use_external_reset  = 1;
    ctx->reset_ctrl_baseaddr = baseaddr;
    ctx->reset_ctrl_offset   = offset;
}

int lan9252_spi_set_external_reset(lan9252_spi_t *ctx, int asserted)
{
    u32 val;

    if ((ctx == 0) || (ctx->use_external_reset == 0)) {
        return XST_FAILURE;
    }

    val = asserted ? 0x00000001U : 0x00000000U;

    Xil_Out32(ctx->reset_ctrl_baseaddr + ctx->reset_ctrl_offset, val);

    return XST_SUCCESS;
}

int lan9252_spi_hw_reset_sequence(lan9252_spi_t *ctx,
                                  u32 assert_ms,
                                  u32 release_delay_ms)
{
    int status;

    status = lan9252_spi_set_external_reset(ctx, 1);
    if (status != XST_SUCCESS) {
        return status;
    }

    usleep(assert_ms * 1000U);

    status = lan9252_spi_set_external_reset(ctx, 0);
    if (status != XST_SUCCESS) {
        return status;
    }

    usleep(release_delay_ms * 1000U);
    return XST_SUCCESS;
}

int lan9252_spi_wait_reset_ctl_clear(lan9252_spi_t *ctx,
                                     u32 mask,
                                     u32 timeout_ms)
{
    u32 val = 0;
    u32 elapsed = 0;
    int status;

    while (elapsed <= timeout_ms) {
        status = lan9252_spi_read32(ctx, LAN9252_REG_RESET_CTL, &val);
        if (status != XST_SUCCESS) {
            return status;
        }

        if ((val & mask) == 0U) {
            return XST_SUCCESS;
        }

        usleep(1000);
        elapsed += 1U;
    }

    return XST_FAILURE;
}

int lan9252_spi_ethercat_reset(lan9252_spi_t *ctx, u32 timeout_ms)
{
    int status;

    status = lan9252_spi_write32(ctx,
                                 LAN9252_REG_RESET_CTL,
                                 LAN9252_RESET_CTL_ETHERCAT_RST);
    if (status != XST_SUCCESS) {
        return status;
    }

    status = lan9252_spi_wait_reset_ctl_clear(ctx,
                                              LAN9252_RESET_CTL_ETHERCAT_RST,
                                              timeout_ms);
    if (status != XST_SUCCESS) {
        return status;
    }

    status = lan9252_spi_wait_byte_test(ctx,
                                        LAN9252_BYTE_TEST_VALUE,
                                        timeout_ms,
                                        10U);
    if (status != XST_SUCCESS) {
        return status;
    }

    status = lan9252_spi_wait_hw_ready(ctx, timeout_ms, 10U);
    if (status != XST_SUCCESS) {
        return status;
    }

    return XST_SUCCESS;
}

int lan9252_spi_write_readback32(lan9252_spi_t *ctx,
                                 u16 addr,
                                 u32 write_val,
                                 u32 *read_val)
{
    int status;
    u32 tmp = 0;

    status = lan9252_spi_write32(ctx, addr, write_val);
    if (status != XST_SUCCESS) {
        return status;
    }

    usleep(1000);

    status = lan9252_spi_read32(ctx, addr, &tmp);
    if (status != XST_SUCCESS) {
        return status;
    }

    if (read_val != 0) {
        *read_val = tmp;
    }

    return XST_SUCCESS;
}

int lan9252_spi_csr_wait_not_busy(lan9252_spi_t *ctx, u32 timeout_ms)
{
    u32 cmd = 0U;
    u32 elapsed = 0U;
    int status;

    while (elapsed <= timeout_ms) {
        status = lan9252_spi_read32(ctx, LAN9252_REG_CSR_CMD, &cmd);
        if (status != XST_SUCCESS) {
            return status;
        }

        if ((cmd & LAN9252_CSR_BUSY) == 0U) {
            return XST_SUCCESS;
        }

        usleep(1000);
        elapsed += 1U;
    }

    return XST_FAILURE;
}

int lan9252_spi_csr_read(lan9252_spi_t *ctx, u16 csr_addr, u8 size, u32 *val)
{
    int status;
    u32 cmd;
    u32 data;
    u32 dummy;
    u32 size_field;

    if ((ctx == 0) || (val == 0)) {
        return XST_FAILURE;
    }

    if (!lan9252_spi_is_valid_csr_size_addr(csr_addr, size)) {
        return XST_FAILURE;
    }

    size_field = lan9252_csr_size_to_cmd(size);
    if (size_field == 0xFFFFFFFFU) {
        return XST_FAILURE;
    }

    status = lan9252_spi_csr_wait_not_busy(ctx, 100U);
    if (status != XST_SUCCESS) {
        return status;
    }

    cmd = LAN9252_CSR_BUSY |
          LAN9252_CSR_READ |
          size_field |
          (u32)csr_addr;

    status = lan9252_spi_write32(ctx, LAN9252_REG_CSR_CMD, cmd);
    if (status != XST_SUCCESS) {
        return status;
    }

    status = lan9252_spi_read32(ctx, LAN9252_REG_BYTE_TEST, &dummy);
    if (status != XST_SUCCESS) {
        return status;
    }

    status = lan9252_spi_csr_wait_not_busy(ctx, 100U);
    if (status != XST_SUCCESS) {
        return status;
    }

    status = lan9252_spi_read32(ctx, LAN9252_REG_CSR_DATA, &data);
    if (status != XST_SUCCESS) {
        return status;
    }

    if (size == 1U) {
        *val = data & 0xFFU;
    } else if (size == 2U) {
        *val = data & 0xFFFFU;
    } else {
        *val = data;
    }

    return XST_SUCCESS;
}

int lan9252_spi_csr_write(lan9252_spi_t *ctx, u16 csr_addr, u8 size, u32 val)
{
    int status;
    u32 cmd;
    u32 dummy;
    u32 size_field;

    if (ctx == 0) {
        return XST_FAILURE;
    }

    if (!lan9252_spi_is_valid_csr_size_addr(csr_addr, size)) {
        return XST_FAILURE;
    }

    size_field = lan9252_csr_size_to_cmd(size);
    if (size_field == 0xFFFFFFFFU) {
        return XST_FAILURE;
    }

    status = lan9252_spi_csr_wait_not_busy(ctx, 100U);
    if (status != XST_SUCCESS) {
        return status;
    }

    status = lan9252_spi_write32(ctx, LAN9252_REG_CSR_DATA, val);
    if (status != XST_SUCCESS) {
        return status;
    }

    status = lan9252_spi_read32(ctx, LAN9252_REG_BYTE_TEST, &dummy);
    if (status != XST_SUCCESS) {
        return status;
    }

    cmd = LAN9252_CSR_BUSY |
          size_field |
          (u32)csr_addr;

    status = lan9252_spi_write32(ctx, LAN9252_REG_CSR_CMD, cmd);
    if (status != XST_SUCCESS) {
        return status;
    }

    status = lan9252_spi_read32(ctx, LAN9252_REG_BYTE_TEST, &dummy);
    if (status != XST_SUCCESS) {
        return status;
    }

    return lan9252_spi_csr_wait_not_busy(ctx, 100U);
}

int lan9252_spi_csr_write_readback(lan9252_spi_t *ctx,
                                   u16 esc_addr,
                                   u8 size,
                                   u32 write_val,
                                   u32 *read_val)
{
    int status;
    u32 tmp = 0U;

    status = lan9252_spi_csr_write(ctx, esc_addr, size, write_val);
    if (status != XST_SUCCESS) {
        return status;
    }

    usleep(1000);

    status = lan9252_spi_csr_read(ctx, esc_addr, size, &tmp);
    if (status != XST_SUCCESS) {
        return status;
    }

    if (read_val != 0) {
        *read_val = tmp;
    }

    return XST_SUCCESS;
}

int lan9252_spi_read_al_status(lan9252_spi_t *ctx, u16 *al_status)
{
    int status;
    u32 val = 0;

    if (al_status == 0) {
        return XST_FAILURE;
    }

    status = lan9252_spi_csr_read(ctx, LAN9252_ESC_REG_AL_STATUS, 2U, &val);
    if (status != XST_SUCCESS) {
        return status;
    }

    *al_status = (u16)(val & 0xFFFFU);
    return XST_SUCCESS;
}

int lan9252_spi_read_al_status_code(lan9252_spi_t *ctx, u16 *al_status_code)
{
    int status;
    u32 val = 0;

    if (al_status_code == 0) {
        return XST_FAILURE;
    }

    status = lan9252_spi_csr_read(ctx, LAN9252_ESC_REG_AL_STATUS_CODE, 2U, &val);
    if (status != XST_SUCCESS) {
        return status;
    }

    *al_status_code = (u16)(val & 0xFFFFU);
    return XST_SUCCESS;
}

int lan9252_spi_request_al_state(lan9252_spi_t *ctx, u16 requested_state)
{
    return lan9252_spi_csr_write(ctx,
                                 LAN9252_ESC_REG_AL_CONTROL,
                                 2U,
                                 (u32)(requested_state & 0xFFFFU));
}

int lan9252_spi_wait_al_state(lan9252_spi_t *ctx,
                              u16 expected_state,
                              u32 timeout_ms,
                              u32 poll_interval_ms,
                              u16 *final_status,
                              u16 *final_status_code)
{
    int status;
    u32 elapsed = 0;
    u16 al_status = 0;
    u16 al_status_code = 0;

    if (poll_interval_ms == 0U) {
        poll_interval_ms = 1U;
    }

    while (elapsed <= timeout_ms) {
        status = lan9252_spi_read_al_status(ctx, &al_status);
        if (status != XST_SUCCESS) {
            return status;
        }

        status = lan9252_spi_read_al_status_code(ctx, &al_status_code);
        if (status != XST_SUCCESS) {
            return status;
        }

        if (final_status != 0) {
            *final_status = al_status;
        }

        if (final_status_code != 0) {
            *final_status_code = al_status_code;
        }

        if ((al_status & LAN9252_AL_STATE_MASK) ==
            (expected_state & LAN9252_AL_STATE_MASK)) {
            return XST_SUCCESS;
        }

        usleep(poll_interval_ms * 1000U);
        elapsed += poll_interval_ms;
    }

    return XST_FAILURE;
}

int lan9252_spi_request_al_state_and_wait(lan9252_spi_t *ctx,
                                          u16 requested_state,
                                          u32 timeout_ms,
                                          u32 poll_interval_ms,
                                          u16 *final_status,
                                          u16 *final_status_code)
{
    int status;

    status = lan9252_spi_request_al_state(ctx, requested_state);
    if (status != XST_SUCCESS) {
        return status;
    }

    usleep(1000);

    return lan9252_spi_wait_al_state(ctx,
                                     requested_state,
                                     timeout_ms,
                                     poll_interval_ms,
                                     final_status,
                                     final_status_code);
}
