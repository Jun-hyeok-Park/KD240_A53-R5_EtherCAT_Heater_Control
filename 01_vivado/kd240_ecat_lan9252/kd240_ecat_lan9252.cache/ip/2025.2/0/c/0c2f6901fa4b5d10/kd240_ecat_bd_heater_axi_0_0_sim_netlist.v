// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Fri May 15 16:53:24 2026
// Host        : pjh running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ kd240_ecat_bd_heater_axi_0_0_sim_netlist.v
// Design      : kd240_ecat_bd_heater_axi_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xck24-ubva530-2LV-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_axi
   (axi_arready_reg,
    axi_rvalid_reg,
    s00_axi_rdata,
    axi_awready_reg,
    s00_axi_bvalid,
    s00_axi_wready,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axi_aresetn,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_wstrb,
    s00_axi_bready);
  output axi_arready_reg;
  output axi_rvalid_reg;
  output [31:0]s00_axi_rdata;
  output axi_awready_reg;
  output s00_axi_bvalid;
  output s00_axi_wready;
  input s00_axi_aclk;
  input [3:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input s00_axi_aresetn;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input [3:0]s00_axi_wstrb;
  input s00_axi_bready;

  wire axi_arready_i_1_n_0;
  wire axi_arready_reg;
  wire axi_awready0__0;
  wire axi_awready_i_2_n_0;
  wire axi_awready_reg;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_rvalid_reg;
  wire axi_wready_i_1_n_0;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [1:0]state_read;
  wire [1:0]state_write;

  LUT6 #(
    .INIT(64'hC4C4C4C4FFCFCFCF)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(axi_arready_reg),
        .I2(state_read[1]),
        .I3(s00_axi_rready),
        .I4(axi_rvalid_reg),
        .I5(state_read[0]),
        .O(axi_arready_i_1_n_0));
  LUT5 #(
    .INIT(32'hCCC4FFCF)) 
    axi_awready_i_2
       (.I0(s00_axi_awvalid),
        .I1(axi_awready_reg),
        .I2(state_write[1]),
        .I3(s00_axi_wvalid),
        .I4(state_write[0]),
        .O(axi_awready_i_2_n_0));
  LUT6 #(
    .INIT(64'hFBFF3838C3FF0000)) 
    axi_bvalid_i_1
       (.I0(axi_awready0__0),
        .I1(state_write[0]),
        .I2(state_write[1]),
        .I3(s00_axi_bready),
        .I4(s00_axi_bvalid),
        .I5(s00_axi_wvalid),
        .O(axi_bvalid_i_1_n_0));
  LUT6 #(
    .INIT(64'hF0FFFFFF00800080)) 
    axi_rvalid_i_1
       (.I0(axi_arready_reg),
        .I1(s00_axi_arvalid),
        .I2(state_read[0]),
        .I3(state_read[1]),
        .I4(s00_axi_rready),
        .I5(axi_rvalid_reg),
        .O(axi_rvalid_i_1_n_0));
  LUT3 #(
    .INIT(8'hF1)) 
    axi_wready_i_1
       (.I0(state_write[1]),
        .I1(state_write[0]),
        .I2(s00_axi_wready),
        .O(axi_wready_i_1_n_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_axi_slave_lite_v1_0_S00_AXI heater_axi_slave_lite_v1_0_S00_AXI_inst
       (.\FSM_sequential_state_read_reg[1]_0 (state_read),
        .Q(state_write),
        .axi_arready_reg_0(axi_arready_reg),
        .axi_arready_reg_1(axi_arready_i_1_n_0),
        .axi_awready0__0(axi_awready0__0),
        .axi_awready_reg_0(axi_awready_reg),
        .axi_awready_reg_1(axi_awready_i_2_n_0),
        .axi_bvalid_reg_0(axi_bvalid_i_1_n_0),
        .axi_rvalid_reg_0(axi_rvalid_reg),
        .axi_rvalid_reg_1(axi_rvalid_i_1_n_0),
        .axi_wready_reg_0(axi_wready_i_1_n_0),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_axi_slave_lite_v1_0_S00_AXI
   (s00_axi_bvalid,
    axi_awready_reg_0,
    s00_axi_wready,
    axi_rvalid_reg_0,
    axi_arready_reg_0,
    Q,
    \FSM_sequential_state_read_reg[1]_0 ,
    axi_awready0__0,
    s00_axi_rdata,
    s00_axi_aclk,
    axi_bvalid_reg_0,
    axi_awready_reg_1,
    axi_wready_reg_0,
    axi_rvalid_reg_1,
    axi_arready_reg_1,
    s00_axi_awaddr,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_wstrb,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axi_aresetn);
  output s00_axi_bvalid;
  output axi_awready_reg_0;
  output s00_axi_wready;
  output axi_rvalid_reg_0;
  output axi_arready_reg_0;
  output [1:0]Q;
  output [1:0]\FSM_sequential_state_read_reg[1]_0 ;
  output axi_awready0__0;
  output [31:0]s00_axi_rdata;
  input s00_axi_aclk;
  input axi_bvalid_reg_0;
  input axi_awready_reg_1;
  input axi_wready_reg_0;
  input axi_rvalid_reg_1;
  input axi_arready_reg_1;
  input [3:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_araddr;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input [3:0]s00_axi_wstrb;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input s00_axi_aresetn;

  wire \FSM_sequential_state_read[1]_i_1_n_0 ;
  wire [1:0]\FSM_sequential_state_read_reg[1]_0 ;
  wire \FSM_sequential_state_write[1]_i_1_n_0 ;
  wire [1:0]Q;
  wire \axi_araddr[5]_i_1_n_0 ;
  wire axi_arready_reg_0;
  wire axi_arready_reg_1;
  wire [0:0]axi_awaddr;
  wire \axi_awaddr_reg_n_0_[2] ;
  wire \axi_awaddr_reg_n_0_[3] ;
  wire \axi_awaddr_reg_n_0_[4] ;
  wire \axi_awaddr_reg_n_0_[5] ;
  wire axi_awready0__0;
  wire axi_awready_reg_0;
  wire axi_awready_reg_1;
  wire axi_bvalid_reg_0;
  wire axi_rvalid_reg_0;
  wire axi_rvalid_reg_1;
  wire axi_wready_reg_0;
  wire [31:7]p_1_in;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire \s00_axi_rdata[0]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[0]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[0]_INST_0_i_5_n_0 ;
  wire \s00_axi_rdata[0]_INST_0_i_6_n_0 ;
  wire \s00_axi_rdata[10]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[10]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[10]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[11]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[11]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[11]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[12]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[12]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[12]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[13]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[13]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[13]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[14]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[14]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[14]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[15]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[15]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[15]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[16]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[16]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[16]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[17]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[17]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[17]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[18]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[18]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[18]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[19]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[19]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[19]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[1]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[1]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[1]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[20]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[20]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[20]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[21]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[21]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[21]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[22]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[22]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[22]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[23]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[23]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[23]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[24]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[24]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[24]_INST_0_i_5_n_0 ;
  wire \s00_axi_rdata[24]_INST_0_i_6_n_0 ;
  wire \s00_axi_rdata[25]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[25]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[25]_INST_0_i_5_n_0 ;
  wire \s00_axi_rdata[25]_INST_0_i_6_n_0 ;
  wire \s00_axi_rdata[26]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[26]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[26]_INST_0_i_5_n_0 ;
  wire \s00_axi_rdata[26]_INST_0_i_6_n_0 ;
  wire \s00_axi_rdata[27]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[27]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[27]_INST_0_i_5_n_0 ;
  wire \s00_axi_rdata[27]_INST_0_i_6_n_0 ;
  wire \s00_axi_rdata[28]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[28]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[28]_INST_0_i_5_n_0 ;
  wire \s00_axi_rdata[28]_INST_0_i_6_n_0 ;
  wire \s00_axi_rdata[29]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[29]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[29]_INST_0_i_5_n_0 ;
  wire \s00_axi_rdata[29]_INST_0_i_6_n_0 ;
  wire \s00_axi_rdata[2]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[2]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[2]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[30]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[30]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[30]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[31]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[31]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[31]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[3]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[3]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[3]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[4]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[4]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[4]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[5]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[5]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[5]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[6]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[6]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[6]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[7]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[7]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[7]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[8]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[8]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[8]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[9]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[9]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[9]_INST_0_i_4_n_0 ;
  wire s00_axi_rready;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [3:0]sel0;
  wire [31:0]slv_reg0;
  wire \slv_reg0[31]_i_2_n_0 ;
  wire \slv_reg0[31]_i_3_n_0 ;
  wire \slv_reg0[31]_i_4_n_0 ;
  wire \slv_reg0[31]_i_5_n_0 ;
  wire [31:0]slv_reg1;
  wire [31:0]slv_reg10;
  wire \slv_reg10[15]_i_1_n_0 ;
  wire \slv_reg10[23]_i_1_n_0 ;
  wire \slv_reg10[31]_i_1_n_0 ;
  wire \slv_reg10[7]_i_1_n_0 ;
  wire [31:0]slv_reg12;
  wire \slv_reg12[15]_i_1_n_0 ;
  wire \slv_reg12[23]_i_1_n_0 ;
  wire \slv_reg12[31]_i_1_n_0 ;
  wire \slv_reg12[7]_i_1_n_0 ;
  wire [31:0]slv_reg13;
  wire \slv_reg13[15]_i_1_n_0 ;
  wire \slv_reg13[23]_i_1_n_0 ;
  wire \slv_reg13[31]_i_1_n_0 ;
  wire \slv_reg13[7]_i_1_n_0 ;
  wire [31:0]slv_reg14;
  wire \slv_reg14[15]_i_1_n_0 ;
  wire \slv_reg14[23]_i_1_n_0 ;
  wire \slv_reg14[31]_i_1_n_0 ;
  wire \slv_reg14[7]_i_1_n_0 ;
  wire [31:0]slv_reg15;
  wire \slv_reg15[15]_i_1_n_0 ;
  wire \slv_reg15[23]_i_1_n_0 ;
  wire \slv_reg15[31]_i_1_n_0 ;
  wire \slv_reg15[7]_i_1_n_0 ;
  wire \slv_reg1[15]_i_1_n_0 ;
  wire \slv_reg1[23]_i_1_n_0 ;
  wire \slv_reg1[31]_i_1_n_0 ;
  wire \slv_reg1[7]_i_1_n_0 ;
  wire [31:0]slv_reg2;
  wire \slv_reg2[15]_i_1_n_0 ;
  wire \slv_reg2[23]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[7]_i_1_n_0 ;
  wire [31:0]slv_reg3;
  wire \slv_reg3[15]_i_1_n_0 ;
  wire \slv_reg3[23]_i_1_n_0 ;
  wire \slv_reg3[31]_i_1_n_0 ;
  wire \slv_reg3[7]_i_1_n_0 ;
  wire [31:0]slv_reg8;
  wire \slv_reg8[15]_i_1_n_0 ;
  wire \slv_reg8[23]_i_1_n_0 ;
  wire \slv_reg8[31]_i_1_n_0 ;
  wire \slv_reg8[7]_i_1_n_0 ;
  wire [31:0]slv_reg9;
  wire \slv_reg9[15]_i_1_n_0 ;
  wire \slv_reg9[23]_i_1_n_0 ;
  wire \slv_reg9[31]_i_1_n_0 ;
  wire \slv_reg9[7]_i_1_n_0 ;
  wire [1:0]state_read__0;
  wire [1:0]state_write__0;
  wire u_heater_core_dummy_n_0;

  LUT6 #(
    .INIT(64'h07070707FF0F0F0F)) 
    \FSM_sequential_state_read[0]_i_1 
       (.I0(s00_axi_arvalid),
        .I1(axi_arready_reg_0),
        .I2(\FSM_sequential_state_read_reg[1]_0 [1]),
        .I3(s00_axi_rready),
        .I4(axi_rvalid_reg_0),
        .I5(\FSM_sequential_state_read_reg[1]_0 [0]),
        .O(state_read__0[0]));
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_sequential_state_read[1]_i_1 
       (.I0(\FSM_sequential_state_read_reg[1]_0 [0]),
        .I1(\FSM_sequential_state_read_reg[1]_0 [1]),
        .O(\FSM_sequential_state_read[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00800F800F800F80)) 
    \FSM_sequential_state_read[1]_i_2 
       (.I0(axi_arready_reg_0),
        .I1(s00_axi_arvalid),
        .I2(\FSM_sequential_state_read_reg[1]_0 [0]),
        .I3(\FSM_sequential_state_read_reg[1]_0 [1]),
        .I4(s00_axi_rready),
        .I5(axi_rvalid_reg_0),
        .O(state_read__0[1]));
  (* FSM_ENCODED_STATES = "Idle:00,Rdata:10,Raddr:01" *) 
  FDRE \FSM_sequential_state_read_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\FSM_sequential_state_read[1]_i_1_n_0 ),
        .D(state_read__0[0]),
        .Q(\FSM_sequential_state_read_reg[1]_0 [0]),
        .R(u_heater_core_dummy_n_0));
  (* FSM_ENCODED_STATES = "Idle:00,Rdata:10,Raddr:01" *) 
  FDRE \FSM_sequential_state_read_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\FSM_sequential_state_read[1]_i_1_n_0 ),
        .D(state_read__0[1]),
        .Q(\FSM_sequential_state_read_reg[1]_0 [1]),
        .R(u_heater_core_dummy_n_0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT5 #(
    .INIT(32'h0F07FF0F)) 
    \FSM_sequential_state_write[0]_i_1 
       (.I0(axi_awready_reg_0),
        .I1(s00_axi_awvalid),
        .I2(Q[1]),
        .I3(s00_axi_wvalid),
        .I4(Q[0]),
        .O(state_write__0[0]));
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_sequential_state_write[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\FSM_sequential_state_write[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT5 #(
    .INIT(32'h00000F80)) 
    \FSM_sequential_state_write[1]_i_2 
       (.I0(s00_axi_awvalid),
        .I1(axi_awready_reg_0),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(s00_axi_wvalid),
        .O(state_write__0[1]));
  (* FSM_ENCODED_STATES = "Idle:00,Wdata:10,Waddr:01" *) 
  FDRE \FSM_sequential_state_write_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\FSM_sequential_state_write[1]_i_1_n_0 ),
        .D(state_write__0[0]),
        .Q(Q[0]),
        .R(u_heater_core_dummy_n_0));
  (* FSM_ENCODED_STATES = "Idle:00,Wdata:10,Waddr:01" *) 
  FDRE \FSM_sequential_state_write_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\FSM_sequential_state_write[1]_i_1_n_0 ),
        .D(state_write__0[1]),
        .Q(Q[1]),
        .R(u_heater_core_dummy_n_0));
  LUT5 #(
    .INIT(32'h00008000)) 
    \axi_araddr[5]_i_1 
       (.I0(s00_axi_aresetn),
        .I1(axi_arready_reg_0),
        .I2(s00_axi_arvalid),
        .I3(\FSM_sequential_state_read_reg[1]_0 [0]),
        .I4(\FSM_sequential_state_read_reg[1]_0 [1]),
        .O(\axi_araddr[5]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\axi_araddr[5]_i_1_n_0 ),
        .D(s00_axi_araddr[0]),
        .Q(sel0[0]),
        .R(1'b0));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\axi_araddr[5]_i_1_n_0 ),
        .D(s00_axi_araddr[1]),
        .Q(sel0[1]),
        .R(1'b0));
  FDRE \axi_araddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\axi_araddr[5]_i_1_n_0 ),
        .D(s00_axi_araddr[2]),
        .Q(sel0[2]),
        .R(1'b0));
  FDRE \axi_araddr_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\axi_araddr[5]_i_1_n_0 ),
        .D(s00_axi_araddr[3]),
        .Q(sel0[3]),
        .R(1'b0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready_reg_1),
        .Q(axi_arready_reg_0),
        .R(u_heater_core_dummy_n_0));
  LUT4 #(
    .INIT(16'h4000)) 
    \axi_awaddr[5]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(s00_axi_awvalid),
        .I3(axi_awready_reg_0),
        .O(axi_awaddr));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(axi_awaddr),
        .D(s00_axi_awaddr[0]),
        .Q(\axi_awaddr_reg_n_0_[2] ),
        .R(u_heater_core_dummy_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(axi_awaddr),
        .D(s00_axi_awaddr[1]),
        .Q(\axi_awaddr_reg_n_0_[3] ),
        .R(u_heater_core_dummy_n_0));
  FDRE \axi_awaddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(axi_awaddr),
        .D(s00_axi_awaddr[2]),
        .Q(\axi_awaddr_reg_n_0_[4] ),
        .R(u_heater_core_dummy_n_0));
  FDRE \axi_awaddr_reg[5] 
       (.C(s00_axi_aclk),
        .CE(axi_awaddr),
        .D(s00_axi_awaddr[3]),
        .Q(\axi_awaddr_reg_n_0_[5] ),
        .R(u_heater_core_dummy_n_0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready_reg_1),
        .Q(axi_awready_reg_0),
        .R(u_heater_core_dummy_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    axi_bvalid_i_2
       (.I0(s00_axi_awvalid),
        .I1(axi_awready_reg_0),
        .O(axi_awready0__0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_reg_0),
        .Q(s00_axi_bvalid),
        .R(u_heater_core_dummy_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_reg_1),
        .Q(axi_rvalid_reg_0),
        .R(u_heater_core_dummy_n_0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready_reg_0),
        .Q(s00_axi_wready),
        .R(u_heater_core_dummy_n_0));
  MUXF7 \s00_axi_rdata[0]_INST_0_i_2 
       (.I0(\s00_axi_rdata[0]_INST_0_i_5_n_0 ),
        .I1(\s00_axi_rdata[0]_INST_0_i_6_n_0 ),
        .O(\s00_axi_rdata[0]_INST_0_i_2_n_0 ),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[0]_INST_0_i_3 
       (.I0(slv_reg3[0]),
        .I1(slv_reg2[0]),
        .I2(sel0[1]),
        .I3(slv_reg1[0]),
        .I4(sel0[0]),
        .I5(slv_reg0[0]),
        .O(\s00_axi_rdata[0]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \s00_axi_rdata[0]_INST_0_i_5 
       (.I0(slv_reg10[0]),
        .I1(sel0[1]),
        .I2(slv_reg9[0]),
        .I3(sel0[0]),
        .I4(slv_reg8[0]),
        .O(\s00_axi_rdata[0]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[0]_INST_0_i_6 
       (.I0(slv_reg15[0]),
        .I1(slv_reg14[0]),
        .I2(sel0[1]),
        .I3(slv_reg13[0]),
        .I4(sel0[0]),
        .I5(slv_reg12[0]),
        .O(\s00_axi_rdata[0]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[10]_INST_0_i_1 
       (.I0(slv_reg15[10]),
        .I1(slv_reg14[10]),
        .I2(sel0[1]),
        .I3(slv_reg13[10]),
        .I4(sel0[0]),
        .I5(slv_reg12[10]),
        .O(\s00_axi_rdata[10]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \s00_axi_rdata[10]_INST_0_i_2 
       (.I0(slv_reg10[10]),
        .I1(sel0[1]),
        .I2(slv_reg9[10]),
        .I3(sel0[0]),
        .I4(slv_reg8[10]),
        .O(\s00_axi_rdata[10]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[10]_INST_0_i_4 
       (.I0(slv_reg3[10]),
        .I1(slv_reg2[10]),
        .I2(sel0[1]),
        .I3(slv_reg1[10]),
        .I4(sel0[0]),
        .I5(slv_reg0[10]),
        .O(\s00_axi_rdata[10]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[11]_INST_0_i_1 
       (.I0(slv_reg15[11]),
        .I1(slv_reg14[11]),
        .I2(sel0[1]),
        .I3(slv_reg13[11]),
        .I4(sel0[0]),
        .I5(slv_reg12[11]),
        .O(\s00_axi_rdata[11]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[11]_INST_0_i_2 
       (.I0(slv_reg10[11]),
        .I1(sel0[1]),
        .I2(slv_reg9[11]),
        .I3(sel0[0]),
        .I4(slv_reg8[11]),
        .O(\s00_axi_rdata[11]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[11]_INST_0_i_4 
       (.I0(slv_reg3[11]),
        .I1(slv_reg2[11]),
        .I2(sel0[1]),
        .I3(slv_reg1[11]),
        .I4(sel0[0]),
        .I5(slv_reg0[11]),
        .O(\s00_axi_rdata[11]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[12]_INST_0_i_1 
       (.I0(slv_reg15[12]),
        .I1(slv_reg14[12]),
        .I2(sel0[1]),
        .I3(slv_reg13[12]),
        .I4(sel0[0]),
        .I5(slv_reg12[12]),
        .O(\s00_axi_rdata[12]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[12]_INST_0_i_2 
       (.I0(slv_reg10[12]),
        .I1(sel0[1]),
        .I2(slv_reg9[12]),
        .I3(sel0[0]),
        .I4(slv_reg8[12]),
        .O(\s00_axi_rdata[12]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[12]_INST_0_i_4 
       (.I0(slv_reg3[12]),
        .I1(slv_reg2[12]),
        .I2(sel0[1]),
        .I3(slv_reg1[12]),
        .I4(sel0[0]),
        .I5(slv_reg0[12]),
        .O(\s00_axi_rdata[12]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[13]_INST_0_i_1 
       (.I0(slv_reg15[13]),
        .I1(slv_reg14[13]),
        .I2(sel0[1]),
        .I3(slv_reg13[13]),
        .I4(sel0[0]),
        .I5(slv_reg12[13]),
        .O(\s00_axi_rdata[13]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[13]_INST_0_i_2 
       (.I0(slv_reg10[13]),
        .I1(sel0[1]),
        .I2(slv_reg9[13]),
        .I3(sel0[0]),
        .I4(slv_reg8[13]),
        .O(\s00_axi_rdata[13]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[13]_INST_0_i_4 
       (.I0(slv_reg3[13]),
        .I1(slv_reg2[13]),
        .I2(sel0[1]),
        .I3(slv_reg1[13]),
        .I4(sel0[0]),
        .I5(slv_reg0[13]),
        .O(\s00_axi_rdata[13]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[14]_INST_0_i_1 
       (.I0(slv_reg15[14]),
        .I1(slv_reg14[14]),
        .I2(sel0[1]),
        .I3(slv_reg13[14]),
        .I4(sel0[0]),
        .I5(slv_reg12[14]),
        .O(\s00_axi_rdata[14]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[14]_INST_0_i_2 
       (.I0(slv_reg10[14]),
        .I1(sel0[1]),
        .I2(slv_reg9[14]),
        .I3(sel0[0]),
        .I4(slv_reg8[14]),
        .O(\s00_axi_rdata[14]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[14]_INST_0_i_4 
       (.I0(slv_reg3[14]),
        .I1(slv_reg2[14]),
        .I2(sel0[1]),
        .I3(slv_reg1[14]),
        .I4(sel0[0]),
        .I5(slv_reg0[14]),
        .O(\s00_axi_rdata[14]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[15]_INST_0_i_1 
       (.I0(slv_reg15[15]),
        .I1(slv_reg14[15]),
        .I2(sel0[1]),
        .I3(slv_reg13[15]),
        .I4(sel0[0]),
        .I5(slv_reg12[15]),
        .O(\s00_axi_rdata[15]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[15]_INST_0_i_2 
       (.I0(slv_reg10[15]),
        .I1(sel0[1]),
        .I2(slv_reg9[15]),
        .I3(sel0[0]),
        .I4(slv_reg8[15]),
        .O(\s00_axi_rdata[15]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[15]_INST_0_i_4 
       (.I0(slv_reg3[15]),
        .I1(slv_reg2[15]),
        .I2(sel0[1]),
        .I3(slv_reg1[15]),
        .I4(sel0[0]),
        .I5(slv_reg0[15]),
        .O(\s00_axi_rdata[15]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[16]_INST_0_i_1 
       (.I0(slv_reg15[16]),
        .I1(slv_reg14[16]),
        .I2(sel0[1]),
        .I3(slv_reg13[16]),
        .I4(sel0[0]),
        .I5(slv_reg12[16]),
        .O(\s00_axi_rdata[16]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[16]_INST_0_i_2 
       (.I0(slv_reg10[16]),
        .I1(sel0[1]),
        .I2(slv_reg9[16]),
        .I3(sel0[0]),
        .I4(slv_reg8[16]),
        .O(\s00_axi_rdata[16]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[16]_INST_0_i_4 
       (.I0(slv_reg3[16]),
        .I1(slv_reg2[16]),
        .I2(sel0[1]),
        .I3(slv_reg1[16]),
        .I4(sel0[0]),
        .I5(slv_reg0[16]),
        .O(\s00_axi_rdata[16]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[17]_INST_0_i_1 
       (.I0(slv_reg15[17]),
        .I1(slv_reg14[17]),
        .I2(sel0[1]),
        .I3(slv_reg13[17]),
        .I4(sel0[0]),
        .I5(slv_reg12[17]),
        .O(\s00_axi_rdata[17]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \s00_axi_rdata[17]_INST_0_i_2 
       (.I0(slv_reg10[17]),
        .I1(sel0[1]),
        .I2(slv_reg9[17]),
        .I3(sel0[0]),
        .I4(slv_reg8[17]),
        .O(\s00_axi_rdata[17]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[17]_INST_0_i_4 
       (.I0(slv_reg3[17]),
        .I1(slv_reg2[17]),
        .I2(sel0[1]),
        .I3(slv_reg1[17]),
        .I4(sel0[0]),
        .I5(slv_reg0[17]),
        .O(\s00_axi_rdata[17]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[18]_INST_0_i_1 
       (.I0(slv_reg15[18]),
        .I1(slv_reg14[18]),
        .I2(sel0[1]),
        .I3(slv_reg13[18]),
        .I4(sel0[0]),
        .I5(slv_reg12[18]),
        .O(\s00_axi_rdata[18]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \s00_axi_rdata[18]_INST_0_i_2 
       (.I0(slv_reg10[18]),
        .I1(sel0[1]),
        .I2(slv_reg9[18]),
        .I3(sel0[0]),
        .I4(slv_reg8[18]),
        .O(\s00_axi_rdata[18]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[18]_INST_0_i_4 
       (.I0(slv_reg3[18]),
        .I1(slv_reg2[18]),
        .I2(sel0[1]),
        .I3(slv_reg1[18]),
        .I4(sel0[0]),
        .I5(slv_reg0[18]),
        .O(\s00_axi_rdata[18]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[19]_INST_0_i_1 
       (.I0(slv_reg15[19]),
        .I1(slv_reg14[19]),
        .I2(sel0[1]),
        .I3(slv_reg13[19]),
        .I4(sel0[0]),
        .I5(slv_reg12[19]),
        .O(\s00_axi_rdata[19]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[19]_INST_0_i_2 
       (.I0(slv_reg10[19]),
        .I1(sel0[1]),
        .I2(slv_reg9[19]),
        .I3(sel0[0]),
        .I4(slv_reg8[19]),
        .O(\s00_axi_rdata[19]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[19]_INST_0_i_4 
       (.I0(slv_reg3[19]),
        .I1(slv_reg2[19]),
        .I2(sel0[1]),
        .I3(slv_reg1[19]),
        .I4(sel0[0]),
        .I5(slv_reg0[19]),
        .O(\s00_axi_rdata[19]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[1]_INST_0_i_1 
       (.I0(slv_reg15[1]),
        .I1(slv_reg14[1]),
        .I2(sel0[1]),
        .I3(slv_reg13[1]),
        .I4(sel0[0]),
        .I5(slv_reg12[1]),
        .O(\s00_axi_rdata[1]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[1]_INST_0_i_2 
       (.I0(slv_reg10[1]),
        .I1(sel0[1]),
        .I2(slv_reg9[1]),
        .I3(sel0[0]),
        .I4(slv_reg8[1]),
        .O(\s00_axi_rdata[1]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[1]_INST_0_i_4 
       (.I0(slv_reg3[1]),
        .I1(slv_reg2[1]),
        .I2(sel0[1]),
        .I3(slv_reg1[1]),
        .I4(sel0[0]),
        .I5(slv_reg0[1]),
        .O(\s00_axi_rdata[1]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[20]_INST_0_i_1 
       (.I0(slv_reg15[20]),
        .I1(slv_reg14[20]),
        .I2(sel0[1]),
        .I3(slv_reg13[20]),
        .I4(sel0[0]),
        .I5(slv_reg12[20]),
        .O(\s00_axi_rdata[20]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[20]_INST_0_i_2 
       (.I0(slv_reg10[20]),
        .I1(sel0[1]),
        .I2(slv_reg9[20]),
        .I3(sel0[0]),
        .I4(slv_reg8[20]),
        .O(\s00_axi_rdata[20]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[20]_INST_0_i_4 
       (.I0(slv_reg3[20]),
        .I1(slv_reg2[20]),
        .I2(sel0[1]),
        .I3(slv_reg1[20]),
        .I4(sel0[0]),
        .I5(slv_reg0[20]),
        .O(\s00_axi_rdata[20]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[21]_INST_0_i_1 
       (.I0(slv_reg15[21]),
        .I1(slv_reg14[21]),
        .I2(sel0[1]),
        .I3(slv_reg13[21]),
        .I4(sel0[0]),
        .I5(slv_reg12[21]),
        .O(\s00_axi_rdata[21]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \s00_axi_rdata[21]_INST_0_i_2 
       (.I0(slv_reg10[21]),
        .I1(sel0[1]),
        .I2(slv_reg9[21]),
        .I3(sel0[0]),
        .I4(slv_reg8[21]),
        .O(\s00_axi_rdata[21]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[21]_INST_0_i_4 
       (.I0(slv_reg3[21]),
        .I1(slv_reg2[21]),
        .I2(sel0[1]),
        .I3(slv_reg1[21]),
        .I4(sel0[0]),
        .I5(slv_reg0[21]),
        .O(\s00_axi_rdata[21]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[22]_INST_0_i_1 
       (.I0(slv_reg15[22]),
        .I1(slv_reg14[22]),
        .I2(sel0[1]),
        .I3(slv_reg13[22]),
        .I4(sel0[0]),
        .I5(slv_reg12[22]),
        .O(\s00_axi_rdata[22]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[22]_INST_0_i_2 
       (.I0(slv_reg10[22]),
        .I1(sel0[1]),
        .I2(slv_reg9[22]),
        .I3(sel0[0]),
        .I4(slv_reg8[22]),
        .O(\s00_axi_rdata[22]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[22]_INST_0_i_4 
       (.I0(slv_reg3[22]),
        .I1(slv_reg2[22]),
        .I2(sel0[1]),
        .I3(slv_reg1[22]),
        .I4(sel0[0]),
        .I5(slv_reg0[22]),
        .O(\s00_axi_rdata[22]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[23]_INST_0_i_1 
       (.I0(slv_reg15[23]),
        .I1(slv_reg14[23]),
        .I2(sel0[1]),
        .I3(slv_reg13[23]),
        .I4(sel0[0]),
        .I5(slv_reg12[23]),
        .O(\s00_axi_rdata[23]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[23]_INST_0_i_2 
       (.I0(slv_reg10[23]),
        .I1(sel0[1]),
        .I2(slv_reg9[23]),
        .I3(sel0[0]),
        .I4(slv_reg8[23]),
        .O(\s00_axi_rdata[23]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[23]_INST_0_i_4 
       (.I0(slv_reg3[23]),
        .I1(slv_reg2[23]),
        .I2(sel0[1]),
        .I3(slv_reg1[23]),
        .I4(sel0[0]),
        .I5(slv_reg0[23]),
        .O(\s00_axi_rdata[23]_INST_0_i_4_n_0 ));
  MUXF7 \s00_axi_rdata[24]_INST_0_i_2 
       (.I0(\s00_axi_rdata[24]_INST_0_i_5_n_0 ),
        .I1(\s00_axi_rdata[24]_INST_0_i_6_n_0 ),
        .O(\s00_axi_rdata[24]_INST_0_i_2_n_0 ),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[24]_INST_0_i_3 
       (.I0(slv_reg3[24]),
        .I1(slv_reg2[24]),
        .I2(sel0[1]),
        .I3(slv_reg1[24]),
        .I4(sel0[0]),
        .I5(slv_reg0[24]),
        .O(\s00_axi_rdata[24]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[24]_INST_0_i_5 
       (.I0(slv_reg10[24]),
        .I1(sel0[1]),
        .I2(slv_reg9[24]),
        .I3(sel0[0]),
        .I4(slv_reg8[24]),
        .O(\s00_axi_rdata[24]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[24]_INST_0_i_6 
       (.I0(slv_reg15[24]),
        .I1(slv_reg14[24]),
        .I2(sel0[1]),
        .I3(slv_reg13[24]),
        .I4(sel0[0]),
        .I5(slv_reg12[24]),
        .O(\s00_axi_rdata[24]_INST_0_i_6_n_0 ));
  MUXF7 \s00_axi_rdata[25]_INST_0_i_2 
       (.I0(\s00_axi_rdata[25]_INST_0_i_5_n_0 ),
        .I1(\s00_axi_rdata[25]_INST_0_i_6_n_0 ),
        .O(\s00_axi_rdata[25]_INST_0_i_2_n_0 ),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[25]_INST_0_i_3 
       (.I0(slv_reg3[25]),
        .I1(slv_reg2[25]),
        .I2(sel0[1]),
        .I3(slv_reg1[25]),
        .I4(sel0[0]),
        .I5(slv_reg0[25]),
        .O(\s00_axi_rdata[25]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[25]_INST_0_i_5 
       (.I0(slv_reg10[25]),
        .I1(sel0[1]),
        .I2(slv_reg9[25]),
        .I3(sel0[0]),
        .I4(slv_reg8[25]),
        .O(\s00_axi_rdata[25]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[25]_INST_0_i_6 
       (.I0(slv_reg15[25]),
        .I1(slv_reg14[25]),
        .I2(sel0[1]),
        .I3(slv_reg13[25]),
        .I4(sel0[0]),
        .I5(slv_reg12[25]),
        .O(\s00_axi_rdata[25]_INST_0_i_6_n_0 ));
  MUXF7 \s00_axi_rdata[26]_INST_0_i_2 
       (.I0(\s00_axi_rdata[26]_INST_0_i_5_n_0 ),
        .I1(\s00_axi_rdata[26]_INST_0_i_6_n_0 ),
        .O(\s00_axi_rdata[26]_INST_0_i_2_n_0 ),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[26]_INST_0_i_3 
       (.I0(slv_reg3[26]),
        .I1(slv_reg2[26]),
        .I2(sel0[1]),
        .I3(slv_reg1[26]),
        .I4(sel0[0]),
        .I5(slv_reg0[26]),
        .O(\s00_axi_rdata[26]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[26]_INST_0_i_5 
       (.I0(slv_reg10[26]),
        .I1(sel0[1]),
        .I2(slv_reg9[26]),
        .I3(sel0[0]),
        .I4(slv_reg8[26]),
        .O(\s00_axi_rdata[26]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[26]_INST_0_i_6 
       (.I0(slv_reg15[26]),
        .I1(slv_reg14[26]),
        .I2(sel0[1]),
        .I3(slv_reg13[26]),
        .I4(sel0[0]),
        .I5(slv_reg12[26]),
        .O(\s00_axi_rdata[26]_INST_0_i_6_n_0 ));
  MUXF7 \s00_axi_rdata[27]_INST_0_i_2 
       (.I0(\s00_axi_rdata[27]_INST_0_i_5_n_0 ),
        .I1(\s00_axi_rdata[27]_INST_0_i_6_n_0 ),
        .O(\s00_axi_rdata[27]_INST_0_i_2_n_0 ),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[27]_INST_0_i_3 
       (.I0(slv_reg3[27]),
        .I1(slv_reg2[27]),
        .I2(sel0[1]),
        .I3(slv_reg1[27]),
        .I4(sel0[0]),
        .I5(slv_reg0[27]),
        .O(\s00_axi_rdata[27]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[27]_INST_0_i_5 
       (.I0(slv_reg10[27]),
        .I1(sel0[1]),
        .I2(slv_reg9[27]),
        .I3(sel0[0]),
        .I4(slv_reg8[27]),
        .O(\s00_axi_rdata[27]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[27]_INST_0_i_6 
       (.I0(slv_reg15[27]),
        .I1(slv_reg14[27]),
        .I2(sel0[1]),
        .I3(slv_reg13[27]),
        .I4(sel0[0]),
        .I5(slv_reg12[27]),
        .O(\s00_axi_rdata[27]_INST_0_i_6_n_0 ));
  MUXF7 \s00_axi_rdata[28]_INST_0_i_2 
       (.I0(\s00_axi_rdata[28]_INST_0_i_5_n_0 ),
        .I1(\s00_axi_rdata[28]_INST_0_i_6_n_0 ),
        .O(\s00_axi_rdata[28]_INST_0_i_2_n_0 ),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[28]_INST_0_i_3 
       (.I0(slv_reg3[28]),
        .I1(slv_reg2[28]),
        .I2(sel0[1]),
        .I3(slv_reg1[28]),
        .I4(sel0[0]),
        .I5(slv_reg0[28]),
        .O(\s00_axi_rdata[28]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[28]_INST_0_i_5 
       (.I0(slv_reg10[28]),
        .I1(sel0[1]),
        .I2(slv_reg9[28]),
        .I3(sel0[0]),
        .I4(slv_reg8[28]),
        .O(\s00_axi_rdata[28]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[28]_INST_0_i_6 
       (.I0(slv_reg15[28]),
        .I1(slv_reg14[28]),
        .I2(sel0[1]),
        .I3(slv_reg13[28]),
        .I4(sel0[0]),
        .I5(slv_reg12[28]),
        .O(\s00_axi_rdata[28]_INST_0_i_6_n_0 ));
  MUXF7 \s00_axi_rdata[29]_INST_0_i_2 
       (.I0(\s00_axi_rdata[29]_INST_0_i_5_n_0 ),
        .I1(\s00_axi_rdata[29]_INST_0_i_6_n_0 ),
        .O(\s00_axi_rdata[29]_INST_0_i_2_n_0 ),
        .S(sel0[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[29]_INST_0_i_3 
       (.I0(slv_reg3[29]),
        .I1(slv_reg2[29]),
        .I2(sel0[1]),
        .I3(slv_reg1[29]),
        .I4(sel0[0]),
        .I5(slv_reg0[29]),
        .O(\s00_axi_rdata[29]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \s00_axi_rdata[29]_INST_0_i_5 
       (.I0(slv_reg10[29]),
        .I1(sel0[1]),
        .I2(slv_reg9[29]),
        .I3(sel0[0]),
        .I4(slv_reg8[29]),
        .O(\s00_axi_rdata[29]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[29]_INST_0_i_6 
       (.I0(slv_reg15[29]),
        .I1(slv_reg14[29]),
        .I2(sel0[1]),
        .I3(slv_reg13[29]),
        .I4(sel0[0]),
        .I5(slv_reg12[29]),
        .O(\s00_axi_rdata[29]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[2]_INST_0_i_1 
       (.I0(slv_reg15[2]),
        .I1(slv_reg14[2]),
        .I2(sel0[1]),
        .I3(slv_reg13[2]),
        .I4(sel0[0]),
        .I5(slv_reg12[2]),
        .O(\s00_axi_rdata[2]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \s00_axi_rdata[2]_INST_0_i_2 
       (.I0(slv_reg10[2]),
        .I1(sel0[1]),
        .I2(slv_reg9[2]),
        .I3(sel0[0]),
        .I4(slv_reg8[2]),
        .O(\s00_axi_rdata[2]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[2]_INST_0_i_4 
       (.I0(slv_reg3[2]),
        .I1(slv_reg2[2]),
        .I2(sel0[1]),
        .I3(slv_reg1[2]),
        .I4(sel0[0]),
        .I5(slv_reg0[2]),
        .O(\s00_axi_rdata[2]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[30]_INST_0_i_1 
       (.I0(slv_reg15[30]),
        .I1(slv_reg14[30]),
        .I2(sel0[1]),
        .I3(slv_reg13[30]),
        .I4(sel0[0]),
        .I5(slv_reg12[30]),
        .O(\s00_axi_rdata[30]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[30]_INST_0_i_2 
       (.I0(slv_reg10[30]),
        .I1(sel0[1]),
        .I2(slv_reg9[30]),
        .I3(sel0[0]),
        .I4(slv_reg8[30]),
        .O(\s00_axi_rdata[30]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[30]_INST_0_i_4 
       (.I0(slv_reg3[30]),
        .I1(slv_reg2[30]),
        .I2(sel0[1]),
        .I3(slv_reg1[30]),
        .I4(sel0[0]),
        .I5(slv_reg0[30]),
        .O(\s00_axi_rdata[30]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[31]_INST_0_i_1 
       (.I0(slv_reg15[31]),
        .I1(slv_reg14[31]),
        .I2(sel0[1]),
        .I3(slv_reg13[31]),
        .I4(sel0[0]),
        .I5(slv_reg12[31]),
        .O(\s00_axi_rdata[31]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[31]_INST_0_i_2 
       (.I0(slv_reg10[31]),
        .I1(sel0[1]),
        .I2(slv_reg9[31]),
        .I3(sel0[0]),
        .I4(slv_reg8[31]),
        .O(\s00_axi_rdata[31]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[31]_INST_0_i_4 
       (.I0(slv_reg3[31]),
        .I1(slv_reg2[31]),
        .I2(sel0[1]),
        .I3(slv_reg1[31]),
        .I4(sel0[0]),
        .I5(slv_reg0[31]),
        .O(\s00_axi_rdata[31]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[3]_INST_0_i_1 
       (.I0(slv_reg15[3]),
        .I1(slv_reg14[3]),
        .I2(sel0[1]),
        .I3(slv_reg13[3]),
        .I4(sel0[0]),
        .I5(slv_reg12[3]),
        .O(\s00_axi_rdata[3]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[3]_INST_0_i_2 
       (.I0(slv_reg10[3]),
        .I1(sel0[1]),
        .I2(slv_reg9[3]),
        .I3(sel0[0]),
        .I4(slv_reg8[3]),
        .O(\s00_axi_rdata[3]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[3]_INST_0_i_4 
       (.I0(slv_reg3[3]),
        .I1(slv_reg2[3]),
        .I2(sel0[1]),
        .I3(slv_reg1[3]),
        .I4(sel0[0]),
        .I5(slv_reg0[3]),
        .O(\s00_axi_rdata[3]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[4]_INST_0_i_1 
       (.I0(slv_reg15[4]),
        .I1(slv_reg14[4]),
        .I2(sel0[1]),
        .I3(slv_reg13[4]),
        .I4(sel0[0]),
        .I5(slv_reg12[4]),
        .O(\s00_axi_rdata[4]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \s00_axi_rdata[4]_INST_0_i_2 
       (.I0(slv_reg10[4]),
        .I1(sel0[1]),
        .I2(slv_reg9[4]),
        .I3(sel0[0]),
        .I4(slv_reg8[4]),
        .O(\s00_axi_rdata[4]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[4]_INST_0_i_4 
       (.I0(slv_reg3[4]),
        .I1(slv_reg2[4]),
        .I2(sel0[1]),
        .I3(slv_reg1[4]),
        .I4(sel0[0]),
        .I5(slv_reg0[4]),
        .O(\s00_axi_rdata[4]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[5]_INST_0_i_1 
       (.I0(slv_reg15[5]),
        .I1(slv_reg14[5]),
        .I2(sel0[1]),
        .I3(slv_reg13[5]),
        .I4(sel0[0]),
        .I5(slv_reg12[5]),
        .O(\s00_axi_rdata[5]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[5]_INST_0_i_2 
       (.I0(slv_reg10[5]),
        .I1(sel0[1]),
        .I2(slv_reg9[5]),
        .I3(sel0[0]),
        .I4(slv_reg8[5]),
        .O(\s00_axi_rdata[5]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[5]_INST_0_i_4 
       (.I0(slv_reg3[5]),
        .I1(slv_reg2[5]),
        .I2(sel0[1]),
        .I3(slv_reg1[5]),
        .I4(sel0[0]),
        .I5(slv_reg0[5]),
        .O(\s00_axi_rdata[5]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[6]_INST_0_i_1 
       (.I0(slv_reg15[6]),
        .I1(slv_reg14[6]),
        .I2(sel0[1]),
        .I3(slv_reg13[6]),
        .I4(sel0[0]),
        .I5(slv_reg12[6]),
        .O(\s00_axi_rdata[6]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[6]_INST_0_i_2 
       (.I0(slv_reg10[6]),
        .I1(sel0[1]),
        .I2(slv_reg9[6]),
        .I3(sel0[0]),
        .I4(slv_reg8[6]),
        .O(\s00_axi_rdata[6]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[6]_INST_0_i_4 
       (.I0(slv_reg3[6]),
        .I1(slv_reg2[6]),
        .I2(sel0[1]),
        .I3(slv_reg1[6]),
        .I4(sel0[0]),
        .I5(slv_reg0[6]),
        .O(\s00_axi_rdata[6]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[7]_INST_0_i_1 
       (.I0(slv_reg15[7]),
        .I1(slv_reg14[7]),
        .I2(sel0[1]),
        .I3(slv_reg13[7]),
        .I4(sel0[0]),
        .I5(slv_reg12[7]),
        .O(\s00_axi_rdata[7]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[7]_INST_0_i_2 
       (.I0(slv_reg10[7]),
        .I1(sel0[1]),
        .I2(slv_reg9[7]),
        .I3(sel0[0]),
        .I4(slv_reg8[7]),
        .O(\s00_axi_rdata[7]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[7]_INST_0_i_4 
       (.I0(slv_reg3[7]),
        .I1(slv_reg2[7]),
        .I2(sel0[1]),
        .I3(slv_reg1[7]),
        .I4(sel0[0]),
        .I5(slv_reg0[7]),
        .O(\s00_axi_rdata[7]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[8]_INST_0_i_1 
       (.I0(slv_reg15[8]),
        .I1(slv_reg14[8]),
        .I2(sel0[1]),
        .I3(slv_reg13[8]),
        .I4(sel0[0]),
        .I5(slv_reg12[8]),
        .O(\s00_axi_rdata[8]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \s00_axi_rdata[8]_INST_0_i_2 
       (.I0(slv_reg10[8]),
        .I1(sel0[1]),
        .I2(slv_reg9[8]),
        .I3(sel0[0]),
        .I4(slv_reg8[8]),
        .O(\s00_axi_rdata[8]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[8]_INST_0_i_4 
       (.I0(slv_reg3[8]),
        .I1(slv_reg2[8]),
        .I2(sel0[1]),
        .I3(slv_reg1[8]),
        .I4(sel0[0]),
        .I5(slv_reg0[8]),
        .O(\s00_axi_rdata[8]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[9]_INST_0_i_1 
       (.I0(slv_reg15[9]),
        .I1(slv_reg14[9]),
        .I2(sel0[1]),
        .I3(slv_reg13[9]),
        .I4(sel0[0]),
        .I5(slv_reg12[9]),
        .O(\s00_axi_rdata[9]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[9]_INST_0_i_2 
       (.I0(slv_reg10[9]),
        .I1(sel0[1]),
        .I2(slv_reg9[9]),
        .I3(sel0[0]),
        .I4(slv_reg8[9]),
        .O(\s00_axi_rdata[9]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[9]_INST_0_i_4 
       (.I0(slv_reg3[9]),
        .I1(slv_reg2[9]),
        .I2(sel0[1]),
        .I3(slv_reg1[9]),
        .I4(sel0[0]),
        .I5(slv_reg0[9]),
        .O(\s00_axi_rdata[9]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \slv_reg0[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_2_n_0 ),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(s00_axi_wstrb[1]),
        .O(p_1_in[15]));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \slv_reg0[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_2_n_0 ),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(s00_axi_wstrb[2]),
        .O(p_1_in[23]));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \slv_reg0[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_2_n_0 ),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(s00_axi_wstrb[3]),
        .O(p_1_in[31]));
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg0[31]_i_2 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_awvalid),
        .I2(\axi_awaddr_reg_n_0_[2] ),
        .O(\slv_reg0[31]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg0[31]_i_3 
       (.I0(s00_axi_awaddr[3]),
        .I1(s00_axi_awvalid),
        .I2(\axi_awaddr_reg_n_0_[5] ),
        .O(\slv_reg0[31]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg0[31]_i_4 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_awvalid),
        .I2(\axi_awaddr_reg_n_0_[3] ),
        .O(\slv_reg0[31]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg0[31]_i_5 
       (.I0(s00_axi_awaddr[2]),
        .I1(s00_axi_awvalid),
        .I2(\axi_awaddr_reg_n_0_[4] ),
        .O(\slv_reg0[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \slv_reg0[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_2_n_0 ),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(s00_axi_wstrb[0]),
        .O(p_1_in[7]));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg0[0]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg0[10]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg0[11]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg0[12]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg0[13]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg0[14]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg0[15]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg0[16]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg0[17]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg0[18]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg0[19]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg0[1]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg0[20]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg0[21]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg0[22]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg0[23]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg0[24]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg0[25]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg0[26]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg0[27]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg0[28]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg0[29]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg0[2]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg0[30]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg0[31]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg0[3]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg0[4]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg0[5]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg0[6]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg0[7]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg0[8]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg0[9]),
        .R(u_heater_core_dummy_n_0));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg10[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[1]),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_2_n_0 ),
        .I5(\slv_reg0[31]_i_5_n_0 ),
        .O(\slv_reg10[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg10[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[2]),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_2_n_0 ),
        .I5(\slv_reg0[31]_i_5_n_0 ),
        .O(\slv_reg10[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg10[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[3]),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_2_n_0 ),
        .I5(\slv_reg0[31]_i_5_n_0 ),
        .O(\slv_reg10[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg10[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[0]),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_2_n_0 ),
        .I5(\slv_reg0[31]_i_5_n_0 ),
        .O(\slv_reg10[7]_i_1_n_0 ));
  FDRE \slv_reg10_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg10[0]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg10[10]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg10[11]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg10[12]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg10[13]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg10[14]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg10[15]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg10[16]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg10[17]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg10[18]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg10[19]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg10[1]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg10[20]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg10[21]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg10[22]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg10[23]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg10[24]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg10[25]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg10[26]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg10[27]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg10[28]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg10[29]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg10[2]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg10[30]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg10[31]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg10[3]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg10[4]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg10[5]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg10[6]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg10[7]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg10[8]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg10_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg10[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg10[9]),
        .R(u_heater_core_dummy_n_0));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg12[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[1]),
        .I3(\slv_reg0[31]_i_5_n_0 ),
        .I4(\slv_reg0[31]_i_2_n_0 ),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg12[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg12[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[2]),
        .I3(\slv_reg0[31]_i_5_n_0 ),
        .I4(\slv_reg0[31]_i_2_n_0 ),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg12[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg12[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[3]),
        .I3(\slv_reg0[31]_i_5_n_0 ),
        .I4(\slv_reg0[31]_i_2_n_0 ),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg12[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg12[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[0]),
        .I3(\slv_reg0[31]_i_5_n_0 ),
        .I4(\slv_reg0[31]_i_2_n_0 ),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg12[7]_i_1_n_0 ));
  FDRE \slv_reg12_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg12[0]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg12[10]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg12[11]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg12[12]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg12[13]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg12[14]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg12[15]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg12[16]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg12[17]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg12[18]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg12[19]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg12[1]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg12[20]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg12[21]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg12[22]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg12[23]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg12[24]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg12[25]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg12[26]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg12[27]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg12[28]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg12[29]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg12[2]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg12[30]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg12[31]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg12[3]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg12[4]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg12[5]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg12[6]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg12[7]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg12[8]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg12_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg12[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg12[9]),
        .R(u_heater_core_dummy_n_0));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg13[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_5_n_0 ),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(s00_axi_wstrb[1]),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg13[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg13[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_5_n_0 ),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(s00_axi_wstrb[2]),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg13[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg13[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_5_n_0 ),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(s00_axi_wstrb[3]),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg13[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg13[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_5_n_0 ),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(s00_axi_wstrb[0]),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg13[7]_i_1_n_0 ));
  FDRE \slv_reg13_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg13[0]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg13[10]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg13[11]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg13[12]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg13[13]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg13[14]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg13[15]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg13[16]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg13[17]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg13[18]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg13[19]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg13[1]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg13[20]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg13[21]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg13[22]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg13[23]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg13[24]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg13[25]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg13[26]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg13[27]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg13[28]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg13[29]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg13[2]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg13[30]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg13[31]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg13[3]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg13[4]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg13[5]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg13[6]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg13[7]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg13[8]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg13_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg13[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg13[9]),
        .R(u_heater_core_dummy_n_0));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg14[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_5_n_0 ),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(s00_axi_wstrb[1]),
        .I4(\slv_reg0[31]_i_4_n_0 ),
        .I5(\slv_reg0[31]_i_2_n_0 ),
        .O(\slv_reg14[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg14[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_5_n_0 ),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(s00_axi_wstrb[2]),
        .I4(\slv_reg0[31]_i_4_n_0 ),
        .I5(\slv_reg0[31]_i_2_n_0 ),
        .O(\slv_reg14[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg14[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_5_n_0 ),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(s00_axi_wstrb[3]),
        .I4(\slv_reg0[31]_i_4_n_0 ),
        .I5(\slv_reg0[31]_i_2_n_0 ),
        .O(\slv_reg14[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg14[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_5_n_0 ),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(s00_axi_wstrb[0]),
        .I4(\slv_reg0[31]_i_4_n_0 ),
        .I5(\slv_reg0[31]_i_2_n_0 ),
        .O(\slv_reg14[7]_i_1_n_0 ));
  FDRE \slv_reg14_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg14[0]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg14[10]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg14[11]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg14[12]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg14[13]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg14[14]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg14[15]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg14[16]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg14[17]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg14[18]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg14[19]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg14[1]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg14[20]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg14[21]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg14[22]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg14[23]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg14[24]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg14[25]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg14[26]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg14[27]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg14[28]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg14[29]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg14[2]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg14[30]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg14[31]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg14[3]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg14[4]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg14[5]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg14[6]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg14[7]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg14[8]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg14_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg14[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg14[9]),
        .R(u_heater_core_dummy_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \slv_reg15[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_5_n_0 ),
        .I2(s00_axi_wstrb[1]),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(\slv_reg0[31]_i_4_n_0 ),
        .I5(\slv_reg0[31]_i_3_n_0 ),
        .O(\slv_reg15[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \slv_reg15[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_5_n_0 ),
        .I2(s00_axi_wstrb[2]),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(\slv_reg0[31]_i_4_n_0 ),
        .I5(\slv_reg0[31]_i_3_n_0 ),
        .O(\slv_reg15[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \slv_reg15[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_5_n_0 ),
        .I2(s00_axi_wstrb[3]),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(\slv_reg0[31]_i_4_n_0 ),
        .I5(\slv_reg0[31]_i_3_n_0 ),
        .O(\slv_reg15[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \slv_reg15[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_5_n_0 ),
        .I2(s00_axi_wstrb[0]),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(\slv_reg0[31]_i_4_n_0 ),
        .I5(\slv_reg0[31]_i_3_n_0 ),
        .O(\slv_reg15[7]_i_1_n_0 ));
  FDRE \slv_reg15_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg15[0]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg15[10]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg15[11]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg15[12]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg15[13]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg15[14]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg15[15]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg15[16]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg15[17]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg15[18]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg15[19]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg15[1]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg15[20]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg15[21]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg15[22]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg15[23]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg15[24]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg15[25]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg15[26]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg15[27]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg15[28]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg15[29]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg15[2]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg15[30]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg15[31]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg15[3]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg15[4]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg15[5]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg15[6]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg15[7]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg15[8]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg15_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg15[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg15[9]),
        .R(u_heater_core_dummy_n_0));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg1[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[1]),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(\slv_reg0[31]_i_2_n_0 ),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg1[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[2]),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(\slv_reg0[31]_i_2_n_0 ),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg1[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[3]),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(\slv_reg0[31]_i_2_n_0 ),
        .O(\slv_reg1[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg1[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[0]),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(\slv_reg0[31]_i_2_n_0 ),
        .O(\slv_reg1[7]_i_1_n_0 ));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg1[0]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg1[10]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg1[11]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg1[12]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg1[13]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg1[14]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg1[15]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg1[16]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg1[17]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg1[18]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg1[19]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg1[1]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg1[20]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg1[21]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg1[22]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg1[23]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg1[24]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg1[25]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg1[26]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg1[27]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg1[28]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg1[29]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg1[2]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg1[30]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg1[31]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg1[3]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg1[4]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg1[5]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg1[6]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg1[7]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg1[8]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg1_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg1[9]),
        .R(u_heater_core_dummy_n_0));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg2[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[1]),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg2[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg2[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[2]),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg2[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg2[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[3]),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg2[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg2[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[0]),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg2[7]_i_1_n_0 ));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg2[0]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg2[10]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg2[11]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg2[12]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg2[13]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg2[14]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg2[15]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg2[16]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg2[17]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg2[18]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg2[19]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg2[1]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg2[20]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg2[21]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg2[22]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg2[23]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg2[24]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg2[25]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg2[26]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg2[27]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg2[28]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg2[29]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg2[2]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg2[30]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg2[31]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg2[3]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg2[4]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg2[5]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg2[6]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg2[7]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg2[8]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg2[9]),
        .R(u_heater_core_dummy_n_0));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg3[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[1]),
        .I2(\slv_reg0[31]_i_2_n_0 ),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(\slv_reg0[31]_i_3_n_0 ),
        .O(\slv_reg3[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg3[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[2]),
        .I2(\slv_reg0[31]_i_2_n_0 ),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(\slv_reg0[31]_i_3_n_0 ),
        .O(\slv_reg3[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg3[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[3]),
        .I2(\slv_reg0[31]_i_2_n_0 ),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(\slv_reg0[31]_i_3_n_0 ),
        .O(\slv_reg3[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg3[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[0]),
        .I2(\slv_reg0[31]_i_2_n_0 ),
        .I3(\slv_reg0[31]_i_4_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(\slv_reg0[31]_i_3_n_0 ),
        .O(\slv_reg3[7]_i_1_n_0 ));
  FDRE \slv_reg3_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg3[0]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg3[10]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg3[11]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg3[12]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg3[13]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg3[14]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg3[15]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg3[16]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg3[17]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg3[18]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg3[19]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg3[1]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg3[20]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg3[21]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg3[22]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg3[23]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg3[24]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg3[25]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg3[26]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg3[27]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg3[28]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg3[29]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg3[2]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg3[30]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg3[31]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg3[3]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg3[4]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg3[5]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg3[6]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg3[7]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg3[8]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg3_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg3[9]),
        .R(u_heater_core_dummy_n_0));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg8[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(\slv_reg0[31]_i_4_n_0 ),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(s00_axi_wstrb[1]),
        .O(\slv_reg8[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg8[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(\slv_reg0[31]_i_4_n_0 ),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(s00_axi_wstrb[2]),
        .O(\slv_reg8[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg8[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(\slv_reg0[31]_i_4_n_0 ),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(s00_axi_wstrb[3]),
        .O(\slv_reg8[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg8[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(\slv_reg0[31]_i_4_n_0 ),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .I4(\slv_reg0[31]_i_5_n_0 ),
        .I5(s00_axi_wstrb[0]),
        .O(\slv_reg8[7]_i_1_n_0 ));
  FDRE \slv_reg8_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg8[0]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg8[10]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg8[11]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg8[12]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg8[13]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg8[14]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg8[15]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg8[16]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg8[17]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg8[18]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg8[19]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg8[1]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg8[20]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg8[21]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg8[22]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg8[23]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg8[24]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg8[25]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg8[26]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg8[27]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg8[28]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg8[29]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg8[2]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg8[30]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg8[31]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg8[3]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg8[4]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg8[5]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg8[6]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg8[7]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg8[8]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg8_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg8[9]),
        .R(u_heater_core_dummy_n_0));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg9[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(\slv_reg0[31]_i_2_n_0 ),
        .I3(s00_axi_wstrb[1]),
        .I4(\slv_reg0[31]_i_4_n_0 ),
        .I5(\slv_reg0[31]_i_5_n_0 ),
        .O(\slv_reg9[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg9[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(\slv_reg0[31]_i_2_n_0 ),
        .I3(s00_axi_wstrb[2]),
        .I4(\slv_reg0[31]_i_4_n_0 ),
        .I5(\slv_reg0[31]_i_5_n_0 ),
        .O(\slv_reg9[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg9[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(\slv_reg0[31]_i_2_n_0 ),
        .I3(s00_axi_wstrb[3]),
        .I4(\slv_reg0[31]_i_4_n_0 ),
        .I5(\slv_reg0[31]_i_5_n_0 ),
        .O(\slv_reg9[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg9[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(\slv_reg0[31]_i_2_n_0 ),
        .I3(s00_axi_wstrb[0]),
        .I4(\slv_reg0[31]_i_4_n_0 ),
        .I5(\slv_reg0[31]_i_5_n_0 ),
        .O(\slv_reg9[7]_i_1_n_0 ));
  FDRE \slv_reg9_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg9[0]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg9[10]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg9[11]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg9[12]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg9[13]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg9[14]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg9[15]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg9[16]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg9[17]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg9[18]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg9[19]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg9[1]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg9[20]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg9[21]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg9[22]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg9[23]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg9[24]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg9[25]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg9[26]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg9[27]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg9[28]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg9[29]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg9[2]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg9[30]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg9[31]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg9[3]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg9[4]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg9[5]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg9[6]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg9[7]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg9[8]),
        .R(u_heater_core_dummy_n_0));
  FDRE \slv_reg9_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg9[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg9[9]),
        .R(u_heater_core_dummy_n_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_core_dummy u_heater_core_dummy
       (.Q(sel0),
        .SR(u_heater_core_dummy_n_0),
        .\error_reg[0]_0 ({slv_reg0[2],slv_reg0[0]}),
        .\error_reg[31]_0 (slv_reg1),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_rdata(s00_axi_rdata),
        .\s00_axi_rdata[0]_0 (\s00_axi_rdata[0]_INST_0_i_3_n_0 ),
        .\s00_axi_rdata[10]_0 (\s00_axi_rdata[10]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[10]_1 (\s00_axi_rdata[10]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[11]_0 (\s00_axi_rdata[11]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[11]_1 (\s00_axi_rdata[11]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[12]_0 (\s00_axi_rdata[12]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[12]_1 (\s00_axi_rdata[12]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[13]_0 (\s00_axi_rdata[13]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[13]_1 (\s00_axi_rdata[13]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[14]_0 (\s00_axi_rdata[14]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[14]_1 (\s00_axi_rdata[14]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[15]_0 (\s00_axi_rdata[15]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[15]_1 (\s00_axi_rdata[15]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[16]_0 (\s00_axi_rdata[16]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[16]_1 (\s00_axi_rdata[16]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[17]_0 (\s00_axi_rdata[17]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[17]_1 (\s00_axi_rdata[17]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[18]_0 (\s00_axi_rdata[18]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[18]_1 (\s00_axi_rdata[18]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[19]_0 (\s00_axi_rdata[19]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[19]_1 (\s00_axi_rdata[19]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[1]_0 (\s00_axi_rdata[1]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[1]_1 (\s00_axi_rdata[1]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[20]_0 (\s00_axi_rdata[20]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[20]_1 (\s00_axi_rdata[20]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[21]_0 (\s00_axi_rdata[21]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[21]_1 (\s00_axi_rdata[21]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[22]_0 (\s00_axi_rdata[22]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[22]_1 (\s00_axi_rdata[22]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[23]_0 (\s00_axi_rdata[23]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[23]_1 (\s00_axi_rdata[23]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[24]_0 (\s00_axi_rdata[24]_INST_0_i_3_n_0 ),
        .\s00_axi_rdata[25]_0 (\s00_axi_rdata[25]_INST_0_i_3_n_0 ),
        .\s00_axi_rdata[26]_0 (\s00_axi_rdata[26]_INST_0_i_3_n_0 ),
        .\s00_axi_rdata[27]_0 (\s00_axi_rdata[27]_INST_0_i_3_n_0 ),
        .\s00_axi_rdata[28]_0 (\s00_axi_rdata[28]_INST_0_i_3_n_0 ),
        .\s00_axi_rdata[29]_0 (\s00_axi_rdata[29]_INST_0_i_3_n_0 ),
        .\s00_axi_rdata[2]_0 (\s00_axi_rdata[2]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[2]_1 (\s00_axi_rdata[2]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[30]_0 (\s00_axi_rdata[30]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[30]_1 (\s00_axi_rdata[30]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[31]_0 (\s00_axi_rdata[31]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[31]_1 (\s00_axi_rdata[31]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[3]_0 (\s00_axi_rdata[3]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[3]_1 (\s00_axi_rdata[3]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[4]_0 (\s00_axi_rdata[4]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[4]_1 (\s00_axi_rdata[4]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[5]_0 (\s00_axi_rdata[5]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[5]_1 (\s00_axi_rdata[5]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[6]_0 (\s00_axi_rdata[6]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[6]_1 (\s00_axi_rdata[6]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[7]_0 (\s00_axi_rdata[7]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[7]_1 (\s00_axi_rdata[7]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[8]_0 (\s00_axi_rdata[8]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[8]_1 (\s00_axi_rdata[8]_INST_0_i_4_n_0 ),
        .\s00_axi_rdata[9]_0 (\s00_axi_rdata[9]_INST_0_i_2_n_0 ),
        .\s00_axi_rdata[9]_1 (\s00_axi_rdata[9]_INST_0_i_4_n_0 ),
        .s00_axi_rdata_0_sp_1(\s00_axi_rdata[0]_INST_0_i_2_n_0 ),
        .s00_axi_rdata_10_sp_1(\s00_axi_rdata[10]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_11_sp_1(\s00_axi_rdata[11]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_12_sp_1(\s00_axi_rdata[12]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_13_sp_1(\s00_axi_rdata[13]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_14_sp_1(\s00_axi_rdata[14]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_15_sp_1(\s00_axi_rdata[15]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_16_sp_1(\s00_axi_rdata[16]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_17_sp_1(\s00_axi_rdata[17]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_18_sp_1(\s00_axi_rdata[18]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_19_sp_1(\s00_axi_rdata[19]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_1_sp_1(\s00_axi_rdata[1]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_20_sp_1(\s00_axi_rdata[20]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_21_sp_1(\s00_axi_rdata[21]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_22_sp_1(\s00_axi_rdata[22]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_23_sp_1(\s00_axi_rdata[23]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_24_sp_1(\s00_axi_rdata[24]_INST_0_i_2_n_0 ),
        .s00_axi_rdata_25_sp_1(\s00_axi_rdata[25]_INST_0_i_2_n_0 ),
        .s00_axi_rdata_26_sp_1(\s00_axi_rdata[26]_INST_0_i_2_n_0 ),
        .s00_axi_rdata_27_sp_1(\s00_axi_rdata[27]_INST_0_i_2_n_0 ),
        .s00_axi_rdata_28_sp_1(\s00_axi_rdata[28]_INST_0_i_2_n_0 ),
        .s00_axi_rdata_29_sp_1(\s00_axi_rdata[29]_INST_0_i_2_n_0 ),
        .s00_axi_rdata_2_sp_1(\s00_axi_rdata[2]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_30_sp_1(\s00_axi_rdata[30]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_31_sp_1(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_3_sp_1(\s00_axi_rdata[3]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_4_sp_1(\s00_axi_rdata[4]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_5_sp_1(\s00_axi_rdata[5]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_6_sp_1(\s00_axi_rdata[6]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_7_sp_1(\s00_axi_rdata[7]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_8_sp_1(\s00_axi_rdata[8]_INST_0_i_1_n_0 ),
        .s00_axi_rdata_9_sp_1(\s00_axi_rdata[9]_INST_0_i_1_n_0 ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_core_dummy
   (SR,
    s00_axi_rdata,
    s00_axi_aclk,
    Q,
    \error_reg[0]_0 ,
    s00_axi_aresetn,
    \error_reg[31]_0 ,
    s00_axi_rdata_0_sp_1,
    \s00_axi_rdata[0]_0 ,
    s00_axi_rdata_1_sp_1,
    \s00_axi_rdata[1]_0 ,
    \s00_axi_rdata[1]_1 ,
    s00_axi_rdata_2_sp_1,
    \s00_axi_rdata[2]_0 ,
    \s00_axi_rdata[2]_1 ,
    s00_axi_rdata_3_sp_1,
    \s00_axi_rdata[3]_0 ,
    \s00_axi_rdata[3]_1 ,
    s00_axi_rdata_4_sp_1,
    \s00_axi_rdata[4]_0 ,
    \s00_axi_rdata[4]_1 ,
    s00_axi_rdata_5_sp_1,
    \s00_axi_rdata[5]_0 ,
    \s00_axi_rdata[5]_1 ,
    s00_axi_rdata_6_sp_1,
    \s00_axi_rdata[6]_0 ,
    \s00_axi_rdata[6]_1 ,
    s00_axi_rdata_7_sp_1,
    \s00_axi_rdata[7]_0 ,
    \s00_axi_rdata[7]_1 ,
    s00_axi_rdata_8_sp_1,
    \s00_axi_rdata[8]_0 ,
    \s00_axi_rdata[8]_1 ,
    s00_axi_rdata_9_sp_1,
    \s00_axi_rdata[9]_0 ,
    \s00_axi_rdata[9]_1 ,
    s00_axi_rdata_10_sp_1,
    \s00_axi_rdata[10]_0 ,
    \s00_axi_rdata[10]_1 ,
    s00_axi_rdata_11_sp_1,
    \s00_axi_rdata[11]_0 ,
    \s00_axi_rdata[11]_1 ,
    s00_axi_rdata_12_sp_1,
    \s00_axi_rdata[12]_0 ,
    \s00_axi_rdata[12]_1 ,
    s00_axi_rdata_13_sp_1,
    \s00_axi_rdata[13]_0 ,
    \s00_axi_rdata[13]_1 ,
    s00_axi_rdata_14_sp_1,
    \s00_axi_rdata[14]_0 ,
    \s00_axi_rdata[14]_1 ,
    s00_axi_rdata_15_sp_1,
    \s00_axi_rdata[15]_0 ,
    \s00_axi_rdata[15]_1 ,
    s00_axi_rdata_16_sp_1,
    \s00_axi_rdata[16]_0 ,
    \s00_axi_rdata[16]_1 ,
    s00_axi_rdata_17_sp_1,
    \s00_axi_rdata[17]_0 ,
    \s00_axi_rdata[17]_1 ,
    s00_axi_rdata_18_sp_1,
    \s00_axi_rdata[18]_0 ,
    \s00_axi_rdata[18]_1 ,
    s00_axi_rdata_19_sp_1,
    \s00_axi_rdata[19]_0 ,
    \s00_axi_rdata[19]_1 ,
    s00_axi_rdata_20_sp_1,
    \s00_axi_rdata[20]_0 ,
    \s00_axi_rdata[20]_1 ,
    s00_axi_rdata_21_sp_1,
    \s00_axi_rdata[21]_0 ,
    \s00_axi_rdata[21]_1 ,
    s00_axi_rdata_22_sp_1,
    \s00_axi_rdata[22]_0 ,
    \s00_axi_rdata[22]_1 ,
    s00_axi_rdata_23_sp_1,
    \s00_axi_rdata[23]_0 ,
    \s00_axi_rdata[23]_1 ,
    s00_axi_rdata_24_sp_1,
    \s00_axi_rdata[24]_0 ,
    s00_axi_rdata_25_sp_1,
    \s00_axi_rdata[25]_0 ,
    s00_axi_rdata_26_sp_1,
    \s00_axi_rdata[26]_0 ,
    s00_axi_rdata_27_sp_1,
    \s00_axi_rdata[27]_0 ,
    s00_axi_rdata_28_sp_1,
    \s00_axi_rdata[28]_0 ,
    s00_axi_rdata_29_sp_1,
    \s00_axi_rdata[29]_0 ,
    s00_axi_rdata_30_sp_1,
    \s00_axi_rdata[30]_0 ,
    \s00_axi_rdata[30]_1 ,
    s00_axi_rdata_31_sp_1,
    \s00_axi_rdata[31]_0 ,
    \s00_axi_rdata[31]_1 );
  output [0:0]SR;
  output [31:0]s00_axi_rdata;
  input s00_axi_aclk;
  input [3:0]Q;
  input [1:0]\error_reg[0]_0 ;
  input s00_axi_aresetn;
  input [31:0]\error_reg[31]_0 ;
  input s00_axi_rdata_0_sp_1;
  input \s00_axi_rdata[0]_0 ;
  input s00_axi_rdata_1_sp_1;
  input \s00_axi_rdata[1]_0 ;
  input \s00_axi_rdata[1]_1 ;
  input s00_axi_rdata_2_sp_1;
  input \s00_axi_rdata[2]_0 ;
  input \s00_axi_rdata[2]_1 ;
  input s00_axi_rdata_3_sp_1;
  input \s00_axi_rdata[3]_0 ;
  input \s00_axi_rdata[3]_1 ;
  input s00_axi_rdata_4_sp_1;
  input \s00_axi_rdata[4]_0 ;
  input \s00_axi_rdata[4]_1 ;
  input s00_axi_rdata_5_sp_1;
  input \s00_axi_rdata[5]_0 ;
  input \s00_axi_rdata[5]_1 ;
  input s00_axi_rdata_6_sp_1;
  input \s00_axi_rdata[6]_0 ;
  input \s00_axi_rdata[6]_1 ;
  input s00_axi_rdata_7_sp_1;
  input \s00_axi_rdata[7]_0 ;
  input \s00_axi_rdata[7]_1 ;
  input s00_axi_rdata_8_sp_1;
  input \s00_axi_rdata[8]_0 ;
  input \s00_axi_rdata[8]_1 ;
  input s00_axi_rdata_9_sp_1;
  input \s00_axi_rdata[9]_0 ;
  input \s00_axi_rdata[9]_1 ;
  input s00_axi_rdata_10_sp_1;
  input \s00_axi_rdata[10]_0 ;
  input \s00_axi_rdata[10]_1 ;
  input s00_axi_rdata_11_sp_1;
  input \s00_axi_rdata[11]_0 ;
  input \s00_axi_rdata[11]_1 ;
  input s00_axi_rdata_12_sp_1;
  input \s00_axi_rdata[12]_0 ;
  input \s00_axi_rdata[12]_1 ;
  input s00_axi_rdata_13_sp_1;
  input \s00_axi_rdata[13]_0 ;
  input \s00_axi_rdata[13]_1 ;
  input s00_axi_rdata_14_sp_1;
  input \s00_axi_rdata[14]_0 ;
  input \s00_axi_rdata[14]_1 ;
  input s00_axi_rdata_15_sp_1;
  input \s00_axi_rdata[15]_0 ;
  input \s00_axi_rdata[15]_1 ;
  input s00_axi_rdata_16_sp_1;
  input \s00_axi_rdata[16]_0 ;
  input \s00_axi_rdata[16]_1 ;
  input s00_axi_rdata_17_sp_1;
  input \s00_axi_rdata[17]_0 ;
  input \s00_axi_rdata[17]_1 ;
  input s00_axi_rdata_18_sp_1;
  input \s00_axi_rdata[18]_0 ;
  input \s00_axi_rdata[18]_1 ;
  input s00_axi_rdata_19_sp_1;
  input \s00_axi_rdata[19]_0 ;
  input \s00_axi_rdata[19]_1 ;
  input s00_axi_rdata_20_sp_1;
  input \s00_axi_rdata[20]_0 ;
  input \s00_axi_rdata[20]_1 ;
  input s00_axi_rdata_21_sp_1;
  input \s00_axi_rdata[21]_0 ;
  input \s00_axi_rdata[21]_1 ;
  input s00_axi_rdata_22_sp_1;
  input \s00_axi_rdata[22]_0 ;
  input \s00_axi_rdata[22]_1 ;
  input s00_axi_rdata_23_sp_1;
  input \s00_axi_rdata[23]_0 ;
  input \s00_axi_rdata[23]_1 ;
  input s00_axi_rdata_24_sp_1;
  input \s00_axi_rdata[24]_0 ;
  input s00_axi_rdata_25_sp_1;
  input \s00_axi_rdata[25]_0 ;
  input s00_axi_rdata_26_sp_1;
  input \s00_axi_rdata[26]_0 ;
  input s00_axi_rdata_27_sp_1;
  input \s00_axi_rdata[27]_0 ;
  input s00_axi_rdata_28_sp_1;
  input \s00_axi_rdata[28]_0 ;
  input s00_axi_rdata_29_sp_1;
  input \s00_axi_rdata[29]_0 ;
  input s00_axi_rdata_30_sp_1;
  input \s00_axi_rdata[30]_0 ;
  input \s00_axi_rdata[30]_1 ;
  input s00_axi_rdata_31_sp_1;
  input \s00_axi_rdata[31]_0 ;
  input \s00_axi_rdata[31]_1 ;

  wire [3:0]Q;
  wire [0:0]SR;
  wire \current_t[31]_i_1_n_0 ;
  wire [23:1]data0;
  wire \error[31]_i_1_n_0 ;
  wire [1:0]\error_reg[0]_0 ;
  wire [31:0]\error_reg[31]_0 ;
  wire [31:0]heater_current_t;
  wire [31:0]heater_error;
  wire [29:29]heater_u_ctrl;
  wire [31:0]p_0_in;
  wire [31:0]p_1_in;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire [31:0]s00_axi_rdata;
  wire \s00_axi_rdata[0]_0 ;
  wire \s00_axi_rdata[0]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[0]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[10]_0 ;
  wire \s00_axi_rdata[10]_1 ;
  wire \s00_axi_rdata[10]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[11]_0 ;
  wire \s00_axi_rdata[11]_1 ;
  wire \s00_axi_rdata[11]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[12]_0 ;
  wire \s00_axi_rdata[12]_1 ;
  wire \s00_axi_rdata[12]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[13]_0 ;
  wire \s00_axi_rdata[13]_1 ;
  wire \s00_axi_rdata[13]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[14]_0 ;
  wire \s00_axi_rdata[14]_1 ;
  wire \s00_axi_rdata[14]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[15]_0 ;
  wire \s00_axi_rdata[15]_1 ;
  wire \s00_axi_rdata[15]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[16]_0 ;
  wire \s00_axi_rdata[16]_1 ;
  wire \s00_axi_rdata[16]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[17]_0 ;
  wire \s00_axi_rdata[17]_1 ;
  wire \s00_axi_rdata[17]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[18]_0 ;
  wire \s00_axi_rdata[18]_1 ;
  wire \s00_axi_rdata[18]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[19]_0 ;
  wire \s00_axi_rdata[19]_1 ;
  wire \s00_axi_rdata[19]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[1]_0 ;
  wire \s00_axi_rdata[1]_1 ;
  wire \s00_axi_rdata[1]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[20]_0 ;
  wire \s00_axi_rdata[20]_1 ;
  wire \s00_axi_rdata[20]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[21]_0 ;
  wire \s00_axi_rdata[21]_1 ;
  wire \s00_axi_rdata[21]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[22]_0 ;
  wire \s00_axi_rdata[22]_1 ;
  wire \s00_axi_rdata[22]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[23]_0 ;
  wire \s00_axi_rdata[23]_1 ;
  wire \s00_axi_rdata[23]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[24]_0 ;
  wire \s00_axi_rdata[24]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[24]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[25]_0 ;
  wire \s00_axi_rdata[25]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[25]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[26]_0 ;
  wire \s00_axi_rdata[26]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[26]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[27]_0 ;
  wire \s00_axi_rdata[27]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[27]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[28]_0 ;
  wire \s00_axi_rdata[28]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[28]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[29]_0 ;
  wire \s00_axi_rdata[29]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[29]_INST_0_i_4_n_0 ;
  wire \s00_axi_rdata[2]_0 ;
  wire \s00_axi_rdata[2]_1 ;
  wire \s00_axi_rdata[2]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[30]_0 ;
  wire \s00_axi_rdata[30]_1 ;
  wire \s00_axi_rdata[30]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[31]_0 ;
  wire \s00_axi_rdata[31]_1 ;
  wire \s00_axi_rdata[31]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[3]_0 ;
  wire \s00_axi_rdata[3]_1 ;
  wire \s00_axi_rdata[3]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[4]_0 ;
  wire \s00_axi_rdata[4]_1 ;
  wire \s00_axi_rdata[4]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[5]_0 ;
  wire \s00_axi_rdata[5]_1 ;
  wire \s00_axi_rdata[5]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[6]_0 ;
  wire \s00_axi_rdata[6]_1 ;
  wire \s00_axi_rdata[6]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[7]_0 ;
  wire \s00_axi_rdata[7]_1 ;
  wire \s00_axi_rdata[7]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[8]_0 ;
  wire \s00_axi_rdata[8]_1 ;
  wire \s00_axi_rdata[8]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[9]_0 ;
  wire \s00_axi_rdata[9]_1 ;
  wire \s00_axi_rdata[9]_INST_0_i_3_n_0 ;
  wire s00_axi_rdata_0_sn_1;
  wire s00_axi_rdata_10_sn_1;
  wire s00_axi_rdata_11_sn_1;
  wire s00_axi_rdata_12_sn_1;
  wire s00_axi_rdata_13_sn_1;
  wire s00_axi_rdata_14_sn_1;
  wire s00_axi_rdata_15_sn_1;
  wire s00_axi_rdata_16_sn_1;
  wire s00_axi_rdata_17_sn_1;
  wire s00_axi_rdata_18_sn_1;
  wire s00_axi_rdata_19_sn_1;
  wire s00_axi_rdata_1_sn_1;
  wire s00_axi_rdata_20_sn_1;
  wire s00_axi_rdata_21_sn_1;
  wire s00_axi_rdata_22_sn_1;
  wire s00_axi_rdata_23_sn_1;
  wire s00_axi_rdata_24_sn_1;
  wire s00_axi_rdata_25_sn_1;
  wire s00_axi_rdata_26_sn_1;
  wire s00_axi_rdata_27_sn_1;
  wire s00_axi_rdata_28_sn_1;
  wire s00_axi_rdata_29_sn_1;
  wire s00_axi_rdata_2_sn_1;
  wire s00_axi_rdata_30_sn_1;
  wire s00_axi_rdata_31_sn_1;
  wire s00_axi_rdata_3_sn_1;
  wire s00_axi_rdata_4_sn_1;
  wire s00_axi_rdata_5_sn_1;
  wire s00_axi_rdata_6_sn_1;
  wire s00_axi_rdata_7_sn_1;
  wire s00_axi_rdata_8_sn_1;
  wire s00_axi_rdata_9_sn_1;
  wire \temp_counter[0]_i_10_n_0 ;
  wire \temp_counter[0]_i_2_n_0 ;
  wire \temp_counter[0]_i_3_n_0 ;
  wire \temp_counter[0]_i_4_n_0 ;
  wire \temp_counter[0]_i_5_n_0 ;
  wire \temp_counter[0]_i_6_n_0 ;
  wire \temp_counter[0]_i_7_n_0 ;
  wire \temp_counter[0]_i_8_n_0 ;
  wire \temp_counter[0]_i_9_n_0 ;
  wire \temp_counter[16]_i_2_n_0 ;
  wire \temp_counter[16]_i_3_n_0 ;
  wire \temp_counter[16]_i_4_n_0 ;
  wire \temp_counter[16]_i_5_n_0 ;
  wire \temp_counter[16]_i_6_n_0 ;
  wire \temp_counter[16]_i_7_n_0 ;
  wire \temp_counter[16]_i_8_n_0 ;
  wire \temp_counter[16]_i_9_n_0 ;
  wire \temp_counter[24]_i_2_n_0 ;
  wire \temp_counter[24]_i_3_n_0 ;
  wire \temp_counter[24]_i_4_n_0 ;
  wire \temp_counter[24]_i_5_n_0 ;
  wire \temp_counter[24]_i_6_n_0 ;
  wire \temp_counter[24]_i_7_n_0 ;
  wire \temp_counter[24]_i_8_n_0 ;
  wire \temp_counter[24]_i_9_n_0 ;
  wire \temp_counter[8]_i_2_n_0 ;
  wire \temp_counter[8]_i_3_n_0 ;
  wire \temp_counter[8]_i_4_n_0 ;
  wire \temp_counter[8]_i_5_n_0 ;
  wire \temp_counter[8]_i_6_n_0 ;
  wire \temp_counter[8]_i_7_n_0 ;
  wire \temp_counter[8]_i_8_n_0 ;
  wire \temp_counter[8]_i_9_n_0 ;
  wire [31:0]temp_counter_reg;
  wire \temp_counter_reg[0]_i_1_n_0 ;
  wire \temp_counter_reg[0]_i_1_n_1 ;
  wire \temp_counter_reg[0]_i_1_n_10 ;
  wire \temp_counter_reg[0]_i_1_n_11 ;
  wire \temp_counter_reg[0]_i_1_n_12 ;
  wire \temp_counter_reg[0]_i_1_n_13 ;
  wire \temp_counter_reg[0]_i_1_n_14 ;
  wire \temp_counter_reg[0]_i_1_n_15 ;
  wire \temp_counter_reg[0]_i_1_n_2 ;
  wire \temp_counter_reg[0]_i_1_n_3 ;
  wire \temp_counter_reg[0]_i_1_n_4 ;
  wire \temp_counter_reg[0]_i_1_n_5 ;
  wire \temp_counter_reg[0]_i_1_n_6 ;
  wire \temp_counter_reg[0]_i_1_n_7 ;
  wire \temp_counter_reg[0]_i_1_n_8 ;
  wire \temp_counter_reg[0]_i_1_n_9 ;
  wire \temp_counter_reg[16]_i_1_n_0 ;
  wire \temp_counter_reg[16]_i_1_n_1 ;
  wire \temp_counter_reg[16]_i_1_n_10 ;
  wire \temp_counter_reg[16]_i_1_n_11 ;
  wire \temp_counter_reg[16]_i_1_n_12 ;
  wire \temp_counter_reg[16]_i_1_n_13 ;
  wire \temp_counter_reg[16]_i_1_n_14 ;
  wire \temp_counter_reg[16]_i_1_n_15 ;
  wire \temp_counter_reg[16]_i_1_n_2 ;
  wire \temp_counter_reg[16]_i_1_n_3 ;
  wire \temp_counter_reg[16]_i_1_n_4 ;
  wire \temp_counter_reg[16]_i_1_n_5 ;
  wire \temp_counter_reg[16]_i_1_n_6 ;
  wire \temp_counter_reg[16]_i_1_n_7 ;
  wire \temp_counter_reg[16]_i_1_n_8 ;
  wire \temp_counter_reg[16]_i_1_n_9 ;
  wire \temp_counter_reg[24]_i_1_n_1 ;
  wire \temp_counter_reg[24]_i_1_n_10 ;
  wire \temp_counter_reg[24]_i_1_n_11 ;
  wire \temp_counter_reg[24]_i_1_n_12 ;
  wire \temp_counter_reg[24]_i_1_n_13 ;
  wire \temp_counter_reg[24]_i_1_n_14 ;
  wire \temp_counter_reg[24]_i_1_n_15 ;
  wire \temp_counter_reg[24]_i_1_n_2 ;
  wire \temp_counter_reg[24]_i_1_n_3 ;
  wire \temp_counter_reg[24]_i_1_n_4 ;
  wire \temp_counter_reg[24]_i_1_n_5 ;
  wire \temp_counter_reg[24]_i_1_n_6 ;
  wire \temp_counter_reg[24]_i_1_n_7 ;
  wire \temp_counter_reg[24]_i_1_n_8 ;
  wire \temp_counter_reg[24]_i_1_n_9 ;
  wire \temp_counter_reg[8]_i_1_n_0 ;
  wire \temp_counter_reg[8]_i_1_n_1 ;
  wire \temp_counter_reg[8]_i_1_n_10 ;
  wire \temp_counter_reg[8]_i_1_n_11 ;
  wire \temp_counter_reg[8]_i_1_n_12 ;
  wire \temp_counter_reg[8]_i_1_n_13 ;
  wire \temp_counter_reg[8]_i_1_n_14 ;
  wire \temp_counter_reg[8]_i_1_n_15 ;
  wire \temp_counter_reg[8]_i_1_n_2 ;
  wire \temp_counter_reg[8]_i_1_n_3 ;
  wire \temp_counter_reg[8]_i_1_n_4 ;
  wire \temp_counter_reg[8]_i_1_n_5 ;
  wire \temp_counter_reg[8]_i_1_n_6 ;
  wire \temp_counter_reg[8]_i_1_n_7 ;
  wire \temp_counter_reg[8]_i_1_n_8 ;
  wire \temp_counter_reg[8]_i_1_n_9 ;
  wire tick_100ms;
  wire tick_100ms_reg_n_0;
  wire [23:0]tick_cnt;
  wire tick_cnt0_carry__0_n_0;
  wire tick_cnt0_carry__0_n_1;
  wire tick_cnt0_carry__0_n_2;
  wire tick_cnt0_carry__0_n_3;
  wire tick_cnt0_carry__0_n_4;
  wire tick_cnt0_carry__0_n_5;
  wire tick_cnt0_carry__0_n_6;
  wire tick_cnt0_carry__0_n_7;
  wire tick_cnt0_carry__1_n_2;
  wire tick_cnt0_carry__1_n_3;
  wire tick_cnt0_carry__1_n_4;
  wire tick_cnt0_carry__1_n_5;
  wire tick_cnt0_carry__1_n_6;
  wire tick_cnt0_carry__1_n_7;
  wire tick_cnt0_carry_n_0;
  wire tick_cnt0_carry_n_1;
  wire tick_cnt0_carry_n_2;
  wire tick_cnt0_carry_n_3;
  wire tick_cnt0_carry_n_4;
  wire tick_cnt0_carry_n_5;
  wire tick_cnt0_carry_n_6;
  wire tick_cnt0_carry_n_7;
  wire \tick_cnt[23]_i_2_n_0 ;
  wire \tick_cnt[23]_i_3_n_0 ;
  wire \tick_cnt[23]_i_4_n_0 ;
  wire \tick_cnt[23]_i_5_n_0 ;
  wire \tick_cnt[23]_i_6_n_0 ;
  wire \tick_cnt[23]_i_7_n_0 ;
  wire \tick_cnt[23]_i_8_n_0 ;
  wire \tick_cnt_reg_n_0_[0] ;
  wire \tick_cnt_reg_n_0_[10] ;
  wire \tick_cnt_reg_n_0_[11] ;
  wire \tick_cnt_reg_n_0_[12] ;
  wire \tick_cnt_reg_n_0_[13] ;
  wire \tick_cnt_reg_n_0_[14] ;
  wire \tick_cnt_reg_n_0_[15] ;
  wire \tick_cnt_reg_n_0_[16] ;
  wire \tick_cnt_reg_n_0_[17] ;
  wire \tick_cnt_reg_n_0_[18] ;
  wire \tick_cnt_reg_n_0_[19] ;
  wire \tick_cnt_reg_n_0_[1] ;
  wire \tick_cnt_reg_n_0_[20] ;
  wire \tick_cnt_reg_n_0_[21] ;
  wire \tick_cnt_reg_n_0_[22] ;
  wire \tick_cnt_reg_n_0_[23] ;
  wire \tick_cnt_reg_n_0_[2] ;
  wire \tick_cnt_reg_n_0_[3] ;
  wire \tick_cnt_reg_n_0_[4] ;
  wire \tick_cnt_reg_n_0_[5] ;
  wire \tick_cnt_reg_n_0_[6] ;
  wire \tick_cnt_reg_n_0_[7] ;
  wire \tick_cnt_reg_n_0_[8] ;
  wire \tick_cnt_reg_n_0_[9] ;
  wire \u_ctrl[29]_i_1_n_0 ;
  wire [7:7]\NLW_temp_counter_reg[24]_i_1_CO_UNCONNECTED ;
  wire [7:6]NLW_tick_cnt0_carry__1_CO_UNCONNECTED;
  wire [7:7]NLW_tick_cnt0_carry__1_O_UNCONNECTED;

  assign s00_axi_rdata_0_sn_1 = s00_axi_rdata_0_sp_1;
  assign s00_axi_rdata_10_sn_1 = s00_axi_rdata_10_sp_1;
  assign s00_axi_rdata_11_sn_1 = s00_axi_rdata_11_sp_1;
  assign s00_axi_rdata_12_sn_1 = s00_axi_rdata_12_sp_1;
  assign s00_axi_rdata_13_sn_1 = s00_axi_rdata_13_sp_1;
  assign s00_axi_rdata_14_sn_1 = s00_axi_rdata_14_sp_1;
  assign s00_axi_rdata_15_sn_1 = s00_axi_rdata_15_sp_1;
  assign s00_axi_rdata_16_sn_1 = s00_axi_rdata_16_sp_1;
  assign s00_axi_rdata_17_sn_1 = s00_axi_rdata_17_sp_1;
  assign s00_axi_rdata_18_sn_1 = s00_axi_rdata_18_sp_1;
  assign s00_axi_rdata_19_sn_1 = s00_axi_rdata_19_sp_1;
  assign s00_axi_rdata_1_sn_1 = s00_axi_rdata_1_sp_1;
  assign s00_axi_rdata_20_sn_1 = s00_axi_rdata_20_sp_1;
  assign s00_axi_rdata_21_sn_1 = s00_axi_rdata_21_sp_1;
  assign s00_axi_rdata_22_sn_1 = s00_axi_rdata_22_sp_1;
  assign s00_axi_rdata_23_sn_1 = s00_axi_rdata_23_sp_1;
  assign s00_axi_rdata_24_sn_1 = s00_axi_rdata_24_sp_1;
  assign s00_axi_rdata_25_sn_1 = s00_axi_rdata_25_sp_1;
  assign s00_axi_rdata_26_sn_1 = s00_axi_rdata_26_sp_1;
  assign s00_axi_rdata_27_sn_1 = s00_axi_rdata_27_sp_1;
  assign s00_axi_rdata_28_sn_1 = s00_axi_rdata_28_sp_1;
  assign s00_axi_rdata_29_sn_1 = s00_axi_rdata_29_sp_1;
  assign s00_axi_rdata_2_sn_1 = s00_axi_rdata_2_sp_1;
  assign s00_axi_rdata_30_sn_1 = s00_axi_rdata_30_sp_1;
  assign s00_axi_rdata_31_sn_1 = s00_axi_rdata_31_sp_1;
  assign s00_axi_rdata_3_sn_1 = s00_axi_rdata_3_sp_1;
  assign s00_axi_rdata_4_sn_1 = s00_axi_rdata_4_sp_1;
  assign s00_axi_rdata_5_sn_1 = s00_axi_rdata_5_sp_1;
  assign s00_axi_rdata_6_sn_1 = s00_axi_rdata_6_sp_1;
  assign s00_axi_rdata_7_sn_1 = s00_axi_rdata_7_sp_1;
  assign s00_axi_rdata_8_sn_1 = s00_axi_rdata_8_sp_1;
  assign s00_axi_rdata_9_sn_1 = s00_axi_rdata_9_sp_1;
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[0]_i_1 
       (.I0(temp_counter_reg[0]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[10]_i_1 
       (.I0(temp_counter_reg[10]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[11]_i_1 
       (.I0(temp_counter_reg[11]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[12]_i_1 
       (.I0(temp_counter_reg[12]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[13]_i_1 
       (.I0(temp_counter_reg[13]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[14]_i_1 
       (.I0(temp_counter_reg[14]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[15]_i_1 
       (.I0(temp_counter_reg[15]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[16]_i_1 
       (.I0(temp_counter_reg[16]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[17]_i_1 
       (.I0(temp_counter_reg[17]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[18]_i_1 
       (.I0(temp_counter_reg[18]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[19]_i_1 
       (.I0(temp_counter_reg[19]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[1]_i_1 
       (.I0(temp_counter_reg[1]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[20]_i_1 
       (.I0(temp_counter_reg[20]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[21]_i_1 
       (.I0(temp_counter_reg[21]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[22]_i_1 
       (.I0(temp_counter_reg[22]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[23]_i_1 
       (.I0(temp_counter_reg[23]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[24]_i_1 
       (.I0(temp_counter_reg[24]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[25]_i_1 
       (.I0(temp_counter_reg[25]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[26]_i_1 
       (.I0(temp_counter_reg[26]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[27]_i_1 
       (.I0(temp_counter_reg[27]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[28]_i_1 
       (.I0(temp_counter_reg[28]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[29]_i_1 
       (.I0(temp_counter_reg[29]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[2]_i_1 
       (.I0(temp_counter_reg[2]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[30]_i_1 
       (.I0(temp_counter_reg[30]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[30]));
  LUT3 #(
    .INIT(8'hEA)) 
    \current_t[31]_i_1 
       (.I0(\error_reg[0]_0 [1]),
        .I1(tick_100ms_reg_n_0),
        .I2(\error_reg[0]_0 [0]),
        .O(\current_t[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[31]_i_2 
       (.I0(temp_counter_reg[31]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[3]_i_1 
       (.I0(temp_counter_reg[3]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[4]_i_1 
       (.I0(temp_counter_reg[4]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[5]_i_1 
       (.I0(temp_counter_reg[5]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[6]_i_1 
       (.I0(temp_counter_reg[6]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[7]_i_1 
       (.I0(temp_counter_reg[7]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[8]_i_1 
       (.I0(temp_counter_reg[8]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \current_t[9]_i_1 
       (.I0(temp_counter_reg[9]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_0_in[9]));
  FDCE \current_t_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[0]),
        .Q(heater_current_t[0]));
  FDCE \current_t_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[10]),
        .Q(heater_current_t[10]));
  FDCE \current_t_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[11]),
        .Q(heater_current_t[11]));
  FDCE \current_t_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[12]),
        .Q(heater_current_t[12]));
  FDCE \current_t_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[13]),
        .Q(heater_current_t[13]));
  FDCE \current_t_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[14]),
        .Q(heater_current_t[14]));
  FDCE \current_t_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[15]),
        .Q(heater_current_t[15]));
  FDCE \current_t_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[16]),
        .Q(heater_current_t[16]));
  FDCE \current_t_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[17]),
        .Q(heater_current_t[17]));
  FDCE \current_t_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[18]),
        .Q(heater_current_t[18]));
  FDCE \current_t_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[19]),
        .Q(heater_current_t[19]));
  FDCE \current_t_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[1]),
        .Q(heater_current_t[1]));
  FDCE \current_t_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[20]),
        .Q(heater_current_t[20]));
  FDCE \current_t_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[21]),
        .Q(heater_current_t[21]));
  FDCE \current_t_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[22]),
        .Q(heater_current_t[22]));
  FDCE \current_t_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[23]),
        .Q(heater_current_t[23]));
  FDCE \current_t_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[24]),
        .Q(heater_current_t[24]));
  FDCE \current_t_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[25]),
        .Q(heater_current_t[25]));
  FDCE \current_t_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[26]),
        .Q(heater_current_t[26]));
  FDCE \current_t_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[27]),
        .Q(heater_current_t[27]));
  FDCE \current_t_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[28]),
        .Q(heater_current_t[28]));
  FDCE \current_t_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[29]),
        .Q(heater_current_t[29]));
  FDCE \current_t_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[2]),
        .Q(heater_current_t[2]));
  FDCE \current_t_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[30]),
        .Q(heater_current_t[30]));
  FDCE \current_t_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[31]),
        .Q(heater_current_t[31]));
  FDCE \current_t_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[3]),
        .Q(heater_current_t[3]));
  FDCE \current_t_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[4]),
        .Q(heater_current_t[4]));
  FDCE \current_t_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[5]),
        .Q(heater_current_t[5]));
  FDCE \current_t_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[6]),
        .Q(heater_current_t[6]));
  FDCE \current_t_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[7]),
        .Q(heater_current_t[7]));
  FDCE \current_t_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[8]),
        .Q(heater_current_t[8]));
  FDCE \current_t_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_0_in[9]),
        .Q(heater_current_t[9]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[0]_i_1 
       (.I0(\error_reg[31]_0 [0]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[10]_i_1 
       (.I0(\error_reg[31]_0 [10]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[11]_i_1 
       (.I0(\error_reg[31]_0 [11]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[12]_i_1 
       (.I0(\error_reg[31]_0 [12]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[13]_i_1 
       (.I0(\error_reg[31]_0 [13]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[14]_i_1 
       (.I0(\error_reg[31]_0 [14]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[15]_i_1 
       (.I0(\error_reg[31]_0 [15]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[16]_i_1 
       (.I0(\error_reg[31]_0 [16]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[17]_i_1 
       (.I0(\error_reg[31]_0 [17]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[18]_i_1 
       (.I0(\error_reg[31]_0 [18]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[19]_i_1 
       (.I0(\error_reg[31]_0 [19]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[1]_i_1 
       (.I0(\error_reg[31]_0 [1]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[20]_i_1 
       (.I0(\error_reg[31]_0 [20]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[21]_i_1 
       (.I0(\error_reg[31]_0 [21]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[22]_i_1 
       (.I0(\error_reg[31]_0 [22]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[23]_i_1 
       (.I0(\error_reg[31]_0 [23]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[24]_i_1 
       (.I0(\error_reg[31]_0 [24]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[25]_i_1 
       (.I0(\error_reg[31]_0 [25]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[26]_i_1 
       (.I0(\error_reg[31]_0 [26]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[27]_i_1 
       (.I0(\error_reg[31]_0 [27]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[28]_i_1 
       (.I0(\error_reg[31]_0 [28]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[29]_i_1 
       (.I0(\error_reg[31]_0 [29]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[2]_i_1 
       (.I0(\error_reg[31]_0 [2]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[30]_i_1 
       (.I0(\error_reg[31]_0 [30]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[30]));
  LUT2 #(
    .INIT(4'hE)) 
    \error[31]_i_1 
       (.I0(\error_reg[0]_0 [1]),
        .I1(\error_reg[0]_0 [0]),
        .O(\error[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[31]_i_2 
       (.I0(\error_reg[31]_0 [31]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[3]_i_1 
       (.I0(\error_reg[31]_0 [3]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[4]_i_1 
       (.I0(\error_reg[31]_0 [4]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[5]_i_1 
       (.I0(\error_reg[31]_0 [5]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[6]_i_1 
       (.I0(\error_reg[31]_0 [6]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[7]_i_1 
       (.I0(\error_reg[31]_0 [7]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[8]_i_1 
       (.I0(\error_reg[31]_0 [8]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \error[9]_i_1 
       (.I0(\error_reg[31]_0 [9]),
        .I1(\error_reg[0]_0 [1]),
        .O(p_1_in[9]));
  FDCE \error_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[0]),
        .Q(heater_error[0]));
  FDCE \error_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[10]),
        .Q(heater_error[10]));
  FDCE \error_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[11]),
        .Q(heater_error[11]));
  FDCE \error_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[12]),
        .Q(heater_error[12]));
  FDCE \error_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[13]),
        .Q(heater_error[13]));
  FDCE \error_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[14]),
        .Q(heater_error[14]));
  FDCE \error_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[15]),
        .Q(heater_error[15]));
  FDCE \error_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[16]),
        .Q(heater_error[16]));
  FDCE \error_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[17]),
        .Q(heater_error[17]));
  FDCE \error_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[18]),
        .Q(heater_error[18]));
  FDCE \error_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[19]),
        .Q(heater_error[19]));
  FDCE \error_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[1]),
        .Q(heater_error[1]));
  FDCE \error_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[20]),
        .Q(heater_error[20]));
  FDCE \error_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[21]),
        .Q(heater_error[21]));
  FDCE \error_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[22]),
        .Q(heater_error[22]));
  FDCE \error_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[23]),
        .Q(heater_error[23]));
  FDCE \error_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[24]),
        .Q(heater_error[24]));
  FDCE \error_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[25]),
        .Q(heater_error[25]));
  FDCE \error_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[26]),
        .Q(heater_error[26]));
  FDCE \error_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[27]),
        .Q(heater_error[27]));
  FDCE \error_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[28]),
        .Q(heater_error[28]));
  FDCE \error_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[29]),
        .Q(heater_error[29]));
  FDCE \error_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[2]),
        .Q(heater_error[2]));
  FDCE \error_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[30]),
        .Q(heater_error[30]));
  FDCE \error_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[31]),
        .Q(heater_error[31]));
  FDCE \error_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[3]),
        .Q(heater_error[3]));
  FDCE \error_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[4]),
        .Q(heater_error[4]));
  FDCE \error_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[5]),
        .Q(heater_error[5]));
  FDCE \error_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[6]),
        .Q(heater_error[6]));
  FDCE \error_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[7]),
        .Q(heater_error[7]));
  FDCE \error_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[8]),
        .Q(heater_error[8]));
  FDCE \error_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\error[31]_i_1_n_0 ),
        .CLR(SR),
        .D(p_1_in[9]),
        .Q(heater_error[9]));
  MUXF8 \s00_axi_rdata[0]_INST_0 
       (.I0(\s00_axi_rdata[0]_INST_0_i_1_n_0 ),
        .I1(s00_axi_rdata_0_sn_1),
        .O(s00_axi_rdata[0]),
        .S(Q[3]));
  MUXF7 \s00_axi_rdata[0]_INST_0_i_1 
       (.I0(\s00_axi_rdata[0]_0 ),
        .I1(\s00_axi_rdata[0]_INST_0_i_4_n_0 ),
        .O(\s00_axi_rdata[0]_INST_0_i_1_n_0 ),
        .S(Q[2]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \s00_axi_rdata[0]_INST_0_i_4 
       (.I0(heater_u_ctrl),
        .I1(Q[1]),
        .I2(heater_error[0]),
        .I3(Q[0]),
        .I4(heater_current_t[0]),
        .O(\s00_axi_rdata[0]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[10]_INST_0 
       (.I0(s00_axi_rdata_10_sn_1),
        .I1(\s00_axi_rdata[10]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[10]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[10]_1 ),
        .O(s00_axi_rdata[10]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[10]_INST_0_i_3 
       (.I0(heater_current_t[10]),
        .I1(Q[0]),
        .I2(heater_error[10]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[10]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[11]_INST_0 
       (.I0(s00_axi_rdata_11_sn_1),
        .I1(\s00_axi_rdata[11]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[11]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[11]_1 ),
        .O(s00_axi_rdata[11]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[11]_INST_0_i_3 
       (.I0(heater_current_t[11]),
        .I1(Q[0]),
        .I2(heater_error[11]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[11]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[12]_INST_0 
       (.I0(s00_axi_rdata_12_sn_1),
        .I1(\s00_axi_rdata[12]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[12]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[12]_1 ),
        .O(s00_axi_rdata[12]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[12]_INST_0_i_3 
       (.I0(heater_current_t[12]),
        .I1(Q[0]),
        .I2(heater_error[12]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[12]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[13]_INST_0 
       (.I0(s00_axi_rdata_13_sn_1),
        .I1(\s00_axi_rdata[13]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[13]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[13]_1 ),
        .O(s00_axi_rdata[13]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[13]_INST_0_i_3 
       (.I0(heater_current_t[13]),
        .I1(Q[0]),
        .I2(heater_error[13]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[13]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[14]_INST_0 
       (.I0(s00_axi_rdata_14_sn_1),
        .I1(\s00_axi_rdata[14]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[14]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[14]_1 ),
        .O(s00_axi_rdata[14]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[14]_INST_0_i_3 
       (.I0(heater_current_t[14]),
        .I1(Q[0]),
        .I2(heater_error[14]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[14]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[15]_INST_0 
       (.I0(s00_axi_rdata_15_sn_1),
        .I1(\s00_axi_rdata[15]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[15]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[15]_1 ),
        .O(s00_axi_rdata[15]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[15]_INST_0_i_3 
       (.I0(heater_current_t[15]),
        .I1(Q[0]),
        .I2(heater_error[15]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[15]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[16]_INST_0 
       (.I0(s00_axi_rdata_16_sn_1),
        .I1(\s00_axi_rdata[16]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[16]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[16]_1 ),
        .O(s00_axi_rdata[16]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[16]_INST_0_i_3 
       (.I0(heater_current_t[16]),
        .I1(Q[0]),
        .I2(heater_error[16]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[16]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[17]_INST_0 
       (.I0(s00_axi_rdata_17_sn_1),
        .I1(\s00_axi_rdata[17]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[17]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[17]_1 ),
        .O(s00_axi_rdata[17]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[17]_INST_0_i_3 
       (.I0(heater_current_t[17]),
        .I1(Q[0]),
        .I2(heater_error[17]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[17]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[18]_INST_0 
       (.I0(s00_axi_rdata_18_sn_1),
        .I1(\s00_axi_rdata[18]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[18]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[18]_1 ),
        .O(s00_axi_rdata[18]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[18]_INST_0_i_3 
       (.I0(heater_current_t[18]),
        .I1(Q[0]),
        .I2(heater_error[18]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[18]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[19]_INST_0 
       (.I0(s00_axi_rdata_19_sn_1),
        .I1(\s00_axi_rdata[19]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[19]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[19]_1 ),
        .O(s00_axi_rdata[19]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[19]_INST_0_i_3 
       (.I0(heater_current_t[19]),
        .I1(Q[0]),
        .I2(heater_error[19]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[19]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[1]_INST_0 
       (.I0(s00_axi_rdata_1_sn_1),
        .I1(\s00_axi_rdata[1]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[1]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[1]_1 ),
        .O(s00_axi_rdata[1]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[1]_INST_0_i_3 
       (.I0(heater_current_t[1]),
        .I1(Q[0]),
        .I2(heater_error[1]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[1]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[20]_INST_0 
       (.I0(s00_axi_rdata_20_sn_1),
        .I1(\s00_axi_rdata[20]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[20]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[20]_1 ),
        .O(s00_axi_rdata[20]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[20]_INST_0_i_3 
       (.I0(heater_current_t[20]),
        .I1(Q[0]),
        .I2(heater_error[20]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[20]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[21]_INST_0 
       (.I0(s00_axi_rdata_21_sn_1),
        .I1(\s00_axi_rdata[21]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[21]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[21]_1 ),
        .O(s00_axi_rdata[21]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[21]_INST_0_i_3 
       (.I0(heater_current_t[21]),
        .I1(Q[0]),
        .I2(heater_error[21]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[21]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[22]_INST_0 
       (.I0(s00_axi_rdata_22_sn_1),
        .I1(\s00_axi_rdata[22]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[22]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[22]_1 ),
        .O(s00_axi_rdata[22]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[22]_INST_0_i_3 
       (.I0(heater_current_t[22]),
        .I1(Q[0]),
        .I2(heater_error[22]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[22]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[23]_INST_0 
       (.I0(s00_axi_rdata_23_sn_1),
        .I1(\s00_axi_rdata[23]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[23]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[23]_1 ),
        .O(s00_axi_rdata[23]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[23]_INST_0_i_3 
       (.I0(heater_current_t[23]),
        .I1(Q[0]),
        .I2(heater_error[23]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[23]_INST_0_i_3_n_0 ));
  MUXF8 \s00_axi_rdata[24]_INST_0 
       (.I0(\s00_axi_rdata[24]_INST_0_i_1_n_0 ),
        .I1(s00_axi_rdata_24_sn_1),
        .O(s00_axi_rdata[24]),
        .S(Q[3]));
  MUXF7 \s00_axi_rdata[24]_INST_0_i_1 
       (.I0(\s00_axi_rdata[24]_0 ),
        .I1(\s00_axi_rdata[24]_INST_0_i_4_n_0 ),
        .O(\s00_axi_rdata[24]_INST_0_i_1_n_0 ),
        .S(Q[2]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[24]_INST_0_i_4 
       (.I0(heater_u_ctrl),
        .I1(Q[1]),
        .I2(heater_error[24]),
        .I3(Q[0]),
        .I4(heater_current_t[24]),
        .O(\s00_axi_rdata[24]_INST_0_i_4_n_0 ));
  MUXF8 \s00_axi_rdata[25]_INST_0 
       (.I0(\s00_axi_rdata[25]_INST_0_i_1_n_0 ),
        .I1(s00_axi_rdata_25_sn_1),
        .O(s00_axi_rdata[25]),
        .S(Q[3]));
  MUXF7 \s00_axi_rdata[25]_INST_0_i_1 
       (.I0(\s00_axi_rdata[25]_0 ),
        .I1(\s00_axi_rdata[25]_INST_0_i_4_n_0 ),
        .O(\s00_axi_rdata[25]_INST_0_i_1_n_0 ),
        .S(Q[2]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[25]_INST_0_i_4 
       (.I0(heater_u_ctrl),
        .I1(Q[1]),
        .I2(heater_error[25]),
        .I3(Q[0]),
        .I4(heater_current_t[25]),
        .O(\s00_axi_rdata[25]_INST_0_i_4_n_0 ));
  MUXF8 \s00_axi_rdata[26]_INST_0 
       (.I0(\s00_axi_rdata[26]_INST_0_i_1_n_0 ),
        .I1(s00_axi_rdata_26_sn_1),
        .O(s00_axi_rdata[26]),
        .S(Q[3]));
  MUXF7 \s00_axi_rdata[26]_INST_0_i_1 
       (.I0(\s00_axi_rdata[26]_0 ),
        .I1(\s00_axi_rdata[26]_INST_0_i_4_n_0 ),
        .O(\s00_axi_rdata[26]_INST_0_i_1_n_0 ),
        .S(Q[2]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[26]_INST_0_i_4 
       (.I0(heater_u_ctrl),
        .I1(Q[1]),
        .I2(heater_error[26]),
        .I3(Q[0]),
        .I4(heater_current_t[26]),
        .O(\s00_axi_rdata[26]_INST_0_i_4_n_0 ));
  MUXF8 \s00_axi_rdata[27]_INST_0 
       (.I0(\s00_axi_rdata[27]_INST_0_i_1_n_0 ),
        .I1(s00_axi_rdata_27_sn_1),
        .O(s00_axi_rdata[27]),
        .S(Q[3]));
  MUXF7 \s00_axi_rdata[27]_INST_0_i_1 
       (.I0(\s00_axi_rdata[27]_0 ),
        .I1(\s00_axi_rdata[27]_INST_0_i_4_n_0 ),
        .O(\s00_axi_rdata[27]_INST_0_i_1_n_0 ),
        .S(Q[2]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[27]_INST_0_i_4 
       (.I0(heater_u_ctrl),
        .I1(Q[1]),
        .I2(heater_error[27]),
        .I3(Q[0]),
        .I4(heater_current_t[27]),
        .O(\s00_axi_rdata[27]_INST_0_i_4_n_0 ));
  MUXF8 \s00_axi_rdata[28]_INST_0 
       (.I0(\s00_axi_rdata[28]_INST_0_i_1_n_0 ),
        .I1(s00_axi_rdata_28_sn_1),
        .O(s00_axi_rdata[28]),
        .S(Q[3]));
  MUXF7 \s00_axi_rdata[28]_INST_0_i_1 
       (.I0(\s00_axi_rdata[28]_0 ),
        .I1(\s00_axi_rdata[28]_INST_0_i_4_n_0 ),
        .O(\s00_axi_rdata[28]_INST_0_i_1_n_0 ),
        .S(Q[2]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[28]_INST_0_i_4 
       (.I0(heater_u_ctrl),
        .I1(Q[1]),
        .I2(heater_error[28]),
        .I3(Q[0]),
        .I4(heater_current_t[28]),
        .O(\s00_axi_rdata[28]_INST_0_i_4_n_0 ));
  MUXF8 \s00_axi_rdata[29]_INST_0 
       (.I0(\s00_axi_rdata[29]_INST_0_i_1_n_0 ),
        .I1(s00_axi_rdata_29_sn_1),
        .O(s00_axi_rdata[29]),
        .S(Q[3]));
  MUXF7 \s00_axi_rdata[29]_INST_0_i_1 
       (.I0(\s00_axi_rdata[29]_0 ),
        .I1(\s00_axi_rdata[29]_INST_0_i_4_n_0 ),
        .O(\s00_axi_rdata[29]_INST_0_i_1_n_0 ),
        .S(Q[2]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \s00_axi_rdata[29]_INST_0_i_4 
       (.I0(heater_u_ctrl),
        .I1(Q[1]),
        .I2(heater_error[29]),
        .I3(Q[0]),
        .I4(heater_current_t[29]),
        .O(\s00_axi_rdata[29]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[2]_INST_0 
       (.I0(s00_axi_rdata_2_sn_1),
        .I1(\s00_axi_rdata[2]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[2]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[2]_1 ),
        .O(s00_axi_rdata[2]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[2]_INST_0_i_3 
       (.I0(heater_current_t[2]),
        .I1(Q[0]),
        .I2(heater_error[2]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[2]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[30]_INST_0 
       (.I0(s00_axi_rdata_30_sn_1),
        .I1(\s00_axi_rdata[30]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[30]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[30]_1 ),
        .O(s00_axi_rdata[30]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[30]_INST_0_i_3 
       (.I0(heater_current_t[30]),
        .I1(Q[0]),
        .I2(heater_error[30]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[30]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[31]_INST_0 
       (.I0(s00_axi_rdata_31_sn_1),
        .I1(\s00_axi_rdata[31]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[31]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[31]_1 ),
        .O(s00_axi_rdata[31]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[31]_INST_0_i_3 
       (.I0(heater_current_t[31]),
        .I1(Q[0]),
        .I2(heater_error[31]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[31]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[3]_INST_0 
       (.I0(s00_axi_rdata_3_sn_1),
        .I1(\s00_axi_rdata[3]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[3]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[3]_1 ),
        .O(s00_axi_rdata[3]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[3]_INST_0_i_3 
       (.I0(heater_current_t[3]),
        .I1(Q[0]),
        .I2(heater_error[3]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[3]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[4]_INST_0 
       (.I0(s00_axi_rdata_4_sn_1),
        .I1(\s00_axi_rdata[4]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[4]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[4]_1 ),
        .O(s00_axi_rdata[4]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[4]_INST_0_i_3 
       (.I0(heater_current_t[4]),
        .I1(Q[0]),
        .I2(heater_error[4]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[4]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[5]_INST_0 
       (.I0(s00_axi_rdata_5_sn_1),
        .I1(\s00_axi_rdata[5]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[5]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[5]_1 ),
        .O(s00_axi_rdata[5]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[5]_INST_0_i_3 
       (.I0(heater_current_t[5]),
        .I1(Q[0]),
        .I2(heater_error[5]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[5]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[6]_INST_0 
       (.I0(s00_axi_rdata_6_sn_1),
        .I1(\s00_axi_rdata[6]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[6]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[6]_1 ),
        .O(s00_axi_rdata[6]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[6]_INST_0_i_3 
       (.I0(heater_current_t[6]),
        .I1(Q[0]),
        .I2(heater_error[6]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[6]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[7]_INST_0 
       (.I0(s00_axi_rdata_7_sn_1),
        .I1(\s00_axi_rdata[7]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[7]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[7]_1 ),
        .O(s00_axi_rdata[7]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[7]_INST_0_i_3 
       (.I0(heater_current_t[7]),
        .I1(Q[0]),
        .I2(heater_error[7]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[7]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[8]_INST_0 
       (.I0(s00_axi_rdata_8_sn_1),
        .I1(\s00_axi_rdata[8]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[8]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[8]_1 ),
        .O(s00_axi_rdata[8]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[8]_INST_0_i_3 
       (.I0(heater_current_t[8]),
        .I1(Q[0]),
        .I2(heater_error[8]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[8]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[9]_INST_0 
       (.I0(s00_axi_rdata_9_sn_1),
        .I1(\s00_axi_rdata[9]_0 ),
        .I2(Q[3]),
        .I3(\s00_axi_rdata[9]_INST_0_i_3_n_0 ),
        .I4(Q[2]),
        .I5(\s00_axi_rdata[9]_1 ),
        .O(s00_axi_rdata[9]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \s00_axi_rdata[9]_INST_0_i_3 
       (.I0(heater_current_t[9]),
        .I1(Q[0]),
        .I2(heater_error[9]),
        .I3(Q[1]),
        .O(\s00_axi_rdata[9]_INST_0_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \temp_counter[0]_i_10 
       (.I0(temp_counter_reg[0]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[0]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[0]_i_2 
       (.I0(temp_counter_reg[0]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[0]_i_3 
       (.I0(temp_counter_reg[7]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[0]_i_4 
       (.I0(temp_counter_reg[6]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[0]_i_5 
       (.I0(temp_counter_reg[5]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[0]_i_6 
       (.I0(temp_counter_reg[4]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[0]_i_7 
       (.I0(temp_counter_reg[3]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[0]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[0]_i_8 
       (.I0(temp_counter_reg[2]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[0]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[0]_i_9 
       (.I0(temp_counter_reg[1]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[0]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[16]_i_2 
       (.I0(temp_counter_reg[23]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[16]_i_3 
       (.I0(temp_counter_reg[22]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[16]_i_4 
       (.I0(temp_counter_reg[21]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[16]_i_5 
       (.I0(temp_counter_reg[20]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[16]_i_6 
       (.I0(temp_counter_reg[19]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[16]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[16]_i_7 
       (.I0(temp_counter_reg[18]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[16]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[16]_i_8 
       (.I0(temp_counter_reg[17]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[16]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[16]_i_9 
       (.I0(temp_counter_reg[16]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[16]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[24]_i_2 
       (.I0(temp_counter_reg[31]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[24]_i_3 
       (.I0(temp_counter_reg[30]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[24]_i_4 
       (.I0(temp_counter_reg[29]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[24]_i_5 
       (.I0(temp_counter_reg[28]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[24]_i_6 
       (.I0(temp_counter_reg[27]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[24]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[24]_i_7 
       (.I0(temp_counter_reg[26]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[24]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[24]_i_8 
       (.I0(temp_counter_reg[25]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[24]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[24]_i_9 
       (.I0(temp_counter_reg[24]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[24]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[8]_i_2 
       (.I0(temp_counter_reg[15]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[8]_i_3 
       (.I0(temp_counter_reg[14]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[8]_i_4 
       (.I0(temp_counter_reg[13]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[8]_i_5 
       (.I0(temp_counter_reg[12]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[8]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[8]_i_6 
       (.I0(temp_counter_reg[11]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[8]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[8]_i_7 
       (.I0(temp_counter_reg[10]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[8]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[8]_i_8 
       (.I0(temp_counter_reg[9]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[8]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \temp_counter[8]_i_9 
       (.I0(temp_counter_reg[8]),
        .I1(\error_reg[0]_0 [1]),
        .O(\temp_counter[8]_i_9_n_0 ));
  FDCE \temp_counter_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[0]_i_1_n_15 ),
        .Q(temp_counter_reg[0]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \temp_counter_reg[0]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\temp_counter_reg[0]_i_1_n_0 ,\temp_counter_reg[0]_i_1_n_1 ,\temp_counter_reg[0]_i_1_n_2 ,\temp_counter_reg[0]_i_1_n_3 ,\temp_counter_reg[0]_i_1_n_4 ,\temp_counter_reg[0]_i_1_n_5 ,\temp_counter_reg[0]_i_1_n_6 ,\temp_counter_reg[0]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\temp_counter[0]_i_2_n_0 }),
        .O({\temp_counter_reg[0]_i_1_n_8 ,\temp_counter_reg[0]_i_1_n_9 ,\temp_counter_reg[0]_i_1_n_10 ,\temp_counter_reg[0]_i_1_n_11 ,\temp_counter_reg[0]_i_1_n_12 ,\temp_counter_reg[0]_i_1_n_13 ,\temp_counter_reg[0]_i_1_n_14 ,\temp_counter_reg[0]_i_1_n_15 }),
        .S({\temp_counter[0]_i_3_n_0 ,\temp_counter[0]_i_4_n_0 ,\temp_counter[0]_i_5_n_0 ,\temp_counter[0]_i_6_n_0 ,\temp_counter[0]_i_7_n_0 ,\temp_counter[0]_i_8_n_0 ,\temp_counter[0]_i_9_n_0 ,\temp_counter[0]_i_10_n_0 }));
  FDCE \temp_counter_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[8]_i_1_n_13 ),
        .Q(temp_counter_reg[10]));
  FDCE \temp_counter_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[8]_i_1_n_12 ),
        .Q(temp_counter_reg[11]));
  FDCE \temp_counter_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[8]_i_1_n_11 ),
        .Q(temp_counter_reg[12]));
  FDCE \temp_counter_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[8]_i_1_n_10 ),
        .Q(temp_counter_reg[13]));
  FDCE \temp_counter_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[8]_i_1_n_9 ),
        .Q(temp_counter_reg[14]));
  FDCE \temp_counter_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[8]_i_1_n_8 ),
        .Q(temp_counter_reg[15]));
  FDCE \temp_counter_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[16]_i_1_n_15 ),
        .Q(temp_counter_reg[16]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \temp_counter_reg[16]_i_1 
       (.CI(\temp_counter_reg[8]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\temp_counter_reg[16]_i_1_n_0 ,\temp_counter_reg[16]_i_1_n_1 ,\temp_counter_reg[16]_i_1_n_2 ,\temp_counter_reg[16]_i_1_n_3 ,\temp_counter_reg[16]_i_1_n_4 ,\temp_counter_reg[16]_i_1_n_5 ,\temp_counter_reg[16]_i_1_n_6 ,\temp_counter_reg[16]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\temp_counter_reg[16]_i_1_n_8 ,\temp_counter_reg[16]_i_1_n_9 ,\temp_counter_reg[16]_i_1_n_10 ,\temp_counter_reg[16]_i_1_n_11 ,\temp_counter_reg[16]_i_1_n_12 ,\temp_counter_reg[16]_i_1_n_13 ,\temp_counter_reg[16]_i_1_n_14 ,\temp_counter_reg[16]_i_1_n_15 }),
        .S({\temp_counter[16]_i_2_n_0 ,\temp_counter[16]_i_3_n_0 ,\temp_counter[16]_i_4_n_0 ,\temp_counter[16]_i_5_n_0 ,\temp_counter[16]_i_6_n_0 ,\temp_counter[16]_i_7_n_0 ,\temp_counter[16]_i_8_n_0 ,\temp_counter[16]_i_9_n_0 }));
  FDCE \temp_counter_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[16]_i_1_n_14 ),
        .Q(temp_counter_reg[17]));
  FDCE \temp_counter_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[16]_i_1_n_13 ),
        .Q(temp_counter_reg[18]));
  FDCE \temp_counter_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[16]_i_1_n_12 ),
        .Q(temp_counter_reg[19]));
  FDCE \temp_counter_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[0]_i_1_n_14 ),
        .Q(temp_counter_reg[1]));
  FDCE \temp_counter_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[16]_i_1_n_11 ),
        .Q(temp_counter_reg[20]));
  FDCE \temp_counter_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[16]_i_1_n_10 ),
        .Q(temp_counter_reg[21]));
  FDCE \temp_counter_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[16]_i_1_n_9 ),
        .Q(temp_counter_reg[22]));
  FDCE \temp_counter_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[16]_i_1_n_8 ),
        .Q(temp_counter_reg[23]));
  FDCE \temp_counter_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[24]_i_1_n_15 ),
        .Q(temp_counter_reg[24]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \temp_counter_reg[24]_i_1 
       (.CI(\temp_counter_reg[16]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_temp_counter_reg[24]_i_1_CO_UNCONNECTED [7],\temp_counter_reg[24]_i_1_n_1 ,\temp_counter_reg[24]_i_1_n_2 ,\temp_counter_reg[24]_i_1_n_3 ,\temp_counter_reg[24]_i_1_n_4 ,\temp_counter_reg[24]_i_1_n_5 ,\temp_counter_reg[24]_i_1_n_6 ,\temp_counter_reg[24]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\temp_counter_reg[24]_i_1_n_8 ,\temp_counter_reg[24]_i_1_n_9 ,\temp_counter_reg[24]_i_1_n_10 ,\temp_counter_reg[24]_i_1_n_11 ,\temp_counter_reg[24]_i_1_n_12 ,\temp_counter_reg[24]_i_1_n_13 ,\temp_counter_reg[24]_i_1_n_14 ,\temp_counter_reg[24]_i_1_n_15 }),
        .S({\temp_counter[24]_i_2_n_0 ,\temp_counter[24]_i_3_n_0 ,\temp_counter[24]_i_4_n_0 ,\temp_counter[24]_i_5_n_0 ,\temp_counter[24]_i_6_n_0 ,\temp_counter[24]_i_7_n_0 ,\temp_counter[24]_i_8_n_0 ,\temp_counter[24]_i_9_n_0 }));
  FDCE \temp_counter_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[24]_i_1_n_14 ),
        .Q(temp_counter_reg[25]));
  FDCE \temp_counter_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[24]_i_1_n_13 ),
        .Q(temp_counter_reg[26]));
  FDCE \temp_counter_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[24]_i_1_n_12 ),
        .Q(temp_counter_reg[27]));
  FDCE \temp_counter_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[24]_i_1_n_11 ),
        .Q(temp_counter_reg[28]));
  FDCE \temp_counter_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[24]_i_1_n_10 ),
        .Q(temp_counter_reg[29]));
  FDCE \temp_counter_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[0]_i_1_n_13 ),
        .Q(temp_counter_reg[2]));
  FDCE \temp_counter_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[24]_i_1_n_9 ),
        .Q(temp_counter_reg[30]));
  FDCE \temp_counter_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[24]_i_1_n_8 ),
        .Q(temp_counter_reg[31]));
  FDCE \temp_counter_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[0]_i_1_n_12 ),
        .Q(temp_counter_reg[3]));
  FDCE \temp_counter_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[0]_i_1_n_11 ),
        .Q(temp_counter_reg[4]));
  FDCE \temp_counter_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[0]_i_1_n_10 ),
        .Q(temp_counter_reg[5]));
  FDCE \temp_counter_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[0]_i_1_n_9 ),
        .Q(temp_counter_reg[6]));
  FDCE \temp_counter_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[0]_i_1_n_8 ),
        .Q(temp_counter_reg[7]));
  FDCE \temp_counter_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[8]_i_1_n_15 ),
        .Q(temp_counter_reg[8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \temp_counter_reg[8]_i_1 
       (.CI(\temp_counter_reg[0]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\temp_counter_reg[8]_i_1_n_0 ,\temp_counter_reg[8]_i_1_n_1 ,\temp_counter_reg[8]_i_1_n_2 ,\temp_counter_reg[8]_i_1_n_3 ,\temp_counter_reg[8]_i_1_n_4 ,\temp_counter_reg[8]_i_1_n_5 ,\temp_counter_reg[8]_i_1_n_6 ,\temp_counter_reg[8]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\temp_counter_reg[8]_i_1_n_8 ,\temp_counter_reg[8]_i_1_n_9 ,\temp_counter_reg[8]_i_1_n_10 ,\temp_counter_reg[8]_i_1_n_11 ,\temp_counter_reg[8]_i_1_n_12 ,\temp_counter_reg[8]_i_1_n_13 ,\temp_counter_reg[8]_i_1_n_14 ,\temp_counter_reg[8]_i_1_n_15 }),
        .S({\temp_counter[8]_i_2_n_0 ,\temp_counter[8]_i_3_n_0 ,\temp_counter[8]_i_4_n_0 ,\temp_counter[8]_i_5_n_0 ,\temp_counter[8]_i_6_n_0 ,\temp_counter[8]_i_7_n_0 ,\temp_counter[8]_i_8_n_0 ,\temp_counter[8]_i_9_n_0 }));
  FDCE \temp_counter_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\current_t[31]_i_1_n_0 ),
        .CLR(SR),
        .D(\temp_counter_reg[8]_i_1_n_14 ),
        .Q(temp_counter_reg[9]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT1 #(
    .INIT(2'h1)) 
    tick_100ms_i_1
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .O(tick_100ms));
  FDCE tick_100ms_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_100ms),
        .Q(tick_100ms_reg_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tick_cnt0_carry
       (.CI(\tick_cnt_reg_n_0_[0] ),
        .CI_TOP(1'b0),
        .CO({tick_cnt0_carry_n_0,tick_cnt0_carry_n_1,tick_cnt0_carry_n_2,tick_cnt0_carry_n_3,tick_cnt0_carry_n_4,tick_cnt0_carry_n_5,tick_cnt0_carry_n_6,tick_cnt0_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:1]),
        .S({\tick_cnt_reg_n_0_[8] ,\tick_cnt_reg_n_0_[7] ,\tick_cnt_reg_n_0_[6] ,\tick_cnt_reg_n_0_[5] ,\tick_cnt_reg_n_0_[4] ,\tick_cnt_reg_n_0_[3] ,\tick_cnt_reg_n_0_[2] ,\tick_cnt_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tick_cnt0_carry__0
       (.CI(tick_cnt0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({tick_cnt0_carry__0_n_0,tick_cnt0_carry__0_n_1,tick_cnt0_carry__0_n_2,tick_cnt0_carry__0_n_3,tick_cnt0_carry__0_n_4,tick_cnt0_carry__0_n_5,tick_cnt0_carry__0_n_6,tick_cnt0_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:9]),
        .S({\tick_cnt_reg_n_0_[16] ,\tick_cnt_reg_n_0_[15] ,\tick_cnt_reg_n_0_[14] ,\tick_cnt_reg_n_0_[13] ,\tick_cnt_reg_n_0_[12] ,\tick_cnt_reg_n_0_[11] ,\tick_cnt_reg_n_0_[10] ,\tick_cnt_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tick_cnt0_carry__1
       (.CI(tick_cnt0_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_tick_cnt0_carry__1_CO_UNCONNECTED[7:6],tick_cnt0_carry__1_n_2,tick_cnt0_carry__1_n_3,tick_cnt0_carry__1_n_4,tick_cnt0_carry__1_n_5,tick_cnt0_carry__1_n_6,tick_cnt0_carry__1_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_tick_cnt0_carry__1_O_UNCONNECTED[7],data0[23:17]}),
        .S({1'b0,\tick_cnt_reg_n_0_[23] ,\tick_cnt_reg_n_0_[22] ,\tick_cnt_reg_n_0_[21] ,\tick_cnt_reg_n_0_[20] ,\tick_cnt_reg_n_0_[19] ,\tick_cnt_reg_n_0_[18] ,\tick_cnt_reg_n_0_[17] }));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \tick_cnt[0]_i_1 
       (.I0(\tick_cnt_reg_n_0_[0] ),
        .O(tick_cnt[0]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[10]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[10]),
        .O(tick_cnt[10]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[11]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[11]),
        .O(tick_cnt[11]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[12]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[12]),
        .O(tick_cnt[12]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[13]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[13]),
        .O(tick_cnt[13]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[14]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[14]),
        .O(tick_cnt[14]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[15]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[15]),
        .O(tick_cnt[15]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[16]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[16]),
        .O(tick_cnt[16]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[17]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[17]),
        .O(tick_cnt[17]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[18]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[18]),
        .O(tick_cnt[18]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[19]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[19]),
        .O(tick_cnt[19]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[1]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[1]),
        .O(tick_cnt[1]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[20]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[20]),
        .O(tick_cnt[20]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[21]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[21]),
        .O(tick_cnt[21]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[22]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[22]),
        .O(tick_cnt[22]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[23]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[23]),
        .O(tick_cnt[23]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \tick_cnt[23]_i_2 
       (.I0(\tick_cnt[23]_i_3_n_0 ),
        .I1(\tick_cnt[23]_i_4_n_0 ),
        .I2(\tick_cnt[23]_i_5_n_0 ),
        .I3(\tick_cnt[23]_i_6_n_0 ),
        .I4(\tick_cnt[23]_i_7_n_0 ),
        .I5(\tick_cnt[23]_i_8_n_0 ),
        .O(\tick_cnt[23]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \tick_cnt[23]_i_3 
       (.I0(\tick_cnt_reg_n_0_[17] ),
        .I1(\tick_cnt_reg_n_0_[16] ),
        .I2(\tick_cnt_reg_n_0_[19] ),
        .I3(\tick_cnt_reg_n_0_[18] ),
        .O(\tick_cnt[23]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \tick_cnt[23]_i_4 
       (.I0(\tick_cnt_reg_n_0_[20] ),
        .I1(\tick_cnt_reg_n_0_[21] ),
        .I2(\tick_cnt_reg_n_0_[23] ),
        .I3(\tick_cnt_reg_n_0_[22] ),
        .O(\tick_cnt[23]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \tick_cnt[23]_i_5 
       (.I0(\tick_cnt_reg_n_0_[9] ),
        .I1(\tick_cnt_reg_n_0_[8] ),
        .I2(\tick_cnt_reg_n_0_[10] ),
        .I3(\tick_cnt_reg_n_0_[11] ),
        .O(\tick_cnt[23]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \tick_cnt[23]_i_6 
       (.I0(\tick_cnt_reg_n_0_[12] ),
        .I1(\tick_cnt_reg_n_0_[13] ),
        .I2(\tick_cnt_reg_n_0_[15] ),
        .I3(\tick_cnt_reg_n_0_[14] ),
        .O(\tick_cnt[23]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \tick_cnt[23]_i_7 
       (.I0(\tick_cnt_reg_n_0_[5] ),
        .I1(\tick_cnt_reg_n_0_[4] ),
        .I2(\tick_cnt_reg_n_0_[6] ),
        .I3(\tick_cnt_reg_n_0_[7] ),
        .O(\tick_cnt[23]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \tick_cnt[23]_i_8 
       (.I0(\tick_cnt_reg_n_0_[1] ),
        .I1(\tick_cnt_reg_n_0_[0] ),
        .I2(\tick_cnt_reg_n_0_[3] ),
        .I3(\tick_cnt_reg_n_0_[2] ),
        .O(\tick_cnt[23]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[2]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[2]),
        .O(tick_cnt[2]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[3]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[3]),
        .O(tick_cnt[3]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[4]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[4]),
        .O(tick_cnt[4]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[5]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[5]),
        .O(tick_cnt[5]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[6]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[6]),
        .O(tick_cnt[6]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[7]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[7]),
        .O(tick_cnt[7]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[8]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[8]),
        .O(tick_cnt[8]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tick_cnt[9]_i_1 
       (.I0(\tick_cnt[23]_i_2_n_0 ),
        .I1(data0[9]),
        .O(tick_cnt[9]));
  FDCE \tick_cnt_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[0]),
        .Q(\tick_cnt_reg_n_0_[0] ));
  FDCE \tick_cnt_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[10]),
        .Q(\tick_cnt_reg_n_0_[10] ));
  FDCE \tick_cnt_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[11]),
        .Q(\tick_cnt_reg_n_0_[11] ));
  FDCE \tick_cnt_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[12]),
        .Q(\tick_cnt_reg_n_0_[12] ));
  FDCE \tick_cnt_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[13]),
        .Q(\tick_cnt_reg_n_0_[13] ));
  FDCE \tick_cnt_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[14]),
        .Q(\tick_cnt_reg_n_0_[14] ));
  FDCE \tick_cnt_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[15]),
        .Q(\tick_cnt_reg_n_0_[15] ));
  FDCE \tick_cnt_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[16]),
        .Q(\tick_cnt_reg_n_0_[16] ));
  FDCE \tick_cnt_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[17]),
        .Q(\tick_cnt_reg_n_0_[17] ));
  FDCE \tick_cnt_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[18]),
        .Q(\tick_cnt_reg_n_0_[18] ));
  FDCE \tick_cnt_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[19]),
        .Q(\tick_cnt_reg_n_0_[19] ));
  FDCE \tick_cnt_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[1]),
        .Q(\tick_cnt_reg_n_0_[1] ));
  FDCE \tick_cnt_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[20]),
        .Q(\tick_cnt_reg_n_0_[20] ));
  FDCE \tick_cnt_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[21]),
        .Q(\tick_cnt_reg_n_0_[21] ));
  FDCE \tick_cnt_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[22]),
        .Q(\tick_cnt_reg_n_0_[22] ));
  FDCE \tick_cnt_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[23]),
        .Q(\tick_cnt_reg_n_0_[23] ));
  FDCE \tick_cnt_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[2]),
        .Q(\tick_cnt_reg_n_0_[2] ));
  FDCE \tick_cnt_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[3]),
        .Q(\tick_cnt_reg_n_0_[3] ));
  FDCE \tick_cnt_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[4]),
        .Q(\tick_cnt_reg_n_0_[4] ));
  FDCE \tick_cnt_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[5]),
        .Q(\tick_cnt_reg_n_0_[5] ));
  FDCE \tick_cnt_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[6]),
        .Q(\tick_cnt_reg_n_0_[6] ));
  FDCE \tick_cnt_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[7]),
        .Q(\tick_cnt_reg_n_0_[7] ));
  FDCE \tick_cnt_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[8]),
        .Q(\tick_cnt_reg_n_0_[8] ));
  FDCE \tick_cnt_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(tick_cnt[9]),
        .Q(\tick_cnt_reg_n_0_[9] ));
  LUT2 #(
    .INIT(4'h2)) 
    \u_ctrl[29]_i_1 
       (.I0(\error_reg[0]_0 [0]),
        .I1(\error_reg[0]_0 [1]),
        .O(\u_ctrl[29]_i_1_n_0 ));
  FDCE \u_ctrl_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\u_ctrl[29]_i_1_n_0 ),
        .Q(heater_u_ctrl));
endmodule

(* CHECK_LICENSE_TYPE = "kd240_ecat_bd_heater_axi_0_0,heater_axi,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "heater_axi,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s00_axi_awaddr,
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
    s00_axi_rready,
    s00_axi_aclk,
    s00_axi_aresetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 16, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99999001, ID_WIDTH 0, ADDR_WIDTH 6, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN kd240_ecat_bd_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [5:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [5:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) input s00_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN kd240_ecat_bd_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;

  wire \<const0> ;
  wire s00_axi_aclk;
  wire [5:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [5:0]s00_axi_awaddr;
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

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_axi inst
       (.axi_arready_reg(s00_axi_arready),
        .axi_awready_reg(s00_axi_awready),
        .axi_rvalid_reg(s00_axi_rvalid),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[5:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[5:2]),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
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
