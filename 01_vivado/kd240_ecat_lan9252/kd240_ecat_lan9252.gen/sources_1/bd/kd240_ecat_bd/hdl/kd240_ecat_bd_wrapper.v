//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Tue May 19 13:34:41 2026
//Host        : pjh running 64-bit major release  (build 9200)
//Command     : generate_target kd240_ecat_bd_wrapper.bd
//Design      : kd240_ecat_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module kd240_ecat_bd_wrapper
   (irq_in_0,
    rst_out_0,
    spi_rtl_io0_io,
    spi_rtl_io1_io,
    spi_rtl_sck_io,
    spi_rtl_ss_io,
    sync0_in_0,
    sync1_in_0);
  input irq_in_0;
  output rst_out_0;
  inout spi_rtl_io0_io;
  inout spi_rtl_io1_io;
  inout spi_rtl_sck_io;
  inout [0:0]spi_rtl_ss_io;
  input sync0_in_0;
  input sync1_in_0;

  wire irq_in_0;
  wire rst_out_0;
  wire spi_rtl_io0_i;
  wire spi_rtl_io0_io;
  wire spi_rtl_io0_o;
  wire spi_rtl_io0_t;
  wire spi_rtl_io1_i;
  wire spi_rtl_io1_io;
  wire spi_rtl_io1_o;
  wire spi_rtl_io1_t;
  wire spi_rtl_sck_i;
  wire spi_rtl_sck_io;
  wire spi_rtl_sck_o;
  wire spi_rtl_sck_t;
  wire [0:0]spi_rtl_ss_i_0;
  wire [0:0]spi_rtl_ss_io_0;
  wire [0:0]spi_rtl_ss_o_0;
  wire spi_rtl_ss_t;
  wire sync0_in_0;
  wire sync1_in_0;

  kd240_ecat_bd kd240_ecat_bd_i
       (.irq_in_0(irq_in_0),
        .rst_out_0(rst_out_0),
        .spi_rtl_io0_i(spi_rtl_io0_i),
        .spi_rtl_io0_o(spi_rtl_io0_o),
        .spi_rtl_io0_t(spi_rtl_io0_t),
        .spi_rtl_io1_i(spi_rtl_io1_i),
        .spi_rtl_io1_o(spi_rtl_io1_o),
        .spi_rtl_io1_t(spi_rtl_io1_t),
        .spi_rtl_sck_i(spi_rtl_sck_i),
        .spi_rtl_sck_o(spi_rtl_sck_o),
        .spi_rtl_sck_t(spi_rtl_sck_t),
        .spi_rtl_ss_i(spi_rtl_ss_i_0),
        .spi_rtl_ss_o(spi_rtl_ss_o_0),
        .spi_rtl_ss_t(spi_rtl_ss_t),
        .sync0_in_0(sync0_in_0),
        .sync1_in_0(sync1_in_0));
  IOBUF spi_rtl_io0_iobuf
       (.I(spi_rtl_io0_o),
        .IO(spi_rtl_io0_io),
        .O(spi_rtl_io0_i),
        .T(spi_rtl_io0_t));
  IOBUF spi_rtl_io1_iobuf
       (.I(spi_rtl_io1_o),
        .IO(spi_rtl_io1_io),
        .O(spi_rtl_io1_i),
        .T(spi_rtl_io1_t));
  IOBUF spi_rtl_sck_iobuf
       (.I(spi_rtl_sck_o),
        .IO(spi_rtl_sck_io),
        .O(spi_rtl_sck_i),
        .T(spi_rtl_sck_t));
  IOBUF spi_rtl_ss_iobuf_0
       (.I(spi_rtl_ss_o_0),
        .IO(spi_rtl_ss_io[0]),
        .O(spi_rtl_ss_i_0),
        .T(spi_rtl_ss_t));
endmodule
