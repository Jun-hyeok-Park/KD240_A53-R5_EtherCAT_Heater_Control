## ============================================================
## KD240 J2 PMOD - LAN9252 SPI Connection
## Project   : kd240_ecat_lan9252
## Interface : AXI Quad SPI -> LAN9252
## Target    : KD240 J2 PMOD
## ============================================================

## J2 Pin 1 : HDA11 -> LAN9252 SCK
set_property PACKAGE_PIN E9 [get_ports spi_rtl_sck_io]
set_property IOSTANDARD LVCMOS33 [get_ports spi_rtl_sck_io]

## J2 Pin 3 : HDA12 -> LAN9252 MOSI
set_property PACKAGE_PIN F13 [get_ports spi_rtl_io0_io]
set_property IOSTANDARD LVCMOS33 [get_ports spi_rtl_io0_io]

## J2 Pin 5 : HDA13 -> LAN9252 MISO
set_property PACKAGE_PIN E12 [get_ports spi_rtl_io1_io]
set_property IOSTANDARD LVCMOS33 [get_ports spi_rtl_io1_io]

## J2 Pin 7 : HDA14 -> LAN9252 CS
set_property PACKAGE_PIN D10 [get_ports {spi_rtl_ss_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {spi_rtl_ss_io[0]}]

## J2 Pin 2 : HDA15 -> LAN9252 IRQ
set_property PACKAGE_PIN D9 [get_ports irq_in_0]
set_property IOSTANDARD LVCMOS33 [get_ports irq_in_0]

## J2 Pin 4 : HDA16_CC -> LAN9252 RST
set_property PACKAGE_PIN D13 [get_ports rst_out_0]
set_property IOSTANDARD LVCMOS33 [get_ports rst_out_0]

## J2 Pin 6 : HDA17 -> LAN9252 SYNC0
set_property PACKAGE_PIN C13 [get_ports sync0_in_0]
set_property IOSTANDARD LVCMOS33 [get_ports sync0_in_0]

## J2 Pin 8 : HDA18 -> LAN9252 SYNC1
set_property PACKAGE_PIN C10 [get_ports sync1_in_0]
set_property IOSTANDARD LVCMOS33 [get_ports sync1_in_0]