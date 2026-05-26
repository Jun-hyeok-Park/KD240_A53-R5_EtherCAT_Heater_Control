transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+kd240_ecat_bd  -L xil_defaultlib -L xilinx_vip -L xpm -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L dist_mem_gen_v8_0_17 -L axi_lite_ipif_v3_0_4 -L interrupt_control_v3_1_5 -L axi_quad_spi_v3_2_35 -L proc_sys_reset_v5_0_17 -L smartconnect_v1_0 -L axi_register_slice_v2_1_36 -L xlconcat_v2_1_7 -L xbip_utils_v3_0_15 -L axi_utils_v2_0_11 -L xbip_pipe_v3_0_11 -L xbip_dsp48_wrapper_v3_0_7 -L mult_gen_v12_0_24 -L floating_point_v7_1_21 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.kd240_ecat_bd xil_defaultlib.glbl

do {kd240_ecat_bd.udo}

run 1000ns

endsim

quit -force
