vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_22
vlib questa_lib/msim/zynq_ultra_ps_e_vip_v1_0_22
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/dist_mem_gen_v8_0_17
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/interrupt_control_v3_1_5
vlib questa_lib/msim/axi_quad_spi_v3_2_35
vlib questa_lib/msim/proc_sys_reset_v5_0_17
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/axi_register_slice_v2_1_36
vlib questa_lib/msim/xlconcat_v2_1_7
vlib questa_lib/msim/xbip_utils_v3_0_15
vlib questa_lib/msim/axi_utils_v2_0_11
vlib questa_lib/msim/xbip_pipe_v3_0_11
vlib questa_lib/msim/xbip_dsp48_wrapper_v3_0_7
vlib questa_lib/msim/mult_gen_v12_0_24
vlib questa_lib/msim/floating_point_v7_1_21

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_22 questa_lib/msim/axi_vip_v1_1_22
vmap zynq_ultra_ps_e_vip_v1_0_22 questa_lib/msim/zynq_ultra_ps_e_vip_v1_0_22
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap dist_mem_gen_v8_0_17 questa_lib/msim/dist_mem_gen_v8_0_17
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_5 questa_lib/msim/interrupt_control_v3_1_5
vmap axi_quad_spi_v3_2_35 questa_lib/msim/axi_quad_spi_v3_2_35
vmap proc_sys_reset_v5_0_17 questa_lib/msim/proc_sys_reset_v5_0_17
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap axi_register_slice_v2_1_36 questa_lib/msim/axi_register_slice_v2_1_36
vmap xlconcat_v2_1_7 questa_lib/msim/xlconcat_v2_1_7
vmap xbip_utils_v3_0_15 questa_lib/msim/xbip_utils_v3_0_15
vmap axi_utils_v2_0_11 questa_lib/msim/axi_utils_v2_0_11
vmap xbip_pipe_v3_0_11 questa_lib/msim/xbip_pipe_v3_0_11
vmap xbip_dsp48_wrapper_v3_0_7 questa_lib/msim/xbip_dsp48_wrapper_v3_0_7
vmap mult_gen_v12_0_24 questa_lib/msim/mult_gen_v12_0_24
vmap floating_point_v7_1_21 questa_lib/msim/floating_point_v7_1_21

vlog -work xilinx_vip  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"C:/AMDDesignTools/2025.2/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/AMDDesignTools/2025.2/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/AMDDesignTools/2025.2/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"C:/AMDDesignTools/2025.2/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_22  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/b16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_22  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_zynq_ultra_ps_e_0_0/sim/kd240_ecat_bd_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vlog -work dist_mem_gen_v8_0_17  -incr -mfcu  "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ca90/simulation/dist_mem_gen_v8_0.v" \

vcom -work axi_lite_ipif_v3_0_4  -93  \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_5  -93  \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_quad_spi_v3_2_35  -93  \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/9bdf/hdl/axi_quad_spi_v3_2_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_quad_spi_0_0/sim/kd240_ecat_bd_axi_quad_spi_0_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/sim/bd_6104.v" \

vcom -work proc_sys_reset_v5_0_17  -93  \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_1/sim/bd_6104_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/0848/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_2/sim/bd_6104_arinsw_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_3/sim/bd_6104_rinsw_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_4/sim/bd_6104_awinsw_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_5/sim/bd_6104_winsw_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_6/sim/bd_6104_binsw_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_7/sim/bd_6104_aroutsw_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_8/sim/bd_6104_routsw_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_9/sim/bd_6104_awoutsw_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_10/sim/bd_6104_woutsw_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_11/sim/bd_6104_boutsw_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_12/sim/bd_6104_arni_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_13/sim/bd_6104_rni_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_14/sim/bd_6104_awni_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_15/sim/bd_6104_wni_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_16/sim/bd_6104_bni_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/3d9a/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_17/sim/bd_6104_s01mmu_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/7785/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_18/sim/bd_6104_s01tr_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/3051/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_19/sim/bd_6104_s01sic_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/852f/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_20/sim/bd_6104_s01a2s_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_21/sim/bd_6104_sarn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_22/sim/bd_6104_srn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_23/sim/bd_6104_sawn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_24/sim/bd_6104_swn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_25/sim/bd_6104_sbn_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/fca9/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_26/sim/bd_6104_m00s2a_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_27/sim/bd_6104_m00arn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_28/sim/bd_6104_m00rn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_29/sim/bd_6104_m00awn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_30/sim/bd_6104_m00wn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_31/sim/bd_6104_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/e44a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_32/sim/bd_6104_m00e_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_33/sim/bd_6104_m01s2a_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_34/sim/bd_6104_m01arn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_35/sim/bd_6104_m01rn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_36/sim/bd_6104_m01awn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_37/sim/bd_6104_m01wn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_38/sim/bd_6104_m01bn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_39/sim/bd_6104_m01e_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_40/sim/bd_6104_m02s2a_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_41/sim/bd_6104_m02arn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_42/sim/bd_6104_m02rn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_43/sim/bd_6104_m02awn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_44/sim/bd_6104_m02wn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_45/sim/bd_6104_m02bn_0.sv" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/bd_0/ip/ip_46/sim/bd_6104_m02e_0.sv" \

vcom -work smartconnect_v1_0  -93  \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.vhd" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.sv" \

vlog -work axi_register_slice_v2_1_36  -incr -mfcu  "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/bc4b/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_axi_smc_0/sim/kd240_ecat_bd_axi_smc_0.sv" \

vcom -work xil_defaultlib  -93  \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_rst_ps8_0_99M_0/sim/kd240_ecat_bd_rst_ps8_0_99M_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ipshared/14f6/hdl/ecat_pl_if_slave_lite_v1_0_S00_AXI.v" \
"../../../bd/kd240_ecat_bd/ipshared/14f6/hdl/ecat_pl_if.v" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_ecat_pl_if_0_0/sim/kd240_ecat_bd_ecat_pl_if_0_0.v" \

vlog -work xlconcat_v2_1_7  -incr -mfcu  "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/9c1a/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_xlconcat_0_0/sim/kd240_ecat_bd_xlconcat_0_0.v" \

vcom -work xbip_utils_v3_0_15  -93  \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ip/kd240_ecat_bd_heater_axi_0_0/src/fp_add_1/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_11  -93  \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ip/kd240_ecat_bd_heater_axi_0_0/src/fp_add_1/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_11  -93  \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ip/kd240_ecat_bd_heater_axi_0_0/src/fp_add_1/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_7  -93  \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ip/kd240_ecat_bd_heater_axi_0_0/src/fp_add_1/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_24  -93  \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ip/kd240_ecat_bd_heater_axi_0_0/src/fp_add_1/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_21  -93  \
"../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ip/kd240_ecat_bd_heater_axi_0_0/src/fp_add_1/hdl/floating_point_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_heater_axi_0_0/src/fp_add_1/sim/fp_add.vhd" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_heater_axi_0_0/src/fp_mult_1/sim/fp_mult.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ipshared/4d64/hdl/heater_axi_slave_lite_v1_0_S00_AXI.v" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ipshared/4d64/hdl/heater_core.sv" \
"../../../bd/kd240_ecat_bd/ipshared/4d64/src/pi_controller.sv" \
"../../../bd/kd240_ecat_bd/ipshared/4d64/src/pwm_gen.sv" \
"../../../bd/kd240_ecat_bd/ipshared/4d64/src/sensor_delay_float.sv" \
"../../../bd/kd240_ecat_bd/ipshared/4d64/src/sensor_noise_float.sv" \
"../../../bd/kd240_ecat_bd/ipshared/4d64/src/system_fsm.sv" \
"../../../bd/kd240_ecat_bd/ipshared/4d64/src/timer_gen.sv" \
"../../../bd/kd240_ecat_bd/ipshared/4d64/src/virtual_plant.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/ec67/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/a0fe/hdl" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/f0b6/hdl/verilog" "+incdir+../../../../kd240_ecat_lan9252.gen/sources_1/bd/kd240_ecat_bd/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/kd240_ecat_bd/ipshared/4d64/hdl/heater_axi.v" \
"../../../bd/kd240_ecat_bd/ip/kd240_ecat_bd_heater_axi_0_0/sim/kd240_ecat_bd_heater_axi_0_0.v" \
"../../../bd/kd240_ecat_bd/sim/kd240_ecat_bd.v" \

vlog -work xil_defaultlib \
"glbl.v"

