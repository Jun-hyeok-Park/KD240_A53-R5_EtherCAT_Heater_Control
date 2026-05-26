# 2026-05-19T08:37:25.836036400
import vitis

client = vitis.create_client()
client.set_workspace(path="02_vitis")

comp = client.get_component(name="kd240_ecat_slave_app")
comp.build()

platform = client.get_component(name="kd240_ecat_platform")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../07_export/kd240_ecat_bd_wrapper.xsa")

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../07_export/kd240_ecat_bd_wrapper.xsa")

status = platform.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

vitis.dispose()

