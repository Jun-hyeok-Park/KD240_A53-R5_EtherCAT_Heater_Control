-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Fri May 15 16:53:24 2026
-- Host        : pjh running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ kd240_ecat_bd_heater_axi_0_0_sim_netlist.vhdl
-- Design      : kd240_ecat_bd_heater_axi_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xck24-ubva530-2LV-c
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_core_dummy is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \error_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    \error_reg[31]_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rdata_0_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[0]_0\ : in STD_LOGIC;
    s00_axi_rdata_1_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[1]_0\ : in STD_LOGIC;
    \s00_axi_rdata[1]_1\ : in STD_LOGIC;
    s00_axi_rdata_2_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[2]_0\ : in STD_LOGIC;
    \s00_axi_rdata[2]_1\ : in STD_LOGIC;
    s00_axi_rdata_3_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[3]_0\ : in STD_LOGIC;
    \s00_axi_rdata[3]_1\ : in STD_LOGIC;
    s00_axi_rdata_4_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[4]_0\ : in STD_LOGIC;
    \s00_axi_rdata[4]_1\ : in STD_LOGIC;
    s00_axi_rdata_5_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[5]_0\ : in STD_LOGIC;
    \s00_axi_rdata[5]_1\ : in STD_LOGIC;
    s00_axi_rdata_6_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[6]_0\ : in STD_LOGIC;
    \s00_axi_rdata[6]_1\ : in STD_LOGIC;
    s00_axi_rdata_7_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[7]_0\ : in STD_LOGIC;
    \s00_axi_rdata[7]_1\ : in STD_LOGIC;
    s00_axi_rdata_8_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[8]_0\ : in STD_LOGIC;
    \s00_axi_rdata[8]_1\ : in STD_LOGIC;
    s00_axi_rdata_9_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[9]_0\ : in STD_LOGIC;
    \s00_axi_rdata[9]_1\ : in STD_LOGIC;
    s00_axi_rdata_10_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[10]_0\ : in STD_LOGIC;
    \s00_axi_rdata[10]_1\ : in STD_LOGIC;
    s00_axi_rdata_11_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[11]_0\ : in STD_LOGIC;
    \s00_axi_rdata[11]_1\ : in STD_LOGIC;
    s00_axi_rdata_12_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[12]_0\ : in STD_LOGIC;
    \s00_axi_rdata[12]_1\ : in STD_LOGIC;
    s00_axi_rdata_13_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[13]_0\ : in STD_LOGIC;
    \s00_axi_rdata[13]_1\ : in STD_LOGIC;
    s00_axi_rdata_14_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[14]_0\ : in STD_LOGIC;
    \s00_axi_rdata[14]_1\ : in STD_LOGIC;
    s00_axi_rdata_15_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[15]_0\ : in STD_LOGIC;
    \s00_axi_rdata[15]_1\ : in STD_LOGIC;
    s00_axi_rdata_16_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[16]_0\ : in STD_LOGIC;
    \s00_axi_rdata[16]_1\ : in STD_LOGIC;
    s00_axi_rdata_17_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[17]_0\ : in STD_LOGIC;
    \s00_axi_rdata[17]_1\ : in STD_LOGIC;
    s00_axi_rdata_18_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[18]_0\ : in STD_LOGIC;
    \s00_axi_rdata[18]_1\ : in STD_LOGIC;
    s00_axi_rdata_19_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[19]_0\ : in STD_LOGIC;
    \s00_axi_rdata[19]_1\ : in STD_LOGIC;
    s00_axi_rdata_20_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[20]_0\ : in STD_LOGIC;
    \s00_axi_rdata[20]_1\ : in STD_LOGIC;
    s00_axi_rdata_21_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[21]_0\ : in STD_LOGIC;
    \s00_axi_rdata[21]_1\ : in STD_LOGIC;
    s00_axi_rdata_22_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[22]_0\ : in STD_LOGIC;
    \s00_axi_rdata[22]_1\ : in STD_LOGIC;
    s00_axi_rdata_23_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[23]_0\ : in STD_LOGIC;
    \s00_axi_rdata[23]_1\ : in STD_LOGIC;
    s00_axi_rdata_24_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[24]_0\ : in STD_LOGIC;
    s00_axi_rdata_25_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[25]_0\ : in STD_LOGIC;
    s00_axi_rdata_26_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[26]_0\ : in STD_LOGIC;
    s00_axi_rdata_27_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[27]_0\ : in STD_LOGIC;
    s00_axi_rdata_28_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[28]_0\ : in STD_LOGIC;
    s00_axi_rdata_29_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[29]_0\ : in STD_LOGIC;
    s00_axi_rdata_30_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[30]_0\ : in STD_LOGIC;
    \s00_axi_rdata[30]_1\ : in STD_LOGIC;
    s00_axi_rdata_31_sp_1 : in STD_LOGIC;
    \s00_axi_rdata[31]_0\ : in STD_LOGIC;
    \s00_axi_rdata[31]_1\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_core_dummy;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_core_dummy is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \current_t[31]_i_1_n_0\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 23 downto 1 );
  signal \error[31]_i_1_n_0\ : STD_LOGIC;
  signal heater_current_t : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal heater_error : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal heater_u_ctrl : STD_LOGIC_VECTOR ( 29 to 29 );
  signal p_0_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \s00_axi_rdata[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[0]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[10]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[11]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[12]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[13]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[14]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[15]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[16]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[17]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[18]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[19]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[1]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[20]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[21]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[22]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[23]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[24]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[24]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[25]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[25]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[26]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[26]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[27]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[27]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[28]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[28]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[29]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[29]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[2]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[30]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[31]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[3]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[4]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[5]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[6]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[7]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[8]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[9]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal s00_axi_rdata_0_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_10_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_11_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_12_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_13_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_14_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_15_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_16_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_17_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_18_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_19_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_1_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_20_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_21_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_22_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_23_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_24_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_25_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_26_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_27_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_28_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_29_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_2_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_30_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_31_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_3_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_4_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_5_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_6_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_7_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_8_sn_1 : STD_LOGIC;
  signal s00_axi_rdata_9_sn_1 : STD_LOGIC;
  signal \temp_counter[0]_i_10_n_0\ : STD_LOGIC;
  signal \temp_counter[0]_i_2_n_0\ : STD_LOGIC;
  signal \temp_counter[0]_i_3_n_0\ : STD_LOGIC;
  signal \temp_counter[0]_i_4_n_0\ : STD_LOGIC;
  signal \temp_counter[0]_i_5_n_0\ : STD_LOGIC;
  signal \temp_counter[0]_i_6_n_0\ : STD_LOGIC;
  signal \temp_counter[0]_i_7_n_0\ : STD_LOGIC;
  signal \temp_counter[0]_i_8_n_0\ : STD_LOGIC;
  signal \temp_counter[0]_i_9_n_0\ : STD_LOGIC;
  signal \temp_counter[16]_i_2_n_0\ : STD_LOGIC;
  signal \temp_counter[16]_i_3_n_0\ : STD_LOGIC;
  signal \temp_counter[16]_i_4_n_0\ : STD_LOGIC;
  signal \temp_counter[16]_i_5_n_0\ : STD_LOGIC;
  signal \temp_counter[16]_i_6_n_0\ : STD_LOGIC;
  signal \temp_counter[16]_i_7_n_0\ : STD_LOGIC;
  signal \temp_counter[16]_i_8_n_0\ : STD_LOGIC;
  signal \temp_counter[16]_i_9_n_0\ : STD_LOGIC;
  signal \temp_counter[24]_i_2_n_0\ : STD_LOGIC;
  signal \temp_counter[24]_i_3_n_0\ : STD_LOGIC;
  signal \temp_counter[24]_i_4_n_0\ : STD_LOGIC;
  signal \temp_counter[24]_i_5_n_0\ : STD_LOGIC;
  signal \temp_counter[24]_i_6_n_0\ : STD_LOGIC;
  signal \temp_counter[24]_i_7_n_0\ : STD_LOGIC;
  signal \temp_counter[24]_i_8_n_0\ : STD_LOGIC;
  signal \temp_counter[24]_i_9_n_0\ : STD_LOGIC;
  signal \temp_counter[8]_i_2_n_0\ : STD_LOGIC;
  signal \temp_counter[8]_i_3_n_0\ : STD_LOGIC;
  signal \temp_counter[8]_i_4_n_0\ : STD_LOGIC;
  signal \temp_counter[8]_i_5_n_0\ : STD_LOGIC;
  signal \temp_counter[8]_i_6_n_0\ : STD_LOGIC;
  signal \temp_counter[8]_i_7_n_0\ : STD_LOGIC;
  signal \temp_counter[8]_i_8_n_0\ : STD_LOGIC;
  signal \temp_counter[8]_i_9_n_0\ : STD_LOGIC;
  signal temp_counter_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \temp_counter_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_10\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_11\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_12\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_13\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_14\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_15\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_8\ : STD_LOGIC;
  signal \temp_counter_reg[0]_i_1_n_9\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_10\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_11\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_12\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_13\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_14\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_15\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_8\ : STD_LOGIC;
  signal \temp_counter_reg[16]_i_1_n_9\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_10\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_11\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_12\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_13\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_14\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_15\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_8\ : STD_LOGIC;
  signal \temp_counter_reg[24]_i_1_n_9\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_10\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_11\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_12\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_8\ : STD_LOGIC;
  signal \temp_counter_reg[8]_i_1_n_9\ : STD_LOGIC;
  signal tick_100ms : STD_LOGIC;
  signal tick_100ms_reg_n_0 : STD_LOGIC;
  signal tick_cnt : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal \tick_cnt0_carry__0_n_0\ : STD_LOGIC;
  signal \tick_cnt0_carry__0_n_1\ : STD_LOGIC;
  signal \tick_cnt0_carry__0_n_2\ : STD_LOGIC;
  signal \tick_cnt0_carry__0_n_3\ : STD_LOGIC;
  signal \tick_cnt0_carry__0_n_4\ : STD_LOGIC;
  signal \tick_cnt0_carry__0_n_5\ : STD_LOGIC;
  signal \tick_cnt0_carry__0_n_6\ : STD_LOGIC;
  signal \tick_cnt0_carry__0_n_7\ : STD_LOGIC;
  signal \tick_cnt0_carry__1_n_2\ : STD_LOGIC;
  signal \tick_cnt0_carry__1_n_3\ : STD_LOGIC;
  signal \tick_cnt0_carry__1_n_4\ : STD_LOGIC;
  signal \tick_cnt0_carry__1_n_5\ : STD_LOGIC;
  signal \tick_cnt0_carry__1_n_6\ : STD_LOGIC;
  signal \tick_cnt0_carry__1_n_7\ : STD_LOGIC;
  signal tick_cnt0_carry_n_0 : STD_LOGIC;
  signal tick_cnt0_carry_n_1 : STD_LOGIC;
  signal tick_cnt0_carry_n_2 : STD_LOGIC;
  signal tick_cnt0_carry_n_3 : STD_LOGIC;
  signal tick_cnt0_carry_n_4 : STD_LOGIC;
  signal tick_cnt0_carry_n_5 : STD_LOGIC;
  signal tick_cnt0_carry_n_6 : STD_LOGIC;
  signal tick_cnt0_carry_n_7 : STD_LOGIC;
  signal \tick_cnt[23]_i_2_n_0\ : STD_LOGIC;
  signal \tick_cnt[23]_i_3_n_0\ : STD_LOGIC;
  signal \tick_cnt[23]_i_4_n_0\ : STD_LOGIC;
  signal \tick_cnt[23]_i_5_n_0\ : STD_LOGIC;
  signal \tick_cnt[23]_i_6_n_0\ : STD_LOGIC;
  signal \tick_cnt[23]_i_7_n_0\ : STD_LOGIC;
  signal \tick_cnt[23]_i_8_n_0\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[10]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[11]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[12]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[13]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[14]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[15]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[16]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[17]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[18]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[19]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[20]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[21]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[22]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[23]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[5]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[6]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[7]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[8]\ : STD_LOGIC;
  signal \tick_cnt_reg_n_0_[9]\ : STD_LOGIC;
  signal \u_ctrl[29]_i_1_n_0\ : STD_LOGIC;
  signal \NLW_temp_counter_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_tick_cnt0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal \NLW_tick_cnt0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \current_t[0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \current_t[10]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \current_t[11]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \current_t[12]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \current_t[13]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \current_t[14]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \current_t[15]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \current_t[16]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \current_t[17]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \current_t[18]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \current_t[19]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \current_t[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \current_t[20]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \current_t[21]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \current_t[22]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \current_t[23]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \current_t[24]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \current_t[25]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \current_t[26]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \current_t[27]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \current_t[28]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \current_t[29]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \current_t[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \current_t[30]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \current_t[31]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \current_t[3]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \current_t[4]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \current_t[5]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \current_t[6]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \current_t[7]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \current_t[8]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \current_t[9]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \error[0]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \error[10]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \error[11]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \error[12]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \error[13]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \error[14]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \error[15]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \error[16]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \error[17]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \error[18]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \error[19]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \error[1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \error[20]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \error[21]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \error[22]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \error[23]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \error[24]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \error[25]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \error[26]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \error[27]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \error[28]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \error[29]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \error[2]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \error[30]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \error[31]_i_2\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \error[3]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \error[4]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \error[5]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \error[6]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \error[7]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \error[8]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \error[9]_i_1\ : label is "soft_lutpair21";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \temp_counter_reg[0]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \temp_counter_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \temp_counter_reg[24]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \temp_counter_reg[8]_i_1\ : label is 35;
  attribute SOFT_HLUTNM of tick_100ms_i_1 : label is "soft_lutpair33";
  attribute ADDER_THRESHOLD of tick_cnt0_carry : label is 35;
  attribute ADDER_THRESHOLD of \tick_cnt0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \tick_cnt0_carry__1\ : label is 35;
  attribute SOFT_HLUTNM of \tick_cnt[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \tick_cnt[10]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \tick_cnt[11]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \tick_cnt[12]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \tick_cnt[13]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \tick_cnt[14]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \tick_cnt[15]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \tick_cnt[16]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \tick_cnt[17]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \tick_cnt[18]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \tick_cnt[19]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \tick_cnt[1]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \tick_cnt[20]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \tick_cnt[21]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \tick_cnt[22]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \tick_cnt[23]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \tick_cnt[23]_i_8\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \tick_cnt[2]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \tick_cnt[3]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \tick_cnt[4]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \tick_cnt[5]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \tick_cnt[6]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \tick_cnt[7]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \tick_cnt[8]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \tick_cnt[9]_i_1\ : label is "soft_lutpair37";
begin
  SR(0) <= \^sr\(0);
  s00_axi_rdata_0_sn_1 <= s00_axi_rdata_0_sp_1;
  s00_axi_rdata_10_sn_1 <= s00_axi_rdata_10_sp_1;
  s00_axi_rdata_11_sn_1 <= s00_axi_rdata_11_sp_1;
  s00_axi_rdata_12_sn_1 <= s00_axi_rdata_12_sp_1;
  s00_axi_rdata_13_sn_1 <= s00_axi_rdata_13_sp_1;
  s00_axi_rdata_14_sn_1 <= s00_axi_rdata_14_sp_1;
  s00_axi_rdata_15_sn_1 <= s00_axi_rdata_15_sp_1;
  s00_axi_rdata_16_sn_1 <= s00_axi_rdata_16_sp_1;
  s00_axi_rdata_17_sn_1 <= s00_axi_rdata_17_sp_1;
  s00_axi_rdata_18_sn_1 <= s00_axi_rdata_18_sp_1;
  s00_axi_rdata_19_sn_1 <= s00_axi_rdata_19_sp_1;
  s00_axi_rdata_1_sn_1 <= s00_axi_rdata_1_sp_1;
  s00_axi_rdata_20_sn_1 <= s00_axi_rdata_20_sp_1;
  s00_axi_rdata_21_sn_1 <= s00_axi_rdata_21_sp_1;
  s00_axi_rdata_22_sn_1 <= s00_axi_rdata_22_sp_1;
  s00_axi_rdata_23_sn_1 <= s00_axi_rdata_23_sp_1;
  s00_axi_rdata_24_sn_1 <= s00_axi_rdata_24_sp_1;
  s00_axi_rdata_25_sn_1 <= s00_axi_rdata_25_sp_1;
  s00_axi_rdata_26_sn_1 <= s00_axi_rdata_26_sp_1;
  s00_axi_rdata_27_sn_1 <= s00_axi_rdata_27_sp_1;
  s00_axi_rdata_28_sn_1 <= s00_axi_rdata_28_sp_1;
  s00_axi_rdata_29_sn_1 <= s00_axi_rdata_29_sp_1;
  s00_axi_rdata_2_sn_1 <= s00_axi_rdata_2_sp_1;
  s00_axi_rdata_30_sn_1 <= s00_axi_rdata_30_sp_1;
  s00_axi_rdata_31_sn_1 <= s00_axi_rdata_31_sp_1;
  s00_axi_rdata_3_sn_1 <= s00_axi_rdata_3_sp_1;
  s00_axi_rdata_4_sn_1 <= s00_axi_rdata_4_sp_1;
  s00_axi_rdata_5_sn_1 <= s00_axi_rdata_5_sp_1;
  s00_axi_rdata_6_sn_1 <= s00_axi_rdata_6_sp_1;
  s00_axi_rdata_7_sn_1 <= s00_axi_rdata_7_sp_1;
  s00_axi_rdata_8_sn_1 <= s00_axi_rdata_8_sp_1;
  s00_axi_rdata_9_sn_1 <= s00_axi_rdata_9_sp_1;
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => \^sr\(0)
    );
\current_t[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(0),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(0)
    );
\current_t[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(10),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(10)
    );
\current_t[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(11),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(11)
    );
\current_t[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(12),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(12)
    );
\current_t[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(13),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(13)
    );
\current_t[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(14),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(14)
    );
\current_t[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(15),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(15)
    );
\current_t[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(16),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(16)
    );
\current_t[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(17),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(17)
    );
\current_t[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(18),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(18)
    );
\current_t[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(19),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(19)
    );
\current_t[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(1),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(1)
    );
\current_t[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(20),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(20)
    );
\current_t[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(21),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(21)
    );
\current_t[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(22),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(22)
    );
\current_t[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(23),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(23)
    );
\current_t[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(24),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(24)
    );
\current_t[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(25),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(25)
    );
\current_t[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(26),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(26)
    );
\current_t[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(27),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(27)
    );
\current_t[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(28),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(28)
    );
\current_t[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(29),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(29)
    );
\current_t[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(2),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(2)
    );
\current_t[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(30),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(30)
    );
\current_t[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \error_reg[0]_0\(1),
      I1 => tick_100ms_reg_n_0,
      I2 => \error_reg[0]_0\(0),
      O => \current_t[31]_i_1_n_0\
    );
\current_t[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(31),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(31)
    );
\current_t[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(3),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(3)
    );
\current_t[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(4),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(4)
    );
\current_t[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(5),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(5)
    );
\current_t[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(6),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(6)
    );
\current_t[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(7),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(7)
    );
\current_t[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(8),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(8)
    );
\current_t[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(9),
      I1 => \error_reg[0]_0\(1),
      O => p_0_in(9)
    );
\current_t_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(0),
      Q => heater_current_t(0)
    );
\current_t_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(10),
      Q => heater_current_t(10)
    );
\current_t_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(11),
      Q => heater_current_t(11)
    );
\current_t_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(12),
      Q => heater_current_t(12)
    );
\current_t_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(13),
      Q => heater_current_t(13)
    );
\current_t_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(14),
      Q => heater_current_t(14)
    );
\current_t_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(15),
      Q => heater_current_t(15)
    );
\current_t_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(16),
      Q => heater_current_t(16)
    );
\current_t_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(17),
      Q => heater_current_t(17)
    );
\current_t_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(18),
      Q => heater_current_t(18)
    );
\current_t_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(19),
      Q => heater_current_t(19)
    );
\current_t_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(1),
      Q => heater_current_t(1)
    );
\current_t_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(20),
      Q => heater_current_t(20)
    );
\current_t_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(21),
      Q => heater_current_t(21)
    );
\current_t_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(22),
      Q => heater_current_t(22)
    );
\current_t_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(23),
      Q => heater_current_t(23)
    );
\current_t_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(24),
      Q => heater_current_t(24)
    );
\current_t_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(25),
      Q => heater_current_t(25)
    );
\current_t_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(26),
      Q => heater_current_t(26)
    );
\current_t_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(27),
      Q => heater_current_t(27)
    );
\current_t_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(28),
      Q => heater_current_t(28)
    );
\current_t_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(29),
      Q => heater_current_t(29)
    );
\current_t_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(2),
      Q => heater_current_t(2)
    );
\current_t_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(30),
      Q => heater_current_t(30)
    );
\current_t_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(31),
      Q => heater_current_t(31)
    );
\current_t_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(3),
      Q => heater_current_t(3)
    );
\current_t_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(4),
      Q => heater_current_t(4)
    );
\current_t_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(5),
      Q => heater_current_t(5)
    );
\current_t_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(6),
      Q => heater_current_t(6)
    );
\current_t_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(7),
      Q => heater_current_t(7)
    );
\current_t_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(8),
      Q => heater_current_t(8)
    );
\current_t_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_0_in(9),
      Q => heater_current_t(9)
    );
\error[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(0),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(0)
    );
\error[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(10),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(10)
    );
\error[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(11),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(11)
    );
\error[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(12),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(12)
    );
\error[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(13),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(13)
    );
\error[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(14),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(14)
    );
\error[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(15),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(15)
    );
\error[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(16),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(16)
    );
\error[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(17),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(17)
    );
\error[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(18),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(18)
    );
\error[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(19),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(19)
    );
\error[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(1),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(1)
    );
\error[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(20),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(20)
    );
\error[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(21),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(21)
    );
\error[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(22),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(22)
    );
\error[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(23),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(23)
    );
\error[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(24),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(24)
    );
\error[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(25),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(25)
    );
\error[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(26),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(26)
    );
\error[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(27),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(27)
    );
\error[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(28),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(28)
    );
\error[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(29),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(29)
    );
\error[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(2),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(2)
    );
\error[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(30),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(30)
    );
\error[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \error_reg[0]_0\(1),
      I1 => \error_reg[0]_0\(0),
      O => \error[31]_i_1_n_0\
    );
\error[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(31),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(31)
    );
\error[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(3),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(3)
    );
\error[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(4),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(4)
    );
\error[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(5),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(5)
    );
\error[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(6),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(6)
    );
\error[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(7),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(7)
    );
\error[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(8),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(8)
    );
\error[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[31]_0\(9),
      I1 => \error_reg[0]_0\(1),
      O => p_1_in(9)
    );
\error_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(0),
      Q => heater_error(0)
    );
\error_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(10),
      Q => heater_error(10)
    );
\error_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(11),
      Q => heater_error(11)
    );
\error_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(12),
      Q => heater_error(12)
    );
\error_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(13),
      Q => heater_error(13)
    );
\error_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(14),
      Q => heater_error(14)
    );
\error_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(15),
      Q => heater_error(15)
    );
\error_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(16),
      Q => heater_error(16)
    );
\error_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(17),
      Q => heater_error(17)
    );
\error_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(18),
      Q => heater_error(18)
    );
\error_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(19),
      Q => heater_error(19)
    );
\error_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(1),
      Q => heater_error(1)
    );
\error_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(20),
      Q => heater_error(20)
    );
\error_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(21),
      Q => heater_error(21)
    );
\error_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(22),
      Q => heater_error(22)
    );
\error_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(23),
      Q => heater_error(23)
    );
\error_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(24),
      Q => heater_error(24)
    );
\error_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(25),
      Q => heater_error(25)
    );
\error_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(26),
      Q => heater_error(26)
    );
\error_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(27),
      Q => heater_error(27)
    );
\error_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(28),
      Q => heater_error(28)
    );
\error_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(29),
      Q => heater_error(29)
    );
\error_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(2),
      Q => heater_error(2)
    );
\error_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(30),
      Q => heater_error(30)
    );
\error_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(31),
      Q => heater_error(31)
    );
\error_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(3),
      Q => heater_error(3)
    );
\error_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(4),
      Q => heater_error(4)
    );
\error_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(5),
      Q => heater_error(5)
    );
\error_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(6),
      Q => heater_error(6)
    );
\error_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(7),
      Q => heater_error(7)
    );
\error_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(8),
      Q => heater_error(8)
    );
\error_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \error[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => p_1_in(9),
      Q => heater_error(9)
    );
\s00_axi_rdata[0]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \s00_axi_rdata[0]_INST_0_i_1_n_0\,
      I1 => s00_axi_rdata_0_sn_1,
      O => s00_axi_rdata(0),
      S => Q(3)
    );
\s00_axi_rdata[0]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[0]_0\,
      I1 => \s00_axi_rdata[0]_INST_0_i_4_n_0\,
      O => \s00_axi_rdata[0]_INST_0_i_1_n_0\,
      S => Q(2)
    );
\s00_axi_rdata[0]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => heater_u_ctrl(29),
      I1 => Q(1),
      I2 => heater_error(0),
      I3 => Q(0),
      I4 => heater_current_t(0),
      O => \s00_axi_rdata[0]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_10_sn_1,
      I1 => \s00_axi_rdata[10]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[10]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[10]_1\,
      O => s00_axi_rdata(10)
    );
\s00_axi_rdata[10]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(10),
      I1 => Q(0),
      I2 => heater_error(10),
      I3 => Q(1),
      O => \s00_axi_rdata[10]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_11_sn_1,
      I1 => \s00_axi_rdata[11]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[11]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[11]_1\,
      O => s00_axi_rdata(11)
    );
\s00_axi_rdata[11]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(11),
      I1 => Q(0),
      I2 => heater_error(11),
      I3 => Q(1),
      O => \s00_axi_rdata[11]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[12]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_12_sn_1,
      I1 => \s00_axi_rdata[12]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[12]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[12]_1\,
      O => s00_axi_rdata(12)
    );
\s00_axi_rdata[12]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(12),
      I1 => Q(0),
      I2 => heater_error(12),
      I3 => Q(1),
      O => \s00_axi_rdata[12]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[13]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_13_sn_1,
      I1 => \s00_axi_rdata[13]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[13]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[13]_1\,
      O => s00_axi_rdata(13)
    );
\s00_axi_rdata[13]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(13),
      I1 => Q(0),
      I2 => heater_error(13),
      I3 => Q(1),
      O => \s00_axi_rdata[13]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[14]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_14_sn_1,
      I1 => \s00_axi_rdata[14]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[14]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[14]_1\,
      O => s00_axi_rdata(14)
    );
\s00_axi_rdata[14]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(14),
      I1 => Q(0),
      I2 => heater_error(14),
      I3 => Q(1),
      O => \s00_axi_rdata[14]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[15]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_15_sn_1,
      I1 => \s00_axi_rdata[15]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[15]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[15]_1\,
      O => s00_axi_rdata(15)
    );
\s00_axi_rdata[15]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(15),
      I1 => Q(0),
      I2 => heater_error(15),
      I3 => Q(1),
      O => \s00_axi_rdata[15]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[16]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_16_sn_1,
      I1 => \s00_axi_rdata[16]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[16]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[16]_1\,
      O => s00_axi_rdata(16)
    );
\s00_axi_rdata[16]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(16),
      I1 => Q(0),
      I2 => heater_error(16),
      I3 => Q(1),
      O => \s00_axi_rdata[16]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[17]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_17_sn_1,
      I1 => \s00_axi_rdata[17]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[17]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[17]_1\,
      O => s00_axi_rdata(17)
    );
\s00_axi_rdata[17]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(17),
      I1 => Q(0),
      I2 => heater_error(17),
      I3 => Q(1),
      O => \s00_axi_rdata[17]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[18]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_18_sn_1,
      I1 => \s00_axi_rdata[18]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[18]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[18]_1\,
      O => s00_axi_rdata(18)
    );
\s00_axi_rdata[18]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(18),
      I1 => Q(0),
      I2 => heater_error(18),
      I3 => Q(1),
      O => \s00_axi_rdata[18]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[19]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_19_sn_1,
      I1 => \s00_axi_rdata[19]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[19]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[19]_1\,
      O => s00_axi_rdata(19)
    );
\s00_axi_rdata[19]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(19),
      I1 => Q(0),
      I2 => heater_error(19),
      I3 => Q(1),
      O => \s00_axi_rdata[19]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_1_sn_1,
      I1 => \s00_axi_rdata[1]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[1]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[1]_1\,
      O => s00_axi_rdata(1)
    );
\s00_axi_rdata[1]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(1),
      I1 => Q(0),
      I2 => heater_error(1),
      I3 => Q(1),
      O => \s00_axi_rdata[1]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[20]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_20_sn_1,
      I1 => \s00_axi_rdata[20]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[20]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[20]_1\,
      O => s00_axi_rdata(20)
    );
\s00_axi_rdata[20]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(20),
      I1 => Q(0),
      I2 => heater_error(20),
      I3 => Q(1),
      O => \s00_axi_rdata[20]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[21]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_21_sn_1,
      I1 => \s00_axi_rdata[21]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[21]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[21]_1\,
      O => s00_axi_rdata(21)
    );
\s00_axi_rdata[21]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(21),
      I1 => Q(0),
      I2 => heater_error(21),
      I3 => Q(1),
      O => \s00_axi_rdata[21]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[22]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_22_sn_1,
      I1 => \s00_axi_rdata[22]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[22]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[22]_1\,
      O => s00_axi_rdata(22)
    );
\s00_axi_rdata[22]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(22),
      I1 => Q(0),
      I2 => heater_error(22),
      I3 => Q(1),
      O => \s00_axi_rdata[22]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[23]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_23_sn_1,
      I1 => \s00_axi_rdata[23]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[23]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[23]_1\,
      O => s00_axi_rdata(23)
    );
\s00_axi_rdata[23]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(23),
      I1 => Q(0),
      I2 => heater_error(23),
      I3 => Q(1),
      O => \s00_axi_rdata[23]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[24]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \s00_axi_rdata[24]_INST_0_i_1_n_0\,
      I1 => s00_axi_rdata_24_sn_1,
      O => s00_axi_rdata(24),
      S => Q(3)
    );
\s00_axi_rdata[24]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[24]_0\,
      I1 => \s00_axi_rdata[24]_INST_0_i_4_n_0\,
      O => \s00_axi_rdata[24]_INST_0_i_1_n_0\,
      S => Q(2)
    );
\s00_axi_rdata[24]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => heater_u_ctrl(29),
      I1 => Q(1),
      I2 => heater_error(24),
      I3 => Q(0),
      I4 => heater_current_t(24),
      O => \s00_axi_rdata[24]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[25]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \s00_axi_rdata[25]_INST_0_i_1_n_0\,
      I1 => s00_axi_rdata_25_sn_1,
      O => s00_axi_rdata(25),
      S => Q(3)
    );
\s00_axi_rdata[25]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[25]_0\,
      I1 => \s00_axi_rdata[25]_INST_0_i_4_n_0\,
      O => \s00_axi_rdata[25]_INST_0_i_1_n_0\,
      S => Q(2)
    );
\s00_axi_rdata[25]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => heater_u_ctrl(29),
      I1 => Q(1),
      I2 => heater_error(25),
      I3 => Q(0),
      I4 => heater_current_t(25),
      O => \s00_axi_rdata[25]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[26]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \s00_axi_rdata[26]_INST_0_i_1_n_0\,
      I1 => s00_axi_rdata_26_sn_1,
      O => s00_axi_rdata(26),
      S => Q(3)
    );
\s00_axi_rdata[26]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[26]_0\,
      I1 => \s00_axi_rdata[26]_INST_0_i_4_n_0\,
      O => \s00_axi_rdata[26]_INST_0_i_1_n_0\,
      S => Q(2)
    );
\s00_axi_rdata[26]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => heater_u_ctrl(29),
      I1 => Q(1),
      I2 => heater_error(26),
      I3 => Q(0),
      I4 => heater_current_t(26),
      O => \s00_axi_rdata[26]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[27]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \s00_axi_rdata[27]_INST_0_i_1_n_0\,
      I1 => s00_axi_rdata_27_sn_1,
      O => s00_axi_rdata(27),
      S => Q(3)
    );
\s00_axi_rdata[27]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[27]_0\,
      I1 => \s00_axi_rdata[27]_INST_0_i_4_n_0\,
      O => \s00_axi_rdata[27]_INST_0_i_1_n_0\,
      S => Q(2)
    );
\s00_axi_rdata[27]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => heater_u_ctrl(29),
      I1 => Q(1),
      I2 => heater_error(27),
      I3 => Q(0),
      I4 => heater_current_t(27),
      O => \s00_axi_rdata[27]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[28]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \s00_axi_rdata[28]_INST_0_i_1_n_0\,
      I1 => s00_axi_rdata_28_sn_1,
      O => s00_axi_rdata(28),
      S => Q(3)
    );
\s00_axi_rdata[28]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[28]_0\,
      I1 => \s00_axi_rdata[28]_INST_0_i_4_n_0\,
      O => \s00_axi_rdata[28]_INST_0_i_1_n_0\,
      S => Q(2)
    );
\s00_axi_rdata[28]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => heater_u_ctrl(29),
      I1 => Q(1),
      I2 => heater_error(28),
      I3 => Q(0),
      I4 => heater_current_t(28),
      O => \s00_axi_rdata[28]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[29]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \s00_axi_rdata[29]_INST_0_i_1_n_0\,
      I1 => s00_axi_rdata_29_sn_1,
      O => s00_axi_rdata(29),
      S => Q(3)
    );
\s00_axi_rdata[29]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[29]_0\,
      I1 => \s00_axi_rdata[29]_INST_0_i_4_n_0\,
      O => \s00_axi_rdata[29]_INST_0_i_1_n_0\,
      S => Q(2)
    );
\s00_axi_rdata[29]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => heater_u_ctrl(29),
      I1 => Q(1),
      I2 => heater_error(29),
      I3 => Q(0),
      I4 => heater_current_t(29),
      O => \s00_axi_rdata[29]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_2_sn_1,
      I1 => \s00_axi_rdata[2]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[2]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[2]_1\,
      O => s00_axi_rdata(2)
    );
\s00_axi_rdata[2]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(2),
      I1 => Q(0),
      I2 => heater_error(2),
      I3 => Q(1),
      O => \s00_axi_rdata[2]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[30]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_30_sn_1,
      I1 => \s00_axi_rdata[30]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[30]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[30]_1\,
      O => s00_axi_rdata(30)
    );
\s00_axi_rdata[30]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(30),
      I1 => Q(0),
      I2 => heater_error(30),
      I3 => Q(1),
      O => \s00_axi_rdata[30]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[31]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_31_sn_1,
      I1 => \s00_axi_rdata[31]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[31]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[31]_1\,
      O => s00_axi_rdata(31)
    );
\s00_axi_rdata[31]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(31),
      I1 => Q(0),
      I2 => heater_error(31),
      I3 => Q(1),
      O => \s00_axi_rdata[31]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_3_sn_1,
      I1 => \s00_axi_rdata[3]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[3]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[3]_1\,
      O => s00_axi_rdata(3)
    );
\s00_axi_rdata[3]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(3),
      I1 => Q(0),
      I2 => heater_error(3),
      I3 => Q(1),
      O => \s00_axi_rdata[3]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_4_sn_1,
      I1 => \s00_axi_rdata[4]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[4]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[4]_1\,
      O => s00_axi_rdata(4)
    );
\s00_axi_rdata[4]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(4),
      I1 => Q(0),
      I2 => heater_error(4),
      I3 => Q(1),
      O => \s00_axi_rdata[4]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_5_sn_1,
      I1 => \s00_axi_rdata[5]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[5]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[5]_1\,
      O => s00_axi_rdata(5)
    );
\s00_axi_rdata[5]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(5),
      I1 => Q(0),
      I2 => heater_error(5),
      I3 => Q(1),
      O => \s00_axi_rdata[5]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_6_sn_1,
      I1 => \s00_axi_rdata[6]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[6]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[6]_1\,
      O => s00_axi_rdata(6)
    );
\s00_axi_rdata[6]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(6),
      I1 => Q(0),
      I2 => heater_error(6),
      I3 => Q(1),
      O => \s00_axi_rdata[6]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_7_sn_1,
      I1 => \s00_axi_rdata[7]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[7]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[7]_1\,
      O => s00_axi_rdata(7)
    );
\s00_axi_rdata[7]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(7),
      I1 => Q(0),
      I2 => heater_error(7),
      I3 => Q(1),
      O => \s00_axi_rdata[7]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_8_sn_1,
      I1 => \s00_axi_rdata[8]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[8]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[8]_1\,
      O => s00_axi_rdata(8)
    );
\s00_axi_rdata[8]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(8),
      I1 => Q(0),
      I2 => heater_error(8),
      I3 => Q(1),
      O => \s00_axi_rdata[8]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s00_axi_rdata_9_sn_1,
      I1 => \s00_axi_rdata[9]_0\,
      I2 => Q(3),
      I3 => \s00_axi_rdata[9]_INST_0_i_3_n_0\,
      I4 => Q(2),
      I5 => \s00_axi_rdata[9]_1\,
      O => s00_axi_rdata(9)
    );
\s00_axi_rdata[9]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => heater_current_t(9),
      I1 => Q(0),
      I2 => heater_error(9),
      I3 => Q(1),
      O => \s00_axi_rdata[9]_INST_0_i_3_n_0\
    );
\temp_counter[0]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => temp_counter_reg(0),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[0]_i_10_n_0\
    );
\temp_counter[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(0),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[0]_i_2_n_0\
    );
\temp_counter[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(7),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[0]_i_3_n_0\
    );
\temp_counter[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(6),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[0]_i_4_n_0\
    );
\temp_counter[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(5),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[0]_i_5_n_0\
    );
\temp_counter[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(4),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[0]_i_6_n_0\
    );
\temp_counter[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(3),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[0]_i_7_n_0\
    );
\temp_counter[0]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(2),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[0]_i_8_n_0\
    );
\temp_counter[0]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(1),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[0]_i_9_n_0\
    );
\temp_counter[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(23),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[16]_i_2_n_0\
    );
\temp_counter[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(22),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[16]_i_3_n_0\
    );
\temp_counter[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(21),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[16]_i_4_n_0\
    );
\temp_counter[16]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(20),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[16]_i_5_n_0\
    );
\temp_counter[16]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(19),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[16]_i_6_n_0\
    );
\temp_counter[16]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(18),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[16]_i_7_n_0\
    );
\temp_counter[16]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(17),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[16]_i_8_n_0\
    );
\temp_counter[16]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(16),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[16]_i_9_n_0\
    );
\temp_counter[24]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(31),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[24]_i_2_n_0\
    );
\temp_counter[24]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(30),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[24]_i_3_n_0\
    );
\temp_counter[24]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(29),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[24]_i_4_n_0\
    );
\temp_counter[24]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(28),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[24]_i_5_n_0\
    );
\temp_counter[24]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(27),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[24]_i_6_n_0\
    );
\temp_counter[24]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(26),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[24]_i_7_n_0\
    );
\temp_counter[24]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(25),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[24]_i_8_n_0\
    );
\temp_counter[24]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(24),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[24]_i_9_n_0\
    );
\temp_counter[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(15),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[8]_i_2_n_0\
    );
\temp_counter[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(14),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[8]_i_3_n_0\
    );
\temp_counter[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(13),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[8]_i_4_n_0\
    );
\temp_counter[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(12),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[8]_i_5_n_0\
    );
\temp_counter[8]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(11),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[8]_i_6_n_0\
    );
\temp_counter[8]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(10),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[8]_i_7_n_0\
    );
\temp_counter[8]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(9),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[8]_i_8_n_0\
    );
\temp_counter[8]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => temp_counter_reg(8),
      I1 => \error_reg[0]_0\(1),
      O => \temp_counter[8]_i_9_n_0\
    );
\temp_counter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[0]_i_1_n_15\,
      Q => temp_counter_reg(0)
    );
\temp_counter_reg[0]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \temp_counter_reg[0]_i_1_n_0\,
      CO(6) => \temp_counter_reg[0]_i_1_n_1\,
      CO(5) => \temp_counter_reg[0]_i_1_n_2\,
      CO(4) => \temp_counter_reg[0]_i_1_n_3\,
      CO(3) => \temp_counter_reg[0]_i_1_n_4\,
      CO(2) => \temp_counter_reg[0]_i_1_n_5\,
      CO(1) => \temp_counter_reg[0]_i_1_n_6\,
      CO(0) => \temp_counter_reg[0]_i_1_n_7\,
      DI(7 downto 1) => B"0000000",
      DI(0) => \temp_counter[0]_i_2_n_0\,
      O(7) => \temp_counter_reg[0]_i_1_n_8\,
      O(6) => \temp_counter_reg[0]_i_1_n_9\,
      O(5) => \temp_counter_reg[0]_i_1_n_10\,
      O(4) => \temp_counter_reg[0]_i_1_n_11\,
      O(3) => \temp_counter_reg[0]_i_1_n_12\,
      O(2) => \temp_counter_reg[0]_i_1_n_13\,
      O(1) => \temp_counter_reg[0]_i_1_n_14\,
      O(0) => \temp_counter_reg[0]_i_1_n_15\,
      S(7) => \temp_counter[0]_i_3_n_0\,
      S(6) => \temp_counter[0]_i_4_n_0\,
      S(5) => \temp_counter[0]_i_5_n_0\,
      S(4) => \temp_counter[0]_i_6_n_0\,
      S(3) => \temp_counter[0]_i_7_n_0\,
      S(2) => \temp_counter[0]_i_8_n_0\,
      S(1) => \temp_counter[0]_i_9_n_0\,
      S(0) => \temp_counter[0]_i_10_n_0\
    );
\temp_counter_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[8]_i_1_n_13\,
      Q => temp_counter_reg(10)
    );
\temp_counter_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[8]_i_1_n_12\,
      Q => temp_counter_reg(11)
    );
\temp_counter_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[8]_i_1_n_11\,
      Q => temp_counter_reg(12)
    );
\temp_counter_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[8]_i_1_n_10\,
      Q => temp_counter_reg(13)
    );
\temp_counter_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[8]_i_1_n_9\,
      Q => temp_counter_reg(14)
    );
\temp_counter_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[8]_i_1_n_8\,
      Q => temp_counter_reg(15)
    );
\temp_counter_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[16]_i_1_n_15\,
      Q => temp_counter_reg(16)
    );
\temp_counter_reg[16]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \temp_counter_reg[8]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \temp_counter_reg[16]_i_1_n_0\,
      CO(6) => \temp_counter_reg[16]_i_1_n_1\,
      CO(5) => \temp_counter_reg[16]_i_1_n_2\,
      CO(4) => \temp_counter_reg[16]_i_1_n_3\,
      CO(3) => \temp_counter_reg[16]_i_1_n_4\,
      CO(2) => \temp_counter_reg[16]_i_1_n_5\,
      CO(1) => \temp_counter_reg[16]_i_1_n_6\,
      CO(0) => \temp_counter_reg[16]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \temp_counter_reg[16]_i_1_n_8\,
      O(6) => \temp_counter_reg[16]_i_1_n_9\,
      O(5) => \temp_counter_reg[16]_i_1_n_10\,
      O(4) => \temp_counter_reg[16]_i_1_n_11\,
      O(3) => \temp_counter_reg[16]_i_1_n_12\,
      O(2) => \temp_counter_reg[16]_i_1_n_13\,
      O(1) => \temp_counter_reg[16]_i_1_n_14\,
      O(0) => \temp_counter_reg[16]_i_1_n_15\,
      S(7) => \temp_counter[16]_i_2_n_0\,
      S(6) => \temp_counter[16]_i_3_n_0\,
      S(5) => \temp_counter[16]_i_4_n_0\,
      S(4) => \temp_counter[16]_i_5_n_0\,
      S(3) => \temp_counter[16]_i_6_n_0\,
      S(2) => \temp_counter[16]_i_7_n_0\,
      S(1) => \temp_counter[16]_i_8_n_0\,
      S(0) => \temp_counter[16]_i_9_n_0\
    );
\temp_counter_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[16]_i_1_n_14\,
      Q => temp_counter_reg(17)
    );
\temp_counter_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[16]_i_1_n_13\,
      Q => temp_counter_reg(18)
    );
\temp_counter_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[16]_i_1_n_12\,
      Q => temp_counter_reg(19)
    );
\temp_counter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[0]_i_1_n_14\,
      Q => temp_counter_reg(1)
    );
\temp_counter_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[16]_i_1_n_11\,
      Q => temp_counter_reg(20)
    );
\temp_counter_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[16]_i_1_n_10\,
      Q => temp_counter_reg(21)
    );
\temp_counter_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[16]_i_1_n_9\,
      Q => temp_counter_reg(22)
    );
\temp_counter_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[16]_i_1_n_8\,
      Q => temp_counter_reg(23)
    );
\temp_counter_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[24]_i_1_n_15\,
      Q => temp_counter_reg(24)
    );
\temp_counter_reg[24]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \temp_counter_reg[16]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_temp_counter_reg[24]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \temp_counter_reg[24]_i_1_n_1\,
      CO(5) => \temp_counter_reg[24]_i_1_n_2\,
      CO(4) => \temp_counter_reg[24]_i_1_n_3\,
      CO(3) => \temp_counter_reg[24]_i_1_n_4\,
      CO(2) => \temp_counter_reg[24]_i_1_n_5\,
      CO(1) => \temp_counter_reg[24]_i_1_n_6\,
      CO(0) => \temp_counter_reg[24]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \temp_counter_reg[24]_i_1_n_8\,
      O(6) => \temp_counter_reg[24]_i_1_n_9\,
      O(5) => \temp_counter_reg[24]_i_1_n_10\,
      O(4) => \temp_counter_reg[24]_i_1_n_11\,
      O(3) => \temp_counter_reg[24]_i_1_n_12\,
      O(2) => \temp_counter_reg[24]_i_1_n_13\,
      O(1) => \temp_counter_reg[24]_i_1_n_14\,
      O(0) => \temp_counter_reg[24]_i_1_n_15\,
      S(7) => \temp_counter[24]_i_2_n_0\,
      S(6) => \temp_counter[24]_i_3_n_0\,
      S(5) => \temp_counter[24]_i_4_n_0\,
      S(4) => \temp_counter[24]_i_5_n_0\,
      S(3) => \temp_counter[24]_i_6_n_0\,
      S(2) => \temp_counter[24]_i_7_n_0\,
      S(1) => \temp_counter[24]_i_8_n_0\,
      S(0) => \temp_counter[24]_i_9_n_0\
    );
\temp_counter_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[24]_i_1_n_14\,
      Q => temp_counter_reg(25)
    );
\temp_counter_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[24]_i_1_n_13\,
      Q => temp_counter_reg(26)
    );
\temp_counter_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[24]_i_1_n_12\,
      Q => temp_counter_reg(27)
    );
\temp_counter_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[24]_i_1_n_11\,
      Q => temp_counter_reg(28)
    );
\temp_counter_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[24]_i_1_n_10\,
      Q => temp_counter_reg(29)
    );
\temp_counter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[0]_i_1_n_13\,
      Q => temp_counter_reg(2)
    );
\temp_counter_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[24]_i_1_n_9\,
      Q => temp_counter_reg(30)
    );
\temp_counter_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[24]_i_1_n_8\,
      Q => temp_counter_reg(31)
    );
\temp_counter_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[0]_i_1_n_12\,
      Q => temp_counter_reg(3)
    );
\temp_counter_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[0]_i_1_n_11\,
      Q => temp_counter_reg(4)
    );
\temp_counter_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[0]_i_1_n_10\,
      Q => temp_counter_reg(5)
    );
\temp_counter_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[0]_i_1_n_9\,
      Q => temp_counter_reg(6)
    );
\temp_counter_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[0]_i_1_n_8\,
      Q => temp_counter_reg(7)
    );
\temp_counter_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[8]_i_1_n_15\,
      Q => temp_counter_reg(8)
    );
\temp_counter_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \temp_counter_reg[0]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \temp_counter_reg[8]_i_1_n_0\,
      CO(6) => \temp_counter_reg[8]_i_1_n_1\,
      CO(5) => \temp_counter_reg[8]_i_1_n_2\,
      CO(4) => \temp_counter_reg[8]_i_1_n_3\,
      CO(3) => \temp_counter_reg[8]_i_1_n_4\,
      CO(2) => \temp_counter_reg[8]_i_1_n_5\,
      CO(1) => \temp_counter_reg[8]_i_1_n_6\,
      CO(0) => \temp_counter_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \temp_counter_reg[8]_i_1_n_8\,
      O(6) => \temp_counter_reg[8]_i_1_n_9\,
      O(5) => \temp_counter_reg[8]_i_1_n_10\,
      O(4) => \temp_counter_reg[8]_i_1_n_11\,
      O(3) => \temp_counter_reg[8]_i_1_n_12\,
      O(2) => \temp_counter_reg[8]_i_1_n_13\,
      O(1) => \temp_counter_reg[8]_i_1_n_14\,
      O(0) => \temp_counter_reg[8]_i_1_n_15\,
      S(7) => \temp_counter[8]_i_2_n_0\,
      S(6) => \temp_counter[8]_i_3_n_0\,
      S(5) => \temp_counter[8]_i_4_n_0\,
      S(4) => \temp_counter[8]_i_5_n_0\,
      S(3) => \temp_counter[8]_i_6_n_0\,
      S(2) => \temp_counter[8]_i_7_n_0\,
      S(1) => \temp_counter[8]_i_8_n_0\,
      S(0) => \temp_counter[8]_i_9_n_0\
    );
\temp_counter_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \current_t[31]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \temp_counter_reg[8]_i_1_n_14\,
      Q => temp_counter_reg(9)
    );
tick_100ms_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      O => tick_100ms
    );
tick_100ms_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_100ms,
      Q => tick_100ms_reg_n_0
    );
tick_cnt0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => \tick_cnt_reg_n_0_[0]\,
      CI_TOP => '0',
      CO(7) => tick_cnt0_carry_n_0,
      CO(6) => tick_cnt0_carry_n_1,
      CO(5) => tick_cnt0_carry_n_2,
      CO(4) => tick_cnt0_carry_n_3,
      CO(3) => tick_cnt0_carry_n_4,
      CO(2) => tick_cnt0_carry_n_5,
      CO(1) => tick_cnt0_carry_n_6,
      CO(0) => tick_cnt0_carry_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => data0(8 downto 1),
      S(7) => \tick_cnt_reg_n_0_[8]\,
      S(6) => \tick_cnt_reg_n_0_[7]\,
      S(5) => \tick_cnt_reg_n_0_[6]\,
      S(4) => \tick_cnt_reg_n_0_[5]\,
      S(3) => \tick_cnt_reg_n_0_[4]\,
      S(2) => \tick_cnt_reg_n_0_[3]\,
      S(1) => \tick_cnt_reg_n_0_[2]\,
      S(0) => \tick_cnt_reg_n_0_[1]\
    );
\tick_cnt0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => tick_cnt0_carry_n_0,
      CI_TOP => '0',
      CO(7) => \tick_cnt0_carry__0_n_0\,
      CO(6) => \tick_cnt0_carry__0_n_1\,
      CO(5) => \tick_cnt0_carry__0_n_2\,
      CO(4) => \tick_cnt0_carry__0_n_3\,
      CO(3) => \tick_cnt0_carry__0_n_4\,
      CO(2) => \tick_cnt0_carry__0_n_5\,
      CO(1) => \tick_cnt0_carry__0_n_6\,
      CO(0) => \tick_cnt0_carry__0_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => data0(16 downto 9),
      S(7) => \tick_cnt_reg_n_0_[16]\,
      S(6) => \tick_cnt_reg_n_0_[15]\,
      S(5) => \tick_cnt_reg_n_0_[14]\,
      S(4) => \tick_cnt_reg_n_0_[13]\,
      S(3) => \tick_cnt_reg_n_0_[12]\,
      S(2) => \tick_cnt_reg_n_0_[11]\,
      S(1) => \tick_cnt_reg_n_0_[10]\,
      S(0) => \tick_cnt_reg_n_0_[9]\
    );
\tick_cnt0_carry__1\: unisim.vcomponents.CARRY8
     port map (
      CI => \tick_cnt0_carry__0_n_0\,
      CI_TOP => '0',
      CO(7 downto 6) => \NLW_tick_cnt0_carry__1_CO_UNCONNECTED\(7 downto 6),
      CO(5) => \tick_cnt0_carry__1_n_2\,
      CO(4) => \tick_cnt0_carry__1_n_3\,
      CO(3) => \tick_cnt0_carry__1_n_4\,
      CO(2) => \tick_cnt0_carry__1_n_5\,
      CO(1) => \tick_cnt0_carry__1_n_6\,
      CO(0) => \tick_cnt0_carry__1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \NLW_tick_cnt0_carry__1_O_UNCONNECTED\(7),
      O(6 downto 0) => data0(23 downto 17),
      S(7) => '0',
      S(6) => \tick_cnt_reg_n_0_[23]\,
      S(5) => \tick_cnt_reg_n_0_[22]\,
      S(4) => \tick_cnt_reg_n_0_[21]\,
      S(3) => \tick_cnt_reg_n_0_[20]\,
      S(2) => \tick_cnt_reg_n_0_[19]\,
      S(1) => \tick_cnt_reg_n_0_[18]\,
      S(0) => \tick_cnt_reg_n_0_[17]\
    );
\tick_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tick_cnt_reg_n_0_[0]\,
      O => tick_cnt(0)
    );
\tick_cnt[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(10),
      O => tick_cnt(10)
    );
\tick_cnt[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(11),
      O => tick_cnt(11)
    );
\tick_cnt[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(12),
      O => tick_cnt(12)
    );
\tick_cnt[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(13),
      O => tick_cnt(13)
    );
\tick_cnt[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(14),
      O => tick_cnt(14)
    );
\tick_cnt[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(15),
      O => tick_cnt(15)
    );
\tick_cnt[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(16),
      O => tick_cnt(16)
    );
\tick_cnt[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(17),
      O => tick_cnt(17)
    );
\tick_cnt[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(18),
      O => tick_cnt(18)
    );
\tick_cnt[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(19),
      O => tick_cnt(19)
    );
\tick_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(1),
      O => tick_cnt(1)
    );
\tick_cnt[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(20),
      O => tick_cnt(20)
    );
\tick_cnt[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(21),
      O => tick_cnt(21)
    );
\tick_cnt[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(22),
      O => tick_cnt(22)
    );
\tick_cnt[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(23),
      O => tick_cnt(23)
    );
\tick_cnt[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \tick_cnt[23]_i_3_n_0\,
      I1 => \tick_cnt[23]_i_4_n_0\,
      I2 => \tick_cnt[23]_i_5_n_0\,
      I3 => \tick_cnt[23]_i_6_n_0\,
      I4 => \tick_cnt[23]_i_7_n_0\,
      I5 => \tick_cnt[23]_i_8_n_0\,
      O => \tick_cnt[23]_i_2_n_0\
    );
\tick_cnt[23]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \tick_cnt_reg_n_0_[17]\,
      I1 => \tick_cnt_reg_n_0_[16]\,
      I2 => \tick_cnt_reg_n_0_[19]\,
      I3 => \tick_cnt_reg_n_0_[18]\,
      O => \tick_cnt[23]_i_3_n_0\
    );
\tick_cnt[23]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => \tick_cnt_reg_n_0_[20]\,
      I1 => \tick_cnt_reg_n_0_[21]\,
      I2 => \tick_cnt_reg_n_0_[23]\,
      I3 => \tick_cnt_reg_n_0_[22]\,
      O => \tick_cnt[23]_i_4_n_0\
    );
\tick_cnt[23]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => \tick_cnt_reg_n_0_[9]\,
      I1 => \tick_cnt_reg_n_0_[8]\,
      I2 => \tick_cnt_reg_n_0_[10]\,
      I3 => \tick_cnt_reg_n_0_[11]\,
      O => \tick_cnt[23]_i_5_n_0\
    );
\tick_cnt[23]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => \tick_cnt_reg_n_0_[12]\,
      I1 => \tick_cnt_reg_n_0_[13]\,
      I2 => \tick_cnt_reg_n_0_[15]\,
      I3 => \tick_cnt_reg_n_0_[14]\,
      O => \tick_cnt[23]_i_6_n_0\
    );
\tick_cnt[23]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \tick_cnt_reg_n_0_[5]\,
      I1 => \tick_cnt_reg_n_0_[4]\,
      I2 => \tick_cnt_reg_n_0_[6]\,
      I3 => \tick_cnt_reg_n_0_[7]\,
      O => \tick_cnt[23]_i_7_n_0\
    );
\tick_cnt[23]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \tick_cnt_reg_n_0_[1]\,
      I1 => \tick_cnt_reg_n_0_[0]\,
      I2 => \tick_cnt_reg_n_0_[3]\,
      I3 => \tick_cnt_reg_n_0_[2]\,
      O => \tick_cnt[23]_i_8_n_0\
    );
\tick_cnt[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(2),
      O => tick_cnt(2)
    );
\tick_cnt[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(3),
      O => tick_cnt(3)
    );
\tick_cnt[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(4),
      O => tick_cnt(4)
    );
\tick_cnt[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(5),
      O => tick_cnt(5)
    );
\tick_cnt[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(6),
      O => tick_cnt(6)
    );
\tick_cnt[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(7),
      O => tick_cnt(7)
    );
\tick_cnt[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(8),
      O => tick_cnt(8)
    );
\tick_cnt[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \tick_cnt[23]_i_2_n_0\,
      I1 => data0(9),
      O => tick_cnt(9)
    );
\tick_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(0),
      Q => \tick_cnt_reg_n_0_[0]\
    );
\tick_cnt_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(10),
      Q => \tick_cnt_reg_n_0_[10]\
    );
\tick_cnt_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(11),
      Q => \tick_cnt_reg_n_0_[11]\
    );
\tick_cnt_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(12),
      Q => \tick_cnt_reg_n_0_[12]\
    );
\tick_cnt_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(13),
      Q => \tick_cnt_reg_n_0_[13]\
    );
\tick_cnt_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(14),
      Q => \tick_cnt_reg_n_0_[14]\
    );
\tick_cnt_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(15),
      Q => \tick_cnt_reg_n_0_[15]\
    );
\tick_cnt_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(16),
      Q => \tick_cnt_reg_n_0_[16]\
    );
\tick_cnt_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(17),
      Q => \tick_cnt_reg_n_0_[17]\
    );
\tick_cnt_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(18),
      Q => \tick_cnt_reg_n_0_[18]\
    );
\tick_cnt_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(19),
      Q => \tick_cnt_reg_n_0_[19]\
    );
\tick_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(1),
      Q => \tick_cnt_reg_n_0_[1]\
    );
\tick_cnt_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(20),
      Q => \tick_cnt_reg_n_0_[20]\
    );
\tick_cnt_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(21),
      Q => \tick_cnt_reg_n_0_[21]\
    );
\tick_cnt_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(22),
      Q => \tick_cnt_reg_n_0_[22]\
    );
\tick_cnt_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(23),
      Q => \tick_cnt_reg_n_0_[23]\
    );
\tick_cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(2),
      Q => \tick_cnt_reg_n_0_[2]\
    );
\tick_cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(3),
      Q => \tick_cnt_reg_n_0_[3]\
    );
\tick_cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(4),
      Q => \tick_cnt_reg_n_0_[4]\
    );
\tick_cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(5),
      Q => \tick_cnt_reg_n_0_[5]\
    );
\tick_cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(6),
      Q => \tick_cnt_reg_n_0_[6]\
    );
\tick_cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(7),
      Q => \tick_cnt_reg_n_0_[7]\
    );
\tick_cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(8),
      Q => \tick_cnt_reg_n_0_[8]\
    );
\tick_cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => tick_cnt(9),
      Q => \tick_cnt_reg_n_0_[9]\
    );
\u_ctrl[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \error_reg[0]_0\(0),
      I1 => \error_reg[0]_0\(1),
      O => \u_ctrl[29]_i_1_n_0\
    );
\u_ctrl_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => \u_ctrl[29]_i_1_n_0\,
      Q => heater_u_ctrl(29)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_axi_slave_lite_v1_0_S00_AXI is
  port (
    s00_axi_bvalid : out STD_LOGIC;
    axi_awready_reg_0 : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    axi_rvalid_reg_0 : out STD_LOGIC;
    axi_arready_reg_0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \FSM_sequential_state_read_reg[1]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \axi_awready0__0\ : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    axi_bvalid_reg_0 : in STD_LOGIC;
    axi_awready_reg_1 : in STD_LOGIC;
    axi_wready_reg_0 : in STD_LOGIC;
    axi_rvalid_reg_1 : in STD_LOGIC;
    axi_arready_reg_1 : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_axi_slave_lite_v1_0_S00_AXI;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_axi_slave_lite_v1_0_S00_AXI is
  signal \FSM_sequential_state_read[1]_i_1_n_0\ : STD_LOGIC;
  signal \^fsm_sequential_state_read_reg[1]_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \FSM_sequential_state_write[1]_i_1_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \axi_araddr[5]_i_1_n_0\ : STD_LOGIC;
  signal \^axi_arready_reg_0\ : STD_LOGIC;
  signal axi_awaddr : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \axi_awaddr_reg_n_0_[2]\ : STD_LOGIC;
  signal \axi_awaddr_reg_n_0_[3]\ : STD_LOGIC;
  signal \axi_awaddr_reg_n_0_[4]\ : STD_LOGIC;
  signal \axi_awaddr_reg_n_0_[5]\ : STD_LOGIC;
  signal \^axi_awready_reg_0\ : STD_LOGIC;
  signal \^axi_rvalid_reg_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 7 );
  signal \s00_axi_rdata[0]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[0]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[0]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[0]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[10]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[10]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[10]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[11]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[11]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[11]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[12]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[12]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[12]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[13]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[13]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[13]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[14]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[14]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[14]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[15]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[15]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[15]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[16]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[16]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[16]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[17]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[17]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[17]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[18]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[18]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[18]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[19]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[19]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[19]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[1]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[20]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[20]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[20]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[21]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[21]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[21]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[22]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[22]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[22]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[23]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[23]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[23]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[24]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[24]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[24]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[24]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[25]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[25]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[25]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[25]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[26]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[26]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[26]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[26]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[27]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[27]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[27]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[27]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[28]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[28]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[28]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[28]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[29]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[29]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[29]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[29]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[2]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[2]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[2]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[30]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[30]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[30]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[31]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[31]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[31]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[3]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[4]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[4]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[5]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[5]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[5]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[6]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[6]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[6]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[7]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[7]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[7]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[8]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[8]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[8]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[9]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[9]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \s00_axi_rdata[9]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal sel0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slv_reg0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg0[31]_i_2_n_0\ : STD_LOGIC;
  signal \slv_reg0[31]_i_3_n_0\ : STD_LOGIC;
  signal \slv_reg0[31]_i_4_n_0\ : STD_LOGIC;
  signal \slv_reg0[31]_i_5_n_0\ : STD_LOGIC;
  signal slv_reg1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg10 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg10[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg10[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg10[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg10[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg12 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg12[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg12[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg12[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg12[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg13 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg13[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg13[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg13[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg13[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg14 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg14[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg14[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg14[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg14[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg15 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg15[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg15[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg15[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg15[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg2[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg3 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg3[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg8 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg8[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg9 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg9[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg9[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg9[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg9[7]_i_1_n_0\ : STD_LOGIC;
  signal \state_read__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \state_write__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal u_heater_core_dummy_n_0 : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_read_reg[0]\ : label is "Idle:00,Rdata:10,Raddr:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_read_reg[1]\ : label is "Idle:00,Rdata:10,Raddr:01";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state_write[0]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \FSM_sequential_state_write[1]_i_2\ : label is "soft_lutpair45";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_write_reg[0]\ : label is "Idle:00,Wdata:10,Waddr:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_write_reg[1]\ : label is "Idle:00,Wdata:10,Waddr:01";
begin
  \FSM_sequential_state_read_reg[1]_0\(1 downto 0) <= \^fsm_sequential_state_read_reg[1]_0\(1 downto 0);
  Q(1 downto 0) <= \^q\(1 downto 0);
  axi_arready_reg_0 <= \^axi_arready_reg_0\;
  axi_awready_reg_0 <= \^axi_awready_reg_0\;
  axi_rvalid_reg_0 <= \^axi_rvalid_reg_0\;
\FSM_sequential_state_read[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"07070707FF0F0F0F"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^axi_arready_reg_0\,
      I2 => \^fsm_sequential_state_read_reg[1]_0\(1),
      I3 => s00_axi_rready,
      I4 => \^axi_rvalid_reg_0\,
      I5 => \^fsm_sequential_state_read_reg[1]_0\(0),
      O => \state_read__0\(0)
    );
\FSM_sequential_state_read[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^fsm_sequential_state_read_reg[1]_0\(0),
      I1 => \^fsm_sequential_state_read_reg[1]_0\(1),
      O => \FSM_sequential_state_read[1]_i_1_n_0\
    );
\FSM_sequential_state_read[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00800F800F800F80"
    )
        port map (
      I0 => \^axi_arready_reg_0\,
      I1 => s00_axi_arvalid,
      I2 => \^fsm_sequential_state_read_reg[1]_0\(0),
      I3 => \^fsm_sequential_state_read_reg[1]_0\(1),
      I4 => s00_axi_rready,
      I5 => \^axi_rvalid_reg_0\,
      O => \state_read__0\(1)
    );
\FSM_sequential_state_read_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \FSM_sequential_state_read[1]_i_1_n_0\,
      D => \state_read__0\(0),
      Q => \^fsm_sequential_state_read_reg[1]_0\(0),
      R => u_heater_core_dummy_n_0
    );
\FSM_sequential_state_read_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \FSM_sequential_state_read[1]_i_1_n_0\,
      D => \state_read__0\(1),
      Q => \^fsm_sequential_state_read_reg[1]_0\(1),
      R => u_heater_core_dummy_n_0
    );
\FSM_sequential_state_write[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F07FF0F"
    )
        port map (
      I0 => \^axi_awready_reg_0\,
      I1 => s00_axi_awvalid,
      I2 => \^q\(1),
      I3 => s00_axi_wvalid,
      I4 => \^q\(0),
      O => \state_write__0\(0)
    );
\FSM_sequential_state_write[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \FSM_sequential_state_write[1]_i_1_n_0\
    );
\FSM_sequential_state_write[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000F80"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => \^axi_awready_reg_0\,
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => s00_axi_wvalid,
      O => \state_write__0\(1)
    );
\FSM_sequential_state_write_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \FSM_sequential_state_write[1]_i_1_n_0\,
      D => \state_write__0\(0),
      Q => \^q\(0),
      R => u_heater_core_dummy_n_0
    );
\FSM_sequential_state_write_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \FSM_sequential_state_write[1]_i_1_n_0\,
      D => \state_write__0\(1),
      Q => \^q\(1),
      R => u_heater_core_dummy_n_0
    );
\axi_araddr[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => \^axi_arready_reg_0\,
      I2 => s00_axi_arvalid,
      I3 => \^fsm_sequential_state_read_reg[1]_0\(0),
      I4 => \^fsm_sequential_state_read_reg[1]_0\(1),
      O => \axi_araddr[5]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_araddr[5]_i_1_n_0\,
      D => s00_axi_araddr(0),
      Q => sel0(0),
      R => '0'
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_araddr[5]_i_1_n_0\,
      D => s00_axi_araddr(1),
      Q => sel0(1),
      R => '0'
    );
\axi_araddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_araddr[5]_i_1_n_0\,
      D => s00_axi_araddr(2),
      Q => sel0(2),
      R => '0'
    );
\axi_araddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_araddr[5]_i_1_n_0\,
      D => s00_axi_araddr(3),
      Q => sel0(3),
      R => '0'
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready_reg_1,
      Q => \^axi_arready_reg_0\,
      R => u_heater_core_dummy_n_0
    );
\axi_awaddr[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => s00_axi_awvalid,
      I3 => \^axi_awready_reg_0\,
      O => axi_awaddr(0)
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awaddr(0),
      D => s00_axi_awaddr(0),
      Q => \axi_awaddr_reg_n_0_[2]\,
      R => u_heater_core_dummy_n_0
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awaddr(0),
      D => s00_axi_awaddr(1),
      Q => \axi_awaddr_reg_n_0_[3]\,
      R => u_heater_core_dummy_n_0
    );
\axi_awaddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awaddr(0),
      D => s00_axi_awaddr(2),
      Q => \axi_awaddr_reg_n_0_[4]\,
      R => u_heater_core_dummy_n_0
    );
\axi_awaddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awaddr(0),
      D => s00_axi_awaddr(3),
      Q => \axi_awaddr_reg_n_0_[5]\,
      R => u_heater_core_dummy_n_0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready_reg_1,
      Q => \^axi_awready_reg_0\,
      R => u_heater_core_dummy_n_0
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
      D => axi_bvalid_reg_0,
      Q => s00_axi_bvalid,
      R => u_heater_core_dummy_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_reg_1,
      Q => \^axi_rvalid_reg_0\,
      R => u_heater_core_dummy_n_0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready_reg_0,
      Q => s00_axi_wready,
      R => u_heater_core_dummy_n_0
    );
\s00_axi_rdata[0]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[0]_INST_0_i_5_n_0\,
      I1 => \s00_axi_rdata[0]_INST_0_i_6_n_0\,
      O => \s00_axi_rdata[0]_INST_0_i_2_n_0\,
      S => sel0(2)
    );
\s00_axi_rdata[0]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(0),
      I1 => slv_reg2(0),
      I2 => sel0(1),
      I3 => slv_reg1(0),
      I4 => sel0(0),
      I5 => slv_reg0(0),
      O => \s00_axi_rdata[0]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[0]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCBBFC88"
    )
        port map (
      I0 => slv_reg10(0),
      I1 => sel0(1),
      I2 => slv_reg9(0),
      I3 => sel0(0),
      I4 => slv_reg8(0),
      O => \s00_axi_rdata[0]_INST_0_i_5_n_0\
    );
\s00_axi_rdata[0]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(0),
      I1 => slv_reg14(0),
      I2 => sel0(1),
      I3 => slv_reg13(0),
      I4 => sel0(0),
      I5 => slv_reg12(0),
      O => \s00_axi_rdata[0]_INST_0_i_6_n_0\
    );
\s00_axi_rdata[10]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(10),
      I1 => slv_reg14(10),
      I2 => sel0(1),
      I3 => slv_reg13(10),
      I4 => sel0(0),
      I5 => slv_reg12(10),
      O => \s00_axi_rdata[10]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[10]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCBBFC88"
    )
        port map (
      I0 => slv_reg10(10),
      I1 => sel0(1),
      I2 => slv_reg9(10),
      I3 => sel0(0),
      I4 => slv_reg8(10),
      O => \s00_axi_rdata[10]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[10]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(10),
      I1 => slv_reg2(10),
      I2 => sel0(1),
      I3 => slv_reg1(10),
      I4 => sel0(0),
      I5 => slv_reg0(10),
      O => \s00_axi_rdata[10]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[11]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(11),
      I1 => slv_reg14(11),
      I2 => sel0(1),
      I3 => slv_reg13(11),
      I4 => sel0(0),
      I5 => slv_reg12(11),
      O => \s00_axi_rdata[11]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[11]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(11),
      I1 => sel0(1),
      I2 => slv_reg9(11),
      I3 => sel0(0),
      I4 => slv_reg8(11),
      O => \s00_axi_rdata[11]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[11]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(11),
      I1 => slv_reg2(11),
      I2 => sel0(1),
      I3 => slv_reg1(11),
      I4 => sel0(0),
      I5 => slv_reg0(11),
      O => \s00_axi_rdata[11]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[12]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(12),
      I1 => slv_reg14(12),
      I2 => sel0(1),
      I3 => slv_reg13(12),
      I4 => sel0(0),
      I5 => slv_reg12(12),
      O => \s00_axi_rdata[12]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[12]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(12),
      I1 => sel0(1),
      I2 => slv_reg9(12),
      I3 => sel0(0),
      I4 => slv_reg8(12),
      O => \s00_axi_rdata[12]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[12]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(12),
      I1 => slv_reg2(12),
      I2 => sel0(1),
      I3 => slv_reg1(12),
      I4 => sel0(0),
      I5 => slv_reg0(12),
      O => \s00_axi_rdata[12]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[13]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(13),
      I1 => slv_reg14(13),
      I2 => sel0(1),
      I3 => slv_reg13(13),
      I4 => sel0(0),
      I5 => slv_reg12(13),
      O => \s00_axi_rdata[13]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[13]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(13),
      I1 => sel0(1),
      I2 => slv_reg9(13),
      I3 => sel0(0),
      I4 => slv_reg8(13),
      O => \s00_axi_rdata[13]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[13]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(13),
      I1 => slv_reg2(13),
      I2 => sel0(1),
      I3 => slv_reg1(13),
      I4 => sel0(0),
      I5 => slv_reg0(13),
      O => \s00_axi_rdata[13]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[14]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(14),
      I1 => slv_reg14(14),
      I2 => sel0(1),
      I3 => slv_reg13(14),
      I4 => sel0(0),
      I5 => slv_reg12(14),
      O => \s00_axi_rdata[14]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[14]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(14),
      I1 => sel0(1),
      I2 => slv_reg9(14),
      I3 => sel0(0),
      I4 => slv_reg8(14),
      O => \s00_axi_rdata[14]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[14]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(14),
      I1 => slv_reg2(14),
      I2 => sel0(1),
      I3 => slv_reg1(14),
      I4 => sel0(0),
      I5 => slv_reg0(14),
      O => \s00_axi_rdata[14]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[15]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(15),
      I1 => slv_reg14(15),
      I2 => sel0(1),
      I3 => slv_reg13(15),
      I4 => sel0(0),
      I5 => slv_reg12(15),
      O => \s00_axi_rdata[15]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[15]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(15),
      I1 => sel0(1),
      I2 => slv_reg9(15),
      I3 => sel0(0),
      I4 => slv_reg8(15),
      O => \s00_axi_rdata[15]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[15]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(15),
      I1 => slv_reg2(15),
      I2 => sel0(1),
      I3 => slv_reg1(15),
      I4 => sel0(0),
      I5 => slv_reg0(15),
      O => \s00_axi_rdata[15]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[16]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(16),
      I1 => slv_reg14(16),
      I2 => sel0(1),
      I3 => slv_reg13(16),
      I4 => sel0(0),
      I5 => slv_reg12(16),
      O => \s00_axi_rdata[16]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[16]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(16),
      I1 => sel0(1),
      I2 => slv_reg9(16),
      I3 => sel0(0),
      I4 => slv_reg8(16),
      O => \s00_axi_rdata[16]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[16]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(16),
      I1 => slv_reg2(16),
      I2 => sel0(1),
      I3 => slv_reg1(16),
      I4 => sel0(0),
      I5 => slv_reg0(16),
      O => \s00_axi_rdata[16]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[17]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(17),
      I1 => slv_reg14(17),
      I2 => sel0(1),
      I3 => slv_reg13(17),
      I4 => sel0(0),
      I5 => slv_reg12(17),
      O => \s00_axi_rdata[17]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[17]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCBBFC88"
    )
        port map (
      I0 => slv_reg10(17),
      I1 => sel0(1),
      I2 => slv_reg9(17),
      I3 => sel0(0),
      I4 => slv_reg8(17),
      O => \s00_axi_rdata[17]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[17]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(17),
      I1 => slv_reg2(17),
      I2 => sel0(1),
      I3 => slv_reg1(17),
      I4 => sel0(0),
      I5 => slv_reg0(17),
      O => \s00_axi_rdata[17]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[18]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(18),
      I1 => slv_reg14(18),
      I2 => sel0(1),
      I3 => slv_reg13(18),
      I4 => sel0(0),
      I5 => slv_reg12(18),
      O => \s00_axi_rdata[18]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[18]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCBBFC88"
    )
        port map (
      I0 => slv_reg10(18),
      I1 => sel0(1),
      I2 => slv_reg9(18),
      I3 => sel0(0),
      I4 => slv_reg8(18),
      O => \s00_axi_rdata[18]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[18]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(18),
      I1 => slv_reg2(18),
      I2 => sel0(1),
      I3 => slv_reg1(18),
      I4 => sel0(0),
      I5 => slv_reg0(18),
      O => \s00_axi_rdata[18]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[19]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(19),
      I1 => slv_reg14(19),
      I2 => sel0(1),
      I3 => slv_reg13(19),
      I4 => sel0(0),
      I5 => slv_reg12(19),
      O => \s00_axi_rdata[19]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[19]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(19),
      I1 => sel0(1),
      I2 => slv_reg9(19),
      I3 => sel0(0),
      I4 => slv_reg8(19),
      O => \s00_axi_rdata[19]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[19]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(19),
      I1 => slv_reg2(19),
      I2 => sel0(1),
      I3 => slv_reg1(19),
      I4 => sel0(0),
      I5 => slv_reg0(19),
      O => \s00_axi_rdata[19]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[1]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(1),
      I1 => slv_reg14(1),
      I2 => sel0(1),
      I3 => slv_reg13(1),
      I4 => sel0(0),
      I5 => slv_reg12(1),
      O => \s00_axi_rdata[1]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[1]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(1),
      I1 => sel0(1),
      I2 => slv_reg9(1),
      I3 => sel0(0),
      I4 => slv_reg8(1),
      O => \s00_axi_rdata[1]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[1]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(1),
      I1 => slv_reg2(1),
      I2 => sel0(1),
      I3 => slv_reg1(1),
      I4 => sel0(0),
      I5 => slv_reg0(1),
      O => \s00_axi_rdata[1]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[20]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(20),
      I1 => slv_reg14(20),
      I2 => sel0(1),
      I3 => slv_reg13(20),
      I4 => sel0(0),
      I5 => slv_reg12(20),
      O => \s00_axi_rdata[20]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[20]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(20),
      I1 => sel0(1),
      I2 => slv_reg9(20),
      I3 => sel0(0),
      I4 => slv_reg8(20),
      O => \s00_axi_rdata[20]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[20]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(20),
      I1 => slv_reg2(20),
      I2 => sel0(1),
      I3 => slv_reg1(20),
      I4 => sel0(0),
      I5 => slv_reg0(20),
      O => \s00_axi_rdata[20]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[21]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(21),
      I1 => slv_reg14(21),
      I2 => sel0(1),
      I3 => slv_reg13(21),
      I4 => sel0(0),
      I5 => slv_reg12(21),
      O => \s00_axi_rdata[21]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[21]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCBBFC88"
    )
        port map (
      I0 => slv_reg10(21),
      I1 => sel0(1),
      I2 => slv_reg9(21),
      I3 => sel0(0),
      I4 => slv_reg8(21),
      O => \s00_axi_rdata[21]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[21]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(21),
      I1 => slv_reg2(21),
      I2 => sel0(1),
      I3 => slv_reg1(21),
      I4 => sel0(0),
      I5 => slv_reg0(21),
      O => \s00_axi_rdata[21]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[22]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(22),
      I1 => slv_reg14(22),
      I2 => sel0(1),
      I3 => slv_reg13(22),
      I4 => sel0(0),
      I5 => slv_reg12(22),
      O => \s00_axi_rdata[22]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[22]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(22),
      I1 => sel0(1),
      I2 => slv_reg9(22),
      I3 => sel0(0),
      I4 => slv_reg8(22),
      O => \s00_axi_rdata[22]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[22]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(22),
      I1 => slv_reg2(22),
      I2 => sel0(1),
      I3 => slv_reg1(22),
      I4 => sel0(0),
      I5 => slv_reg0(22),
      O => \s00_axi_rdata[22]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[23]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(23),
      I1 => slv_reg14(23),
      I2 => sel0(1),
      I3 => slv_reg13(23),
      I4 => sel0(0),
      I5 => slv_reg12(23),
      O => \s00_axi_rdata[23]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[23]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(23),
      I1 => sel0(1),
      I2 => slv_reg9(23),
      I3 => sel0(0),
      I4 => slv_reg8(23),
      O => \s00_axi_rdata[23]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[23]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(23),
      I1 => slv_reg2(23),
      I2 => sel0(1),
      I3 => slv_reg1(23),
      I4 => sel0(0),
      I5 => slv_reg0(23),
      O => \s00_axi_rdata[23]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[24]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[24]_INST_0_i_5_n_0\,
      I1 => \s00_axi_rdata[24]_INST_0_i_6_n_0\,
      O => \s00_axi_rdata[24]_INST_0_i_2_n_0\,
      S => sel0(2)
    );
\s00_axi_rdata[24]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(24),
      I1 => slv_reg2(24),
      I2 => sel0(1),
      I3 => slv_reg1(24),
      I4 => sel0(0),
      I5 => slv_reg0(24),
      O => \s00_axi_rdata[24]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[24]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(24),
      I1 => sel0(1),
      I2 => slv_reg9(24),
      I3 => sel0(0),
      I4 => slv_reg8(24),
      O => \s00_axi_rdata[24]_INST_0_i_5_n_0\
    );
\s00_axi_rdata[24]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(24),
      I1 => slv_reg14(24),
      I2 => sel0(1),
      I3 => slv_reg13(24),
      I4 => sel0(0),
      I5 => slv_reg12(24),
      O => \s00_axi_rdata[24]_INST_0_i_6_n_0\
    );
\s00_axi_rdata[25]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[25]_INST_0_i_5_n_0\,
      I1 => \s00_axi_rdata[25]_INST_0_i_6_n_0\,
      O => \s00_axi_rdata[25]_INST_0_i_2_n_0\,
      S => sel0(2)
    );
\s00_axi_rdata[25]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(25),
      I1 => slv_reg2(25),
      I2 => sel0(1),
      I3 => slv_reg1(25),
      I4 => sel0(0),
      I5 => slv_reg0(25),
      O => \s00_axi_rdata[25]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[25]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(25),
      I1 => sel0(1),
      I2 => slv_reg9(25),
      I3 => sel0(0),
      I4 => slv_reg8(25),
      O => \s00_axi_rdata[25]_INST_0_i_5_n_0\
    );
\s00_axi_rdata[25]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(25),
      I1 => slv_reg14(25),
      I2 => sel0(1),
      I3 => slv_reg13(25),
      I4 => sel0(0),
      I5 => slv_reg12(25),
      O => \s00_axi_rdata[25]_INST_0_i_6_n_0\
    );
\s00_axi_rdata[26]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[26]_INST_0_i_5_n_0\,
      I1 => \s00_axi_rdata[26]_INST_0_i_6_n_0\,
      O => \s00_axi_rdata[26]_INST_0_i_2_n_0\,
      S => sel0(2)
    );
\s00_axi_rdata[26]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(26),
      I1 => slv_reg2(26),
      I2 => sel0(1),
      I3 => slv_reg1(26),
      I4 => sel0(0),
      I5 => slv_reg0(26),
      O => \s00_axi_rdata[26]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[26]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(26),
      I1 => sel0(1),
      I2 => slv_reg9(26),
      I3 => sel0(0),
      I4 => slv_reg8(26),
      O => \s00_axi_rdata[26]_INST_0_i_5_n_0\
    );
\s00_axi_rdata[26]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(26),
      I1 => slv_reg14(26),
      I2 => sel0(1),
      I3 => slv_reg13(26),
      I4 => sel0(0),
      I5 => slv_reg12(26),
      O => \s00_axi_rdata[26]_INST_0_i_6_n_0\
    );
\s00_axi_rdata[27]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[27]_INST_0_i_5_n_0\,
      I1 => \s00_axi_rdata[27]_INST_0_i_6_n_0\,
      O => \s00_axi_rdata[27]_INST_0_i_2_n_0\,
      S => sel0(2)
    );
\s00_axi_rdata[27]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(27),
      I1 => slv_reg2(27),
      I2 => sel0(1),
      I3 => slv_reg1(27),
      I4 => sel0(0),
      I5 => slv_reg0(27),
      O => \s00_axi_rdata[27]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[27]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(27),
      I1 => sel0(1),
      I2 => slv_reg9(27),
      I3 => sel0(0),
      I4 => slv_reg8(27),
      O => \s00_axi_rdata[27]_INST_0_i_5_n_0\
    );
\s00_axi_rdata[27]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(27),
      I1 => slv_reg14(27),
      I2 => sel0(1),
      I3 => slv_reg13(27),
      I4 => sel0(0),
      I5 => slv_reg12(27),
      O => \s00_axi_rdata[27]_INST_0_i_6_n_0\
    );
\s00_axi_rdata[28]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[28]_INST_0_i_5_n_0\,
      I1 => \s00_axi_rdata[28]_INST_0_i_6_n_0\,
      O => \s00_axi_rdata[28]_INST_0_i_2_n_0\,
      S => sel0(2)
    );
\s00_axi_rdata[28]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(28),
      I1 => slv_reg2(28),
      I2 => sel0(1),
      I3 => slv_reg1(28),
      I4 => sel0(0),
      I5 => slv_reg0(28),
      O => \s00_axi_rdata[28]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[28]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(28),
      I1 => sel0(1),
      I2 => slv_reg9(28),
      I3 => sel0(0),
      I4 => slv_reg8(28),
      O => \s00_axi_rdata[28]_INST_0_i_5_n_0\
    );
\s00_axi_rdata[28]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(28),
      I1 => slv_reg14(28),
      I2 => sel0(1),
      I3 => slv_reg13(28),
      I4 => sel0(0),
      I5 => slv_reg12(28),
      O => \s00_axi_rdata[28]_INST_0_i_6_n_0\
    );
\s00_axi_rdata[29]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s00_axi_rdata[29]_INST_0_i_5_n_0\,
      I1 => \s00_axi_rdata[29]_INST_0_i_6_n_0\,
      O => \s00_axi_rdata[29]_INST_0_i_2_n_0\,
      S => sel0(2)
    );
\s00_axi_rdata[29]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(29),
      I1 => slv_reg2(29),
      I2 => sel0(1),
      I3 => slv_reg1(29),
      I4 => sel0(0),
      I5 => slv_reg0(29),
      O => \s00_axi_rdata[29]_INST_0_i_3_n_0\
    );
\s00_axi_rdata[29]_INST_0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCBBFC88"
    )
        port map (
      I0 => slv_reg10(29),
      I1 => sel0(1),
      I2 => slv_reg9(29),
      I3 => sel0(0),
      I4 => slv_reg8(29),
      O => \s00_axi_rdata[29]_INST_0_i_5_n_0\
    );
\s00_axi_rdata[29]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(29),
      I1 => slv_reg14(29),
      I2 => sel0(1),
      I3 => slv_reg13(29),
      I4 => sel0(0),
      I5 => slv_reg12(29),
      O => \s00_axi_rdata[29]_INST_0_i_6_n_0\
    );
\s00_axi_rdata[2]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(2),
      I1 => slv_reg14(2),
      I2 => sel0(1),
      I3 => slv_reg13(2),
      I4 => sel0(0),
      I5 => slv_reg12(2),
      O => \s00_axi_rdata[2]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[2]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCBBFC88"
    )
        port map (
      I0 => slv_reg10(2),
      I1 => sel0(1),
      I2 => slv_reg9(2),
      I3 => sel0(0),
      I4 => slv_reg8(2),
      O => \s00_axi_rdata[2]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[2]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(2),
      I1 => slv_reg2(2),
      I2 => sel0(1),
      I3 => slv_reg1(2),
      I4 => sel0(0),
      I5 => slv_reg0(2),
      O => \s00_axi_rdata[2]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[30]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(30),
      I1 => slv_reg14(30),
      I2 => sel0(1),
      I3 => slv_reg13(30),
      I4 => sel0(0),
      I5 => slv_reg12(30),
      O => \s00_axi_rdata[30]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[30]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(30),
      I1 => sel0(1),
      I2 => slv_reg9(30),
      I3 => sel0(0),
      I4 => slv_reg8(30),
      O => \s00_axi_rdata[30]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[30]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(30),
      I1 => slv_reg2(30),
      I2 => sel0(1),
      I3 => slv_reg1(30),
      I4 => sel0(0),
      I5 => slv_reg0(30),
      O => \s00_axi_rdata[30]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[31]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(31),
      I1 => slv_reg14(31),
      I2 => sel0(1),
      I3 => slv_reg13(31),
      I4 => sel0(0),
      I5 => slv_reg12(31),
      O => \s00_axi_rdata[31]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[31]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(31),
      I1 => sel0(1),
      I2 => slv_reg9(31),
      I3 => sel0(0),
      I4 => slv_reg8(31),
      O => \s00_axi_rdata[31]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[31]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(31),
      I1 => slv_reg2(31),
      I2 => sel0(1),
      I3 => slv_reg1(31),
      I4 => sel0(0),
      I5 => slv_reg0(31),
      O => \s00_axi_rdata[31]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[3]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(3),
      I1 => slv_reg14(3),
      I2 => sel0(1),
      I3 => slv_reg13(3),
      I4 => sel0(0),
      I5 => slv_reg12(3),
      O => \s00_axi_rdata[3]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[3]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(3),
      I1 => sel0(1),
      I2 => slv_reg9(3),
      I3 => sel0(0),
      I4 => slv_reg8(3),
      O => \s00_axi_rdata[3]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[3]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(3),
      I1 => slv_reg2(3),
      I2 => sel0(1),
      I3 => slv_reg1(3),
      I4 => sel0(0),
      I5 => slv_reg0(3),
      O => \s00_axi_rdata[3]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[4]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(4),
      I1 => slv_reg14(4),
      I2 => sel0(1),
      I3 => slv_reg13(4),
      I4 => sel0(0),
      I5 => slv_reg12(4),
      O => \s00_axi_rdata[4]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[4]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCBBFC88"
    )
        port map (
      I0 => slv_reg10(4),
      I1 => sel0(1),
      I2 => slv_reg9(4),
      I3 => sel0(0),
      I4 => slv_reg8(4),
      O => \s00_axi_rdata[4]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[4]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(4),
      I1 => slv_reg2(4),
      I2 => sel0(1),
      I3 => slv_reg1(4),
      I4 => sel0(0),
      I5 => slv_reg0(4),
      O => \s00_axi_rdata[4]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[5]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(5),
      I1 => slv_reg14(5),
      I2 => sel0(1),
      I3 => slv_reg13(5),
      I4 => sel0(0),
      I5 => slv_reg12(5),
      O => \s00_axi_rdata[5]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[5]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(5),
      I1 => sel0(1),
      I2 => slv_reg9(5),
      I3 => sel0(0),
      I4 => slv_reg8(5),
      O => \s00_axi_rdata[5]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[5]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(5),
      I1 => slv_reg2(5),
      I2 => sel0(1),
      I3 => slv_reg1(5),
      I4 => sel0(0),
      I5 => slv_reg0(5),
      O => \s00_axi_rdata[5]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[6]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(6),
      I1 => slv_reg14(6),
      I2 => sel0(1),
      I3 => slv_reg13(6),
      I4 => sel0(0),
      I5 => slv_reg12(6),
      O => \s00_axi_rdata[6]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[6]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(6),
      I1 => sel0(1),
      I2 => slv_reg9(6),
      I3 => sel0(0),
      I4 => slv_reg8(6),
      O => \s00_axi_rdata[6]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[6]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(6),
      I1 => slv_reg2(6),
      I2 => sel0(1),
      I3 => slv_reg1(6),
      I4 => sel0(0),
      I5 => slv_reg0(6),
      O => \s00_axi_rdata[6]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[7]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(7),
      I1 => slv_reg14(7),
      I2 => sel0(1),
      I3 => slv_reg13(7),
      I4 => sel0(0),
      I5 => slv_reg12(7),
      O => \s00_axi_rdata[7]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[7]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(7),
      I1 => sel0(1),
      I2 => slv_reg9(7),
      I3 => sel0(0),
      I4 => slv_reg8(7),
      O => \s00_axi_rdata[7]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[7]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(7),
      I1 => slv_reg2(7),
      I2 => sel0(1),
      I3 => slv_reg1(7),
      I4 => sel0(0),
      I5 => slv_reg0(7),
      O => \s00_axi_rdata[7]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[8]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(8),
      I1 => slv_reg14(8),
      I2 => sel0(1),
      I3 => slv_reg13(8),
      I4 => sel0(0),
      I5 => slv_reg12(8),
      O => \s00_axi_rdata[8]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[8]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCBBFC88"
    )
        port map (
      I0 => slv_reg10(8),
      I1 => sel0(1),
      I2 => slv_reg9(8),
      I3 => sel0(0),
      I4 => slv_reg8(8),
      O => \s00_axi_rdata[8]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[8]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(8),
      I1 => slv_reg2(8),
      I2 => sel0(1),
      I3 => slv_reg1(8),
      I4 => sel0(0),
      I5 => slv_reg0(8),
      O => \s00_axi_rdata[8]_INST_0_i_4_n_0\
    );
\s00_axi_rdata[9]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(9),
      I1 => slv_reg14(9),
      I2 => sel0(1),
      I3 => slv_reg13(9),
      I4 => sel0(0),
      I5 => slv_reg12(9),
      O => \s00_axi_rdata[9]_INST_0_i_1_n_0\
    );
\s00_axi_rdata[9]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => slv_reg10(9),
      I1 => sel0(1),
      I2 => slv_reg9(9),
      I3 => sel0(0),
      I4 => slv_reg8(9),
      O => \s00_axi_rdata[9]_INST_0_i_2_n_0\
    );
\s00_axi_rdata[9]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(9),
      I1 => slv_reg2(9),
      I2 => sel0(1),
      I3 => slv_reg1(9),
      I4 => sel0(0),
      I5 => slv_reg0(9),
      O => \s00_axi_rdata[9]_INST_0_i_4_n_0\
    );
\slv_reg0[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_2_n_0\,
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => s00_axi_wstrb(1),
      O => p_1_in(15)
    );
\slv_reg0[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_2_n_0\,
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => s00_axi_wstrb(2),
      O => p_1_in(23)
    );
\slv_reg0[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_2_n_0\,
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => s00_axi_wstrb(3),
      O => p_1_in(31)
    );
\slv_reg0[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s00_axi_awaddr(0),
      I1 => s00_axi_awvalid,
      I2 => \axi_awaddr_reg_n_0_[2]\,
      O => \slv_reg0[31]_i_2_n_0\
    );
\slv_reg0[31]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s00_axi_awaddr(3),
      I1 => s00_axi_awvalid,
      I2 => \axi_awaddr_reg_n_0_[5]\,
      O => \slv_reg0[31]_i_3_n_0\
    );
\slv_reg0[31]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_awvalid,
      I2 => \axi_awaddr_reg_n_0_[3]\,
      O => \slv_reg0[31]_i_4_n_0\
    );
\slv_reg0[31]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s00_axi_awaddr(2),
      I1 => s00_axi_awvalid,
      I2 => \axi_awaddr_reg_n_0_[4]\,
      O => \slv_reg0[31]_i_5_n_0\
    );
\slv_reg0[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_2_n_0\,
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => s00_axi_wstrb(0),
      O => p_1_in(7)
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(0),
      Q => slv_reg0(0),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(10),
      Q => slv_reg0(10),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(11),
      Q => slv_reg0(11),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(12),
      Q => slv_reg0(12),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(13),
      Q => slv_reg0(13),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(14),
      Q => slv_reg0(14),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(15),
      Q => slv_reg0(15),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(16),
      Q => slv_reg0(16),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(17),
      Q => slv_reg0(17),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(18),
      Q => slv_reg0(18),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(19),
      Q => slv_reg0(19),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(1),
      Q => slv_reg0(1),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(20),
      Q => slv_reg0(20),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(21),
      Q => slv_reg0(21),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(22),
      Q => slv_reg0(22),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(23),
      Q => slv_reg0(23),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(24),
      Q => slv_reg0(24),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(25),
      Q => slv_reg0(25),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(26),
      Q => slv_reg0(26),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(27),
      Q => slv_reg0(27),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(28),
      Q => slv_reg0(28),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(29),
      Q => slv_reg0(29),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(2),
      Q => slv_reg0(2),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(30),
      Q => slv_reg0(30),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(31),
      Q => slv_reg0(31),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(3),
      Q => slv_reg0(3),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(4),
      Q => slv_reg0(4),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(5),
      Q => slv_reg0(5),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(6),
      Q => slv_reg0(6),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(7),
      Q => slv_reg0(7),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(8),
      Q => slv_reg0(8),
      R => u_heater_core_dummy_n_0
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(9),
      Q => slv_reg0(9),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => s00_axi_wstrb(1),
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_2_n_0\,
      I5 => \slv_reg0[31]_i_5_n_0\,
      O => \slv_reg10[15]_i_1_n_0\
    );
\slv_reg10[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => s00_axi_wstrb(2),
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_2_n_0\,
      I5 => \slv_reg0[31]_i_5_n_0\,
      O => \slv_reg10[23]_i_1_n_0\
    );
\slv_reg10[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => s00_axi_wstrb(3),
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_2_n_0\,
      I5 => \slv_reg0[31]_i_5_n_0\,
      O => \slv_reg10[31]_i_1_n_0\
    );
\slv_reg10[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => s00_axi_wstrb(0),
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_2_n_0\,
      I5 => \slv_reg0[31]_i_5_n_0\,
      O => \slv_reg10[7]_i_1_n_0\
    );
\slv_reg10_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg10(0),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg10(10),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg10(11),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg10(12),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg10(13),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg10(14),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg10(15),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg10(16),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg10(17),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg10(18),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg10(19),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg10(1),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg10(20),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg10(21),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg10(22),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg10(23),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg10(24),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg10(25),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg10(26),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg10(27),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg10(28),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg10(29),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg10(2),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg10(30),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg10(31),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg10(3),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg10(4),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg10(5),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg10(6),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg10(7),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg10(8),
      R => u_heater_core_dummy_n_0
    );
\slv_reg10_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg10[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg10(9),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => s00_axi_wstrb(1),
      I3 => \slv_reg0[31]_i_5_n_0\,
      I4 => \slv_reg0[31]_i_2_n_0\,
      I5 => \slv_reg0[31]_i_4_n_0\,
      O => \slv_reg12[15]_i_1_n_0\
    );
\slv_reg12[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => s00_axi_wstrb(2),
      I3 => \slv_reg0[31]_i_5_n_0\,
      I4 => \slv_reg0[31]_i_2_n_0\,
      I5 => \slv_reg0[31]_i_4_n_0\,
      O => \slv_reg12[23]_i_1_n_0\
    );
\slv_reg12[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => s00_axi_wstrb(3),
      I3 => \slv_reg0[31]_i_5_n_0\,
      I4 => \slv_reg0[31]_i_2_n_0\,
      I5 => \slv_reg0[31]_i_4_n_0\,
      O => \slv_reg12[31]_i_1_n_0\
    );
\slv_reg12[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => s00_axi_wstrb(0),
      I3 => \slv_reg0[31]_i_5_n_0\,
      I4 => \slv_reg0[31]_i_2_n_0\,
      I5 => \slv_reg0[31]_i_4_n_0\,
      O => \slv_reg12[7]_i_1_n_0\
    );
\slv_reg12_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg12(0),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg12(10),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg12(11),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg12(12),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg12(13),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg12(14),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg12(15),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg12(16),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg12(17),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg12(18),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg12(19),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg12(1),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg12(20),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg12(21),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg12(22),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg12(23),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg12(24),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg12(25),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg12(26),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg12(27),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg12(28),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg12(29),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg12(2),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg12(30),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg12(31),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg12(3),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg12(4),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg12(5),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg12(6),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg12(7),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg12(8),
      R => u_heater_core_dummy_n_0
    );
\slv_reg12_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg12[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg12(9),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_5_n_0\,
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => s00_axi_wstrb(1),
      I5 => \slv_reg0[31]_i_4_n_0\,
      O => \slv_reg13[15]_i_1_n_0\
    );
\slv_reg13[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_5_n_0\,
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => s00_axi_wstrb(2),
      I5 => \slv_reg0[31]_i_4_n_0\,
      O => \slv_reg13[23]_i_1_n_0\
    );
\slv_reg13[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_5_n_0\,
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => s00_axi_wstrb(3),
      I5 => \slv_reg0[31]_i_4_n_0\,
      O => \slv_reg13[31]_i_1_n_0\
    );
\slv_reg13[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_5_n_0\,
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => s00_axi_wstrb(0),
      I5 => \slv_reg0[31]_i_4_n_0\,
      O => \slv_reg13[7]_i_1_n_0\
    );
\slv_reg13_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg13(0),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg13(10),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg13(11),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg13(12),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg13(13),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg13(14),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg13(15),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg13(16),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg13(17),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg13(18),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg13(19),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg13(1),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg13(20),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg13(21),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg13(22),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg13(23),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg13(24),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg13(25),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg13(26),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg13(27),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg13(28),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg13(29),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg13(2),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg13(30),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg13(31),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg13(3),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg13(4),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg13(5),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg13(6),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg13(7),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg13(8),
      R => u_heater_core_dummy_n_0
    );
\slv_reg13_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg13[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg13(9),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_5_n_0\,
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => s00_axi_wstrb(1),
      I4 => \slv_reg0[31]_i_4_n_0\,
      I5 => \slv_reg0[31]_i_2_n_0\,
      O => \slv_reg14[15]_i_1_n_0\
    );
\slv_reg14[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_5_n_0\,
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => s00_axi_wstrb(2),
      I4 => \slv_reg0[31]_i_4_n_0\,
      I5 => \slv_reg0[31]_i_2_n_0\,
      O => \slv_reg14[23]_i_1_n_0\
    );
\slv_reg14[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_5_n_0\,
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => s00_axi_wstrb(3),
      I4 => \slv_reg0[31]_i_4_n_0\,
      I5 => \slv_reg0[31]_i_2_n_0\,
      O => \slv_reg14[31]_i_1_n_0\
    );
\slv_reg14[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_5_n_0\,
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => s00_axi_wstrb(0),
      I4 => \slv_reg0[31]_i_4_n_0\,
      I5 => \slv_reg0[31]_i_2_n_0\,
      O => \slv_reg14[7]_i_1_n_0\
    );
\slv_reg14_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg14(0),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg14(10),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg14(11),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg14(12),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg14(13),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg14(14),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg14(15),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg14(16),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg14(17),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg14(18),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg14(19),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg14(1),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg14(20),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg14(21),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg14(22),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg14(23),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg14(24),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg14(25),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg14(26),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg14(27),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg14(28),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg14(29),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg14(2),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg14(30),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg14(31),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg14(3),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg14(4),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg14(5),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg14(6),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg14(7),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg14(8),
      R => u_heater_core_dummy_n_0
    );
\slv_reg14_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg14[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg14(9),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_5_n_0\,
      I2 => s00_axi_wstrb(1),
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => \slv_reg0[31]_i_4_n_0\,
      I5 => \slv_reg0[31]_i_3_n_0\,
      O => \slv_reg15[15]_i_1_n_0\
    );
\slv_reg15[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_5_n_0\,
      I2 => s00_axi_wstrb(2),
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => \slv_reg0[31]_i_4_n_0\,
      I5 => \slv_reg0[31]_i_3_n_0\,
      O => \slv_reg15[23]_i_1_n_0\
    );
\slv_reg15[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_5_n_0\,
      I2 => s00_axi_wstrb(3),
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => \slv_reg0[31]_i_4_n_0\,
      I5 => \slv_reg0[31]_i_3_n_0\,
      O => \slv_reg15[31]_i_1_n_0\
    );
\slv_reg15[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_5_n_0\,
      I2 => s00_axi_wstrb(0),
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => \slv_reg0[31]_i_4_n_0\,
      I5 => \slv_reg0[31]_i_3_n_0\,
      O => \slv_reg15[7]_i_1_n_0\
    );
\slv_reg15_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg15(0),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg15(10),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg15(11),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg15(12),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg15(13),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg15(14),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg15(15),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg15(16),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg15(17),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg15(18),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg15(19),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg15(1),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg15(20),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg15(21),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg15(22),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg15(23),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg15(24),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg15(25),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg15(26),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg15(27),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg15(28),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg15(29),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg15(2),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg15(30),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg15(31),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg15(3),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg15(4),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg15(5),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg15(6),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg15(7),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg15(8),
      R => u_heater_core_dummy_n_0
    );
\slv_reg15_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg15[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg15(9),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(1),
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => \slv_reg0[31]_i_2_n_0\,
      O => \slv_reg1[15]_i_1_n_0\
    );
\slv_reg1[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(2),
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => \slv_reg0[31]_i_2_n_0\,
      O => \slv_reg1[23]_i_1_n_0\
    );
\slv_reg1[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(3),
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => \slv_reg0[31]_i_2_n_0\,
      O => \slv_reg1[31]_i_1_n_0\
    );
\slv_reg1[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(0),
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => \slv_reg0[31]_i_2_n_0\,
      O => \slv_reg1[7]_i_1_n_0\
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg1(0),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg1(10),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg1(11),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg1(12),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg1(13),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg1(14),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg1(15),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg1(16),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg1(17),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg1(18),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg1(19),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg1(1),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg1(20),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg1(21),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg1(22),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg1(23),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg1(24),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg1(25),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg1(26),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg1(27),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg1(28),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg1(29),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg1(2),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg1(30),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg1(31),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg1(3),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg1(4),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg1(5),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg1(6),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg1(7),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg1(8),
      R => u_heater_core_dummy_n_0
    );
\slv_reg1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg1(9),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(1),
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => \slv_reg0[31]_i_4_n_0\,
      O => \slv_reg2[15]_i_1_n_0\
    );
\slv_reg2[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(2),
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => \slv_reg0[31]_i_4_n_0\,
      O => \slv_reg2[23]_i_1_n_0\
    );
\slv_reg2[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(3),
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => \slv_reg0[31]_i_4_n_0\,
      O => \slv_reg2[31]_i_1_n_0\
    );
\slv_reg2[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(0),
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => \slv_reg0[31]_i_4_n_0\,
      O => \slv_reg2[7]_i_1_n_0\
    );
\slv_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg2(0),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg2(10),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg2(11),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg2(12),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg2(13),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg2(14),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg2(15),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg2(16),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg2(17),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg2(18),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg2(19),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg2(1),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg2(20),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg2(21),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg2(22),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg2(23),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg2(24),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg2(25),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg2(26),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg2(27),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg2(28),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg2(29),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg2(2),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg2(30),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg2(31),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg2(3),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg2(4),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg2(5),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg2(6),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg2(7),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg2(8),
      R => u_heater_core_dummy_n_0
    );
\slv_reg2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg2(9),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(1),
      I2 => \slv_reg0[31]_i_2_n_0\,
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => \slv_reg0[31]_i_3_n_0\,
      O => \slv_reg3[15]_i_1_n_0\
    );
\slv_reg3[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(2),
      I2 => \slv_reg0[31]_i_2_n_0\,
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => \slv_reg0[31]_i_3_n_0\,
      O => \slv_reg3[23]_i_1_n_0\
    );
\slv_reg3[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(3),
      I2 => \slv_reg0[31]_i_2_n_0\,
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => \slv_reg0[31]_i_3_n_0\,
      O => \slv_reg3[31]_i_1_n_0\
    );
\slv_reg3[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(0),
      I2 => \slv_reg0[31]_i_2_n_0\,
      I3 => \slv_reg0[31]_i_4_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => \slv_reg0[31]_i_3_n_0\,
      O => \slv_reg3[7]_i_1_n_0\
    );
\slv_reg3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg3(0),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg3(10),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg3(11),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg3(12),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg3(13),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg3(14),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg3(15),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg3(16),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg3(17),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg3(18),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg3(19),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg3(1),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg3(20),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg3(21),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg3(22),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg3(23),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg3(24),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg3(25),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg3(26),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg3(27),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg3(28),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg3(29),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg3(2),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg3(30),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg3(31),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg3(3),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg3(4),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg3(5),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg3(6),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg3(7),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg3(8),
      R => u_heater_core_dummy_n_0
    );
\slv_reg3_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg3(9),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => \slv_reg0[31]_i_4_n_0\,
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => s00_axi_wstrb(1),
      O => \slv_reg8[15]_i_1_n_0\
    );
\slv_reg8[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => \slv_reg0[31]_i_4_n_0\,
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => s00_axi_wstrb(2),
      O => \slv_reg8[23]_i_1_n_0\
    );
\slv_reg8[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => \slv_reg0[31]_i_4_n_0\,
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => s00_axi_wstrb(3),
      O => \slv_reg8[31]_i_1_n_0\
    );
\slv_reg8[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => \slv_reg0[31]_i_4_n_0\,
      I3 => \slv_reg0[31]_i_2_n_0\,
      I4 => \slv_reg0[31]_i_5_n_0\,
      I5 => s00_axi_wstrb(0),
      O => \slv_reg8[7]_i_1_n_0\
    );
\slv_reg8_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg8(0),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg8(10),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg8(11),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg8(12),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg8(13),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg8(14),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg8(15),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg8(16),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg8(17),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg8(18),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg8(19),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg8(1),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg8(20),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg8(21),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg8(22),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg8(23),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg8(24),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg8(25),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg8(26),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg8(27),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg8(28),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg8(29),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg8(2),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg8(30),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg8(31),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg8(3),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg8(4),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg8(5),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg8(6),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg8(7),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg8(8),
      R => u_heater_core_dummy_n_0
    );
\slv_reg8_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg8(9),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => \slv_reg0[31]_i_2_n_0\,
      I3 => s00_axi_wstrb(1),
      I4 => \slv_reg0[31]_i_4_n_0\,
      I5 => \slv_reg0[31]_i_5_n_0\,
      O => \slv_reg9[15]_i_1_n_0\
    );
\slv_reg9[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => \slv_reg0[31]_i_2_n_0\,
      I3 => s00_axi_wstrb(2),
      I4 => \slv_reg0[31]_i_4_n_0\,
      I5 => \slv_reg0[31]_i_5_n_0\,
      O => \slv_reg9[23]_i_1_n_0\
    );
\slv_reg9[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => \slv_reg0[31]_i_2_n_0\,
      I3 => s00_axi_wstrb(3),
      I4 => \slv_reg0[31]_i_4_n_0\,
      I5 => \slv_reg0[31]_i_5_n_0\,
      O => \slv_reg9[31]_i_1_n_0\
    );
\slv_reg9[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg0[31]_i_3_n_0\,
      I2 => \slv_reg0[31]_i_2_n_0\,
      I3 => s00_axi_wstrb(0),
      I4 => \slv_reg0[31]_i_4_n_0\,
      I5 => \slv_reg0[31]_i_5_n_0\,
      O => \slv_reg9[7]_i_1_n_0\
    );
\slv_reg9_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg9(0),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg9(10),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg9(11),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg9(12),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg9(13),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg9(14),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg9(15),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg9(16),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg9(17),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg9(18),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg9(19),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg9(1),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg9(20),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg9(21),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg9(22),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg9(23),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg9(24),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg9(25),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg9(26),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg9(27),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg9(28),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg9(29),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg9(2),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg9(30),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg9(31),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg9(3),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg9(4),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg9(5),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg9(6),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg9(7),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg9(8),
      R => u_heater_core_dummy_n_0
    );
\slv_reg9_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg9[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg9(9),
      R => u_heater_core_dummy_n_0
    );
u_heater_core_dummy: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_core_dummy
     port map (
      Q(3 downto 0) => sel0(3 downto 0),
      SR(0) => u_heater_core_dummy_n_0,
      \error_reg[0]_0\(1) => slv_reg0(2),
      \error_reg[0]_0\(0) => slv_reg0(0),
      \error_reg[31]_0\(31 downto 0) => slv_reg1(31 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      \s00_axi_rdata[0]_0\ => \s00_axi_rdata[0]_INST_0_i_3_n_0\,
      \s00_axi_rdata[10]_0\ => \s00_axi_rdata[10]_INST_0_i_2_n_0\,
      \s00_axi_rdata[10]_1\ => \s00_axi_rdata[10]_INST_0_i_4_n_0\,
      \s00_axi_rdata[11]_0\ => \s00_axi_rdata[11]_INST_0_i_2_n_0\,
      \s00_axi_rdata[11]_1\ => \s00_axi_rdata[11]_INST_0_i_4_n_0\,
      \s00_axi_rdata[12]_0\ => \s00_axi_rdata[12]_INST_0_i_2_n_0\,
      \s00_axi_rdata[12]_1\ => \s00_axi_rdata[12]_INST_0_i_4_n_0\,
      \s00_axi_rdata[13]_0\ => \s00_axi_rdata[13]_INST_0_i_2_n_0\,
      \s00_axi_rdata[13]_1\ => \s00_axi_rdata[13]_INST_0_i_4_n_0\,
      \s00_axi_rdata[14]_0\ => \s00_axi_rdata[14]_INST_0_i_2_n_0\,
      \s00_axi_rdata[14]_1\ => \s00_axi_rdata[14]_INST_0_i_4_n_0\,
      \s00_axi_rdata[15]_0\ => \s00_axi_rdata[15]_INST_0_i_2_n_0\,
      \s00_axi_rdata[15]_1\ => \s00_axi_rdata[15]_INST_0_i_4_n_0\,
      \s00_axi_rdata[16]_0\ => \s00_axi_rdata[16]_INST_0_i_2_n_0\,
      \s00_axi_rdata[16]_1\ => \s00_axi_rdata[16]_INST_0_i_4_n_0\,
      \s00_axi_rdata[17]_0\ => \s00_axi_rdata[17]_INST_0_i_2_n_0\,
      \s00_axi_rdata[17]_1\ => \s00_axi_rdata[17]_INST_0_i_4_n_0\,
      \s00_axi_rdata[18]_0\ => \s00_axi_rdata[18]_INST_0_i_2_n_0\,
      \s00_axi_rdata[18]_1\ => \s00_axi_rdata[18]_INST_0_i_4_n_0\,
      \s00_axi_rdata[19]_0\ => \s00_axi_rdata[19]_INST_0_i_2_n_0\,
      \s00_axi_rdata[19]_1\ => \s00_axi_rdata[19]_INST_0_i_4_n_0\,
      \s00_axi_rdata[1]_0\ => \s00_axi_rdata[1]_INST_0_i_2_n_0\,
      \s00_axi_rdata[1]_1\ => \s00_axi_rdata[1]_INST_0_i_4_n_0\,
      \s00_axi_rdata[20]_0\ => \s00_axi_rdata[20]_INST_0_i_2_n_0\,
      \s00_axi_rdata[20]_1\ => \s00_axi_rdata[20]_INST_0_i_4_n_0\,
      \s00_axi_rdata[21]_0\ => \s00_axi_rdata[21]_INST_0_i_2_n_0\,
      \s00_axi_rdata[21]_1\ => \s00_axi_rdata[21]_INST_0_i_4_n_0\,
      \s00_axi_rdata[22]_0\ => \s00_axi_rdata[22]_INST_0_i_2_n_0\,
      \s00_axi_rdata[22]_1\ => \s00_axi_rdata[22]_INST_0_i_4_n_0\,
      \s00_axi_rdata[23]_0\ => \s00_axi_rdata[23]_INST_0_i_2_n_0\,
      \s00_axi_rdata[23]_1\ => \s00_axi_rdata[23]_INST_0_i_4_n_0\,
      \s00_axi_rdata[24]_0\ => \s00_axi_rdata[24]_INST_0_i_3_n_0\,
      \s00_axi_rdata[25]_0\ => \s00_axi_rdata[25]_INST_0_i_3_n_0\,
      \s00_axi_rdata[26]_0\ => \s00_axi_rdata[26]_INST_0_i_3_n_0\,
      \s00_axi_rdata[27]_0\ => \s00_axi_rdata[27]_INST_0_i_3_n_0\,
      \s00_axi_rdata[28]_0\ => \s00_axi_rdata[28]_INST_0_i_3_n_0\,
      \s00_axi_rdata[29]_0\ => \s00_axi_rdata[29]_INST_0_i_3_n_0\,
      \s00_axi_rdata[2]_0\ => \s00_axi_rdata[2]_INST_0_i_2_n_0\,
      \s00_axi_rdata[2]_1\ => \s00_axi_rdata[2]_INST_0_i_4_n_0\,
      \s00_axi_rdata[30]_0\ => \s00_axi_rdata[30]_INST_0_i_2_n_0\,
      \s00_axi_rdata[30]_1\ => \s00_axi_rdata[30]_INST_0_i_4_n_0\,
      \s00_axi_rdata[31]_0\ => \s00_axi_rdata[31]_INST_0_i_2_n_0\,
      \s00_axi_rdata[31]_1\ => \s00_axi_rdata[31]_INST_0_i_4_n_0\,
      \s00_axi_rdata[3]_0\ => \s00_axi_rdata[3]_INST_0_i_2_n_0\,
      \s00_axi_rdata[3]_1\ => \s00_axi_rdata[3]_INST_0_i_4_n_0\,
      \s00_axi_rdata[4]_0\ => \s00_axi_rdata[4]_INST_0_i_2_n_0\,
      \s00_axi_rdata[4]_1\ => \s00_axi_rdata[4]_INST_0_i_4_n_0\,
      \s00_axi_rdata[5]_0\ => \s00_axi_rdata[5]_INST_0_i_2_n_0\,
      \s00_axi_rdata[5]_1\ => \s00_axi_rdata[5]_INST_0_i_4_n_0\,
      \s00_axi_rdata[6]_0\ => \s00_axi_rdata[6]_INST_0_i_2_n_0\,
      \s00_axi_rdata[6]_1\ => \s00_axi_rdata[6]_INST_0_i_4_n_0\,
      \s00_axi_rdata[7]_0\ => \s00_axi_rdata[7]_INST_0_i_2_n_0\,
      \s00_axi_rdata[7]_1\ => \s00_axi_rdata[7]_INST_0_i_4_n_0\,
      \s00_axi_rdata[8]_0\ => \s00_axi_rdata[8]_INST_0_i_2_n_0\,
      \s00_axi_rdata[8]_1\ => \s00_axi_rdata[8]_INST_0_i_4_n_0\,
      \s00_axi_rdata[9]_0\ => \s00_axi_rdata[9]_INST_0_i_2_n_0\,
      \s00_axi_rdata[9]_1\ => \s00_axi_rdata[9]_INST_0_i_4_n_0\,
      s00_axi_rdata_0_sp_1 => \s00_axi_rdata[0]_INST_0_i_2_n_0\,
      s00_axi_rdata_10_sp_1 => \s00_axi_rdata[10]_INST_0_i_1_n_0\,
      s00_axi_rdata_11_sp_1 => \s00_axi_rdata[11]_INST_0_i_1_n_0\,
      s00_axi_rdata_12_sp_1 => \s00_axi_rdata[12]_INST_0_i_1_n_0\,
      s00_axi_rdata_13_sp_1 => \s00_axi_rdata[13]_INST_0_i_1_n_0\,
      s00_axi_rdata_14_sp_1 => \s00_axi_rdata[14]_INST_0_i_1_n_0\,
      s00_axi_rdata_15_sp_1 => \s00_axi_rdata[15]_INST_0_i_1_n_0\,
      s00_axi_rdata_16_sp_1 => \s00_axi_rdata[16]_INST_0_i_1_n_0\,
      s00_axi_rdata_17_sp_1 => \s00_axi_rdata[17]_INST_0_i_1_n_0\,
      s00_axi_rdata_18_sp_1 => \s00_axi_rdata[18]_INST_0_i_1_n_0\,
      s00_axi_rdata_19_sp_1 => \s00_axi_rdata[19]_INST_0_i_1_n_0\,
      s00_axi_rdata_1_sp_1 => \s00_axi_rdata[1]_INST_0_i_1_n_0\,
      s00_axi_rdata_20_sp_1 => \s00_axi_rdata[20]_INST_0_i_1_n_0\,
      s00_axi_rdata_21_sp_1 => \s00_axi_rdata[21]_INST_0_i_1_n_0\,
      s00_axi_rdata_22_sp_1 => \s00_axi_rdata[22]_INST_0_i_1_n_0\,
      s00_axi_rdata_23_sp_1 => \s00_axi_rdata[23]_INST_0_i_1_n_0\,
      s00_axi_rdata_24_sp_1 => \s00_axi_rdata[24]_INST_0_i_2_n_0\,
      s00_axi_rdata_25_sp_1 => \s00_axi_rdata[25]_INST_0_i_2_n_0\,
      s00_axi_rdata_26_sp_1 => \s00_axi_rdata[26]_INST_0_i_2_n_0\,
      s00_axi_rdata_27_sp_1 => \s00_axi_rdata[27]_INST_0_i_2_n_0\,
      s00_axi_rdata_28_sp_1 => \s00_axi_rdata[28]_INST_0_i_2_n_0\,
      s00_axi_rdata_29_sp_1 => \s00_axi_rdata[29]_INST_0_i_2_n_0\,
      s00_axi_rdata_2_sp_1 => \s00_axi_rdata[2]_INST_0_i_1_n_0\,
      s00_axi_rdata_30_sp_1 => \s00_axi_rdata[30]_INST_0_i_1_n_0\,
      s00_axi_rdata_31_sp_1 => \s00_axi_rdata[31]_INST_0_i_1_n_0\,
      s00_axi_rdata_3_sp_1 => \s00_axi_rdata[3]_INST_0_i_1_n_0\,
      s00_axi_rdata_4_sp_1 => \s00_axi_rdata[4]_INST_0_i_1_n_0\,
      s00_axi_rdata_5_sp_1 => \s00_axi_rdata[5]_INST_0_i_1_n_0\,
      s00_axi_rdata_6_sp_1 => \s00_axi_rdata[6]_INST_0_i_1_n_0\,
      s00_axi_rdata_7_sp_1 => \s00_axi_rdata[7]_INST_0_i_1_n_0\,
      s00_axi_rdata_8_sp_1 => \s00_axi_rdata[8]_INST_0_i_1_n_0\,
      s00_axi_rdata_9_sp_1 => \s00_axi_rdata[9]_INST_0_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_axi is
  port (
    axi_arready_reg : out STD_LOGIC;
    axi_rvalid_reg : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_awready_reg : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_bready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_axi;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_axi is
  signal axi_arready_i_1_n_0 : STD_LOGIC;
  signal \^axi_arready_reg\ : STD_LOGIC;
  signal \axi_awready0__0\ : STD_LOGIC;
  signal axi_awready_i_2_n_0 : STD_LOGIC;
  signal \^axi_awready_reg\ : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal \^axi_rvalid_reg\ : STD_LOGIC;
  signal axi_wready_i_1_n_0 : STD_LOGIC;
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_wready\ : STD_LOGIC;
  signal state_read : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal state_write : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  axi_arready_reg <= \^axi_arready_reg\;
  axi_awready_reg <= \^axi_awready_reg\;
  axi_rvalid_reg <= \^axi_rvalid_reg\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_wready <= \^s00_axi_wready\;
axi_arready_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C4C4C4C4FFCFCFCF"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^axi_arready_reg\,
      I2 => state_read(1),
      I3 => s00_axi_rready,
      I4 => \^axi_rvalid_reg\,
      I5 => state_read(0),
      O => axi_arready_i_1_n_0
    );
axi_awready_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCC4FFCF"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => \^axi_awready_reg\,
      I2 => state_write(1),
      I3 => s00_axi_wvalid,
      I4 => state_write(0),
      O => axi_awready_i_2_n_0
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFF3838C3FF0000"
    )
        port map (
      I0 => \axi_awready0__0\,
      I1 => state_write(0),
      I2 => state_write(1),
      I3 => s00_axi_bready,
      I4 => \^s00_axi_bvalid\,
      I5 => s00_axi_wvalid,
      O => axi_bvalid_i_1_n_0
    );
axi_rvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFFFFF00800080"
    )
        port map (
      I0 => \^axi_arready_reg\,
      I1 => s00_axi_arvalid,
      I2 => state_read(0),
      I3 => state_read(1),
      I4 => s00_axi_rready,
      I5 => \^axi_rvalid_reg\,
      O => axi_rvalid_i_1_n_0
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
heater_axi_slave_lite_v1_0_S00_AXI_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_axi_slave_lite_v1_0_S00_AXI
     port map (
      \FSM_sequential_state_read_reg[1]_0\(1 downto 0) => state_read(1 downto 0),
      Q(1 downto 0) => state_write(1 downto 0),
      axi_arready_reg_0 => \^axi_arready_reg\,
      axi_arready_reg_1 => axi_arready_i_1_n_0,
      \axi_awready0__0\ => \axi_awready0__0\,
      axi_awready_reg_0 => \^axi_awready_reg\,
      axi_awready_reg_1 => axi_awready_i_2_n_0,
      axi_bvalid_reg_0 => axi_bvalid_i_1_n_0,
      axi_rvalid_reg_0 => \^axi_rvalid_reg\,
      axi_rvalid_reg_1 => axi_rvalid_i_1_n_0,
      axi_wready_reg_0 => axi_wready_i_1_n_0,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(3 downto 0) => s00_axi_araddr(3 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(3 downto 0) => s00_axi_awaddr(3 downto 0),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bvalid => \^s00_axi_bvalid\,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => \^s00_axi_wready\,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
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
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "kd240_ecat_bd_heater_axi_0_0,heater_axi,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "heater_axi,Vivado 2025.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of s00_axi_aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN kd240_ecat_bd_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute X_INTERFACE_MODE of s00_axi_aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute X_INTERFACE_MODE of s00_axi_awaddr : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s00_axi_awaddr : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 16, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99999001, ID_WIDTH 0, ADDR_WIDTH 6, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN kd240_ecat_bd_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
begin
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_heater_axi
     port map (
      axi_arready_reg => s00_axi_arready,
      axi_awready_reg => s00_axi_awready,
      axi_rvalid_reg => s00_axi_rvalid,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(3 downto 0) => s00_axi_araddr(5 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(3 downto 0) => s00_axi_awaddr(5 downto 2),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
