# 2026-05-20T08:48:05.980842
import vitis

client = vitis.create_client()
client.set_workspace(path="02_vitis")

component = client.get_component(name="kd240_ecat_slave_app")

lscript = component.get_ld_script(path="C:\Users\user\Desktop\KD240\02_vitis\kd240_ecat_slave_app\src\lscript.ld")

lscript.update_memory_region("psu_ddr_0_memory_0", "0x0", "0x60000000")

lscript.update_memory_region("psu_qspi_linear_0_memory_0", "0x60000000", "0x20000000")

lscript.update_memory_region("psu_qspi_linear_0_memory_0", "0x60000000", "0x01000000")

lscript.update_memory_region("psu_ocm_ram_0_memory_0", "0x700000000", "0x40000")

component = client.get_component(name="r5_heater_axi_test")

lscript = component.get_ld_script(path="C:\Users\user\Desktop\KD240\02_vitis\r5_heater_axi_test\src\lscript.ld")

lscript.update_memory_region("psu_r5_ddr_0_memory_0", "0x60000000", "0x7fefffff")

lscript.update_memory_region("psu_r5_ddr_0_memory_0", "0x60000000", "0x01000000")

comp = client.get_component(name="r5_heater_axi_test")
comp.build()

comp = client.get_component(name="kd240_ecat_slave_app")
comp.build()

comp = client.get_component(name="r5_heater_axi_test")
comp.build()

comp = client.get_component(name="kd240_ecat_slave_app")
comp.build()

comp = client.get_component(name="r5_heater_axi_test")
comp.build()

comp = client.get_component(name="kd240_ecat_slave_app")
comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp = client.get_component(name="r5_heater_axi_test")
comp.build()

comp = client.get_component(name="kd240_ecat_slave_app")
comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp = client.get_component(name="r5_heater_axi_test")
comp.build()

comp = client.get_component(name="kd240_ecat_slave_app")
comp.build()

comp = client.get_component(name="r5_heater_axi_test")
comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

vitis.dispose()

