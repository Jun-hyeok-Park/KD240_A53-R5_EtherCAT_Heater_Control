# 2026-05-13T11:53:56.335739100
import vitis

client = vitis.create_client()
client.set_workspace(path="02_vitis")

platform = client.create_platform_component(name = "kd240_ecat_platform",hw_design = "$COMPONENT_LOCATION/../../07_export/kd240_ecat_bd_wrapper.xsa",os = "standalone",cpu = "psu_cortexa53_0",domain_name = "standalone_psu_cortexa53_0",architecture = "64-bit",compiler = "gcc")

comp = client.create_app_component(name="kd240_ecat_slave_app",platform = "$COMPONENT_LOCATION/../kd240_ecat_platform/export/kd240_ecat_platform/kd240_ecat_platform.xpfm",domain = "standalone_psu_cortexa53_0")

platform = client.get_component(name="kd240_ecat_platform")
status = platform.build()

vitis.dispose()

