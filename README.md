# KD240 EtherCAT LAN9252 AXI SPI Bring-up

## Objective

This project ports the previous Zybo Z7-20 based LAN9252 EtherCAT Slave structure to the AMD KD240 platform while minimizing architectural changes.

## Hardware Structure

- Board: AMD KD240
- ESC: Microchip LAN9252 EVB
- SPI Interface: AXI Quad SPI
- Auxiliary Interface: ecat_pl_if custom AXI-Lite IP
- External Signals:
  - SPI_SCK
  - SPI_MOSI
  - SPI_MISO
  - SPI_CS
  - IRQ
  - RST
  - SYNC0
  - SYNC1

## Bring-up Steps

1. KD240 Hello World
2. AXI Quad SPI test
3. LAN9252 Byte Order Register read
4. LAN9252 initialization
5. EtherCAT slave scan using pySOEM
6. PREOP / SAFEOP / OP state transition
7. IRQ and SYNC0 test

## Current Status

- [ ] Vivado block design created
- [ ] AXI Quad SPI connected
- [ ] ecat_pl_if connected
- [ ] XDC pin assignment completed
- [ ] XSA exported
- [ ] SPI test passed
- [ ] LAN9252 Byte Order Register passed
- [ ] EtherCAT slave detected