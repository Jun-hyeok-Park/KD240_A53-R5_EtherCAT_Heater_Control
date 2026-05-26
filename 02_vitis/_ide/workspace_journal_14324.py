# 2026-05-14T13:26:41.158633700
import vitis

client = vitis.create_client()
client.set_workspace(path="02_vitis")

comp = client.get_component(name="kd240_ecat_slave_app")
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

