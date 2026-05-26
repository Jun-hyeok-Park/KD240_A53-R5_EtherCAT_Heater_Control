# 2026-05-20T13:35:08.721726200
import vitis

client = vitis.create_client()
client.set_workspace(path="02_vitis")

comp = client.get_component(name="kd240_ecat_slave_app")
comp.build()

comp = client.get_component(name="r5_heater_axi_test")
comp.build()

comp = client.get_component(name="kd240_ecat_slave_app")
comp.build()

comp.build()

comp.build()

comp.build()

comp = client.get_component(name="r5_heater_axi_test")
comp.build()

comp.build()

comp = client.get_component(name="kd240_ecat_slave_app")
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

comp = client.get_component(name="r5_heater_axi_test")
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

comp.build()

comp = client.get_component(name="kd240_ecat_slave_app")
comp.build()

comp.build()

vitis.dispose()

