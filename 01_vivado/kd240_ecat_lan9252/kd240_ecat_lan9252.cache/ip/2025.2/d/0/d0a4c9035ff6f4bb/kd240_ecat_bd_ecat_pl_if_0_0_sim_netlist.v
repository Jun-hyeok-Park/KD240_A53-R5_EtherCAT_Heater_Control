// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Wed May 13 14:46:35 2026
// Host        : pjh running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ kd240_ecat_bd_ecat_pl_if_0_0_sim_netlist.v
// Design      : kd240_ecat_bd_ecat_pl_if_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xck24-ubva530-2LV-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ecat_pl_if
   (axi_rvalid_reg,
    axi_arready_reg,
    rst_out,
    axi_awready_reg,
    s00_axi_rdata,
    irq_int,
    sync0_int,
    sync1_int,
    s00_axi_bvalid,
    s00_axi_wready,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wdata,
    irq_in,
    sync0_in,
    sync1_in,
    s00_axi_araddr,
    s00_axi_wvalid,
    s00_axi_wstrb,
    s00_axi_awvalid,
    s00_axi_rready,
    s00_axi_arvalid,
    s00_axi_aresetn,
    s00_axi_bready);
  output axi_rvalid_reg;
  output axi_arready_reg;
  output rst_out;
  output axi_awready_reg;
  output [31:0]s00_axi_rdata;
  output irq_int;
  output sync0_int;
  output sync1_int;
  output s00_axi_bvalid;
  output s00_axi_wready;
  input s00_axi_aclk;
  input [2:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input irq_in;
  input sync0_in;
  input sync1_in;
  input [2:0]s00_axi_araddr;
  input s00_axi_wvalid;
  input [3:0]s00_axi_wstrb;
  input s00_axi_awvalid;
  input s00_axi_rready;
  input s00_axi_arvalid;
  input s00_axi_aresetn;
  input s00_axi_bready;

  wire axi_arready_reg;
  wire axi_awready_reg;
  wire axi_rvalid_reg;
  wire irq_in;
  wire irq_int;
  wire rst_out;
  wire s00_axi_aclk;
  wire [2:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [2:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire sync0_in;
  wire sync0_int;
  wire sync1_in;
  wire sync1_int;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ecat_pl_if_slave_lite_v1_0_S00_AXI ecat_pl_if_slave_lite_v1_0_S00_AXI_inst
       (.axi_arready_reg_0(axi_arready_reg),
        .axi_awready_reg_0(axi_awready_reg),
        .axi_rvalid_reg_0(axi_rvalid_reg),
        .irq_in(irq_in),
        .irq_int(irq_int),
        .rst_out(rst_out),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .sync0_in(sync0_in),
        .sync0_int(sync0_int),
        .sync1_in(sync1_in),
        .sync1_int(sync1_int));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ecat_pl_if_slave_lite_v1_0_S00_AXI
   (axi_rvalid_reg_0,
    axi_arready_reg_0,
    rst_out,
    axi_awready_reg_0,
    s00_axi_rdata,
    irq_int,
    sync0_int,
    sync1_int,
    s00_axi_bvalid,
    s00_axi_wready,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wdata,
    irq_in,
    sync0_in,
    sync1_in,
    s00_axi_araddr,
    s00_axi_wvalid,
    s00_axi_wstrb,
    s00_axi_awvalid,
    s00_axi_rready,
    s00_axi_arvalid,
    s00_axi_aresetn,
    s00_axi_bready);
  output axi_rvalid_reg_0;
  output axi_arready_reg_0;
  output rst_out;
  output axi_awready_reg_0;
  output [31:0]s00_axi_rdata;
  output irq_int;
  output sync0_int;
  output sync1_int;
  output s00_axi_bvalid;
  output s00_axi_wready;
  input s00_axi_aclk;
  input [2:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input irq_in;
  input sync0_in;
  input sync1_in;
  input [2:0]s00_axi_araddr;
  input s00_axi_wvalid;
  input [3:0]s00_axi_wstrb;
  input s00_axi_awvalid;
  input s00_axi_rready;
  input s00_axi_arvalid;
  input s00_axi_aresetn;
  input s00_axi_bready;

  wire \FSM_sequential_state_read[1]_i_1_n_0 ;
  wire \FSM_sequential_state_write[1]_i_1_n_0 ;
  wire \axi_araddr[4]_i_1_n_0 ;
  wire axi_arready_i_1_n_0;
  wire axi_arready_reg_0;
  wire [0:0]axi_awaddr;
  wire \axi_awaddr_reg_n_0_[2] ;
  wire \axi_awaddr_reg_n_0_[3] ;
  wire \axi_awaddr_reg_n_0_[4] ;
  wire axi_awready0__0;
  wire axi_awready_i_1_n_0;
  wire axi_awready_reg_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_rvalid_reg_0;
  wire axi_wready_i_1_n_0;
  wire \free_cnt[0]_i_2_n_0 ;
  wire [31:0]free_cnt_reg;
  wire \free_cnt_reg[0]_i_1_n_0 ;
  wire \free_cnt_reg[0]_i_1_n_1 ;
  wire \free_cnt_reg[0]_i_1_n_10 ;
  wire \free_cnt_reg[0]_i_1_n_11 ;
  wire \free_cnt_reg[0]_i_1_n_12 ;
  wire \free_cnt_reg[0]_i_1_n_13 ;
  wire \free_cnt_reg[0]_i_1_n_14 ;
  wire \free_cnt_reg[0]_i_1_n_15 ;
  wire \free_cnt_reg[0]_i_1_n_2 ;
  wire \free_cnt_reg[0]_i_1_n_3 ;
  wire \free_cnt_reg[0]_i_1_n_4 ;
  wire \free_cnt_reg[0]_i_1_n_5 ;
  wire \free_cnt_reg[0]_i_1_n_6 ;
  wire \free_cnt_reg[0]_i_1_n_7 ;
  wire \free_cnt_reg[0]_i_1_n_8 ;
  wire \free_cnt_reg[0]_i_1_n_9 ;
  wire \free_cnt_reg[16]_i_1_n_0 ;
  wire \free_cnt_reg[16]_i_1_n_1 ;
  wire \free_cnt_reg[16]_i_1_n_10 ;
  wire \free_cnt_reg[16]_i_1_n_11 ;
  wire \free_cnt_reg[16]_i_1_n_12 ;
  wire \free_cnt_reg[16]_i_1_n_13 ;
  wire \free_cnt_reg[16]_i_1_n_14 ;
  wire \free_cnt_reg[16]_i_1_n_15 ;
  wire \free_cnt_reg[16]_i_1_n_2 ;
  wire \free_cnt_reg[16]_i_1_n_3 ;
  wire \free_cnt_reg[16]_i_1_n_4 ;
  wire \free_cnt_reg[16]_i_1_n_5 ;
  wire \free_cnt_reg[16]_i_1_n_6 ;
  wire \free_cnt_reg[16]_i_1_n_7 ;
  wire \free_cnt_reg[16]_i_1_n_8 ;
  wire \free_cnt_reg[16]_i_1_n_9 ;
  wire \free_cnt_reg[24]_i_1_n_1 ;
  wire \free_cnt_reg[24]_i_1_n_10 ;
  wire \free_cnt_reg[24]_i_1_n_11 ;
  wire \free_cnt_reg[24]_i_1_n_12 ;
  wire \free_cnt_reg[24]_i_1_n_13 ;
  wire \free_cnt_reg[24]_i_1_n_14 ;
  wire \free_cnt_reg[24]_i_1_n_15 ;
  wire \free_cnt_reg[24]_i_1_n_2 ;
  wire \free_cnt_reg[24]_i_1_n_3 ;
  wire \free_cnt_reg[24]_i_1_n_4 ;
  wire \free_cnt_reg[24]_i_1_n_5 ;
  wire \free_cnt_reg[24]_i_1_n_6 ;
  wire \free_cnt_reg[24]_i_1_n_7 ;
  wire \free_cnt_reg[24]_i_1_n_8 ;
  wire \free_cnt_reg[24]_i_1_n_9 ;
  wire \free_cnt_reg[8]_i_1_n_0 ;
  wire \free_cnt_reg[8]_i_1_n_1 ;
  wire \free_cnt_reg[8]_i_1_n_10 ;
  wire \free_cnt_reg[8]_i_1_n_11 ;
  wire \free_cnt_reg[8]_i_1_n_12 ;
  wire \free_cnt_reg[8]_i_1_n_13 ;
  wire \free_cnt_reg[8]_i_1_n_14 ;
  wire \free_cnt_reg[8]_i_1_n_15 ;
  wire \free_cnt_reg[8]_i_1_n_2 ;
  wire \free_cnt_reg[8]_i_1_n_3 ;
  wire \free_cnt_reg[8]_i_1_n_4 ;
  wire \free_cnt_reg[8]_i_1_n_5 ;
  wire \free_cnt_reg[8]_i_1_n_6 ;
  wire \free_cnt_reg[8]_i_1_n_7 ;
  wire \free_cnt_reg[8]_i_1_n_8 ;
  wire \free_cnt_reg[8]_i_1_n_9 ;
  wire \irq_cnt[0]_i_3_n_0 ;
  wire [31:0]irq_cnt_reg;
  wire \irq_cnt_reg[0]_i_2_n_0 ;
  wire \irq_cnt_reg[0]_i_2_n_1 ;
  wire \irq_cnt_reg[0]_i_2_n_10 ;
  wire \irq_cnt_reg[0]_i_2_n_11 ;
  wire \irq_cnt_reg[0]_i_2_n_12 ;
  wire \irq_cnt_reg[0]_i_2_n_13 ;
  wire \irq_cnt_reg[0]_i_2_n_14 ;
  wire \irq_cnt_reg[0]_i_2_n_15 ;
  wire \irq_cnt_reg[0]_i_2_n_2 ;
  wire \irq_cnt_reg[0]_i_2_n_3 ;
  wire \irq_cnt_reg[0]_i_2_n_4 ;
  wire \irq_cnt_reg[0]_i_2_n_5 ;
  wire \irq_cnt_reg[0]_i_2_n_6 ;
  wire \irq_cnt_reg[0]_i_2_n_7 ;
  wire \irq_cnt_reg[0]_i_2_n_8 ;
  wire \irq_cnt_reg[0]_i_2_n_9 ;
  wire \irq_cnt_reg[16]_i_1_n_0 ;
  wire \irq_cnt_reg[16]_i_1_n_1 ;
  wire \irq_cnt_reg[16]_i_1_n_10 ;
  wire \irq_cnt_reg[16]_i_1_n_11 ;
  wire \irq_cnt_reg[16]_i_1_n_12 ;
  wire \irq_cnt_reg[16]_i_1_n_13 ;
  wire \irq_cnt_reg[16]_i_1_n_14 ;
  wire \irq_cnt_reg[16]_i_1_n_15 ;
  wire \irq_cnt_reg[16]_i_1_n_2 ;
  wire \irq_cnt_reg[16]_i_1_n_3 ;
  wire \irq_cnt_reg[16]_i_1_n_4 ;
  wire \irq_cnt_reg[16]_i_1_n_5 ;
  wire \irq_cnt_reg[16]_i_1_n_6 ;
  wire \irq_cnt_reg[16]_i_1_n_7 ;
  wire \irq_cnt_reg[16]_i_1_n_8 ;
  wire \irq_cnt_reg[16]_i_1_n_9 ;
  wire \irq_cnt_reg[24]_i_1_n_1 ;
  wire \irq_cnt_reg[24]_i_1_n_10 ;
  wire \irq_cnt_reg[24]_i_1_n_11 ;
  wire \irq_cnt_reg[24]_i_1_n_12 ;
  wire \irq_cnt_reg[24]_i_1_n_13 ;
  wire \irq_cnt_reg[24]_i_1_n_14 ;
  wire \irq_cnt_reg[24]_i_1_n_15 ;
  wire \irq_cnt_reg[24]_i_1_n_2 ;
  wire \irq_cnt_reg[24]_i_1_n_3 ;
  wire \irq_cnt_reg[24]_i_1_n_4 ;
  wire \irq_cnt_reg[24]_i_1_n_5 ;
  wire \irq_cnt_reg[24]_i_1_n_6 ;
  wire \irq_cnt_reg[24]_i_1_n_7 ;
  wire \irq_cnt_reg[24]_i_1_n_8 ;
  wire \irq_cnt_reg[24]_i_1_n_9 ;
  wire \irq_cnt_reg[8]_i_1_n_0 ;
  wire \irq_cnt_reg[8]_i_1_n_1 ;
  wire \irq_cnt_reg[8]_i_1_n_10 ;
  wire \irq_cnt_reg[8]_i_1_n_11 ;
  wire \irq_cnt_reg[8]_i_1_n_12 ;
  wire \irq_cnt_reg[8]_i_1_n_13 ;
  wire \irq_cnt_reg[8]_i_1_n_14 ;
  wire \irq_cnt_reg[8]_i_1_n_15 ;
  wire \irq_cnt_reg[8]_i_1_n_2 ;
  wire \irq_cnt_reg[8]_i_1_n_3 ;
  wire \irq_cnt_reg[8]_i_1_n_4 ;
  wire \irq_cnt_reg[8]_i_1_n_5 ;
  wire \irq_cnt_reg[8]_i_1_n_6 ;
  wire \irq_cnt_reg[8]_i_1_n_7 ;
  wire \irq_cnt_reg[8]_i_1_n_8 ;
  wire \irq_cnt_reg[8]_i_1_n_9 ;
  wire irq_in;
  wire irq_int;
  wire irq_req_i_1_n_0;
  wire irq_req_i_2_n_0;
  wire irq_req_i_5_n_0;
  wire irq_rise;
  wire irq_sync0;
  wire irq_sync1;
  wire irq_sync1_d;
  wire [31:0]p_1_in;
  wire rst_out;
  wire s00_axi_aclk;
  wire [2:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [2:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire \s00_axi_rdata[0]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[0]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[10]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[10]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[11]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[11]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[12]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[12]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[13]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[13]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[14]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[14]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[15]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[15]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[16]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[16]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[17]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[17]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[18]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[18]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[19]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[19]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[1]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[1]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[20]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[20]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[21]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[21]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[22]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[22]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[23]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[23]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[24]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[24]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[25]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[25]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[26]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[26]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[27]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[27]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[28]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[28]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[29]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[29]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[2]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[2]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[30]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[30]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[31]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[31]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[3]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[3]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[4]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[4]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[5]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[5]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[6]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[6]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[7]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[7]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[8]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[8]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[9]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[9]_INST_0_i_2_n_0 ;
  wire s00_axi_rready;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [2:0]sel0;
  wire [31:0]slv_reg0;
  wire \slv_reg0[15]_i_1_n_0 ;
  wire \slv_reg0[23]_i_1_n_0 ;
  wire \slv_reg0[31]_i_1_n_0 ;
  wire \slv_reg0[7]_i_1_n_0 ;
  wire [31:0]slv_reg1;
  wire \slv_reg1[15]_i_1_n_0 ;
  wire \slv_reg1[23]_i_1_n_0 ;
  wire \slv_reg1[31]_i_1_n_0 ;
  wire \slv_reg1[7]_i_1_n_0 ;
  wire \slv_reg6_reg_n_0_[0] ;
  wire \slv_reg6_reg_n_0_[10] ;
  wire \slv_reg6_reg_n_0_[11] ;
  wire \slv_reg6_reg_n_0_[12] ;
  wire \slv_reg6_reg_n_0_[13] ;
  wire \slv_reg6_reg_n_0_[14] ;
  wire \slv_reg6_reg_n_0_[15] ;
  wire \slv_reg6_reg_n_0_[16] ;
  wire \slv_reg6_reg_n_0_[17] ;
  wire \slv_reg6_reg_n_0_[18] ;
  wire \slv_reg6_reg_n_0_[19] ;
  wire \slv_reg6_reg_n_0_[1] ;
  wire \slv_reg6_reg_n_0_[20] ;
  wire \slv_reg6_reg_n_0_[21] ;
  wire \slv_reg6_reg_n_0_[22] ;
  wire \slv_reg6_reg_n_0_[23] ;
  wire \slv_reg6_reg_n_0_[24] ;
  wire \slv_reg6_reg_n_0_[25] ;
  wire \slv_reg6_reg_n_0_[26] ;
  wire \slv_reg6_reg_n_0_[27] ;
  wire \slv_reg6_reg_n_0_[28] ;
  wire \slv_reg6_reg_n_0_[29] ;
  wire \slv_reg6_reg_n_0_[2] ;
  wire \slv_reg6_reg_n_0_[30] ;
  wire \slv_reg6_reg_n_0_[31] ;
  wire \slv_reg6_reg_n_0_[3] ;
  wire \slv_reg6_reg_n_0_[4] ;
  wire \slv_reg6_reg_n_0_[5] ;
  wire \slv_reg6_reg_n_0_[6] ;
  wire \slv_reg6_reg_n_0_[7] ;
  wire \slv_reg6_reg_n_0_[8] ;
  wire \slv_reg6_reg_n_0_[9] ;
  wire [1:0]state_read;
  wire [1:0]state_read__0;
  wire [1:0]state_write;
  wire [1:0]state_write__0;
  wire \sync0_cnt[0]_i_3_n_0 ;
  wire [31:0]sync0_cnt_reg;
  wire \sync0_cnt_reg[0]_i_2_n_0 ;
  wire \sync0_cnt_reg[0]_i_2_n_1 ;
  wire \sync0_cnt_reg[0]_i_2_n_10 ;
  wire \sync0_cnt_reg[0]_i_2_n_11 ;
  wire \sync0_cnt_reg[0]_i_2_n_12 ;
  wire \sync0_cnt_reg[0]_i_2_n_13 ;
  wire \sync0_cnt_reg[0]_i_2_n_14 ;
  wire \sync0_cnt_reg[0]_i_2_n_15 ;
  wire \sync0_cnt_reg[0]_i_2_n_2 ;
  wire \sync0_cnt_reg[0]_i_2_n_3 ;
  wire \sync0_cnt_reg[0]_i_2_n_4 ;
  wire \sync0_cnt_reg[0]_i_2_n_5 ;
  wire \sync0_cnt_reg[0]_i_2_n_6 ;
  wire \sync0_cnt_reg[0]_i_2_n_7 ;
  wire \sync0_cnt_reg[0]_i_2_n_8 ;
  wire \sync0_cnt_reg[0]_i_2_n_9 ;
  wire \sync0_cnt_reg[16]_i_1_n_0 ;
  wire \sync0_cnt_reg[16]_i_1_n_1 ;
  wire \sync0_cnt_reg[16]_i_1_n_10 ;
  wire \sync0_cnt_reg[16]_i_1_n_11 ;
  wire \sync0_cnt_reg[16]_i_1_n_12 ;
  wire \sync0_cnt_reg[16]_i_1_n_13 ;
  wire \sync0_cnt_reg[16]_i_1_n_14 ;
  wire \sync0_cnt_reg[16]_i_1_n_15 ;
  wire \sync0_cnt_reg[16]_i_1_n_2 ;
  wire \sync0_cnt_reg[16]_i_1_n_3 ;
  wire \sync0_cnt_reg[16]_i_1_n_4 ;
  wire \sync0_cnt_reg[16]_i_1_n_5 ;
  wire \sync0_cnt_reg[16]_i_1_n_6 ;
  wire \sync0_cnt_reg[16]_i_1_n_7 ;
  wire \sync0_cnt_reg[16]_i_1_n_8 ;
  wire \sync0_cnt_reg[16]_i_1_n_9 ;
  wire \sync0_cnt_reg[24]_i_1_n_1 ;
  wire \sync0_cnt_reg[24]_i_1_n_10 ;
  wire \sync0_cnt_reg[24]_i_1_n_11 ;
  wire \sync0_cnt_reg[24]_i_1_n_12 ;
  wire \sync0_cnt_reg[24]_i_1_n_13 ;
  wire \sync0_cnt_reg[24]_i_1_n_14 ;
  wire \sync0_cnt_reg[24]_i_1_n_15 ;
  wire \sync0_cnt_reg[24]_i_1_n_2 ;
  wire \sync0_cnt_reg[24]_i_1_n_3 ;
  wire \sync0_cnt_reg[24]_i_1_n_4 ;
  wire \sync0_cnt_reg[24]_i_1_n_5 ;
  wire \sync0_cnt_reg[24]_i_1_n_6 ;
  wire \sync0_cnt_reg[24]_i_1_n_7 ;
  wire \sync0_cnt_reg[24]_i_1_n_8 ;
  wire \sync0_cnt_reg[24]_i_1_n_9 ;
  wire \sync0_cnt_reg[8]_i_1_n_0 ;
  wire \sync0_cnt_reg[8]_i_1_n_1 ;
  wire \sync0_cnt_reg[8]_i_1_n_10 ;
  wire \sync0_cnt_reg[8]_i_1_n_11 ;
  wire \sync0_cnt_reg[8]_i_1_n_12 ;
  wire \sync0_cnt_reg[8]_i_1_n_13 ;
  wire \sync0_cnt_reg[8]_i_1_n_14 ;
  wire \sync0_cnt_reg[8]_i_1_n_15 ;
  wire \sync0_cnt_reg[8]_i_1_n_2 ;
  wire \sync0_cnt_reg[8]_i_1_n_3 ;
  wire \sync0_cnt_reg[8]_i_1_n_4 ;
  wire \sync0_cnt_reg[8]_i_1_n_5 ;
  wire \sync0_cnt_reg[8]_i_1_n_6 ;
  wire \sync0_cnt_reg[8]_i_1_n_7 ;
  wire \sync0_cnt_reg[8]_i_1_n_8 ;
  wire \sync0_cnt_reg[8]_i_1_n_9 ;
  wire sync0_in;
  wire sync0_int;
  wire sync0_req_i_1_n_0;
  wire sync0_rise;
  wire sync0_sync0;
  wire sync0_sync1;
  wire sync0_sync1_d;
  wire \sync1_cnt[0]_i_3_n_0 ;
  wire [31:0]sync1_cnt_reg;
  wire \sync1_cnt_reg[0]_i_2_n_0 ;
  wire \sync1_cnt_reg[0]_i_2_n_1 ;
  wire \sync1_cnt_reg[0]_i_2_n_10 ;
  wire \sync1_cnt_reg[0]_i_2_n_11 ;
  wire \sync1_cnt_reg[0]_i_2_n_12 ;
  wire \sync1_cnt_reg[0]_i_2_n_13 ;
  wire \sync1_cnt_reg[0]_i_2_n_14 ;
  wire \sync1_cnt_reg[0]_i_2_n_15 ;
  wire \sync1_cnt_reg[0]_i_2_n_2 ;
  wire \sync1_cnt_reg[0]_i_2_n_3 ;
  wire \sync1_cnt_reg[0]_i_2_n_4 ;
  wire \sync1_cnt_reg[0]_i_2_n_5 ;
  wire \sync1_cnt_reg[0]_i_2_n_6 ;
  wire \sync1_cnt_reg[0]_i_2_n_7 ;
  wire \sync1_cnt_reg[0]_i_2_n_8 ;
  wire \sync1_cnt_reg[0]_i_2_n_9 ;
  wire \sync1_cnt_reg[16]_i_1_n_0 ;
  wire \sync1_cnt_reg[16]_i_1_n_1 ;
  wire \sync1_cnt_reg[16]_i_1_n_10 ;
  wire \sync1_cnt_reg[16]_i_1_n_11 ;
  wire \sync1_cnt_reg[16]_i_1_n_12 ;
  wire \sync1_cnt_reg[16]_i_1_n_13 ;
  wire \sync1_cnt_reg[16]_i_1_n_14 ;
  wire \sync1_cnt_reg[16]_i_1_n_15 ;
  wire \sync1_cnt_reg[16]_i_1_n_2 ;
  wire \sync1_cnt_reg[16]_i_1_n_3 ;
  wire \sync1_cnt_reg[16]_i_1_n_4 ;
  wire \sync1_cnt_reg[16]_i_1_n_5 ;
  wire \sync1_cnt_reg[16]_i_1_n_6 ;
  wire \sync1_cnt_reg[16]_i_1_n_7 ;
  wire \sync1_cnt_reg[16]_i_1_n_8 ;
  wire \sync1_cnt_reg[16]_i_1_n_9 ;
  wire \sync1_cnt_reg[24]_i_1_n_1 ;
  wire \sync1_cnt_reg[24]_i_1_n_10 ;
  wire \sync1_cnt_reg[24]_i_1_n_11 ;
  wire \sync1_cnt_reg[24]_i_1_n_12 ;
  wire \sync1_cnt_reg[24]_i_1_n_13 ;
  wire \sync1_cnt_reg[24]_i_1_n_14 ;
  wire \sync1_cnt_reg[24]_i_1_n_15 ;
  wire \sync1_cnt_reg[24]_i_1_n_2 ;
  wire \sync1_cnt_reg[24]_i_1_n_3 ;
  wire \sync1_cnt_reg[24]_i_1_n_4 ;
  wire \sync1_cnt_reg[24]_i_1_n_5 ;
  wire \sync1_cnt_reg[24]_i_1_n_6 ;
  wire \sync1_cnt_reg[24]_i_1_n_7 ;
  wire \sync1_cnt_reg[24]_i_1_n_8 ;
  wire \sync1_cnt_reg[24]_i_1_n_9 ;
  wire \sync1_cnt_reg[8]_i_1_n_0 ;
  wire \sync1_cnt_reg[8]_i_1_n_1 ;
  wire \sync1_cnt_reg[8]_i_1_n_10 ;
  wire \sync1_cnt_reg[8]_i_1_n_11 ;
  wire \sync1_cnt_reg[8]_i_1_n_12 ;
  wire \sync1_cnt_reg[8]_i_1_n_13 ;
  wire \sync1_cnt_reg[8]_i_1_n_14 ;
  wire \sync1_cnt_reg[8]_i_1_n_15 ;
  wire \sync1_cnt_reg[8]_i_1_n_2 ;
  wire \sync1_cnt_reg[8]_i_1_n_3 ;
  wire \sync1_cnt_reg[8]_i_1_n_4 ;
  wire \sync1_cnt_reg[8]_i_1_n_5 ;
  wire \sync1_cnt_reg[8]_i_1_n_6 ;
  wire \sync1_cnt_reg[8]_i_1_n_7 ;
  wire \sync1_cnt_reg[8]_i_1_n_8 ;
  wire \sync1_cnt_reg[8]_i_1_n_9 ;
  wire sync1_in;
  wire sync1_int;
  wire sync1_req_i_1_n_0;
  wire sync1_rise;
  wire sync1_sync0;
  wire sync1_sync1;
  wire sync1_sync1_d;
  wire [2:0]wr_addr__2;
  wire [7:7]\NLW_free_cnt_reg[24]_i_1_CO_UNCONNECTED ;
  wire [7:7]\NLW_irq_cnt_reg[24]_i_1_CO_UNCONNECTED ;
  wire [7:7]\NLW_sync0_cnt_reg[24]_i_1_CO_UNCONNECTED ;
  wire [7:7]\NLW_sync1_cnt_reg[24]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h4040404055FFFFFF)) 
    \FSM_sequential_state_read[0]_i_1 
       (.I0(state_read[0]),
        .I1(s00_axi_rready),
        .I2(axi_rvalid_reg_0),
        .I3(s00_axi_arvalid),
        .I4(axi_arready_reg_0),
        .I5(state_read[1]),
        .O(state_read__0[0]));
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_sequential_state_read[1]_i_1 
       (.I0(state_read[0]),
        .I1(state_read[1]),
        .O(\FSM_sequential_state_read[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000F0F0F80808080)) 
    \FSM_sequential_state_read[1]_i_2 
       (.I0(s00_axi_arvalid),
        .I1(axi_arready_reg_0),
        .I2(state_read[0]),
        .I3(s00_axi_rready),
        .I4(axi_rvalid_reg_0),
        .I5(state_read[1]),
        .O(state_read__0[1]));
  (* FSM_ENCODED_STATES = "Idle:00,Rdata:10,Raddr:01" *) 
  FDRE \FSM_sequential_state_read_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\FSM_sequential_state_read[1]_i_1_n_0 ),
        .D(state_read__0[0]),
        .Q(state_read[0]),
        .R(irq_req_i_1_n_0));
  (* FSM_ENCODED_STATES = "Idle:00,Rdata:10,Raddr:01" *) 
  FDRE \FSM_sequential_state_read_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\FSM_sequential_state_read[1]_i_1_n_0 ),
        .D(state_read__0[1]),
        .Q(state_read[1]),
        .R(irq_req_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0F00FF7F)) 
    \FSM_sequential_state_write[0]_i_1 
       (.I0(axi_awready_reg_0),
        .I1(s00_axi_awvalid),
        .I2(state_write[0]),
        .I3(s00_axi_wvalid),
        .I4(state_write[1]),
        .O(state_write__0[0]));
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_sequential_state_write[1]_i_1 
       (.I0(state_write[0]),
        .I1(state_write[1]),
        .O(\FSM_sequential_state_write[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h000F0080)) 
    \FSM_sequential_state_write[1]_i_2 
       (.I0(axi_awready_reg_0),
        .I1(s00_axi_awvalid),
        .I2(state_write[0]),
        .I3(s00_axi_wvalid),
        .I4(state_write[1]),
        .O(state_write__0[1]));
  (* FSM_ENCODED_STATES = "Idle:00,Wdata:10,Waddr:01" *) 
  FDRE \FSM_sequential_state_write_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\FSM_sequential_state_write[1]_i_1_n_0 ),
        .D(state_write__0[0]),
        .Q(state_write[0]),
        .R(irq_req_i_1_n_0));
  (* FSM_ENCODED_STATES = "Idle:00,Wdata:10,Waddr:01" *) 
  FDRE \FSM_sequential_state_write_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\FSM_sequential_state_write[1]_i_1_n_0 ),
        .D(state_write__0[1]),
        .Q(state_write[1]),
        .R(irq_req_i_1_n_0));
  LUT5 #(
    .INIT(32'h08000000)) 
    \axi_araddr[4]_i_1 
       (.I0(s00_axi_aresetn),
        .I1(state_read[0]),
        .I2(state_read[1]),
        .I3(axi_arready_reg_0),
        .I4(s00_axi_arvalid),
        .O(\axi_araddr[4]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\axi_araddr[4]_i_1_n_0 ),
        .D(s00_axi_araddr[0]),
        .Q(sel0[0]),
        .R(1'b0));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\axi_araddr[4]_i_1_n_0 ),
        .D(s00_axi_araddr[1]),
        .Q(sel0[1]),
        .R(1'b0));
  FDRE \axi_araddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\axi_araddr[4]_i_1_n_0 ),
        .D(s00_axi_araddr[2]),
        .Q(sel0[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hCFCCCCCC4F4F4F4F)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(axi_arready_reg_0),
        .I2(state_read[0]),
        .I3(s00_axi_rready),
        .I4(axi_rvalid_reg_0),
        .I5(state_read[1]),
        .O(axi_arready_i_1_n_0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready_i_1_n_0),
        .Q(axi_arready_reg_0),
        .R(irq_req_i_1_n_0));
  LUT4 #(
    .INIT(16'h4000)) 
    \axi_awaddr[4]_i_1 
       (.I0(state_write[1]),
        .I1(s00_axi_awvalid),
        .I2(axi_awready_reg_0),
        .I3(state_write[0]),
        .O(axi_awaddr));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(axi_awaddr),
        .D(s00_axi_awaddr[0]),
        .Q(\axi_awaddr_reg_n_0_[2] ),
        .R(irq_req_i_1_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(axi_awaddr),
        .D(s00_axi_awaddr[1]),
        .Q(\axi_awaddr_reg_n_0_[3] ),
        .R(irq_req_i_1_n_0));
  FDRE \axi_awaddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(axi_awaddr),
        .D(s00_axi_awaddr[2]),
        .Q(\axi_awaddr_reg_n_0_[4] ),
        .R(irq_req_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hCFCCCF4F)) 
    axi_awready_i_1
       (.I0(s00_axi_awvalid),
        .I1(axi_awready_reg_0),
        .I2(state_write[0]),
        .I3(s00_axi_wvalid),
        .I4(state_write[1]),
        .O(axi_awready_i_1_n_0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready_i_1_n_0),
        .Q(axi_awready_reg_0),
        .R(irq_req_i_1_n_0));
  LUT6 #(
    .INIT(64'hAAF2AA22F2AAF2AA)) 
    axi_bvalid_i_1
       (.I0(s00_axi_bvalid),
        .I1(s00_axi_bready),
        .I2(s00_axi_wvalid),
        .I3(state_write[1]),
        .I4(axi_awready0__0),
        .I5(state_write[0]),
        .O(axi_bvalid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    axi_bvalid_i_2
       (.I0(s00_axi_awvalid),
        .I1(axi_awready_reg_0),
        .O(axi_awready0__0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(irq_req_i_1_n_0));
  LUT6 #(
    .INIT(64'hF0F0F8F800F0F0F0)) 
    axi_rvalid_i_1
       (.I0(axi_arready_reg_0),
        .I1(s00_axi_arvalid),
        .I2(axi_rvalid_reg_0),
        .I3(s00_axi_rready),
        .I4(state_read[1]),
        .I5(state_read[0]),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(axi_rvalid_reg_0),
        .R(irq_req_i_1_n_0));
  LUT3 #(
    .INIT(8'hF1)) 
    axi_wready_i_1
       (.I0(state_write[1]),
        .I1(state_write[0]),
        .I2(s00_axi_wready),
        .O(axi_wready_i_1_n_0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready_i_1_n_0),
        .Q(s00_axi_wready),
        .R(irq_req_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \free_cnt[0]_i_2 
       (.I0(free_cnt_reg[0]),
        .O(\free_cnt[0]_i_2_n_0 ));
  FDRE \free_cnt_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[0]_i_1_n_15 ),
        .Q(free_cnt_reg[0]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \free_cnt_reg[0]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\free_cnt_reg[0]_i_1_n_0 ,\free_cnt_reg[0]_i_1_n_1 ,\free_cnt_reg[0]_i_1_n_2 ,\free_cnt_reg[0]_i_1_n_3 ,\free_cnt_reg[0]_i_1_n_4 ,\free_cnt_reg[0]_i_1_n_5 ,\free_cnt_reg[0]_i_1_n_6 ,\free_cnt_reg[0]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\free_cnt_reg[0]_i_1_n_8 ,\free_cnt_reg[0]_i_1_n_9 ,\free_cnt_reg[0]_i_1_n_10 ,\free_cnt_reg[0]_i_1_n_11 ,\free_cnt_reg[0]_i_1_n_12 ,\free_cnt_reg[0]_i_1_n_13 ,\free_cnt_reg[0]_i_1_n_14 ,\free_cnt_reg[0]_i_1_n_15 }),
        .S({free_cnt_reg[7:1],\free_cnt[0]_i_2_n_0 }));
  FDRE \free_cnt_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[8]_i_1_n_13 ),
        .Q(free_cnt_reg[10]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[8]_i_1_n_12 ),
        .Q(free_cnt_reg[11]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[8]_i_1_n_11 ),
        .Q(free_cnt_reg[12]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[8]_i_1_n_10 ),
        .Q(free_cnt_reg[13]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[8]_i_1_n_9 ),
        .Q(free_cnt_reg[14]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[8]_i_1_n_8 ),
        .Q(free_cnt_reg[15]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[16]_i_1_n_15 ),
        .Q(free_cnt_reg[16]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \free_cnt_reg[16]_i_1 
       (.CI(\free_cnt_reg[8]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\free_cnt_reg[16]_i_1_n_0 ,\free_cnt_reg[16]_i_1_n_1 ,\free_cnt_reg[16]_i_1_n_2 ,\free_cnt_reg[16]_i_1_n_3 ,\free_cnt_reg[16]_i_1_n_4 ,\free_cnt_reg[16]_i_1_n_5 ,\free_cnt_reg[16]_i_1_n_6 ,\free_cnt_reg[16]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\free_cnt_reg[16]_i_1_n_8 ,\free_cnt_reg[16]_i_1_n_9 ,\free_cnt_reg[16]_i_1_n_10 ,\free_cnt_reg[16]_i_1_n_11 ,\free_cnt_reg[16]_i_1_n_12 ,\free_cnt_reg[16]_i_1_n_13 ,\free_cnt_reg[16]_i_1_n_14 ,\free_cnt_reg[16]_i_1_n_15 }),
        .S(free_cnt_reg[23:16]));
  FDRE \free_cnt_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[16]_i_1_n_14 ),
        .Q(free_cnt_reg[17]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[16]_i_1_n_13 ),
        .Q(free_cnt_reg[18]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[16]_i_1_n_12 ),
        .Q(free_cnt_reg[19]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[0]_i_1_n_14 ),
        .Q(free_cnt_reg[1]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[16]_i_1_n_11 ),
        .Q(free_cnt_reg[20]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[16]_i_1_n_10 ),
        .Q(free_cnt_reg[21]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[16]_i_1_n_9 ),
        .Q(free_cnt_reg[22]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[16]_i_1_n_8 ),
        .Q(free_cnt_reg[23]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[24]_i_1_n_15 ),
        .Q(free_cnt_reg[24]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \free_cnt_reg[24]_i_1 
       (.CI(\free_cnt_reg[16]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_free_cnt_reg[24]_i_1_CO_UNCONNECTED [7],\free_cnt_reg[24]_i_1_n_1 ,\free_cnt_reg[24]_i_1_n_2 ,\free_cnt_reg[24]_i_1_n_3 ,\free_cnt_reg[24]_i_1_n_4 ,\free_cnt_reg[24]_i_1_n_5 ,\free_cnt_reg[24]_i_1_n_6 ,\free_cnt_reg[24]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\free_cnt_reg[24]_i_1_n_8 ,\free_cnt_reg[24]_i_1_n_9 ,\free_cnt_reg[24]_i_1_n_10 ,\free_cnt_reg[24]_i_1_n_11 ,\free_cnt_reg[24]_i_1_n_12 ,\free_cnt_reg[24]_i_1_n_13 ,\free_cnt_reg[24]_i_1_n_14 ,\free_cnt_reg[24]_i_1_n_15 }),
        .S(free_cnt_reg[31:24]));
  FDRE \free_cnt_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[24]_i_1_n_14 ),
        .Q(free_cnt_reg[25]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[24]_i_1_n_13 ),
        .Q(free_cnt_reg[26]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[27] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[24]_i_1_n_12 ),
        .Q(free_cnt_reg[27]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[24]_i_1_n_11 ),
        .Q(free_cnt_reg[28]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[24]_i_1_n_10 ),
        .Q(free_cnt_reg[29]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[0]_i_1_n_13 ),
        .Q(free_cnt_reg[2]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[24]_i_1_n_9 ),
        .Q(free_cnt_reg[30]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[24]_i_1_n_8 ),
        .Q(free_cnt_reg[31]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[0]_i_1_n_12 ),
        .Q(free_cnt_reg[3]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[0]_i_1_n_11 ),
        .Q(free_cnt_reg[4]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[0]_i_1_n_10 ),
        .Q(free_cnt_reg[5]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[0]_i_1_n_9 ),
        .Q(free_cnt_reg[6]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[0]_i_1_n_8 ),
        .Q(free_cnt_reg[7]),
        .R(irq_req_i_1_n_0));
  FDRE \free_cnt_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[8]_i_1_n_15 ),
        .Q(free_cnt_reg[8]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \free_cnt_reg[8]_i_1 
       (.CI(\free_cnt_reg[0]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\free_cnt_reg[8]_i_1_n_0 ,\free_cnt_reg[8]_i_1_n_1 ,\free_cnt_reg[8]_i_1_n_2 ,\free_cnt_reg[8]_i_1_n_3 ,\free_cnt_reg[8]_i_1_n_4 ,\free_cnt_reg[8]_i_1_n_5 ,\free_cnt_reg[8]_i_1_n_6 ,\free_cnt_reg[8]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\free_cnt_reg[8]_i_1_n_8 ,\free_cnt_reg[8]_i_1_n_9 ,\free_cnt_reg[8]_i_1_n_10 ,\free_cnt_reg[8]_i_1_n_11 ,\free_cnt_reg[8]_i_1_n_12 ,\free_cnt_reg[8]_i_1_n_13 ,\free_cnt_reg[8]_i_1_n_14 ,\free_cnt_reg[8]_i_1_n_15 }),
        .S(free_cnt_reg[15:8]));
  FDRE \free_cnt_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\free_cnt_reg[8]_i_1_n_14 ),
        .Q(free_cnt_reg[9]),
        .R(irq_req_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \irq_cnt[0]_i_1 
       (.I0(irq_sync1),
        .I1(irq_sync1_d),
        .O(irq_rise));
  LUT1 #(
    .INIT(2'h1)) 
    \irq_cnt[0]_i_3 
       (.I0(irq_cnt_reg[0]),
        .O(\irq_cnt[0]_i_3_n_0 ));
  FDRE \irq_cnt_reg[0] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[0]_i_2_n_15 ),
        .Q(irq_cnt_reg[0]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \irq_cnt_reg[0]_i_2 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\irq_cnt_reg[0]_i_2_n_0 ,\irq_cnt_reg[0]_i_2_n_1 ,\irq_cnt_reg[0]_i_2_n_2 ,\irq_cnt_reg[0]_i_2_n_3 ,\irq_cnt_reg[0]_i_2_n_4 ,\irq_cnt_reg[0]_i_2_n_5 ,\irq_cnt_reg[0]_i_2_n_6 ,\irq_cnt_reg[0]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\irq_cnt_reg[0]_i_2_n_8 ,\irq_cnt_reg[0]_i_2_n_9 ,\irq_cnt_reg[0]_i_2_n_10 ,\irq_cnt_reg[0]_i_2_n_11 ,\irq_cnt_reg[0]_i_2_n_12 ,\irq_cnt_reg[0]_i_2_n_13 ,\irq_cnt_reg[0]_i_2_n_14 ,\irq_cnt_reg[0]_i_2_n_15 }),
        .S({irq_cnt_reg[7:1],\irq_cnt[0]_i_3_n_0 }));
  FDRE \irq_cnt_reg[10] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[8]_i_1_n_13 ),
        .Q(irq_cnt_reg[10]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[11] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[8]_i_1_n_12 ),
        .Q(irq_cnt_reg[11]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[12] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[8]_i_1_n_11 ),
        .Q(irq_cnt_reg[12]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[13] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[8]_i_1_n_10 ),
        .Q(irq_cnt_reg[13]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[14] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[8]_i_1_n_9 ),
        .Q(irq_cnt_reg[14]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[15] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[8]_i_1_n_8 ),
        .Q(irq_cnt_reg[15]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[16] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[16]_i_1_n_15 ),
        .Q(irq_cnt_reg[16]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \irq_cnt_reg[16]_i_1 
       (.CI(\irq_cnt_reg[8]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\irq_cnt_reg[16]_i_1_n_0 ,\irq_cnt_reg[16]_i_1_n_1 ,\irq_cnt_reg[16]_i_1_n_2 ,\irq_cnt_reg[16]_i_1_n_3 ,\irq_cnt_reg[16]_i_1_n_4 ,\irq_cnt_reg[16]_i_1_n_5 ,\irq_cnt_reg[16]_i_1_n_6 ,\irq_cnt_reg[16]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\irq_cnt_reg[16]_i_1_n_8 ,\irq_cnt_reg[16]_i_1_n_9 ,\irq_cnt_reg[16]_i_1_n_10 ,\irq_cnt_reg[16]_i_1_n_11 ,\irq_cnt_reg[16]_i_1_n_12 ,\irq_cnt_reg[16]_i_1_n_13 ,\irq_cnt_reg[16]_i_1_n_14 ,\irq_cnt_reg[16]_i_1_n_15 }),
        .S(irq_cnt_reg[23:16]));
  FDRE \irq_cnt_reg[17] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[16]_i_1_n_14 ),
        .Q(irq_cnt_reg[17]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[18] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[16]_i_1_n_13 ),
        .Q(irq_cnt_reg[18]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[19] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[16]_i_1_n_12 ),
        .Q(irq_cnt_reg[19]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[1] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[0]_i_2_n_14 ),
        .Q(irq_cnt_reg[1]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[20] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[16]_i_1_n_11 ),
        .Q(irq_cnt_reg[20]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[21] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[16]_i_1_n_10 ),
        .Q(irq_cnt_reg[21]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[22] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[16]_i_1_n_9 ),
        .Q(irq_cnt_reg[22]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[23] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[16]_i_1_n_8 ),
        .Q(irq_cnt_reg[23]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[24] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[24]_i_1_n_15 ),
        .Q(irq_cnt_reg[24]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \irq_cnt_reg[24]_i_1 
       (.CI(\irq_cnt_reg[16]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_irq_cnt_reg[24]_i_1_CO_UNCONNECTED [7],\irq_cnt_reg[24]_i_1_n_1 ,\irq_cnt_reg[24]_i_1_n_2 ,\irq_cnt_reg[24]_i_1_n_3 ,\irq_cnt_reg[24]_i_1_n_4 ,\irq_cnt_reg[24]_i_1_n_5 ,\irq_cnt_reg[24]_i_1_n_6 ,\irq_cnt_reg[24]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\irq_cnt_reg[24]_i_1_n_8 ,\irq_cnt_reg[24]_i_1_n_9 ,\irq_cnt_reg[24]_i_1_n_10 ,\irq_cnt_reg[24]_i_1_n_11 ,\irq_cnt_reg[24]_i_1_n_12 ,\irq_cnt_reg[24]_i_1_n_13 ,\irq_cnt_reg[24]_i_1_n_14 ,\irq_cnt_reg[24]_i_1_n_15 }),
        .S(irq_cnt_reg[31:24]));
  FDRE \irq_cnt_reg[25] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[24]_i_1_n_14 ),
        .Q(irq_cnt_reg[25]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[26] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[24]_i_1_n_13 ),
        .Q(irq_cnt_reg[26]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[27] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[24]_i_1_n_12 ),
        .Q(irq_cnt_reg[27]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[28] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[24]_i_1_n_11 ),
        .Q(irq_cnt_reg[28]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[29] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[24]_i_1_n_10 ),
        .Q(irq_cnt_reg[29]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[2] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[0]_i_2_n_13 ),
        .Q(irq_cnt_reg[2]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[30] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[24]_i_1_n_9 ),
        .Q(irq_cnt_reg[30]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[31] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[24]_i_1_n_8 ),
        .Q(irq_cnt_reg[31]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[3] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[0]_i_2_n_12 ),
        .Q(irq_cnt_reg[3]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[4] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[0]_i_2_n_11 ),
        .Q(irq_cnt_reg[4]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[5] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[0]_i_2_n_10 ),
        .Q(irq_cnt_reg[5]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[6] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[0]_i_2_n_9 ),
        .Q(irq_cnt_reg[6]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[7] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[0]_i_2_n_8 ),
        .Q(irq_cnt_reg[7]),
        .R(irq_req_i_1_n_0));
  FDRE \irq_cnt_reg[8] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[8]_i_1_n_15 ),
        .Q(irq_cnt_reg[8]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \irq_cnt_reg[8]_i_1 
       (.CI(\irq_cnt_reg[0]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\irq_cnt_reg[8]_i_1_n_0 ,\irq_cnt_reg[8]_i_1_n_1 ,\irq_cnt_reg[8]_i_1_n_2 ,\irq_cnt_reg[8]_i_1_n_3 ,\irq_cnt_reg[8]_i_1_n_4 ,\irq_cnt_reg[8]_i_1_n_5 ,\irq_cnt_reg[8]_i_1_n_6 ,\irq_cnt_reg[8]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\irq_cnt_reg[8]_i_1_n_8 ,\irq_cnt_reg[8]_i_1_n_9 ,\irq_cnt_reg[8]_i_1_n_10 ,\irq_cnt_reg[8]_i_1_n_11 ,\irq_cnt_reg[8]_i_1_n_12 ,\irq_cnt_reg[8]_i_1_n_13 ,\irq_cnt_reg[8]_i_1_n_14 ,\irq_cnt_reg[8]_i_1_n_15 }),
        .S(irq_cnt_reg[15:8]));
  FDRE \irq_cnt_reg[9] 
       (.C(s00_axi_aclk),
        .CE(irq_rise),
        .D(\irq_cnt_reg[8]_i_1_n_14 ),
        .Q(irq_cnt_reg[9]),
        .R(irq_req_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    irq_req_i_1
       (.I0(s00_axi_aresetn),
        .O(irq_req_i_1_n_0));
  LUT6 #(
    .INIT(64'hBFFFFFFFAAAAAAAA)) 
    irq_req_i_2
       (.I0(irq_rise),
        .I1(s00_axi_wdata[0]),
        .I2(wr_addr__2[0]),
        .I3(wr_addr__2[1]),
        .I4(irq_req_i_5_n_0),
        .I5(irq_int),
        .O(irq_req_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    irq_req_i_3
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_awvalid),
        .I2(\axi_awaddr_reg_n_0_[2] ),
        .O(wr_addr__2[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    irq_req_i_4
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_awvalid),
        .I2(\axi_awaddr_reg_n_0_[3] ),
        .O(wr_addr__2[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hA808)) 
    irq_req_i_5
       (.I0(s00_axi_wvalid),
        .I1(\axi_awaddr_reg_n_0_[4] ),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_awaddr[2]),
        .O(irq_req_i_5_n_0));
  FDRE irq_req_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(irq_req_i_2_n_0),
        .Q(irq_int),
        .R(irq_req_i_1_n_0));
  FDRE irq_sync0_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(irq_in),
        .Q(irq_sync0),
        .R(irq_req_i_1_n_0));
  FDRE irq_sync1_d_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(irq_sync1),
        .Q(irq_sync1_d),
        .R(irq_req_i_1_n_0));
  FDRE irq_sync1_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(irq_sync0),
        .Q(irq_sync1),
        .R(irq_req_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    rst_out_INST_0
       (.I0(\slv_reg6_reg_n_0_[0] ),
        .O(rst_out));
  MUXF7 \s00_axi_rdata[0]_INST_0 
       (.I0(\s00_axi_rdata[0]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[0]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[0]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[0]_INST_0_i_1 
       (.I0(slv_reg1[0]),
        .I1(irq_cnt_reg[0]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[0]),
        .I5(free_cnt_reg[0]),
        .O(\s00_axi_rdata[0]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[0]_INST_0_i_2 
       (.I0(sync1_cnt_reg[0]),
        .I1(irq_int),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(sync0_cnt_reg[0]),
        .I5(\slv_reg6_reg_n_0_[0] ),
        .O(\s00_axi_rdata[0]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[10]_INST_0 
       (.I0(\s00_axi_rdata[10]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[10]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[10]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[10]_INST_0_i_1 
       (.I0(slv_reg1[10]),
        .I1(irq_cnt_reg[10]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[10]),
        .I5(free_cnt_reg[10]),
        .O(\s00_axi_rdata[10]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[10]_INST_0_i_2 
       (.I0(sync0_cnt_reg[10]),
        .I1(\slv_reg6_reg_n_0_[10] ),
        .I2(sync1_cnt_reg[10]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[10]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[11]_INST_0 
       (.I0(\s00_axi_rdata[11]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[11]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[11]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[11]_INST_0_i_1 
       (.I0(slv_reg1[11]),
        .I1(irq_cnt_reg[11]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[11]),
        .I5(free_cnt_reg[11]),
        .O(\s00_axi_rdata[11]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[11]_INST_0_i_2 
       (.I0(sync0_cnt_reg[11]),
        .I1(\slv_reg6_reg_n_0_[11] ),
        .I2(sync1_cnt_reg[11]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[11]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[12]_INST_0 
       (.I0(\s00_axi_rdata[12]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[12]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[12]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[12]_INST_0_i_1 
       (.I0(slv_reg1[12]),
        .I1(irq_cnt_reg[12]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[12]),
        .I5(free_cnt_reg[12]),
        .O(\s00_axi_rdata[12]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[12]_INST_0_i_2 
       (.I0(sync0_cnt_reg[12]),
        .I1(\slv_reg6_reg_n_0_[12] ),
        .I2(sync1_cnt_reg[12]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[12]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[13]_INST_0 
       (.I0(\s00_axi_rdata[13]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[13]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[13]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[13]_INST_0_i_1 
       (.I0(slv_reg1[13]),
        .I1(irq_cnt_reg[13]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[13]),
        .I5(free_cnt_reg[13]),
        .O(\s00_axi_rdata[13]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[13]_INST_0_i_2 
       (.I0(sync0_cnt_reg[13]),
        .I1(\slv_reg6_reg_n_0_[13] ),
        .I2(sync1_cnt_reg[13]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[13]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[14]_INST_0 
       (.I0(\s00_axi_rdata[14]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[14]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[14]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[14]_INST_0_i_1 
       (.I0(slv_reg1[14]),
        .I1(irq_cnt_reg[14]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[14]),
        .I5(free_cnt_reg[14]),
        .O(\s00_axi_rdata[14]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[14]_INST_0_i_2 
       (.I0(sync0_cnt_reg[14]),
        .I1(\slv_reg6_reg_n_0_[14] ),
        .I2(sync1_cnt_reg[14]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[14]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[15]_INST_0 
       (.I0(\s00_axi_rdata[15]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[15]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[15]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[15]_INST_0_i_1 
       (.I0(slv_reg1[15]),
        .I1(irq_cnt_reg[15]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[15]),
        .I5(free_cnt_reg[15]),
        .O(\s00_axi_rdata[15]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[15]_INST_0_i_2 
       (.I0(sync0_cnt_reg[15]),
        .I1(\slv_reg6_reg_n_0_[15] ),
        .I2(sync1_cnt_reg[15]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[15]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[16]_INST_0 
       (.I0(\s00_axi_rdata[16]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[16]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[16]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[16]_INST_0_i_1 
       (.I0(slv_reg1[16]),
        .I1(irq_cnt_reg[16]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[16]),
        .I5(free_cnt_reg[16]),
        .O(\s00_axi_rdata[16]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[16]_INST_0_i_2 
       (.I0(sync0_cnt_reg[16]),
        .I1(\slv_reg6_reg_n_0_[16] ),
        .I2(sync1_cnt_reg[16]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[16]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[17]_INST_0 
       (.I0(\s00_axi_rdata[17]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[17]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[17]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[17]_INST_0_i_1 
       (.I0(slv_reg1[17]),
        .I1(irq_cnt_reg[17]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[17]),
        .I5(free_cnt_reg[17]),
        .O(\s00_axi_rdata[17]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[17]_INST_0_i_2 
       (.I0(sync0_cnt_reg[17]),
        .I1(\slv_reg6_reg_n_0_[17] ),
        .I2(sync1_cnt_reg[17]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[17]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[18]_INST_0 
       (.I0(\s00_axi_rdata[18]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[18]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[18]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[18]_INST_0_i_1 
       (.I0(slv_reg1[18]),
        .I1(irq_cnt_reg[18]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[18]),
        .I5(free_cnt_reg[18]),
        .O(\s00_axi_rdata[18]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[18]_INST_0_i_2 
       (.I0(sync0_cnt_reg[18]),
        .I1(\slv_reg6_reg_n_0_[18] ),
        .I2(sync1_cnt_reg[18]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[18]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[19]_INST_0 
       (.I0(\s00_axi_rdata[19]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[19]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[19]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[19]_INST_0_i_1 
       (.I0(slv_reg1[19]),
        .I1(irq_cnt_reg[19]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[19]),
        .I5(free_cnt_reg[19]),
        .O(\s00_axi_rdata[19]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[19]_INST_0_i_2 
       (.I0(sync0_cnt_reg[19]),
        .I1(\slv_reg6_reg_n_0_[19] ),
        .I2(sync1_cnt_reg[19]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[19]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[1]_INST_0 
       (.I0(\s00_axi_rdata[1]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[1]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[1]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[1]_INST_0_i_1 
       (.I0(slv_reg1[1]),
        .I1(irq_cnt_reg[1]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[1]),
        .I5(free_cnt_reg[1]),
        .O(\s00_axi_rdata[1]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[1]_INST_0_i_2 
       (.I0(sync1_cnt_reg[1]),
        .I1(sync0_int),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(sync0_cnt_reg[1]),
        .I5(\slv_reg6_reg_n_0_[1] ),
        .O(\s00_axi_rdata[1]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[20]_INST_0 
       (.I0(\s00_axi_rdata[20]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[20]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[20]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[20]_INST_0_i_1 
       (.I0(slv_reg1[20]),
        .I1(irq_cnt_reg[20]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[20]),
        .I5(free_cnt_reg[20]),
        .O(\s00_axi_rdata[20]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[20]_INST_0_i_2 
       (.I0(sync0_cnt_reg[20]),
        .I1(\slv_reg6_reg_n_0_[20] ),
        .I2(sync1_cnt_reg[20]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[20]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[21]_INST_0 
       (.I0(\s00_axi_rdata[21]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[21]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[21]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[21]_INST_0_i_1 
       (.I0(slv_reg1[21]),
        .I1(irq_cnt_reg[21]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[21]),
        .I5(free_cnt_reg[21]),
        .O(\s00_axi_rdata[21]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[21]_INST_0_i_2 
       (.I0(sync0_cnt_reg[21]),
        .I1(\slv_reg6_reg_n_0_[21] ),
        .I2(sync1_cnt_reg[21]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[21]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[22]_INST_0 
       (.I0(\s00_axi_rdata[22]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[22]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[22]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[22]_INST_0_i_1 
       (.I0(slv_reg1[22]),
        .I1(irq_cnt_reg[22]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[22]),
        .I5(free_cnt_reg[22]),
        .O(\s00_axi_rdata[22]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[22]_INST_0_i_2 
       (.I0(sync0_cnt_reg[22]),
        .I1(\slv_reg6_reg_n_0_[22] ),
        .I2(sync1_cnt_reg[22]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[22]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[23]_INST_0 
       (.I0(\s00_axi_rdata[23]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[23]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[23]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[23]_INST_0_i_1 
       (.I0(slv_reg1[23]),
        .I1(irq_cnt_reg[23]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[23]),
        .I5(free_cnt_reg[23]),
        .O(\s00_axi_rdata[23]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[23]_INST_0_i_2 
       (.I0(sync0_cnt_reg[23]),
        .I1(\slv_reg6_reg_n_0_[23] ),
        .I2(sync1_cnt_reg[23]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[23]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[24]_INST_0 
       (.I0(\s00_axi_rdata[24]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[24]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[24]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[24]_INST_0_i_1 
       (.I0(slv_reg1[24]),
        .I1(irq_cnt_reg[24]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[24]),
        .I5(free_cnt_reg[24]),
        .O(\s00_axi_rdata[24]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[24]_INST_0_i_2 
       (.I0(sync0_cnt_reg[24]),
        .I1(\slv_reg6_reg_n_0_[24] ),
        .I2(sync1_cnt_reg[24]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[24]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[25]_INST_0 
       (.I0(\s00_axi_rdata[25]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[25]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[25]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[25]_INST_0_i_1 
       (.I0(slv_reg1[25]),
        .I1(irq_cnt_reg[25]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[25]),
        .I5(free_cnt_reg[25]),
        .O(\s00_axi_rdata[25]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[25]_INST_0_i_2 
       (.I0(sync0_cnt_reg[25]),
        .I1(\slv_reg6_reg_n_0_[25] ),
        .I2(sync1_cnt_reg[25]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[25]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[26]_INST_0 
       (.I0(\s00_axi_rdata[26]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[26]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[26]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[26]_INST_0_i_1 
       (.I0(slv_reg1[26]),
        .I1(irq_cnt_reg[26]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[26]),
        .I5(free_cnt_reg[26]),
        .O(\s00_axi_rdata[26]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[26]_INST_0_i_2 
       (.I0(sync0_cnt_reg[26]),
        .I1(\slv_reg6_reg_n_0_[26] ),
        .I2(sync1_cnt_reg[26]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[26]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[27]_INST_0 
       (.I0(\s00_axi_rdata[27]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[27]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[27]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[27]_INST_0_i_1 
       (.I0(slv_reg1[27]),
        .I1(irq_cnt_reg[27]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[27]),
        .I5(free_cnt_reg[27]),
        .O(\s00_axi_rdata[27]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[27]_INST_0_i_2 
       (.I0(sync0_cnt_reg[27]),
        .I1(\slv_reg6_reg_n_0_[27] ),
        .I2(sync1_cnt_reg[27]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[27]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[28]_INST_0 
       (.I0(\s00_axi_rdata[28]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[28]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[28]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[28]_INST_0_i_1 
       (.I0(slv_reg1[28]),
        .I1(irq_cnt_reg[28]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[28]),
        .I5(free_cnt_reg[28]),
        .O(\s00_axi_rdata[28]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[28]_INST_0_i_2 
       (.I0(sync0_cnt_reg[28]),
        .I1(\slv_reg6_reg_n_0_[28] ),
        .I2(sync1_cnt_reg[28]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[28]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[29]_INST_0 
       (.I0(\s00_axi_rdata[29]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[29]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[29]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[29]_INST_0_i_1 
       (.I0(slv_reg1[29]),
        .I1(irq_cnt_reg[29]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[29]),
        .I5(free_cnt_reg[29]),
        .O(\s00_axi_rdata[29]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[29]_INST_0_i_2 
       (.I0(sync0_cnt_reg[29]),
        .I1(\slv_reg6_reg_n_0_[29] ),
        .I2(sync1_cnt_reg[29]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[29]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[2]_INST_0 
       (.I0(\s00_axi_rdata[2]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[2]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[2]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[2]_INST_0_i_1 
       (.I0(slv_reg1[2]),
        .I1(irq_cnt_reg[2]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[2]),
        .I5(free_cnt_reg[2]),
        .O(\s00_axi_rdata[2]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[2]_INST_0_i_2 
       (.I0(sync1_cnt_reg[2]),
        .I1(sync1_int),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(sync0_cnt_reg[2]),
        .I5(\slv_reg6_reg_n_0_[2] ),
        .O(\s00_axi_rdata[2]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[30]_INST_0 
       (.I0(\s00_axi_rdata[30]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[30]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[30]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[30]_INST_0_i_1 
       (.I0(slv_reg1[30]),
        .I1(irq_cnt_reg[30]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[30]),
        .I5(free_cnt_reg[30]),
        .O(\s00_axi_rdata[30]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[30]_INST_0_i_2 
       (.I0(sync0_cnt_reg[30]),
        .I1(\slv_reg6_reg_n_0_[30] ),
        .I2(sync1_cnt_reg[30]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[30]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[31]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[31]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[31]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[31]_INST_0_i_1 
       (.I0(slv_reg1[31]),
        .I1(irq_cnt_reg[31]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[31]),
        .I5(free_cnt_reg[31]),
        .O(\s00_axi_rdata[31]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[31]_INST_0_i_2 
       (.I0(sync0_cnt_reg[31]),
        .I1(\slv_reg6_reg_n_0_[31] ),
        .I2(sync1_cnt_reg[31]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[31]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[3]_INST_0 
       (.I0(\s00_axi_rdata[3]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[3]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[3]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[3]_INST_0_i_1 
       (.I0(slv_reg1[3]),
        .I1(irq_cnt_reg[3]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[3]),
        .I5(free_cnt_reg[3]),
        .O(\s00_axi_rdata[3]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[3]_INST_0_i_2 
       (.I0(sync0_cnt_reg[3]),
        .I1(\slv_reg6_reg_n_0_[3] ),
        .I2(sync1_cnt_reg[3]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[3]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[4]_INST_0 
       (.I0(\s00_axi_rdata[4]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[4]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[4]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[4]_INST_0_i_1 
       (.I0(slv_reg1[4]),
        .I1(irq_cnt_reg[4]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[4]),
        .I5(free_cnt_reg[4]),
        .O(\s00_axi_rdata[4]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[4]_INST_0_i_2 
       (.I0(sync0_cnt_reg[4]),
        .I1(\slv_reg6_reg_n_0_[4] ),
        .I2(sync1_cnt_reg[4]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[4]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[5]_INST_0 
       (.I0(\s00_axi_rdata[5]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[5]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[5]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[5]_INST_0_i_1 
       (.I0(slv_reg1[5]),
        .I1(irq_cnt_reg[5]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[5]),
        .I5(free_cnt_reg[5]),
        .O(\s00_axi_rdata[5]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[5]_INST_0_i_2 
       (.I0(sync0_cnt_reg[5]),
        .I1(\slv_reg6_reg_n_0_[5] ),
        .I2(sync1_cnt_reg[5]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[5]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[6]_INST_0 
       (.I0(\s00_axi_rdata[6]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[6]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[6]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[6]_INST_0_i_1 
       (.I0(slv_reg1[6]),
        .I1(irq_cnt_reg[6]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[6]),
        .I5(free_cnt_reg[6]),
        .O(\s00_axi_rdata[6]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[6]_INST_0_i_2 
       (.I0(sync0_cnt_reg[6]),
        .I1(\slv_reg6_reg_n_0_[6] ),
        .I2(sync1_cnt_reg[6]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[6]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[7]_INST_0 
       (.I0(\s00_axi_rdata[7]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[7]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[7]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[7]_INST_0_i_1 
       (.I0(slv_reg1[7]),
        .I1(irq_cnt_reg[7]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[7]),
        .I5(free_cnt_reg[7]),
        .O(\s00_axi_rdata[7]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[7]_INST_0_i_2 
       (.I0(sync0_cnt_reg[7]),
        .I1(\slv_reg6_reg_n_0_[7] ),
        .I2(sync1_cnt_reg[7]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[7]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[8]_INST_0 
       (.I0(\s00_axi_rdata[8]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[8]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[8]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[8]_INST_0_i_1 
       (.I0(slv_reg1[8]),
        .I1(irq_cnt_reg[8]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[8]),
        .I5(free_cnt_reg[8]),
        .O(\s00_axi_rdata[8]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[8]_INST_0_i_2 
       (.I0(sync0_cnt_reg[8]),
        .I1(\slv_reg6_reg_n_0_[8] ),
        .I2(sync1_cnt_reg[8]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[8]_INST_0_i_2_n_0 ));
  MUXF7 \s00_axi_rdata[9]_INST_0 
       (.I0(\s00_axi_rdata[9]_INST_0_i_1_n_0 ),
        .I1(\s00_axi_rdata[9]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[9]),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s00_axi_rdata[9]_INST_0_i_1 
       (.I0(slv_reg1[9]),
        .I1(irq_cnt_reg[9]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(slv_reg0[9]),
        .I5(free_cnt_reg[9]),
        .O(\s00_axi_rdata[9]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s00_axi_rdata[9]_INST_0_i_2 
       (.I0(sync0_cnt_reg[9]),
        .I1(\slv_reg6_reg_n_0_[9] ),
        .I2(sync1_cnt_reg[9]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\s00_axi_rdata[9]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    \slv_reg0[15]_i_1 
       (.I0(wr_addr__2[2]),
        .I1(s00_axi_wvalid),
        .I2(wr_addr__2[0]),
        .I3(wr_addr__2[1]),
        .I4(s00_axi_wstrb[1]),
        .O(\slv_reg0[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    \slv_reg0[23]_i_1 
       (.I0(wr_addr__2[2]),
        .I1(s00_axi_wvalid),
        .I2(wr_addr__2[0]),
        .I3(wr_addr__2[1]),
        .I4(s00_axi_wstrb[2]),
        .O(\slv_reg0[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    \slv_reg0[31]_i_1 
       (.I0(wr_addr__2[2]),
        .I1(s00_axi_wvalid),
        .I2(wr_addr__2[0]),
        .I3(wr_addr__2[1]),
        .I4(s00_axi_wstrb[3]),
        .O(\slv_reg0[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg0[31]_i_2 
       (.I0(s00_axi_awaddr[2]),
        .I1(s00_axi_awvalid),
        .I2(\axi_awaddr_reg_n_0_[4] ),
        .O(wr_addr__2[2]));
  LUT5 #(
    .INIT(32'h00040000)) 
    \slv_reg0[7]_i_1 
       (.I0(wr_addr__2[2]),
        .I1(s00_axi_wvalid),
        .I2(wr_addr__2[0]),
        .I3(wr_addr__2[1]),
        .I4(s00_axi_wstrb[0]),
        .O(\slv_reg0[7]_i_1_n_0 ));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg0[0]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg0[10]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg0[11]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg0[12]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg0[13]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg0[14]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg0[15]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg0[16]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg0[17]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg0[18]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg0[19]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg0[1]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg0[20]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg0[21]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg0[22]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg0[23]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg0[24]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg0[25]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg0[26]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg0[27]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg0[28]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg0[29]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg0[2]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg0[30]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg0[31]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg0[3]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg0[4]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg0[5]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg0[6]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg0[7]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg0[8]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg0[9]),
        .R(irq_req_i_1_n_0));
  LUT5 #(
    .INIT(32'h00080000)) 
    \slv_reg1[15]_i_1 
       (.I0(wr_addr__2[0]),
        .I1(s00_axi_wvalid),
        .I2(wr_addr__2[1]),
        .I3(wr_addr__2[2]),
        .I4(s00_axi_wstrb[1]),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00080000)) 
    \slv_reg1[23]_i_1 
       (.I0(wr_addr__2[0]),
        .I1(s00_axi_wvalid),
        .I2(wr_addr__2[1]),
        .I3(wr_addr__2[2]),
        .I4(s00_axi_wstrb[2]),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00080000)) 
    \slv_reg1[31]_i_1 
       (.I0(wr_addr__2[0]),
        .I1(s00_axi_wvalid),
        .I2(wr_addr__2[1]),
        .I3(wr_addr__2[2]),
        .I4(s00_axi_wstrb[3]),
        .O(\slv_reg1[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00080000)) 
    \slv_reg1[7]_i_1 
       (.I0(wr_addr__2[0]),
        .I1(s00_axi_wvalid),
        .I2(wr_addr__2[1]),
        .I3(wr_addr__2[2]),
        .I4(s00_axi_wstrb[0]),
        .O(\slv_reg1[7]_i_1_n_0 ));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg1[0]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg1[10]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg1[11]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg1[12]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg1[13]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg1[14]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg1[15]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg1[16]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg1[17]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg1[18]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg1[19]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg1[1]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg1[20]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg1[21]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg1[22]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg1[23]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg1[24]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg1[25]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg1[26]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg1[27]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg1[28]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg1[29]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg1[2]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg1[30]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg1[31]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg1[3]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg1[4]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg1[5]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg1[6]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg1[7]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg1[8]),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg1_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg1[9]),
        .R(irq_req_i_1_n_0));
  LUT6 #(
    .INIT(64'h1D00000000000000)) 
    \slv_reg6[15]_i_1 
       (.I0(\axi_awaddr_reg_n_0_[2] ),
        .I1(s00_axi_awvalid),
        .I2(s00_axi_awaddr[0]),
        .I3(wr_addr__2[1]),
        .I4(irq_req_i_5_n_0),
        .I5(s00_axi_wstrb[1]),
        .O(p_1_in[15]));
  LUT6 #(
    .INIT(64'h1D00000000000000)) 
    \slv_reg6[23]_i_1 
       (.I0(\axi_awaddr_reg_n_0_[2] ),
        .I1(s00_axi_awvalid),
        .I2(s00_axi_awaddr[0]),
        .I3(wr_addr__2[1]),
        .I4(irq_req_i_5_n_0),
        .I5(s00_axi_wstrb[2]),
        .O(p_1_in[23]));
  LUT6 #(
    .INIT(64'h1D00000000000000)) 
    \slv_reg6[31]_i_1 
       (.I0(\axi_awaddr_reg_n_0_[2] ),
        .I1(s00_axi_awvalid),
        .I2(s00_axi_awaddr[0]),
        .I3(wr_addr__2[1]),
        .I4(irq_req_i_5_n_0),
        .I5(s00_axi_wstrb[3]),
        .O(p_1_in[31]));
  LUT6 #(
    .INIT(64'h1D00000000000000)) 
    \slv_reg6[7]_i_1 
       (.I0(\axi_awaddr_reg_n_0_[2] ),
        .I1(s00_axi_awvalid),
        .I2(s00_axi_awaddr[0]),
        .I3(wr_addr__2[1]),
        .I4(irq_req_i_5_n_0),
        .I5(s00_axi_wstrb[0]),
        .O(p_1_in[0]));
  FDRE \slv_reg6_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[0]),
        .Q(\slv_reg6_reg_n_0_[0] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg6_reg_n_0_[10] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg6_reg_n_0_[11] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg6_reg_n_0_[12] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg6_reg_n_0_[13] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg6_reg_n_0_[14] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg6_reg_n_0_[15] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg6_reg_n_0_[16] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg6_reg_n_0_[17] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg6_reg_n_0_[18] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg6_reg_n_0_[19] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg6_reg_n_0_[1] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg6_reg_n_0_[20] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg6_reg_n_0_[21] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg6_reg_n_0_[22] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg6_reg_n_0_[23] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg6_reg_n_0_[24] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg6_reg_n_0_[25] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg6_reg_n_0_[26] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg6_reg_n_0_[27] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg6_reg_n_0_[28] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg6_reg_n_0_[29] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg6_reg_n_0_[2] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg6_reg_n_0_[30] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg6_reg_n_0_[31] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg6_reg_n_0_[3] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg6_reg_n_0_[4] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg6_reg_n_0_[5] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg6_reg_n_0_[6] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg6_reg_n_0_[7] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg6_reg_n_0_[8] ),
        .R(irq_req_i_1_n_0));
  FDRE \slv_reg6_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg6_reg_n_0_[9] ),
        .R(irq_req_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \sync0_cnt[0]_i_1 
       (.I0(sync0_sync1),
        .I1(sync0_sync1_d),
        .O(sync0_rise));
  LUT1 #(
    .INIT(2'h1)) 
    \sync0_cnt[0]_i_3 
       (.I0(sync0_cnt_reg[0]),
        .O(\sync0_cnt[0]_i_3_n_0 ));
  FDRE \sync0_cnt_reg[0] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[0]_i_2_n_15 ),
        .Q(sync0_cnt_reg[0]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sync0_cnt_reg[0]_i_2 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\sync0_cnt_reg[0]_i_2_n_0 ,\sync0_cnt_reg[0]_i_2_n_1 ,\sync0_cnt_reg[0]_i_2_n_2 ,\sync0_cnt_reg[0]_i_2_n_3 ,\sync0_cnt_reg[0]_i_2_n_4 ,\sync0_cnt_reg[0]_i_2_n_5 ,\sync0_cnt_reg[0]_i_2_n_6 ,\sync0_cnt_reg[0]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\sync0_cnt_reg[0]_i_2_n_8 ,\sync0_cnt_reg[0]_i_2_n_9 ,\sync0_cnt_reg[0]_i_2_n_10 ,\sync0_cnt_reg[0]_i_2_n_11 ,\sync0_cnt_reg[0]_i_2_n_12 ,\sync0_cnt_reg[0]_i_2_n_13 ,\sync0_cnt_reg[0]_i_2_n_14 ,\sync0_cnt_reg[0]_i_2_n_15 }),
        .S({sync0_cnt_reg[7:1],\sync0_cnt[0]_i_3_n_0 }));
  FDRE \sync0_cnt_reg[10] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[8]_i_1_n_13 ),
        .Q(sync0_cnt_reg[10]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[11] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[8]_i_1_n_12 ),
        .Q(sync0_cnt_reg[11]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[12] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[8]_i_1_n_11 ),
        .Q(sync0_cnt_reg[12]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[13] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[8]_i_1_n_10 ),
        .Q(sync0_cnt_reg[13]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[14] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[8]_i_1_n_9 ),
        .Q(sync0_cnt_reg[14]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[15] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[8]_i_1_n_8 ),
        .Q(sync0_cnt_reg[15]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[16] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[16]_i_1_n_15 ),
        .Q(sync0_cnt_reg[16]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sync0_cnt_reg[16]_i_1 
       (.CI(\sync0_cnt_reg[8]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\sync0_cnt_reg[16]_i_1_n_0 ,\sync0_cnt_reg[16]_i_1_n_1 ,\sync0_cnt_reg[16]_i_1_n_2 ,\sync0_cnt_reg[16]_i_1_n_3 ,\sync0_cnt_reg[16]_i_1_n_4 ,\sync0_cnt_reg[16]_i_1_n_5 ,\sync0_cnt_reg[16]_i_1_n_6 ,\sync0_cnt_reg[16]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\sync0_cnt_reg[16]_i_1_n_8 ,\sync0_cnt_reg[16]_i_1_n_9 ,\sync0_cnt_reg[16]_i_1_n_10 ,\sync0_cnt_reg[16]_i_1_n_11 ,\sync0_cnt_reg[16]_i_1_n_12 ,\sync0_cnt_reg[16]_i_1_n_13 ,\sync0_cnt_reg[16]_i_1_n_14 ,\sync0_cnt_reg[16]_i_1_n_15 }),
        .S(sync0_cnt_reg[23:16]));
  FDRE \sync0_cnt_reg[17] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[16]_i_1_n_14 ),
        .Q(sync0_cnt_reg[17]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[18] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[16]_i_1_n_13 ),
        .Q(sync0_cnt_reg[18]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[19] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[16]_i_1_n_12 ),
        .Q(sync0_cnt_reg[19]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[1] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[0]_i_2_n_14 ),
        .Q(sync0_cnt_reg[1]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[20] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[16]_i_1_n_11 ),
        .Q(sync0_cnt_reg[20]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[21] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[16]_i_1_n_10 ),
        .Q(sync0_cnt_reg[21]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[22] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[16]_i_1_n_9 ),
        .Q(sync0_cnt_reg[22]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[23] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[16]_i_1_n_8 ),
        .Q(sync0_cnt_reg[23]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[24] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[24]_i_1_n_15 ),
        .Q(sync0_cnt_reg[24]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sync0_cnt_reg[24]_i_1 
       (.CI(\sync0_cnt_reg[16]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_sync0_cnt_reg[24]_i_1_CO_UNCONNECTED [7],\sync0_cnt_reg[24]_i_1_n_1 ,\sync0_cnt_reg[24]_i_1_n_2 ,\sync0_cnt_reg[24]_i_1_n_3 ,\sync0_cnt_reg[24]_i_1_n_4 ,\sync0_cnt_reg[24]_i_1_n_5 ,\sync0_cnt_reg[24]_i_1_n_6 ,\sync0_cnt_reg[24]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\sync0_cnt_reg[24]_i_1_n_8 ,\sync0_cnt_reg[24]_i_1_n_9 ,\sync0_cnt_reg[24]_i_1_n_10 ,\sync0_cnt_reg[24]_i_1_n_11 ,\sync0_cnt_reg[24]_i_1_n_12 ,\sync0_cnt_reg[24]_i_1_n_13 ,\sync0_cnt_reg[24]_i_1_n_14 ,\sync0_cnt_reg[24]_i_1_n_15 }),
        .S(sync0_cnt_reg[31:24]));
  FDRE \sync0_cnt_reg[25] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[24]_i_1_n_14 ),
        .Q(sync0_cnt_reg[25]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[26] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[24]_i_1_n_13 ),
        .Q(sync0_cnt_reg[26]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[27] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[24]_i_1_n_12 ),
        .Q(sync0_cnt_reg[27]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[28] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[24]_i_1_n_11 ),
        .Q(sync0_cnt_reg[28]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[29] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[24]_i_1_n_10 ),
        .Q(sync0_cnt_reg[29]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[2] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[0]_i_2_n_13 ),
        .Q(sync0_cnt_reg[2]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[30] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[24]_i_1_n_9 ),
        .Q(sync0_cnt_reg[30]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[31] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[24]_i_1_n_8 ),
        .Q(sync0_cnt_reg[31]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[3] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[0]_i_2_n_12 ),
        .Q(sync0_cnt_reg[3]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[4] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[0]_i_2_n_11 ),
        .Q(sync0_cnt_reg[4]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[5] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[0]_i_2_n_10 ),
        .Q(sync0_cnt_reg[5]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[6] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[0]_i_2_n_9 ),
        .Q(sync0_cnt_reg[6]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[7] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[0]_i_2_n_8 ),
        .Q(sync0_cnt_reg[7]),
        .R(irq_req_i_1_n_0));
  FDRE \sync0_cnt_reg[8] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[8]_i_1_n_15 ),
        .Q(sync0_cnt_reg[8]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sync0_cnt_reg[8]_i_1 
       (.CI(\sync0_cnt_reg[0]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\sync0_cnt_reg[8]_i_1_n_0 ,\sync0_cnt_reg[8]_i_1_n_1 ,\sync0_cnt_reg[8]_i_1_n_2 ,\sync0_cnt_reg[8]_i_1_n_3 ,\sync0_cnt_reg[8]_i_1_n_4 ,\sync0_cnt_reg[8]_i_1_n_5 ,\sync0_cnt_reg[8]_i_1_n_6 ,\sync0_cnt_reg[8]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\sync0_cnt_reg[8]_i_1_n_8 ,\sync0_cnt_reg[8]_i_1_n_9 ,\sync0_cnt_reg[8]_i_1_n_10 ,\sync0_cnt_reg[8]_i_1_n_11 ,\sync0_cnt_reg[8]_i_1_n_12 ,\sync0_cnt_reg[8]_i_1_n_13 ,\sync0_cnt_reg[8]_i_1_n_14 ,\sync0_cnt_reg[8]_i_1_n_15 }),
        .S(sync0_cnt_reg[15:8]));
  FDRE \sync0_cnt_reg[9] 
       (.C(s00_axi_aclk),
        .CE(sync0_rise),
        .D(\sync0_cnt_reg[8]_i_1_n_14 ),
        .Q(sync0_cnt_reg[9]),
        .R(irq_req_i_1_n_0));
  LUT6 #(
    .INIT(64'hBFFFFFFFAAAAAAAA)) 
    sync0_req_i_1
       (.I0(sync0_rise),
        .I1(s00_axi_wdata[1]),
        .I2(wr_addr__2[0]),
        .I3(wr_addr__2[1]),
        .I4(irq_req_i_5_n_0),
        .I5(sync0_int),
        .O(sync0_req_i_1_n_0));
  FDRE sync0_req_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sync0_req_i_1_n_0),
        .Q(sync0_int),
        .R(irq_req_i_1_n_0));
  FDRE sync0_sync0_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sync0_in),
        .Q(sync0_sync0),
        .R(irq_req_i_1_n_0));
  FDRE sync0_sync1_d_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sync0_sync1),
        .Q(sync0_sync1_d),
        .R(irq_req_i_1_n_0));
  FDRE sync0_sync1_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sync0_sync0),
        .Q(sync0_sync1),
        .R(irq_req_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \sync1_cnt[0]_i_1 
       (.I0(sync1_sync1),
        .I1(sync1_sync1_d),
        .O(sync1_rise));
  LUT1 #(
    .INIT(2'h1)) 
    \sync1_cnt[0]_i_3 
       (.I0(sync1_cnt_reg[0]),
        .O(\sync1_cnt[0]_i_3_n_0 ));
  FDRE \sync1_cnt_reg[0] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[0]_i_2_n_15 ),
        .Q(sync1_cnt_reg[0]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sync1_cnt_reg[0]_i_2 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\sync1_cnt_reg[0]_i_2_n_0 ,\sync1_cnt_reg[0]_i_2_n_1 ,\sync1_cnt_reg[0]_i_2_n_2 ,\sync1_cnt_reg[0]_i_2_n_3 ,\sync1_cnt_reg[0]_i_2_n_4 ,\sync1_cnt_reg[0]_i_2_n_5 ,\sync1_cnt_reg[0]_i_2_n_6 ,\sync1_cnt_reg[0]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\sync1_cnt_reg[0]_i_2_n_8 ,\sync1_cnt_reg[0]_i_2_n_9 ,\sync1_cnt_reg[0]_i_2_n_10 ,\sync1_cnt_reg[0]_i_2_n_11 ,\sync1_cnt_reg[0]_i_2_n_12 ,\sync1_cnt_reg[0]_i_2_n_13 ,\sync1_cnt_reg[0]_i_2_n_14 ,\sync1_cnt_reg[0]_i_2_n_15 }),
        .S({sync1_cnt_reg[7:1],\sync1_cnt[0]_i_3_n_0 }));
  FDRE \sync1_cnt_reg[10] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[8]_i_1_n_13 ),
        .Q(sync1_cnt_reg[10]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[11] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[8]_i_1_n_12 ),
        .Q(sync1_cnt_reg[11]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[12] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[8]_i_1_n_11 ),
        .Q(sync1_cnt_reg[12]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[13] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[8]_i_1_n_10 ),
        .Q(sync1_cnt_reg[13]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[14] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[8]_i_1_n_9 ),
        .Q(sync1_cnt_reg[14]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[15] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[8]_i_1_n_8 ),
        .Q(sync1_cnt_reg[15]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[16] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[16]_i_1_n_15 ),
        .Q(sync1_cnt_reg[16]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sync1_cnt_reg[16]_i_1 
       (.CI(\sync1_cnt_reg[8]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\sync1_cnt_reg[16]_i_1_n_0 ,\sync1_cnt_reg[16]_i_1_n_1 ,\sync1_cnt_reg[16]_i_1_n_2 ,\sync1_cnt_reg[16]_i_1_n_3 ,\sync1_cnt_reg[16]_i_1_n_4 ,\sync1_cnt_reg[16]_i_1_n_5 ,\sync1_cnt_reg[16]_i_1_n_6 ,\sync1_cnt_reg[16]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\sync1_cnt_reg[16]_i_1_n_8 ,\sync1_cnt_reg[16]_i_1_n_9 ,\sync1_cnt_reg[16]_i_1_n_10 ,\sync1_cnt_reg[16]_i_1_n_11 ,\sync1_cnt_reg[16]_i_1_n_12 ,\sync1_cnt_reg[16]_i_1_n_13 ,\sync1_cnt_reg[16]_i_1_n_14 ,\sync1_cnt_reg[16]_i_1_n_15 }),
        .S(sync1_cnt_reg[23:16]));
  FDRE \sync1_cnt_reg[17] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[16]_i_1_n_14 ),
        .Q(sync1_cnt_reg[17]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[18] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[16]_i_1_n_13 ),
        .Q(sync1_cnt_reg[18]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[19] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[16]_i_1_n_12 ),
        .Q(sync1_cnt_reg[19]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[1] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[0]_i_2_n_14 ),
        .Q(sync1_cnt_reg[1]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[20] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[16]_i_1_n_11 ),
        .Q(sync1_cnt_reg[20]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[21] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[16]_i_1_n_10 ),
        .Q(sync1_cnt_reg[21]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[22] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[16]_i_1_n_9 ),
        .Q(sync1_cnt_reg[22]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[23] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[16]_i_1_n_8 ),
        .Q(sync1_cnt_reg[23]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[24] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[24]_i_1_n_15 ),
        .Q(sync1_cnt_reg[24]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sync1_cnt_reg[24]_i_1 
       (.CI(\sync1_cnt_reg[16]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_sync1_cnt_reg[24]_i_1_CO_UNCONNECTED [7],\sync1_cnt_reg[24]_i_1_n_1 ,\sync1_cnt_reg[24]_i_1_n_2 ,\sync1_cnt_reg[24]_i_1_n_3 ,\sync1_cnt_reg[24]_i_1_n_4 ,\sync1_cnt_reg[24]_i_1_n_5 ,\sync1_cnt_reg[24]_i_1_n_6 ,\sync1_cnt_reg[24]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\sync1_cnt_reg[24]_i_1_n_8 ,\sync1_cnt_reg[24]_i_1_n_9 ,\sync1_cnt_reg[24]_i_1_n_10 ,\sync1_cnt_reg[24]_i_1_n_11 ,\sync1_cnt_reg[24]_i_1_n_12 ,\sync1_cnt_reg[24]_i_1_n_13 ,\sync1_cnt_reg[24]_i_1_n_14 ,\sync1_cnt_reg[24]_i_1_n_15 }),
        .S(sync1_cnt_reg[31:24]));
  FDRE \sync1_cnt_reg[25] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[24]_i_1_n_14 ),
        .Q(sync1_cnt_reg[25]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[26] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[24]_i_1_n_13 ),
        .Q(sync1_cnt_reg[26]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[27] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[24]_i_1_n_12 ),
        .Q(sync1_cnt_reg[27]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[28] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[24]_i_1_n_11 ),
        .Q(sync1_cnt_reg[28]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[29] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[24]_i_1_n_10 ),
        .Q(sync1_cnt_reg[29]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[2] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[0]_i_2_n_13 ),
        .Q(sync1_cnt_reg[2]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[30] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[24]_i_1_n_9 ),
        .Q(sync1_cnt_reg[30]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[31] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[24]_i_1_n_8 ),
        .Q(sync1_cnt_reg[31]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[3] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[0]_i_2_n_12 ),
        .Q(sync1_cnt_reg[3]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[4] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[0]_i_2_n_11 ),
        .Q(sync1_cnt_reg[4]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[5] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[0]_i_2_n_10 ),
        .Q(sync1_cnt_reg[5]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[6] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[0]_i_2_n_9 ),
        .Q(sync1_cnt_reg[6]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[7] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[0]_i_2_n_8 ),
        .Q(sync1_cnt_reg[7]),
        .R(irq_req_i_1_n_0));
  FDRE \sync1_cnt_reg[8] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[8]_i_1_n_15 ),
        .Q(sync1_cnt_reg[8]),
        .R(irq_req_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sync1_cnt_reg[8]_i_1 
       (.CI(\sync1_cnt_reg[0]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\sync1_cnt_reg[8]_i_1_n_0 ,\sync1_cnt_reg[8]_i_1_n_1 ,\sync1_cnt_reg[8]_i_1_n_2 ,\sync1_cnt_reg[8]_i_1_n_3 ,\sync1_cnt_reg[8]_i_1_n_4 ,\sync1_cnt_reg[8]_i_1_n_5 ,\sync1_cnt_reg[8]_i_1_n_6 ,\sync1_cnt_reg[8]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\sync1_cnt_reg[8]_i_1_n_8 ,\sync1_cnt_reg[8]_i_1_n_9 ,\sync1_cnt_reg[8]_i_1_n_10 ,\sync1_cnt_reg[8]_i_1_n_11 ,\sync1_cnt_reg[8]_i_1_n_12 ,\sync1_cnt_reg[8]_i_1_n_13 ,\sync1_cnt_reg[8]_i_1_n_14 ,\sync1_cnt_reg[8]_i_1_n_15 }),
        .S(sync1_cnt_reg[15:8]));
  FDRE \sync1_cnt_reg[9] 
       (.C(s00_axi_aclk),
        .CE(sync1_rise),
        .D(\sync1_cnt_reg[8]_i_1_n_14 ),
        .Q(sync1_cnt_reg[9]),
        .R(irq_req_i_1_n_0));
  LUT6 #(
    .INIT(64'hBFFFFFFFAAAAAAAA)) 
    sync1_req_i_1
       (.I0(sync1_rise),
        .I1(s00_axi_wdata[2]),
        .I2(wr_addr__2[0]),
        .I3(wr_addr__2[1]),
        .I4(irq_req_i_5_n_0),
        .I5(sync1_int),
        .O(sync1_req_i_1_n_0));
  FDRE sync1_req_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sync1_req_i_1_n_0),
        .Q(sync1_int),
        .R(irq_req_i_1_n_0));
  FDRE sync1_sync0_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sync1_in),
        .Q(sync1_sync0),
        .R(irq_req_i_1_n_0));
  FDRE sync1_sync1_d_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sync1_sync1),
        .Q(sync1_sync1_d),
        .R(irq_req_i_1_n_0));
  FDRE sync1_sync1_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sync1_sync0),
        .Q(sync1_sync1),
        .R(irq_req_i_1_n_0));
endmodule

(* CHECK_LICENSE_TYPE = "kd240_ecat_bd_ecat_pl_if_0_0,ecat_pl_if,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "ecat_pl_if,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (irq_in,
    sync0_in,
    sync1_in,
    rst_out,
    irq_int,
    sync0_int,
    sync1_int,
    s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready);
  input irq_in;
  input sync0_in;
  input sync1_in;
  output rst_out;
  output irq_int;
  output sync0_int;
  output sync1_int;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN kd240_ecat_bd_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99999001, ID_WIDTH 0, ADDR_WIDTH 5, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN kd240_ecat_bd_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [4:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARADDR" *) input [4:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RREADY" *) input s00_axi_rready;

  wire \<const0> ;
  wire irq_in;
  wire irq_int;
  wire rst_out;
  wire s00_axi_aclk;
  wire [4:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [4:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire sync0_in;
  wire sync0_int;
  wire sync1_in;
  wire sync1_int;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ecat_pl_if inst
       (.axi_arready_reg(s00_axi_arready),
        .axi_awready_reg(s00_axi_awready),
        .axi_rvalid_reg(s00_axi_rvalid),
        .irq_in(irq_in),
        .irq_int(irq_int),
        .rst_out(rst_out),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[4:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[4:2]),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .sync0_in(sync0_in),
        .sync0_int(sync0_int),
        .sync1_in(sync1_in),
        .sync1_int(sync1_int));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
