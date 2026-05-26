#ifndef _9252_HW_H_
#define _9252_HW_H_

#include "esc.h"

#define ECAT_REG_BASE_ADDR              0x0300U

#define CSR_DATA_REG_OFFSET             0x00U
#define CSR_CMD_REG_OFFSET              0x04U
#define PRAM_READ_ADDR_LEN_OFFSET       0x08U
#define PRAM_READ_CMD_OFFSET            0x0CU
#define PRAM_WRITE_ADDR_LEN_OFFSET      0x10U
#define PRAM_WRITE_CMD_OFFSET           0x14U

#define PRAM_SPACE_AVBL_COUNT_MASK      0x1FU
#define IS_PRAM_SPACE_AVBL_MASK         0x01U

#define CSR_DATA_REG                    (ECAT_REG_BASE_ADDR + CSR_DATA_REG_OFFSET)
#define CSR_CMD_REG                     (ECAT_REG_BASE_ADDR + CSR_CMD_REG_OFFSET)
#define PRAM_READ_ADDR_LEN_REG          (ECAT_REG_BASE_ADDR + PRAM_READ_ADDR_LEN_OFFSET)
#define PRAM_READ_CMD_REG               (ECAT_REG_BASE_ADDR + PRAM_READ_CMD_OFFSET)
#define PRAM_WRITE_ADDR_LEN_REG         (ECAT_REG_BASE_ADDR + PRAM_WRITE_ADDR_LEN_OFFSET)
#define PRAM_WRITE_CMD_REG              (ECAT_REG_BASE_ADDR + PRAM_WRITE_CMD_OFFSET)

#define PRAM_READ_FIFO_REG              0x0004U
#define PRAM_WRITE_FIFO_REG             0x0020U

#define HBI_INDEXED_DATA0_REG           0x0004U
#define HBI_INDEXED_DATA1_REG           0x000CU
#define HBI_INDEXED_DATA2_REG           0x0014U

#define HBI_INDEXED_INDEX0_REG          0x0000U
#define HBI_INDEXED_INDEX1_REG          0x0008U
#define HBI_INDEXED_INDEX2_REG          0x0010U

#define HBI_INDEXED_PRAM_READ_WRITE_FIFO 0x0018U

#define PRAM_RW_ABORT_MASK              (1UL << 30)
#define PRAM_RW_BUSY_32B                (1UL << 31)
#define PRAM_RW_BUSY_8B                 (1U  << 7)
#define PRAM_SET_READ                   (1U  << 6)
#define PRAM_SET_WRITE                  0U

#define ECAT_TIMER_INC_P_MS             1U

#ifndef DISABLE_ESC_INT
#define DISABLE_ESC_INT()               {restore_intsts = PDI_Disable_Global_Interrupt();}
#endif

#ifndef ENABLE_ESC_INT
#define ENABLE_ESC_INT()                {PDI_Restore_Global_Interrupt(restore_intsts);}
#endif

#ifndef HW_GetTimer
#define HW_GetTimer()                   (PDI_GetTimer())
#endif

#ifndef HW_ClearTimer
#define HW_ClearTimer()                 (PDI_ClearTimer())
#endif

#define HW_EscReadWord(WordValue, Address)        HW_EscRead(((MEM_ADDR *)&(WordValue)), ((UINT16)(Address)), 2)
#define HW_EscReadDWord(DWordValue, Address)      HW_EscRead(((MEM_ADDR *)&(DWordValue)), ((UINT16)(Address)), 4)
#define HW_EscReadByte(ByteValue, Address)        HW_EscRead(((MEM_ADDR *)&(ByteValue)), ((UINT16)(Address)), 1)
#define HW_EscReadMbxMem(pData, Address, Len)     HW_EscRead(((MEM_ADDR *)(pData)), ((UINT16)(Address)), (Len))

#define HW_EscReadWordIsr(WordValue, Address)     HW_EscReadIsr(((MEM_ADDR *)&(WordValue)), ((UINT16)(Address)), 2)
#define HW_EscReadDWordIsr(DWordValue, Address)   HW_EscReadIsr(((MEM_ADDR *)&(DWordValue)), ((UINT16)(Address)), 4)
#define HW_EscReadByteIsr(ByteValue, Address)     HW_EscReadIsr(((MEM_ADDR *)&(ByteValue)), ((UINT16)(Address)), 1)

#define HW_EscWriteWord(WordValue, Address)       HW_EscWrite(((MEM_ADDR *)&(WordValue)), ((UINT16)(Address)), 2)
#define HW_EscWriteDWord(DWordValue, Address)     HW_EscWrite(((MEM_ADDR *)&(DWordValue)), ((UINT16)(Address)), 4)
#define HW_EscWriteByte(ByteValue, Address)       HW_EscWrite(((MEM_ADDR *)&(ByteValue)), ((UINT16)(Address)), 1)
#define HW_EscWriteMbxMem(pData, Address, Len)    HW_EscWrite(((MEM_ADDR *)(pData)), ((UINT16)(Address)), (Len))

#define HW_EscWriteWordIsr(WordValue, Address)    HW_EscWriteIsr(((MEM_ADDR *)&(WordValue)), ((UINT16)(Address)), 2)
#define HW_EscWriteDWordIsr(DWordValue, Address)  HW_EscWriteIsr(((MEM_ADDR *)&(DWordValue)), ((UINT16)(Address)), 4)
#define HW_EscWriteByteIsr(ByteValue, Address)    HW_EscWriteIsr(((MEM_ADDR *)&(ByteValue)), ((UINT16)(Address)), 1)

#if _9252_HW_
#define PROTO
#else
#define PROTO extern
#endif

PROTO volatile unsigned int restore_intsts;

PROTO UINT8  LAN9252_Init(void);
PROTO void   HW_Release(void);

PROTO UINT16 HW_GetALEventRegister(void);
PROTO UINT16 HW_GetALEventRegister_Isr(void);

PROTO void   HW_ResetALEventMask(UINT16 intMask);
PROTO void   HW_SetALEventMask(UINT16 intMask);

PROTO void   HW_EscRead(MEM_ADDR *pData, UINT16 Address, UINT16 Len);
PROTO void   HW_EscReadIsr(MEM_ADDR *pData, UINT16 Address, UINT16 Len);

PROTO void   HW_EscWrite(MEM_ADDR *pData, UINT16 Address, UINT16 Len);
PROTO void   HW_EscWriteIsr(MEM_ADDR *pData, UINT16 Address, UINT16 Len);

PROTO void   HW_DisableSyncManChannel(UINT8 channel);
PROTO void   HW_EnableSyncManChannel(UINT8 channel);
PROTO TSYNCMAN ESCMEM *HW_GetSyncMan(UINT8 channel);
PROTO void   HW_SetLed(UINT8 RunLed, UINT8 ErrLed);

PROTO UINT16 PDI_GetTimer(void);
PROTO void   PDI_ClearTimer(void);

PROTO void   PDI_Restore_Global_Interrupt(UINT32 int_sts);
PROTO UINT32 PDI_Disable_Global_Interrupt(void);

#undef PROTO

#endif
