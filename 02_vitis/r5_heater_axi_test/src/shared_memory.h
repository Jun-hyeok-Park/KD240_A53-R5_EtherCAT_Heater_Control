#ifndef SHARED_MEMORY_H_
#define SHARED_MEMORY_H_

#include <stdint.h>
#include <stddef.h>

#define SHM_BASE_ADDR       0x70000000U
#define SHM_MAGIC_VALUE     0xA53A5A5AU
#define SHM_VERSION         0x20260520U

#define SHM_CONTROL_RUN                0x00000001U
#define SHM_CONTROL_STOP               0x00000002U
#define SHM_CONTROL_RESET              0x00000004U
#define SHM_CONTROL_AUTO_TUNE_START    0x00000008U
#define SHM_CONTROL_AUTO_TUNE_ABORT    0x00000010U
#define SHM_CONTROL_APPLY_TUNED_GAIN   0x00000020U

#define SHM_CACHE_LINE_SIZE 64U

typedef struct __attribute__((aligned(64)))
{
    /*
     * =========================================================
     * Cache Line 0: A53 -> R5 command block
     * Only A53 writes this block.
     * Only R5 reads this block.
     * =========================================================
     */
    volatile uint32_t magic;
    volatile uint32_t version;

    volatile uint32_t a53_command_seq;
    volatile uint32_t control_word;

    volatile float target_temp;
    volatile float kp;
    volatile float ki;

    volatile uint32_t a53_heartbeat;

    volatile float auto_step_mv;
    volatile float auto_noise_band;
    volatile float auto_slope_band;
    volatile uint32_t auto_max_time_ms;

    /*
     * Padding to make R5 status block start at next 64-byte cache line.
     *
     * Current command size:
     *   12 words x 4 bytes = 48 bytes
     * Need 16 bytes padding.
     */
    volatile uint32_t cmd_reserved[4];

    /*
     * =========================================================
     * Cache Line 1~: R5 -> A53 status block
     * Only R5 writes this block.
     * Only A53 reads this block.
     * =========================================================
     */
    volatile uint32_t r5_status_seq;
    volatile uint32_t state;

    volatile float current_temp;
    volatile float error;
    volatile float u_ctrl;

    volatile uint32_t duty_count;
    volatile uint32_t r5_heartbeat;

    volatile uint32_t reserved[32];

    volatile uint32_t auto_tune_state;
    volatile uint32_t auto_tune_error;

    volatile float tune_K;
    volatile float tune_L;
    volatile float tune_T;

    volatile float tune_kp;
    volatile float tune_ki;

    volatile uint32_t tuned_gain_valid;

} SharedMemory_t;

#define SHM_PTR        ((SharedMemory_t *)SHM_BASE_ADDR)

#define SHM_SIZE_BYTES \
    (((sizeof(SharedMemory_t) + (SHM_CACHE_LINE_SIZE - 1U)) / SHM_CACHE_LINE_SIZE) * SHM_CACHE_LINE_SIZE)

#define SHM_CMD_OFFSET         0U
#define SHM_CMD_SIZE_BYTES     64U

#define SHM_STATUS_OFFSET      ((uint32_t)offsetof(SharedMemory_t, r5_status_seq))
#define SHM_STATUS_SIZE_BYTES  (SHM_SIZE_BYTES - SHM_STATUS_OFFSET)

#endif /* SHARED_MEMORY_H_ */