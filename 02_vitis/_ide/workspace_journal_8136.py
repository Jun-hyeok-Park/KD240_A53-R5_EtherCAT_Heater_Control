# 2026-05-19T13:45:43.785588300
import vitis

client = vitis.create_client()
client.set_workspace(path="02_vitis")

platform = client.get_component(name="kd240_ecat_platform")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../07_export/kd240_ecat_bd_wrapper.xsa")

status = platform.build()

domain = platform.add_domain(cpu = "psu_cortexr5_0",os = "standalone",name = "standalone_psu_cortexr5_0",display_name = "standalone_psu_cortexr5_0",generate_dtb = False,hw_boot_bin = "")

comp = client.create_app_component(name="r5_heater_axi_test",platform = "$COMPONENT_LOCATION/../kd240_ecat_platform/export/kd240_ecat_platform/kd240_ecat_platform.xpfm",domain = "standalone_psu_cortexr5_0")

comp = client.get_component(name="r5_heater_axi_test")
comp.build()

comp.build()

comp.build()

status = platform.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

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

vitis.dispose()

