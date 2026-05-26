# 2026-05-13T12:22:12.244055500
import vitis

client = vitis.create_client()
client.set_workspace(path="02_vitis")

platform = client.get_component(name="kd240_ecat_platform")
status = platform.build()

vitis.dispose()

