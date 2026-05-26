-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Wed May 13 14:46:35 2026
-- Host        : pjh running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top kd240_ecat_bd_ecat_pl_if_0_0 -prefix
--               kd240_ecat_bd_ecat_pl_if_0_0_ kd240_ecat_bd_ecat_pl_if_0_0_sim_netlist.vhdl
-- Design      : kd240_ecat_bd_ecat_pl_if_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xck24-ubva530-2LV-c
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity kd240_ecat_bd_ecat_pl_if_0_0_ecat_pl_if_slave_lite_v1_0_S00_AXI is
  port (
    axi_rvalid_reg_0 : out STD_LOGIC;
    axi_arready_reg_0 : out STD_LOGIC;
    rst_out : out STD_LOGIC;
    axi_awready_reg_0 : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    irq_int : out STD_LOGIC;
    sync0_int : out STD_LOGIC;
    sync1_int : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    irq_in : in STD_LOGIC;
    sync0_in : in STD_LOGIC;
    sync1_in : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC
  );
end kd240_ecat_bd_ecat_pl_if_0_0_ecat_pl_if_slave_lite_v1_0_S00_AXI;

architecture STRUCTURE of kd240_ecat_bd_ecat_pl_if_0_0_ecat_pl_if_slave_lite_v1_0_S00_AXI is
  signal \FSM_sequential_state_read[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state_write[1]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[4]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready_i_1_n_0 : STD_LOGIC;
  signal \^axi_arready_reg_0\ : STD_LOGIC;
  signal axi_awaddr : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \axi_awaddr_reg_n_0_[2]\ : STD_LOGIC;
  signal \axi_awaddr_reg_n_0_[3]\ : STD_LOGIC;
  signal \axi_awaddr_reg_n_0_[4]\ : STD_LOGIC;
  signal \axi_awready0__0\ : STD_LOGIC;
  signal axi_awready_i_1_n_0 : STD_LOGIC;
  signal \^axi_awready_reg_0\ : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal \^axi_rvalid_reg_0\ : STD_LOGIC;
  signal axi_wready_i_1_n_0 : STD_LOGIC;
  signal \free_cnt[0]_i_2_n_0\ : STD_LOGIC;
  signal free_cnt_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \free_cnt_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_10\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_11\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_12\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_13\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_14\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_15\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_8\ : STD_LOGIC;
  signal \free_cnt_reg[0]_i_1_n_9\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_10\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_11\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_12\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_13\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_14\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_15\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_8\ : STD_LOGIC;
  signal \free_cnt_reg[16]_i_1_n_9\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_10\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_11\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_12\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_13\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_14\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_15\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_8\ : STD_LOGIC;
  signal \free_cnt_reg[24]_i_1_n_9\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_10\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_11\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_12\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_8\ : STD_LOGIC;
  signal \free_cnt_reg[8]_i_1_n_9\ : STD_LOGIC;
  signal \irq_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal irq_cnt_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \irq_cnt_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_10\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_11\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_12\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_13\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_14\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_15\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_8\ : STD_LOGIC;
  signal \irq_cnt_reg[0]_i_2_n_9\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_10\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_11\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_12\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_13\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_14\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_15\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_8\ : STD_LOGIC;
  signal \irq_cnt_reg[16]_i_1_n_9\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_10\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_11\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_12\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_13\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_14\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_15\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_8\ : STD_LOGIC;
  signal \irq_cnt_reg[24]_i_1_n_9\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_10\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_11\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_12\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_8\ : STD_LOGIC;
  signal \irq_cnt_reg[8]_i_1_n_9\ : STD_LOGIC;
  signal \^irq_int\ : STD_LOGIC;
  signal irq_req_i_1_n_0 : STD_LOGIC;
  signal irq_req_i_2_n_0 : STD_LOGIC;
  signal irq_req_i_5_n_0 : STD_LOGIC;
  signal irq_rise : STD_LOGIC;
  signal irq_sync0 : STD_LOGIC;
  signal irq_sync1 : STD_LOGIC;
  signal irq_sync1_d : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \s00_axi_rdata[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[0]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[10]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[10]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[11]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[11]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[12]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[12]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[13]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[13]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[14]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[14]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[15]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[15]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[16]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[16]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[17]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[17]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[18]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[18]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[19]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[19]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[20]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[20]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[21]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[21]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[22]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[22]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[23]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[23]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[24]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[24]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[25]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[25]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[26]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[26]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[27]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[27]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[28]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[28]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[29]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[29]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[2]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[2]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[30]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[30]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[31]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[31]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[4]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[5]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[5]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[6]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[6]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[7]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[7]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[8]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[8]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[9]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[9]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \^s00_axi_wready\ : STD_LOGIC;
  signal sel0 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slv_reg0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg0[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg1[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[0]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[10]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[11]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[12]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[13]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[14]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[15]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[16]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[17]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[18]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[19]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[1]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[20]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[21]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[22]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[23]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[24]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[25]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[26]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[27]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[28]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[29]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[2]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[30]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[31]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[3]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[4]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[5]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[6]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[7]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[8]\ : STD_LOGIC;
  signal \slv_reg6_reg_n_0_[9]\ : STD_LOGIC;
  signal state_read : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \state_read__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal state_write : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \state_write__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \sync0_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal sync0_cnt_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \sync0_cnt_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_10\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_11\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_12\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_13\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_14\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_15\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_8\ : STD_LOGIC;
  signal \sync0_cnt_reg[0]_i_2_n_9\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_10\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_11\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_12\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_13\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_14\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_15\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_8\ : STD_LOGIC;
  signal \sync0_cnt_reg[16]_i_1_n_9\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_10\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_11\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_12\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_13\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_14\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_15\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_8\ : STD_LOGIC;
  signal \sync0_cnt_reg[24]_i_1_n_9\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_10\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_11\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_12\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_8\ : STD_LOGIC;
  signal \sync0_cnt_reg[8]_i_1_n_9\ : STD_LOGIC;
  signal \^sync0_int\ : STD_LOGIC;
  signal sync0_req_i_1_n_0 : STD_LOGIC;
  signal sync0_rise : STD_LOGIC;
  signal sync0_sync0 : STD_LOGIC;
  signal sync0_sync1 : STD_LOGIC;
  signal sync0_sync1_d : STD_LOGIC;
  signal \sync1_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal sync1_cnt_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \sync1_cnt_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_10\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_11\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_12\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_13\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_14\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_15\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_8\ : STD_LOGIC;
  signal \sync1_cnt_reg[0]_i_2_n_9\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_10\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_11\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_12\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_13\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_14\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_15\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_8\ : STD_LOGIC;
  signal \sync1_cnt_reg[16]_i_1_n_9\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_10\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_11\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_12\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_13\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_14\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_15\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_8\ : STD_LOGIC;
  signal \sync1_cnt_reg[24]_i_1_n_9\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_10\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_11\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_12\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_8\ : STD_LOGIC;
  signal \sync1_cnt_reg[8]_i_1_n_9\ : STD_LOGIC;
  signal \^sync1_int\ : STD_LOGIC;
  signal sync1_req_i_1_n_0 : STD_LOGIC;
  signal sync1_rise : STD_LOGIC;
  signal sync1_sync0 : STD_LOGIC;
  signal sync1_sync1 : STD_LOGIC;
  signal sync1_sync1_d : STD_LOGIC;
  signal \wr_addr__2\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_free_cnt_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_irq_cnt_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_sync0_cnt_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_sync1_cnt_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_read_reg[0]\ : label is "Idle:00,Rdata:10,Raddr:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_read_reg[1]\ : label is "Idle:00,Rdata:10,Raddr:01";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state_write[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state_write[1]_i_2\ : label is "soft_lutpair0";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_write_reg[0]\ : label is "Idle:00,Wdata:10,Waddr:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_write_reg[1]\ : label is "Idle:00,Wdata:10,Waddr:01";
  attribute SOFT_HLUTNM of axi_awready_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of axi_bvalid_i_2 : label is "soft_lutpair1";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \free_cnt_reg[0]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \free_cnt_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \free_cnt_reg[24]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \free_cnt_reg[8]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \irq_cnt_reg[0]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \irq_cnt_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \irq_cnt_reg[24]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \irq_cnt_reg[8]_i_1\ : label is 35;
  attribute SOFT_HLUTNM of irq_req_i_3 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of irq_req_i_4 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of irq_req_i_5 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \slv_reg0[31]_i_2\ : label is "soft_lutpair2";
  attribute ADDER_THRESHOLD of \sync0_cnt_reg[0]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \sync0_cnt_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \sync0_cnt_reg[24]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \sync0_cnt_reg[8]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \sync1_cnt_reg[0]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \sync1_cnt_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \sync1_cnt_reg[24]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \sync1_cnt_reg[8]_i_1\ : label is 35;
begin
  axi_arready_reg_0 <= \^axi_arready_reg_0\;
  axi_awready_reg_0 <= \^axi_awready_reg_0\;
  axi_rvalid_reg_0 <= \^axi_rvalid_reg_0\;
  irq_int <= \^irq_int\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_wready <= \^s00_axi_wready\;
  sync0_int <= \^sync0_int\;
  sync1_int <= \^sync1_int\;
\FSM_sequential_state_read[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4040404055FFFFFF"
    )
        port map (
      I0 => state_read(0),
      I1 => s00_axi_rready,
      I2 => \^axi_rvalid_reg_0\,
      I3 => s00_axi_arvalid,
      I4 => \^axi_arready_reg_0\,
      I5 => state_read(1),
      O => \state_read__0\(0)
    );
\FSM_sequential_state_read[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => state_read(0),
      I1 => state_read(1),
      O => \FSM_sequential_state_read[1]_i_1_n_0\
    );
\FSM_sequential_state_read[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F0F0F80808080"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^axi_arready_reg_0\,
      I2 => state_read(0),
      I3 => s00_axi_rready,
      I4 => \^axi_rvalid_reg_0\,
      I5 => state_read(1),
      O => \state_read__0\(1)
    );
\FSM_sequential_state_read_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \FSM_sequential_state_read[1]_i_1_n_0\,
      D => \state_read__0\(0),
      Q => state_read(0),
      R => irq_req_i_1_n_0
    );
\FSM_sequential_state_read_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \FSM_sequential_state_read[1]_i_1_n_0\,
      D => \state_read__0\(1),
      Q => state_read(1),
      R => irq_req_i_1_n_0
    );
\FSM_sequential_state_write[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F00FF7F"
    )
        port map (
      I0 => \^axi_awready_reg_0\,
      I1 => s00_axi_awvalid,
      I2 => state_write(0),
      I3 => s00_axi_wvalid,
      I4 => state_write(1),
      O => \state_write__0\(0)
    );
\FSM_sequential_state_write[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => state_write(0),
      I1 => state_write(1),
      O => \FSM_sequential_state_write[1]_i_1_n_0\
    );
\FSM_sequential_state_write[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000F0080"
    )
        port map (
      I0 => \^axi_awready_reg_0\,
      I1 => s00_axi_awvalid,
      I2 => state_write(0),
      I3 => s00_axi_wvalid,
      I4 => state_write(1),
      O => \state_write__0\(1)
    );
\FSM_sequential_state_write_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \FSM_sequential_state_write[1]_i_1_n_0\,
      D => \state_write__0\(0),
      Q => state_write(0),
      R => irq_req_i_1_n_0
    );
\FSM_sequential_state_write_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \FSM_sequential_state_write[1]_i_1_n_0\,
      D => \state_write__0\(1),
      Q => state_write(1),
      R => irq_req_i_1_n_0
    );
\axi_araddr[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => state_read(0),
      I2 => state_read(1),
      I3 => \^axi_arready_reg_0\,
      I4 => s00_axi_arvalid,
      O => \axi_araddr[4]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_araddr[4]_i_1_n_0\,
      D => s00_axi_araddr(0),
      Q => sel0(0),
      R => '0'
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_araddr[4]_i_1_n_0\,
      D => s00_axi_araddr(1),
      Q => sel0(1),
      R => '0'
    );
\axi_araddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_araddr[4]_i_1_n_0\,
      D => s00_axi_araddr(2),
      Q => sel0(2),
      R => '0'
    );
axi_arready_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFCCCCCC4F4F4F4F"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^axi_arready_reg_0\,
      I2 => state_read(0),
      I3 => s00_axi_rready,
      I4 => \^axi_rvalid_reg_0\,
      I5 => state_read(1),
      O => axi_arready_i_1_n_0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready_i_1_n_0,
      Q => \^axi_arready_reg_0\,
      R => irq_req_i_1_n_0
    );
\axi_awaddr[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => state_write(1),
      I1 => s00_axi_awvalid,
      I2 => \^axi_awready_reg_0\,
      I3 => state_write(0),
      O => axi_awaddr(0)
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awaddr(0),
      D => s00_axi_awaddr(0),
      Q => \axi_awaddr_reg_n_0_[2]\,
      R => irq_req_i_1_n_0
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awaddr(0),
      D => s00_axi_awaddr(1),
      Q => \axi_awaddr_reg_n_0_[3]\,
      R => irq_req_i_1_n_0
    );
\axi_awaddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awaddr(0),
      D => s00_axi_awaddr(2),
      Q => \axi_awaddr_reg_n_0_[4]\,
      R => irq_req_i_1_n_0
    );
axi_awready_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFCCCF4F"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => \^axi_awready_reg_0\,
      I2 => state_write(0),
      I3 => s00_axi_wvalid,
      I4 => state_write(1),
      O => axi_awready_i_1_n_0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready_i_1_n_0,
      Q => \^axi_awready_reg_0\,
      R => irq_req_i_1_n_0
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAF2AA22F2AAF2AA"
    )
        port map (
      I0 => \^s00_axi_bvalid\,
      I1 => s00_axi_bready,
      I2 => s00_axi_wvalid,
      I3 => state_write(1),
      I4 => \axi_awready0__0\,
      I5 => state_write(0),
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => \^axi_awready_reg_0\,
      O => \axi_awready0__0\
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => irq_req_i_1_n_0
    );
axi_rvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F8F800F0F0F0"
    )
        port map (
      I0 => \^axi_arready_reg_0\,
      I1 => s00_axi_arvalid,
      I2 => \^axi_rvalid_reg_0\,
      I3 => s00_axi_rready,
      I4 => state_read(1),
      I5 => state_read(0),
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^axi_rvalid_reg_0\,
      R => irq_req_i_1_n_0
    );
axi_wready_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F1"
    )
        port map (
      I0 => state_write(1),
      I1 => state_write(0),
      I2 => \^s00_axi_wready\,
      O => axi_wready_i_1_n_0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready_i_1_n_0,
      Q => \^s00_axi_wready\,
      R => irq_req_i_1_n_0
    );
\free_cnt[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_cnt_reg(0),
      O => \free_cnt[0]_i_2_n_0\
    );
\free_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[0]_i_1_n_15\,
      Q => free_cnt_reg(0),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[0]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \free_cnt_reg[0]_i_1_n_0\,
      CO(6) => \free_cnt_reg[0]_i_1_n_1\,
      CO(5) => \free_cnt_reg[0]_i_1_n_2\,
      CO(4) => \free_cnt_reg[0]_i_1_n_3\,
      CO(3) => \free_cnt_reg[0]_i_1_n_4\,
      CO(2) => \free_cnt_reg[0]_i_1_n_5\,
      CO(1) => \free_cnt_reg[0]_i_1_n_6\,
      CO(0) => \free_cnt_reg[0]_i_1_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \free_cnt_reg[0]_i_1_n_8\,
      O(6) => \free_cnt_reg[0]_i_1_n_9\,
      O(5) => \free_cnt_reg[0]_i_1_n_10\,
      O(4) => \free_cnt_reg[0]_i_1_n_11\,
      O(3) => \free_cnt_reg[0]_i_1_n_12\,
      O(2) => \free_cnt_reg[0]_i_1_n_13\,
      O(1) => \free_cnt_reg[0]_i_1_n_14\,
      O(0) => \free_cnt_reg[0]_i_1_n_15\,
      S(7 downto 1) => free_cnt_reg(7 downto 1),
      S(0) => \free_cnt[0]_i_2_n_0\
    );
\free_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[8]_i_1_n_13\,
      Q => free_cnt_reg(10),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[8]_i_1_n_12\,
      Q => free_cnt_reg(11),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[8]_i_1_n_11\,
      Q => free_cnt_reg(12),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[8]_i_1_n_10\,
      Q => free_cnt_reg(13),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[8]_i_1_n_9\,
      Q => free_cnt_reg(14),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[8]_i_1_n_8\,
      Q => free_cnt_reg(15),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[16]_i_1_n_15\,
      Q => free_cnt_reg(16),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \free_cnt_reg[8]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \free_cnt_reg[16]_i_1_n_0\,
      CO(6) => \free_cnt_reg[16]_i_1_n_1\,
      CO(5) => \free_cnt_reg[16]_i_1_n_2\,
      CO(4) => \free_cnt_reg[16]_i_1_n_3\,
      CO(3) => \free_cnt_reg[16]_i_1_n_4\,
      CO(2) => \free_cnt_reg[16]_i_1_n_5\,
      CO(1) => \free_cnt_reg[16]_i_1_n_6\,
      CO(0) => \free_cnt_reg[16]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \free_cnt_reg[16]_i_1_n_8\,
      O(6) => \free_cnt_reg[16]_i_1_n_9\,
      O(5) => \free_cnt_reg[16]_i_1_n_10\,
      O(4) => \free_cnt_reg[16]_i_1_n_11\,
      O(3) => \free_cnt_reg[16]_i_1_n_12\,
      O(2) => \free_cnt_reg[16]_i_1_n_13\,
      O(1) => \free_cnt_reg[16]_i_1_n_14\,
      O(0) => \free_cnt_reg[16]_i_1_n_15\,
      S(7 downto 0) => free_cnt_reg(23 downto 16)
    );
\free_cnt_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[16]_i_1_n_14\,
      Q => free_cnt_reg(17),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[16]_i_1_n_13\,
      Q => free_cnt_reg(18),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[16]_i_1_n_12\,
      Q => free_cnt_reg(19),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[0]_i_1_n_14\,
      Q => free_cnt_reg(1),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[16]_i_1_n_11\,
      Q => free_cnt_reg(20),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[16]_i_1_n_10\,
      Q => free_cnt_reg(21),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[16]_i_1_n_9\,
      Q => free_cnt_reg(22),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[16]_i_1_n_8\,
      Q => free_cnt_reg(23),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[24]_i_1_n_15\,
      Q => free_cnt_reg(24),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[24]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \free_cnt_reg[16]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_free_cnt_reg[24]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \free_cnt_reg[24]_i_1_n_1\,
      CO(5) => \free_cnt_reg[24]_i_1_n_2\,
      CO(4) => \free_cnt_reg[24]_i_1_n_3\,
      CO(3) => \free_cnt_reg[24]_i_1_n_4\,
      CO(2) => \free_cnt_reg[24]_i_1_n_5\,
      CO(1) => \free_cnt_reg[24]_i_1_n_6\,
      CO(0) => \free_cnt_reg[24]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \free_cnt_reg[24]_i_1_n_8\,
      O(6) => \free_cnt_reg[24]_i_1_n_9\,
      O(5) => \free_cnt_reg[24]_i_1_n_10\,
      O(4) => \free_cnt_reg[24]_i_1_n_11\,
      O(3) => \free_cnt_reg[24]_i_1_n_12\,
      O(2) => \free_cnt_reg[24]_i_1_n_13\,
      O(1) => \free_cnt_reg[24]_i_1_n_14\,
      O(0) => \free_cnt_reg[24]_i_1_n_15\,
      S(7 downto 0) => free_cnt_reg(31 downto 24)
    );
\free_cnt_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[24]_i_1_n_14\,
      Q => free_cnt_reg(25),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[24]_i_1_n_13\,
      Q => free_cnt_reg(26),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[24]_i_1_n_12\,
      Q => free_cnt_reg(27),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[24]_i_1_n_11\,
      Q => free_cnt_reg(28),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[24]_i_1_n_10\,
      Q => free_cnt_reg(29),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[0]_i_1_n_13\,
      Q => free_cnt_reg(2),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[24]_i_1_n_9\,
      Q => free_cnt_reg(30),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[24]_i_1_n_8\,
      Q => free_cnt_reg(31),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[0]_i_1_n_12\,
      Q => free_cnt_reg(3),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[0]_i_1_n_11\,
      Q => free_cnt_reg(4),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[0]_i_1_n_10\,
      Q => free_cnt_reg(5),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[0]_i_1_n_9\,
      Q => free_cnt_reg(6),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[0]_i_1_n_8\,
      Q => free_cnt_reg(7),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[8]_i_1_n_15\,
      Q => free_cnt_reg(8),
      R => irq_req_i_1_n_0
    );
\free_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \free_cnt_reg[0]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \free_cnt_reg[8]_i_1_n_0\,
      CO(6) => \free_cnt_reg[8]_i_1_n_1\,
      CO(5) => \free_cnt_reg[8]_i_1_n_2\,
      CO(4) => \free_cnt_reg[8]_i_1_n_3\,
      CO(3) => \free_cnt_reg[8]_i_1_n_4\,
      CO(2) => \free_cnt_reg[8]_i_1_n_5\,
      CO(1) => \free_cnt_reg[8]_i_1_n_6\,
      CO(0) => \free_cnt_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \free_cnt_reg[8]_i_1_n_8\,
      O(6) => \free_cnt_reg[8]_i_1_n_9\,
      O(5) => \free_cnt_reg[8]_i_1_n_10\,
      O(4) => \free_cnt_reg[8]_i_1_n_11\,
      O(3) => \free_cnt_reg[8]_i_1_n_12\,
      O(2) => \free_cnt_reg[8]_i_1_n_13\,
      O(1) => \free_cnt_reg[8]_i_1_n_14\,
      O(0) => \free_cnt_reg[8]_i_1_n_15\,
      S(7 downto 0) => free_cnt_reg(15 downto 8)
    );
\free_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \free_cnt_reg[8]_i_1_n_14\,
      Q => free_cnt_reg(9),
      R => irq_req_i_1_n_0
    );
\irq_cnt[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => irq_sync1,
      I1 => irq_sync1_d,
      O => irq_rise
    );
\irq_cnt[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => irq_cnt_reg(0),
      O => \irq_cnt[0]_i_3_n_0\
    );
\irq_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[0]_i_2_n_15\,
      Q => irq_cnt_reg(0),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[0]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \irq_cnt_reg[0]_i_2_n_0\,
      CO(6) => \irq_cnt_reg[0]_i_2_n_1\,
      CO(5) => \irq_cnt_reg[0]_i_2_n_2\,
      CO(4) => \irq_cnt_reg[0]_i_2_n_3\,
      CO(3) => \irq_cnt_reg[0]_i_2_n_4\,
      CO(2) => \irq_cnt_reg[0]_i_2_n_5\,
      CO(1) => \irq_cnt_reg[0]_i_2_n_6\,
      CO(0) => \irq_cnt_reg[0]_i_2_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \irq_cnt_reg[0]_i_2_n_8\,
      O(6) => \irq_cnt_reg[0]_i_2_n_9\,
      O(5) => \irq_cnt_reg[0]_i_2_n_10\,
      O(4) => \irq_cnt_reg[0]_i_2_n_11\,
      O(3) => \irq_cnt_reg[0]_i_2_n_12\,
      O(2) => \irq_cnt_reg[0]_i_2_n_13\,
      O(1) => \irq_cnt_reg[0]_i_2_n_14\,
      O(0) => \irq_cnt_reg[0]_i_2_n_15\,
      S(7 downto 1) => irq_cnt_reg(7 downto 1),
      S(0) => \irq_cnt[0]_i_3_n_0\
    );
\irq_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[8]_i_1_n_13\,
      Q => irq_cnt_reg(10),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[8]_i_1_n_12\,
      Q => irq_cnt_reg(11),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[8]_i_1_n_11\,
      Q => irq_cnt_reg(12),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[8]_i_1_n_10\,
      Q => irq_cnt_reg(13),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[8]_i_1_n_9\,
      Q => irq_cnt_reg(14),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[8]_i_1_n_8\,
      Q => irq_cnt_reg(15),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[16]_i_1_n_15\,
      Q => irq_cnt_reg(16),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \irq_cnt_reg[8]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \irq_cnt_reg[16]_i_1_n_0\,
      CO(6) => \irq_cnt_reg[16]_i_1_n_1\,
      CO(5) => \irq_cnt_reg[16]_i_1_n_2\,
      CO(4) => \irq_cnt_reg[16]_i_1_n_3\,
      CO(3) => \irq_cnt_reg[16]_i_1_n_4\,
      CO(2) => \irq_cnt_reg[16]_i_1_n_5\,
      CO(1) => \irq_cnt_reg[16]_i_1_n_6\,
      CO(0) => \irq_cnt_reg[16]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \irq_cnt_reg[16]_i_1_n_8\,
      O(6) => \irq_cnt_reg[16]_i_1_n_9\,
      O(5) => \irq_cnt_reg[16]_i_1_n_10\,
      O(4) => \irq_cnt_reg[16]_i_1_n_11\,
      O(3) => \irq_cnt_reg[16]_i_1_n_12\,
      O(2) => \irq_cnt_reg[16]_i_1_n_13\,
      O(1) => \irq_cnt_reg[16]_i_1_n_14\,
      O(0) => \irq_cnt_reg[16]_i_1_n_15\,
      S(7 downto 0) => irq_cnt_reg(23 downto 16)
    );
\irq_cnt_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[16]_i_1_n_14\,
      Q => irq_cnt_reg(17),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[16]_i_1_n_13\,
      Q => irq_cnt_reg(18),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[16]_i_1_n_12\,
      Q => irq_cnt_reg(19),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[0]_i_2_n_14\,
      Q => irq_cnt_reg(1),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[16]_i_1_n_11\,
      Q => irq_cnt_reg(20),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[16]_i_1_n_10\,
      Q => irq_cnt_reg(21),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[16]_i_1_n_9\,
      Q => irq_cnt_reg(22),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[16]_i_1_n_8\,
      Q => irq_cnt_reg(23),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[24]_i_1_n_15\,
      Q => irq_cnt_reg(24),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[24]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \irq_cnt_reg[16]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_irq_cnt_reg[24]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \irq_cnt_reg[24]_i_1_n_1\,
      CO(5) => \irq_cnt_reg[24]_i_1_n_2\,
      CO(4) => \irq_cnt_reg[24]_i_1_n_3\,
      CO(3) => \irq_cnt_reg[24]_i_1_n_4\,
      CO(2) => \irq_cnt_reg[24]_i_1_n_5\,
      CO(1) => \irq_cnt_reg[24]_i_1_n_6\,
      CO(0) => \irq_cnt_reg[24]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \irq_cnt_reg[24]_i_1_n_8\,
      O(6) => \irq_cnt_reg[24]_i_1_n_9\,
      O(5) => \irq_cnt_reg[24]_i_1_n_10\,
      O(4) => \irq_cnt_reg[24]_i_1_n_11\,
      O(3) => \irq_cnt_reg[24]_i_1_n_12\,
      O(2) => \irq_cnt_reg[24]_i_1_n_13\,
      O(1) => \irq_cnt_reg[24]_i_1_n_14\,
      O(0) => \irq_cnt_reg[24]_i_1_n_15\,
      S(7 downto 0) => irq_cnt_reg(31 downto 24)
    );
\irq_cnt_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[24]_i_1_n_14\,
      Q => irq_cnt_reg(25),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[24]_i_1_n_13\,
      Q => irq_cnt_reg(26),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[24]_i_1_n_12\,
      Q => irq_cnt_reg(27),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[24]_i_1_n_11\,
      Q => irq_cnt_reg(28),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[24]_i_1_n_10\,
      Q => irq_cnt_reg(29),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[0]_i_2_n_13\,
      Q => irq_cnt_reg(2),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[24]_i_1_n_9\,
      Q => irq_cnt_reg(30),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[24]_i_1_n_8\,
      Q => irq_cnt_reg(31),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[0]_i_2_n_12\,
      Q => irq_cnt_reg(3),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[0]_i_2_n_11\,
      Q => irq_cnt_reg(4),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[0]_i_2_n_10\,
      Q => irq_cnt_reg(5),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[0]_i_2_n_9\,
      Q => irq_cnt_reg(6),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[0]_i_2_n_8\,
      Q => irq_cnt_reg(7),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[8]_i_1_n_15\,
      Q => irq_cnt_reg(8),
      R => irq_req_i_1_n_0
    );
\irq_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \irq_cnt_reg[0]_i_2_n_0\,
      CI_TOP => '0',
      CO(7) => \irq_cnt_reg[8]_i_1_n_0\,
      CO(6) => \irq_cnt_reg[8]_i_1_n_1\,
      CO(5) => \irq_cnt_reg[8]_i_1_n_2\,
      CO(4) => \irq_cnt_reg[8]_i_1_n_3\,
      CO(3) => \irq_cnt_reg[8]_i_1_n_4\,
      CO(2) => \irq_cnt_reg[8]_i_1_n_5\,
      CO(1) => \irq_cnt_reg[8]_i_1_n_6\,
      CO(0) => \irq_cnt_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \irq_cnt_reg[8]_i_1_n_8\,
      O(6) => \irq_cnt_reg[8]_i_1_n_9\,
      O(5) => \irq_cnt_reg[8]_i_1_n_10\,
      O(4) => \irq_cnt_reg[8]_i_1_n_11\,
      O(3) => \irq_cnt_reg[8]_i_1_n_12\,
      O(2) => \irq_cnt_reg[8]_i_1_n_13\,
      O(1) => \irq_cnt_reg[8]_i_1_n_14\,
      O(0) => \irq_cnt_reg[8]_i_1_n_15\,
      S(7 downto 0) => irq_cnt_reg(15 downto 8)
    );
\irq_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => irq_rise,
      D => \irq_cnt_reg[8]_i_1_n_14\,
      Q => irq_cnt_reg(9),
      R => irq_req_i_1_n_0
    );
irq_req_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => irq_req_i_1_n_0
    );
irq_req_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFFAAAAAAAA"
    )
        port map (
      I0 => irq_rise,
      I1 => s00_axi_wdata(0),
      I2 => \wr_addr__2\(0),
      I3 => \wr_addr__2\(1),
      I4 => irq_req_i_5_n_0,
      I5 => \^irq_int\,
      O => irq_req_i_2_n_0
    );
irq_req_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s00_axi_awaddr(0),
      I1 => s00_axi_awvalid,
      I2 => \axi_awaddr_reg_n_0_[2]\,
      O => \wr_addr__2\(0)
    );
irq_req_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_awvalid,
      I2 => \axi_awaddr_reg_n_0_[3]\,
      O => \wr_addr__2\(1)
    );
irq_req_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \axi_awaddr_reg_n_0_[4]\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_awaddr(2),
      O => irq_req_i_5_n_0
    );
irq_req_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => irq_req_i_2_n_0,
      Q => \^irq_int\,
      R => irq_req_i_1_n_0
    );
irq_sync0_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => irq_in,
      Q => irq_sync0,
      R => irq_req_i_1_n_0
    );
irq_sync1_d_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => irq_sync1,
      Q => irq_sync1_d,
      R => irq_req_i_1_n_0
    );
irq_sync1_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => irq_sync0,
      Q => irq_sync1,
      R => irq_req_i_1_n_0
    );
rst_out_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \slv_reg6_reg_n_0_[0]\,
      O => rst_out
    );
\s00_axi_rdata[0]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[0]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[0]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(0),
      S => sel0(2)
    );
\s00_axi_rdata[0]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(0),
      I1 => irq_cnt_reg(0),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(0),
      I5 => free_cnt_reg(0),
      O => \s00_axi_rdata[0]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[0]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => sync1_cnt_reg(0),
      I1 => \^irq_int\,
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => sync0_cnt_reg(0),
      I5 => \slv_reg6_reg_n_0_[0]\,
      O => \s00_axi_rdata[0]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[10]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[10]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[10]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(10),
      S => sel0(2)
    );
\s00_axi_rdata[10]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(10),
      I1 => irq_cnt_reg(10),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(10),
      I5 => free_cnt_reg(10),
      O => \s00_axi_rdata[10]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[10]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(10),
      I1 => \slv_reg6_reg_n_0_[10]\,
      I2 => sync1_cnt_reg(10),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[10]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[11]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[11]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[11]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(11),
      S => sel0(2)
    );
\s00_axi_rdata[11]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(11),
      I1 => irq_cnt_reg(11),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(11),
      I5 => free_cnt_reg(11),
      O => \s00_axi_rdata[11]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[11]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(11),
      I1 => \slv_reg6_reg_n_0_[11]\,
      I2 => sync1_cnt_reg(11),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[11]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[12]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[12]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[12]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(12),
      S => sel0(2)
    );
\s00_axi_rdata[12]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(12),
      I1 => irq_cnt_reg(12),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(12),
      I5 => free_cnt_reg(12),
      O => \s00_axi_rdata[12]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[12]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(12),
      I1 => \slv_reg6_reg_n_0_[12]\,
      I2 => sync1_cnt_reg(12),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[12]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[13]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[13]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[13]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(13),
      S => sel0(2)
    );
\s00_axi_rdata[13]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(13),
      I1 => irq_cnt_reg(13),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(13),
      I5 => free_cnt_reg(13),
      O => \s00_axi_rdata[13]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[13]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(13),
      I1 => \slv_reg6_reg_n_0_[13]\,
      I2 => sync1_cnt_reg(13),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[13]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[14]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[14]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[14]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(14),
      S => sel0(2)
    );
\s00_axi_rdata[14]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(14),
      I1 => irq_cnt_reg(14),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(14),
      I5 => free_cnt_reg(14),
      O => \s00_axi_rdata[14]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[14]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(14),
      I1 => \slv_reg6_reg_n_0_[14]\,
      I2 => sync1_cnt_reg(14),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[14]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[15]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[15]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[15]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(15),
      S => sel0(2)
    );
\s00_axi_rdata[15]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(15),
      I1 => irq_cnt_reg(15),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(15),
      I5 => free_cnt_reg(15),
      O => \s00_axi_rdata[15]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[15]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(15),
      I1 => \slv_reg6_reg_n_0_[15]\,
      I2 => sync1_cnt_reg(15),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[15]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[16]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[16]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[16]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(16),
      S => sel0(2)
    );
\s00_axi_rdata[16]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(16),
      I1 => irq_cnt_reg(16),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(16),
      I5 => free_cnt_reg(16),
      O => \s00_axi_rdata[16]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[16]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(16),
      I1 => \slv_reg6_reg_n_0_[16]\,
      I2 => sync1_cnt_reg(16),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[16]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[17]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[17]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[17]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(17),
      S => sel0(2)
    );
\s00_axi_rdata[17]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(17),
      I1 => irq_cnt_reg(17),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(17),
      I5 => free_cnt_reg(17),
      O => \s00_axi_rdata[17]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[17]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(17),
      I1 => \slv_reg6_reg_n_0_[17]\,
      I2 => sync1_cnt_reg(17),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[17]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[18]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[18]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[18]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(18),
      S => sel0(2)
    );
\s00_axi_rdata[18]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(18),
      I1 => irq_cnt_reg(18),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(18),
      I5 => free_cnt_reg(18),
      O => \s00_axi_rdata[18]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[18]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(18),
      I1 => \slv_reg6_reg_n_0_[18]\,
      I2 => sync1_cnt_reg(18),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[18]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[19]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[19]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[19]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(19),
      S => sel0(2)
    );
\s00_axi_rdata[19]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(19),
      I1 => irq_cnt_reg(19),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(19),
      I5 => free_cnt_reg(19),
      O => \s00_axi_rdata[19]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[19]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(19),
      I1 => \slv_reg6_reg_n_0_[19]\,
      I2 => sync1_cnt_reg(19),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[19]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[1]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[1]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[1]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(1),
      S => sel0(2)
    );
\s00_axi_rdata[1]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(1),
      I1 => irq_cnt_reg(1),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(1),
      I5 => free_cnt_reg(1),
      O => \s00_axi_rdata[1]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[1]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => sync1_cnt_reg(1),
      I1 => \^sync0_int\,
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => sync0_cnt_reg(1),
      I5 => \slv_reg6_reg_n_0_[1]\,
      O => \s00_axi_rdata[1]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[20]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[20]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[20]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(20),
      S => sel0(2)
    );
\s00_axi_rdata[20]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(20),
      I1 => irq_cnt_reg(20),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(20),
      I5 => free_cnt_reg(20),
      O => \s00_axi_rdata[20]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[20]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(20),
      I1 => \slv_reg6_reg_n_0_[20]\,
      I2 => sync1_cnt_reg(20),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[20]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[21]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[21]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[21]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(21),
      S => sel0(2)
    );
\s00_axi_rdata[21]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(21),
      I1 => irq_cnt_reg(21),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(21),
      I5 => free_cnt_reg(21),
      O => \s00_axi_rdata[21]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[21]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(21),
      I1 => \slv_reg6_reg_n_0_[21]\,
      I2 => sync1_cnt_reg(21),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[21]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[22]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[22]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[22]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(22),
      S => sel0(2)
    );
\s00_axi_rdata[22]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(22),
      I1 => irq_cnt_reg(22),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(22),
      I5 => free_cnt_reg(22),
      O => \s00_axi_rdata[22]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[22]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(22),
      I1 => \slv_reg6_reg_n_0_[22]\,
      I2 => sync1_cnt_reg(22),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[22]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[23]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[23]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[23]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(23),
      S => sel0(2)
    );
\s00_axi_rdata[23]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(23),
      I1 => irq_cnt_reg(23),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(23),
      I5 => free_cnt_reg(23),
      O => \s00_axi_rdata[23]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[23]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(23),
      I1 => \slv_reg6_reg_n_0_[23]\,
      I2 => sync1_cnt_reg(23),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[23]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[24]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[24]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[24]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(24),
      S => sel0(2)
    );
\s00_axi_rdata[24]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(24),
      I1 => irq_cnt_reg(24),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(24),
      I5 => free_cnt_reg(24),
      O => \s00_axi_rdata[24]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[24]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(24),
      I1 => \slv_reg6_reg_n_0_[24]\,
      I2 => sync1_cnt_reg(24),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[24]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[25]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[25]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[25]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(25),
      S => sel0(2)
    );
\s00_axi_rdata[25]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(25),
      I1 => irq_cnt_reg(25),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(25),
      I5 => free_cnt_reg(25),
      O => \s00_axi_rdata[25]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[25]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(25),
      I1 => \slv_reg6_reg_n_0_[25]\,
      I2 => sync1_cnt_reg(25),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[25]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[26]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[26]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[26]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(26),
      S => sel0(2)
    );
\s00_axi_rdata[26]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(26),
      I1 => irq_cnt_reg(26),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(26),
      I5 => free_cnt_reg(26),
      O => \s00_axi_rdata[26]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[26]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(26),
      I1 => \slv_reg6_reg_n_0_[26]\,
      I2 => sync1_cnt_reg(26),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[26]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[27]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[27]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[27]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(27),
      S => sel0(2)
    );
\s00_axi_rdata[27]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(27),
      I1 => irq_cnt_reg(27),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(27),
      I5 => free_cnt_reg(27),
      O => \s00_axi_rdata[27]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[27]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(27),
      I1 => \slv_reg6_reg_n_0_[27]\,
      I2 => sync1_cnt_reg(27),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[27]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[28]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[28]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[28]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(28),
      S => sel0(2)
    );
\s00_axi_rdata[28]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(28),
      I1 => irq_cnt_reg(28),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(28),
      I5 => free_cnt_reg(28),
      O => \s00_axi_rdata[28]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[28]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(28),
      I1 => \slv_reg6_reg_n_0_[28]\,
      I2 => sync1_cnt_reg(28),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[28]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[29]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[29]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[29]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(29),
      S => sel0(2)
    );
\s00_axi_rdata[29]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(29),
      I1 => irq_cnt_reg(29),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(29),
      I5 => free_cnt_reg(29),
      O => \s00_axi_rdata[29]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[29]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(29),
      I1 => \slv_reg6_reg_n_0_[29]\,
      I2 => sync1_cnt_reg(29),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[29]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[2]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[2]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[2]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(2),
      S => sel0(2)
    );
\s00_axi_rdata[2]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(2),
      I1 => irq_cnt_reg(2),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(2),
      I5 => free_cnt_reg(2),
      O => \s00_axi_rdata[2]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[2]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => sync1_cnt_reg(2),
      I1 => \^sync1_int\,
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => sync0_cnt_reg(2),
      I5 => \slv_reg6_reg_n_0_[2]\,
      O => \s00_axi_rdata[2]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[30]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[30]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[30]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(30),
      S => sel0(2)
    );
\s00_axi_rdata[30]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(30),
      I1 => irq_cnt_reg(30),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(30),
      I5 => free_cnt_reg(30),
      O => \s00_axi_rdata[30]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[30]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(30),
      I1 => \slv_reg6_reg_n_0_[30]\,
      I2 => sync1_cnt_reg(30),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[30]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[31]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[31]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[31]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(31),
      S => sel0(2)
    );
\s00_axi_rdata[31]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(31),
      I1 => irq_cnt_reg(31),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(31),
      I5 => free_cnt_reg(31),
      O => \s00_axi_rdata[31]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[31]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(31),
      I1 => \slv_reg6_reg_n_0_[31]\,
      I2 => sync1_cnt_reg(31),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[31]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[3]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[3]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[3]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(3),
      S => sel0(2)
    );
\s00_axi_rdata[3]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(3),
      I1 => irq_cnt_reg(3),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(3),
      I5 => free_cnt_reg(3),
      O => \s00_axi_rdata[3]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[3]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(3),
      I1 => \slv_reg6_reg_n_0_[3]\,
      I2 => sync1_cnt_reg(3),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[3]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[4]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[4]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[4]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(4),
      S => sel0(2)
    );
\s00_axi_rdata[4]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(4),
      I1 => irq_cnt_reg(4),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(4),
      I5 => free_cnt_reg(4),
      O => \s00_axi_rdata[4]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[4]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(4),
      I1 => \slv_reg6_reg_n_0_[4]\,
      I2 => sync1_cnt_reg(4),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[4]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[5]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[5]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[5]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(5),
      S => sel0(2)
    );
\s00_axi_rdata[5]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(5),
      I1 => irq_cnt_reg(5),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(5),
      I5 => free_cnt_reg(5),
      O => \s00_axi_rdata[5]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[5]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(5),
      I1 => \slv_reg6_reg_n_0_[5]\,
      I2 => sync1_cnt_reg(5),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[5]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[6]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[6]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[6]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(6),
      S => sel0(2)
    );
\s00_axi_rdata[6]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(6),
      I1 => irq_cnt_reg(6),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(6),
      I5 => free_cnt_reg(6),
      O => \s00_axi_rdata[6]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[6]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(6),
      I1 => \slv_reg6_reg_n_0_[6]\,
      I2 => sync1_cnt_reg(6),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[6]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[7]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[7]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[7]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(7),
      S => sel0(2)
    );
\s00_axi_rdata[7]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(7),
      I1 => irq_cnt_reg(7),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(7),
      I5 => free_cnt_reg(7),
      O => \s00_axi_rdata[7]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[7]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(7),
      I1 => \slv_reg6_reg_n_0_[7]\,
      I2 => sync1_cnt_reg(7),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[7]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[8]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[8]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[8]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(8),
      S => sel0(2)
    );
\s00_axi_rdata[8]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(8),
      I1 => irq_cnt_reg(8),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(8),
      I5 => free_cnt_reg(8),
      O => \s00_axi_rdata[8]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[8]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(8),
      I1 => \slv_reg6_reg_n_0_[8]\,
      I2 => sync1_cnt_reg(8),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[8]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[9]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[9]_INST_0_i_1_n_0\,
      I1 => \s00_axi_rdata[9]_INST_0_i_2_n_0\,
      O => s00_axi_rdata(9),
      S => sel0(2)
    );
\s00_axi_rdata[9]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => slv_reg1(9),
      I1 => irq_cnt_reg(9),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => slv_reg0(9),
      I5 => free_cnt_reg(9),
      O => \s00_axi_rdata[9]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[9]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => sync0_cnt_reg(9),
      I1 => \slv_reg6_reg_n_0_[9]\,
      I2 => sync1_cnt_reg(9),
      I3 => sel0(0),
      I4 => sel0(1),
      O => \s00_axi_rdata[9]_INST_0_i_2_n_0\
    );
\slv_reg0[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \wr_addr__2\(2),
      I1 => s00_axi_wvalid,
      I2 => \wr_addr__2\(0),
      I3 => \wr_addr__2\(1),
      I4 => s00_axi_wstrb(1),
      O => \slv_reg0[15]_i_1_n_0\
    );
\slv_reg0[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \wr_addr__2\(2),
      I1 => s00_axi_wvalid,
      I2 => \wr_addr__2\(0),
      I3 => \wr_addr__2\(1),
      I4 => s00_axi_wstrb(2),
      O => \slv_reg0[23]_i_1_n_0\
    );
\slv_reg0[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \wr_addr__2\(2),
      I1 => s00_axi_wvalid,
      I2 => \wr_addr__2\(0),
      I3 => \wr_addr__2\(1),
      I4 => s00_axi_wstrb(3),
      O => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s00_axi_awaddr(2),
      I1 => s00_axi_awvalid,
      I2 => \axi_awaddr_reg_n_0_[4]\,
      O => \wr_addr__2\(2)
    );
\slv_reg0[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \wr_addr__2\(2),
      I1 => s00_axi_wvalid,
      I2 => \wr_addr__2\(0),
      I3 => \wr_addr__2\(1),
      I4 => s00_axi_wstrb(0),
      O => \slv_reg0[7]_i_1_n_0\
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg0(0),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg0(10),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg0(11),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg0(12),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg0(13),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg0(14),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg0(15),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg0(16),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg0(17),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg0(18),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg0(19),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg0(1),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg0(20),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg0(21),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg0(22),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg0(23),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg0(24),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg0(25),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg0(26),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg0(27),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg0(28),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg0(29),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg0(2),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg0(30),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg0(31),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg0(3),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg0(4),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg0(5),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg0(6),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg0(7),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg0(8),
      R => irq_req_i_1_n_0
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg0(9),
      R => irq_req_i_1_n_0
    );
\slv_reg1[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => \wr_addr__2\(0),
      I1 => s00_axi_wvalid,
      I2 => \wr_addr__2\(1),
      I3 => \wr_addr__2\(2),
      I4 => s00_axi_wstrb(1),
      O => \slv_reg1[15]_i_1_n_0\
    );
\slv_reg1[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => \wr_addr__2\(0),
      I1 => s00_axi_wvalid,
      I2 => \wr_addr__2\(1),
      I3 => \wr_addr__2\(2),
      I4 => s00_axi_wstrb(2),
      O => \slv_reg1[23]_i_1_n_0\
    );
\slv_reg1[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => \wr_addr__2\(0),
      I1 => s00_axi_wvalid,
      I2 => \wr_addr__2\(1),
      I3 => \wr_addr__2\(2),
      I4 => s00_axi_wstrb(3),
      O => \slv_reg1[31]_i_1_n_0\
    );
\slv_reg1[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => \wr_addr__2\(0),
      I1 => s00_axi_wvalid,
      I2 => \wr_addr__2\(1),
      I3 => \wr_addr__2\(2),
      I4 => s00_axi_wstrb(0),
      O => \slv_reg1[7]_i_1_n_0\
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg1(0),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg1(10),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg1(11),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg1(12),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg1(13),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg1(14),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg1(15),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg1(16),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg1(17),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg1(18),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg1(19),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg1(1),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg1(20),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg1(21),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg1(22),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg1(23),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg1(24),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg1(25),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg1(26),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg1(27),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg1(28),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg1(29),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg1(2),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg1(30),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg1(31),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg1(3),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg1(4),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg1(5),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg1(6),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg1(7),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg1(8),
      R => irq_req_i_1_n_0
    );
\slv_reg1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg1(9),
      R => irq_req_i_1_n_0
    );
\slv_reg6[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1D00000000000000"
    )
        port map (
      I0 => \axi_awaddr_reg_n_0_[2]\,
      I1 => s00_axi_awvalid,
      I2 => s00_axi_awaddr(0),
      I3 => \wr_addr__2\(1),
      I4 => irq_req_i_5_n_0,
      I5 => s00_axi_wstrb(1),
      O => p_1_in(15)
    );
\slv_reg6[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1D00000000000000"
    )
        port map (
      I0 => \axi_awaddr_reg_n_0_[2]\,
      I1 => s00_axi_awvalid,
      I2 => s00_axi_awaddr(0),
      I3 => \wr_addr__2\(1),
      I4 => irq_req_i_5_n_0,
      I5 => s00_axi_wstrb(2),
      O => p_1_in(23)
    );
\slv_reg6[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1D00000000000000"
    )
        port map (
      I0 => \axi_awaddr_reg_n_0_[2]\,
      I1 => s00_axi_awvalid,
      I2 => s00_axi_awaddr(0),
      I3 => \wr_addr__2\(1),
      I4 => irq_req_i_5_n_0,
      I5 => s00_axi_wstrb(3),
      O => p_1_in(31)
    );
\slv_reg6[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1D00000000000000"
    )
        port map (
      I0 => \axi_awaddr_reg_n_0_[2]\,
      I1 => s00_axi_awvalid,
      I2 => s00_axi_awaddr(0),
      I3 => \wr_addr__2\(1),
      I4 => irq_req_i_5_n_0,
      I5 => s00_axi_wstrb(0),
      O => p_1_in(0)
    );
\slv_reg6_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(0),
      Q => \slv_reg6_reg_n_0_[0]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(10),
      Q => \slv_reg6_reg_n_0_[10]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(11),
      Q => \slv_reg6_reg_n_0_[11]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(12),
      Q => \slv_reg6_reg_n_0_[12]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(13),
      Q => \slv_reg6_reg_n_0_[13]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(14),
      Q => \slv_reg6_reg_n_0_[14]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(15),
      Q => \slv_reg6_reg_n_0_[15]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(16),
      Q => \slv_reg6_reg_n_0_[16]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(17),
      Q => \slv_reg6_reg_n_0_[17]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(18),
      Q => \slv_reg6_reg_n_0_[18]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(19),
      Q => \slv_reg6_reg_n_0_[19]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(1),
      Q => \slv_reg6_reg_n_0_[1]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(20),
      Q => \slv_reg6_reg_n_0_[20]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(21),
      Q => \slv_reg6_reg_n_0_[21]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(22),
      Q => \slv_reg6_reg_n_0_[22]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(23),
      Q => \slv_reg6_reg_n_0_[23]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(24),
      Q => \slv_reg6_reg_n_0_[24]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(25),
      Q => \slv_reg6_reg_n_0_[25]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(26),
      Q => \slv_reg6_reg_n_0_[26]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(27),
      Q => \slv_reg6_reg_n_0_[27]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(28),
      Q => \slv_reg6_reg_n_0_[28]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(29),
      Q => \slv_reg6_reg_n_0_[29]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(2),
      Q => \slv_reg6_reg_n_0_[2]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(30),
      Q => \slv_reg6_reg_n_0_[30]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(31),
      Q => \slv_reg6_reg_n_0_[31]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(3),
      Q => \slv_reg6_reg_n_0_[3]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(4),
      Q => \slv_reg6_reg_n_0_[4]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(5),
      Q => \slv_reg6_reg_n_0_[5]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(6),
      Q => \slv_reg6_reg_n_0_[6]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(7),
      Q => \slv_reg6_reg_n_0_[7]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(8),
      Q => \slv_reg6_reg_n_0_[8]\,
      R => irq_req_i_1_n_0
    );
\slv_reg6_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(9),
      Q => \slv_reg6_reg_n_0_[9]\,
      R => irq_req_i_1_n_0
    );
\sync0_cnt[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => sync0_sync1,
      I1 => sync0_sync1_d,
      O => sync0_rise
    );
\sync0_cnt[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sync0_cnt_reg(0),
      O => \sync0_cnt[0]_i_3_n_0\
    );
\sync0_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[0]_i_2_n_15\,
      Q => sync0_cnt_reg(0),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[0]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \sync0_cnt_reg[0]_i_2_n_0\,
      CO(6) => \sync0_cnt_reg[0]_i_2_n_1\,
      CO(5) => \sync0_cnt_reg[0]_i_2_n_2\,
      CO(4) => \sync0_cnt_reg[0]_i_2_n_3\,
      CO(3) => \sync0_cnt_reg[0]_i_2_n_4\,
      CO(2) => \sync0_cnt_reg[0]_i_2_n_5\,
      CO(1) => \sync0_cnt_reg[0]_i_2_n_6\,
      CO(0) => \sync0_cnt_reg[0]_i_2_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \sync0_cnt_reg[0]_i_2_n_8\,
      O(6) => \sync0_cnt_reg[0]_i_2_n_9\,
      O(5) => \sync0_cnt_reg[0]_i_2_n_10\,
      O(4) => \sync0_cnt_reg[0]_i_2_n_11\,
      O(3) => \sync0_cnt_reg[0]_i_2_n_12\,
      O(2) => \sync0_cnt_reg[0]_i_2_n_13\,
      O(1) => \sync0_cnt_reg[0]_i_2_n_14\,
      O(0) => \sync0_cnt_reg[0]_i_2_n_15\,
      S(7 downto 1) => sync0_cnt_reg(7 downto 1),
      S(0) => \sync0_cnt[0]_i_3_n_0\
    );
\sync0_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[8]_i_1_n_13\,
      Q => sync0_cnt_reg(10),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[8]_i_1_n_12\,
      Q => sync0_cnt_reg(11),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[8]_i_1_n_11\,
      Q => sync0_cnt_reg(12),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[8]_i_1_n_10\,
      Q => sync0_cnt_reg(13),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[8]_i_1_n_9\,
      Q => sync0_cnt_reg(14),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[8]_i_1_n_8\,
      Q => sync0_cnt_reg(15),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[16]_i_1_n_15\,
      Q => sync0_cnt_reg(16),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sync0_cnt_reg[8]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \sync0_cnt_reg[16]_i_1_n_0\,
      CO(6) => \sync0_cnt_reg[16]_i_1_n_1\,
      CO(5) => \sync0_cnt_reg[16]_i_1_n_2\,
      CO(4) => \sync0_cnt_reg[16]_i_1_n_3\,
      CO(3) => \sync0_cnt_reg[16]_i_1_n_4\,
      CO(2) => \sync0_cnt_reg[16]_i_1_n_5\,
      CO(1) => \sync0_cnt_reg[16]_i_1_n_6\,
      CO(0) => \sync0_cnt_reg[16]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \sync0_cnt_reg[16]_i_1_n_8\,
      O(6) => \sync0_cnt_reg[16]_i_1_n_9\,
      O(5) => \sync0_cnt_reg[16]_i_1_n_10\,
      O(4) => \sync0_cnt_reg[16]_i_1_n_11\,
      O(3) => \sync0_cnt_reg[16]_i_1_n_12\,
      O(2) => \sync0_cnt_reg[16]_i_1_n_13\,
      O(1) => \sync0_cnt_reg[16]_i_1_n_14\,
      O(0) => \sync0_cnt_reg[16]_i_1_n_15\,
      S(7 downto 0) => sync0_cnt_reg(23 downto 16)
    );
\sync0_cnt_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[16]_i_1_n_14\,
      Q => sync0_cnt_reg(17),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[16]_i_1_n_13\,
      Q => sync0_cnt_reg(18),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[16]_i_1_n_12\,
      Q => sync0_cnt_reg(19),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[0]_i_2_n_14\,
      Q => sync0_cnt_reg(1),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[16]_i_1_n_11\,
      Q => sync0_cnt_reg(20),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[16]_i_1_n_10\,
      Q => sync0_cnt_reg(21),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[16]_i_1_n_9\,
      Q => sync0_cnt_reg(22),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[16]_i_1_n_8\,
      Q => sync0_cnt_reg(23),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[24]_i_1_n_15\,
      Q => sync0_cnt_reg(24),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[24]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sync0_cnt_reg[16]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_sync0_cnt_reg[24]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \sync0_cnt_reg[24]_i_1_n_1\,
      CO(5) => \sync0_cnt_reg[24]_i_1_n_2\,
      CO(4) => \sync0_cnt_reg[24]_i_1_n_3\,
      CO(3) => \sync0_cnt_reg[24]_i_1_n_4\,
      CO(2) => \sync0_cnt_reg[24]_i_1_n_5\,
      CO(1) => \sync0_cnt_reg[24]_i_1_n_6\,
      CO(0) => \sync0_cnt_reg[24]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \sync0_cnt_reg[24]_i_1_n_8\,
      O(6) => \sync0_cnt_reg[24]_i_1_n_9\,
      O(5) => \sync0_cnt_reg[24]_i_1_n_10\,
      O(4) => \sync0_cnt_reg[24]_i_1_n_11\,
      O(3) => \sync0_cnt_reg[24]_i_1_n_12\,
      O(2) => \sync0_cnt_reg[24]_i_1_n_13\,
      O(1) => \sync0_cnt_reg[24]_i_1_n_14\,
      O(0) => \sync0_cnt_reg[24]_i_1_n_15\,
      S(7 downto 0) => sync0_cnt_reg(31 downto 24)
    );
\sync0_cnt_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[24]_i_1_n_14\,
      Q => sync0_cnt_reg(25),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[24]_i_1_n_13\,
      Q => sync0_cnt_reg(26),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[24]_i_1_n_12\,
      Q => sync0_cnt_reg(27),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[24]_i_1_n_11\,
      Q => sync0_cnt_reg(28),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[24]_i_1_n_10\,
      Q => sync0_cnt_reg(29),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[0]_i_2_n_13\,
      Q => sync0_cnt_reg(2),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[24]_i_1_n_9\,
      Q => sync0_cnt_reg(30),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[24]_i_1_n_8\,
      Q => sync0_cnt_reg(31),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[0]_i_2_n_12\,
      Q => sync0_cnt_reg(3),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[0]_i_2_n_11\,
      Q => sync0_cnt_reg(4),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[0]_i_2_n_10\,
      Q => sync0_cnt_reg(5),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[0]_i_2_n_9\,
      Q => sync0_cnt_reg(6),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[0]_i_2_n_8\,
      Q => sync0_cnt_reg(7),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[8]_i_1_n_15\,
      Q => sync0_cnt_reg(8),
      R => irq_req_i_1_n_0
    );
\sync0_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sync0_cnt_reg[0]_i_2_n_0\,
      CI_TOP => '0',
      CO(7) => \sync0_cnt_reg[8]_i_1_n_0\,
      CO(6) => \sync0_cnt_reg[8]_i_1_n_1\,
      CO(5) => \sync0_cnt_reg[8]_i_1_n_2\,
      CO(4) => \sync0_cnt_reg[8]_i_1_n_3\,
      CO(3) => \sync0_cnt_reg[8]_i_1_n_4\,
      CO(2) => \sync0_cnt_reg[8]_i_1_n_5\,
      CO(1) => \sync0_cnt_reg[8]_i_1_n_6\,
      CO(0) => \sync0_cnt_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \sync0_cnt_reg[8]_i_1_n_8\,
      O(6) => \sync0_cnt_reg[8]_i_1_n_9\,
      O(5) => \sync0_cnt_reg[8]_i_1_n_10\,
      O(4) => \sync0_cnt_reg[8]_i_1_n_11\,
      O(3) => \sync0_cnt_reg[8]_i_1_n_12\,
      O(2) => \sync0_cnt_reg[8]_i_1_n_13\,
      O(1) => \sync0_cnt_reg[8]_i_1_n_14\,
      O(0) => \sync0_cnt_reg[8]_i_1_n_15\,
      S(7 downto 0) => sync0_cnt_reg(15 downto 8)
    );
\sync0_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync0_rise,
      D => \sync0_cnt_reg[8]_i_1_n_14\,
      Q => sync0_cnt_reg(9),
      R => irq_req_i_1_n_0
    );
sync0_req_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFFAAAAAAAA"
    )
        port map (
      I0 => sync0_rise,
      I1 => s00_axi_wdata(1),
      I2 => \wr_addr__2\(0),
      I3 => \wr_addr__2\(1),
      I4 => irq_req_i_5_n_0,
      I5 => \^sync0_int\,
      O => sync0_req_i_1_n_0
    );
sync0_req_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => sync0_req_i_1_n_0,
      Q => \^sync0_int\,
      R => irq_req_i_1_n_0
    );
sync0_sync0_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => sync0_in,
      Q => sync0_sync0,
      R => irq_req_i_1_n_0
    );
sync0_sync1_d_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => sync0_sync1,
      Q => sync0_sync1_d,
      R => irq_req_i_1_n_0
    );
sync0_sync1_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => sync0_sync0,
      Q => sync0_sync1,
      R => irq_req_i_1_n_0
    );
\sync1_cnt[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => sync1_sync1,
      I1 => sync1_sync1_d,
      O => sync1_rise
    );
\sync1_cnt[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sync1_cnt_reg(0),
      O => \sync1_cnt[0]_i_3_n_0\
    );
\sync1_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[0]_i_2_n_15\,
      Q => sync1_cnt_reg(0),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[0]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \sync1_cnt_reg[0]_i_2_n_0\,
      CO(6) => \sync1_cnt_reg[0]_i_2_n_1\,
      CO(5) => \sync1_cnt_reg[0]_i_2_n_2\,
      CO(4) => \sync1_cnt_reg[0]_i_2_n_3\,
      CO(3) => \sync1_cnt_reg[0]_i_2_n_4\,
      CO(2) => \sync1_cnt_reg[0]_i_2_n_5\,
      CO(1) => \sync1_cnt_reg[0]_i_2_n_6\,
      CO(0) => \sync1_cnt_reg[0]_i_2_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \sync1_cnt_reg[0]_i_2_n_8\,
      O(6) => \sync1_cnt_reg[0]_i_2_n_9\,
      O(5) => \sync1_cnt_reg[0]_i_2_n_10\,
      O(4) => \sync1_cnt_reg[0]_i_2_n_11\,
      O(3) => \sync1_cnt_reg[0]_i_2_n_12\,
      O(2) => \sync1_cnt_reg[0]_i_2_n_13\,
      O(1) => \sync1_cnt_reg[0]_i_2_n_14\,
      O(0) => \sync1_cnt_reg[0]_i_2_n_15\,
      S(7 downto 1) => sync1_cnt_reg(7 downto 1),
      S(0) => \sync1_cnt[0]_i_3_n_0\
    );
\sync1_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[8]_i_1_n_13\,
      Q => sync1_cnt_reg(10),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[8]_i_1_n_12\,
      Q => sync1_cnt_reg(11),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[8]_i_1_n_11\,
      Q => sync1_cnt_reg(12),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[8]_i_1_n_10\,
      Q => sync1_cnt_reg(13),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[8]_i_1_n_9\,
      Q => sync1_cnt_reg(14),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[8]_i_1_n_8\,
      Q => sync1_cnt_reg(15),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[16]_i_1_n_15\,
      Q => sync1_cnt_reg(16),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sync1_cnt_reg[8]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \sync1_cnt_reg[16]_i_1_n_0\,
      CO(6) => \sync1_cnt_reg[16]_i_1_n_1\,
      CO(5) => \sync1_cnt_reg[16]_i_1_n_2\,
      CO(4) => \sync1_cnt_reg[16]_i_1_n_3\,
      CO(3) => \sync1_cnt_reg[16]_i_1_n_4\,
      CO(2) => \sync1_cnt_reg[16]_i_1_n_5\,
      CO(1) => \sync1_cnt_reg[16]_i_1_n_6\,
      CO(0) => \sync1_cnt_reg[16]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \sync1_cnt_reg[16]_i_1_n_8\,
      O(6) => \sync1_cnt_reg[16]_i_1_n_9\,
      O(5) => \sync1_cnt_reg[16]_i_1_n_10\,
      O(4) => \sync1_cnt_reg[16]_i_1_n_11\,
      O(3) => \sync1_cnt_reg[16]_i_1_n_12\,
      O(2) => \sync1_cnt_reg[16]_i_1_n_13\,
      O(1) => \sync1_cnt_reg[16]_i_1_n_14\,
      O(0) => \sync1_cnt_reg[16]_i_1_n_15\,
      S(7 downto 0) => sync1_cnt_reg(23 downto 16)
    );
\sync1_cnt_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[16]_i_1_n_14\,
      Q => sync1_cnt_reg(17),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[16]_i_1_n_13\,
      Q => sync1_cnt_reg(18),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[16]_i_1_n_12\,
      Q => sync1_cnt_reg(19),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[0]_i_2_n_14\,
      Q => sync1_cnt_reg(1),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[16]_i_1_n_11\,
      Q => sync1_cnt_reg(20),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[16]_i_1_n_10\,
      Q => sync1_cnt_reg(21),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[16]_i_1_n_9\,
      Q => sync1_cnt_reg(22),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[16]_i_1_n_8\,
      Q => sync1_cnt_reg(23),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[24]_i_1_n_15\,
      Q => sync1_cnt_reg(24),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[24]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sync1_cnt_reg[16]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_sync1_cnt_reg[24]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \sync1_cnt_reg[24]_i_1_n_1\,
      CO(5) => \sync1_cnt_reg[24]_i_1_n_2\,
      CO(4) => \sync1_cnt_reg[24]_i_1_n_3\,
      CO(3) => \sync1_cnt_reg[24]_i_1_n_4\,
      CO(2) => \sync1_cnt_reg[24]_i_1_n_5\,
      CO(1) => \sync1_cnt_reg[24]_i_1_n_6\,
      CO(0) => \sync1_cnt_reg[24]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \sync1_cnt_reg[24]_i_1_n_8\,
      O(6) => \sync1_cnt_reg[24]_i_1_n_9\,
      O(5) => \sync1_cnt_reg[24]_i_1_n_10\,
      O(4) => \sync1_cnt_reg[24]_i_1_n_11\,
      O(3) => \sync1_cnt_reg[24]_i_1_n_12\,
      O(2) => \sync1_cnt_reg[24]_i_1_n_13\,
      O(1) => \sync1_cnt_reg[24]_i_1_n_14\,
      O(0) => \sync1_cnt_reg[24]_i_1_n_15\,
      S(7 downto 0) => sync1_cnt_reg(31 downto 24)
    );
\sync1_cnt_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[24]_i_1_n_14\,
      Q => sync1_cnt_reg(25),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[24]_i_1_n_13\,
      Q => sync1_cnt_reg(26),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[24]_i_1_n_12\,
      Q => sync1_cnt_reg(27),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[24]_i_1_n_11\,
      Q => sync1_cnt_reg(28),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[24]_i_1_n_10\,
      Q => sync1_cnt_reg(29),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[0]_i_2_n_13\,
      Q => sync1_cnt_reg(2),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[24]_i_1_n_9\,
      Q => sync1_cnt_reg(30),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[24]_i_1_n_8\,
      Q => sync1_cnt_reg(31),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[0]_i_2_n_12\,
      Q => sync1_cnt_reg(3),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[0]_i_2_n_11\,
      Q => sync1_cnt_reg(4),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[0]_i_2_n_10\,
      Q => sync1_cnt_reg(5),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[0]_i_2_n_9\,
      Q => sync1_cnt_reg(6),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[0]_i_2_n_8\,
      Q => sync1_cnt_reg(7),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[8]_i_1_n_15\,
      Q => sync1_cnt_reg(8),
      R => irq_req_i_1_n_0
    );
\sync1_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sync1_cnt_reg[0]_i_2_n_0\,
      CI_TOP => '0',
      CO(7) => \sync1_cnt_reg[8]_i_1_n_0\,
      CO(6) => \sync1_cnt_reg[8]_i_1_n_1\,
      CO(5) => \sync1_cnt_reg[8]_i_1_n_2\,
      CO(4) => \sync1_cnt_reg[8]_i_1_n_3\,
      CO(3) => \sync1_cnt_reg[8]_i_1_n_4\,
      CO(2) => \sync1_cnt_reg[8]_i_1_n_5\,
      CO(1) => \sync1_cnt_reg[8]_i_1_n_6\,
      CO(0) => \sync1_cnt_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \sync1_cnt_reg[8]_i_1_n_8\,
      O(6) => \sync1_cnt_reg[8]_i_1_n_9\,
      O(5) => \sync1_cnt_reg[8]_i_1_n_10\,
      O(4) => \sync1_cnt_reg[8]_i_1_n_11\,
      O(3) => \sync1_cnt_reg[8]_i_1_n_12\,
      O(2) => \sync1_cnt_reg[8]_i_1_n_13\,
      O(1) => \sync1_cnt_reg[8]_i_1_n_14\,
      O(0) => \sync1_cnt_reg[8]_i_1_n_15\,
      S(7 downto 0) => sync1_cnt_reg(15 downto 8)
    );
\sync1_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => sync1_rise,
      D => \sync1_cnt_reg[8]_i_1_n_14\,
      Q => sync1_cnt_reg(9),
      R => irq_req_i_1_n_0
    );
sync1_req_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFFAAAAAAAA"
    )
        port map (
      I0 => sync1_rise,
      I1 => s00_axi_wdata(2),
      I2 => \wr_addr__2\(0),
      I3 => \wr_addr__2\(1),
      I4 => irq_req_i_5_n_0,
      I5 => \^sync1_int\,
      O => sync1_req_i_1_n_0
    );
sync1_req_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => sync1_req_i_1_n_0,
      Q => \^sync1_int\,
      R => irq_req_i_1_n_0
    );
sync1_sync0_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => sync1_in,
      Q => sync1_sync0,
      R => irq_req_i_1_n_0
    );
sync1_sync1_d_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => sync1_sync1,
      Q => sync1_sync1_d,
      R => irq_req_i_1_n_0
    );
sync1_sync1_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => sync1_sync0,
      Q => sync1_sync1,
      R => irq_req_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity kd240_ecat_bd_ecat_pl_if_0_0_ecat_pl_if is
  port (
    axi_rvalid_reg : out STD_LOGIC;
    axi_arready_reg : out STD_LOGIC;
    rst_out : out STD_LOGIC;
    axi_awready_reg : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    irq_int : out STD_LOGIC;
    sync0_int : out STD_LOGIC;
    sync1_int : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    irq_in : in STD_LOGIC;
    sync0_in : in STD_LOGIC;
    sync1_in : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC
  );
end kd240_ecat_bd_ecat_pl_if_0_0_ecat_pl_if;

architecture STRUCTURE of kd240_ecat_bd_ecat_pl_if_0_0_ecat_pl_if is
begin
ecat_pl_if_slave_lite_v1_0_S00_AXI_inst: entity work.kd240_ecat_bd_ecat_pl_if_0_0_ecat_pl_if_slave_lite_v1_0_S00_AXI
     port map (
      axi_arready_reg_0 => axi_arready_reg,
      axi_awready_reg_0 => axi_awready_reg,
      axi_rvalid_reg_0 => axi_rvalid_reg,
      irq_in => irq_in,
      irq_int => irq_int,
      rst_out => rst_out,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(2 downto 0) => s00_axi_araddr(2 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(2 downto 0) => s00_axi_awaddr(2 downto 0),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      sync0_in => sync0_in,
      sync0_int => sync0_int,
      sync1_in => sync1_in,
      sync1_int => sync1_int
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity kd240_ecat_bd_ecat_pl_if_0_0 is
  port (
    irq_in : in STD_LOGIC;
    sync0_in : in STD_LOGIC;
    sync1_in : in STD_LOGIC;
    rst_out : out STD_LOGIC;
    irq_int : out STD_LOGIC;
    sync0_int : out STD_LOGIC;
    sync1_int : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of kd240_ecat_bd_ecat_pl_if_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of kd240_ecat_bd_ecat_pl_if_0_0 : entity is "kd240_ecat_bd_ecat_pl_if_0_0,ecat_pl_if,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of kd240_ecat_bd_ecat_pl_if_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of kd240_ecat_bd_ecat_pl_if_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of kd240_ecat_bd_ecat_pl_if_0_0 : entity is "ecat_pl_if,Vivado 2025.2";
end kd240_ecat_bd_ecat_pl_if_0_0;

architecture STRUCTURE of kd240_ecat_bd_ecat_pl_if_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of s00_axi_aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN kd240_ecat_bd_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST";
  attribute X_INTERFACE_MODE of s00_axi_aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 s00_axi BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 s00_axi RREADY";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 s00_axi WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWADDR";
  attribute X_INTERFACE_MODE of s00_axi_awaddr : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s00_axi_awaddr : signal is "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99999001, ID_WIDTH 0, ADDR_WIDTH 5, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN kd240_ecat_bd_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 s00_axi BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 s00_axi RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 s00_axi RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 s00_axi WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 s00_axi WSTRB";
begin
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.kd240_ecat_bd_ecat_pl_if_0_0_ecat_pl_if
     port map (
      axi_arready_reg => s00_axi_arready,
      axi_awready_reg => s00_axi_awready,
      axi_rvalid_reg => s00_axi_rvalid,
      irq_in => irq_in,
      irq_int => irq_int,
      rst_out => rst_out,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(2 downto 0) => s00_axi_araddr(4 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(2 downto 0) => s00_axi_awaddr(4 downto 2),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      sync0_in => sync0_in,
      sync0_int => sync0_int,
      sync1_in => sync1_in,
      sync1_int => sync1_int
    );
end STRUCTURE;
