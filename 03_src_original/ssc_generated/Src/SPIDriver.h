#ifndef SPIDRIVER_H
#define SPIDRIVER_H

#ifdef __cplusplus
extern "C" {
#endif

#include "ecat_def.h"
#include "lan9252_spi.h"

#define CMD_SERIAL_READ              0x03U
#define CMD_FAST_READ                0x0BU
#define CMD_SERIAL_WRITE             0x02U
#define CMD_FAST_READ_DUMMY          0x00U

#define ESC_CSR_CMD_REG              0x0304U
#define ESC_CSR_DATA_REG             0x0300U

void   PDI_RegisterLan9252Context(lan9252_spi_t *ctx);
void   PDI_Init(void);

void   SPIWritePDRamRegister(UINT8 *write_buffer, UINT16 address, UINT16 count);
void   SPIReadPDRamRegister(UINT8 *read_buffer, UINT16 address, UINT16 count);
void   SPIReadRegUsingCSR(UINT8 *read_buffer, UINT16 address, UINT8 count);
void   SPIWriteRegUsingCSR(UINT8 *write_buffer, UINT16 address, UINT8 count);
void   SPIWriteDWord(UINT16 address, UINT32 val);
UINT32 SPIReadDWord(UINT16 address);

void   PDIReadReg(UINT8 *read_buffer, UINT16 address, UINT16 count);
void   PDIWriteReg(UINT8 *write_buffer, UINT16 address, UINT16 count);
UINT32 PDIReadLAN9252DirectReg(UINT16 address);
void   PDIWriteLAN9252DirectReg(UINT32 val, UINT16 address);

void   PDI_Enable_Global_interrupt(void);
void   PDI_Init_SYNC_Interrupts(void);
void   PDI_Timer_Interrupt(void);
void   PDI_IRQ_Interrupt(void);

void   EcatPlInterruptDisable(void);
void   EcatPlInterruptEnable(void);

#ifdef __cplusplus
}
#endif

#endif
