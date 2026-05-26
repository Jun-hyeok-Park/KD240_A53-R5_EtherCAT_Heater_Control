# 2026-05-15T15:18:35.251348100
import vitis

client = vitis.create_client()
client.set_workspace(path="02_vitis")

platform = client.get_component(name="kd240_ecat_platform")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../07_export/kd240_ecat_bd_wrapper.xsa")

status = platform.build()

comp = client.get_component(name="kd240_ecat_slave_app")
comp.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../07_export/kd240_ecat_bd_wrapper.xsa")

status = platform.build()

vitis.dispose()

