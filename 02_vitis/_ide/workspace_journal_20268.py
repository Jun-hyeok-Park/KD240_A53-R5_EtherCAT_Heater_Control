# 2026-05-13T13:33:47.006918100
import vitis

client = vitis.create_client()
client.set_workspace(path="02_vitis")

comp = client.get_component(name="kd240_ecat_slave_app")
status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../../Z7-20/vitis_ws_sm_sync0/ethercat_lan9252_sm_sync0_app/src", files=["lan9252_spi.c", "lan9252_spi.h", "main.c"], dest_dir_in_cmp = "src", is_skip_copy_sources = False)

comp = client.get_component(name="kd240_ecat_slave_app")
comp.build()

platform = client.get_component(name="kd240_ecat_platform")
status = platform.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../07_export/kd240_ecat_bd_wrapper.xsa")

status = platform.build()

comp.build()

comp.build()

comp.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../07_export/kd240_ecat_bd_wrapper.xsa")

status = platform.build()

comp.build()

comp = client.get_component(name="kd240_ecat_slave_app")
status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../../Z7-20/vitis_ws_sm_sync0/ethercat_lan9252_sm_sync0_app/src", files=["9252_HW.c", "9252_HW.h", "SPIDriver.c", "SPIDriver.h"], dest_dir_in_cmp = "src", is_skip_copy_sources = False)

status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../../Z7-20/vitis_ws_sm_sync0/ethercat_lan9252_sm_sync0_app/src", files=["applInterface.h", "ecat_debug.c", "ecat_debug.h", "ecat_def.h", "ecatappl.h", "ecatslv.h", "esc.h", "objdef.h"], dest_dir_in_cmp = "src", is_skip_copy_sources = False)

comp = client.get_component(name="kd240_ecat_slave_app")
comp.build()

comp.build()

comp.build()

comp = client.get_component(name="kd240_ecat_slave_app")
status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../../Z7-20/vitis_ws_sm_sync0/ethercat_lan9252_sm_sync0_app/src", files=["coeappl.c", "ecatappl.c", "ecatcoe.c", "ecatslv.c", "emcy.c", "mailbox.c", "objdef.c", "PIC32_EtherCAT_Slave.c", "PIC32_EtherCAT_Slave.h", "PIC32_EtherCAT_SlaveObjects.h", "sdoserv.c"], dest_dir_in_cmp = "src", is_skip_copy_sources = False)

status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../../Z7-20/vitis_ws_sm_sync0/ethercat_lan9252_sm_sync0_app/src", files=["ecatcoe.h"], dest_dir_in_cmp = "src", is_skip_copy_sources = False)

status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../../Z7-20/vitis_ws_sm_sync0/ethercat_lan9252_sm_sync0_app/src", files=["mailbox.h"], dest_dir_in_cmp = "src", is_skip_copy_sources = False)

status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../../Z7-20/vitis_ws_sm_sync0/ethercat_lan9252_sm_sync0_app/src", files=["coeappl.h"], dest_dir_in_cmp = "src", is_skip_copy_sources = False)

status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../../Z7-20/vitis_ws_sm_sync0/ethercat_lan9252_sm_sync0_app/src", files=["sdoserv.h"], dest_dir_in_cmp = "src", is_skip_copy_sources = False)

comp = client.get_component(name="kd240_ecat_slave_app")
comp.build()

comp = client.get_component(name="kd240_ecat_slave_app")
status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../../Z7-20/vitis_ws_sm_sync0/ethercat_lan9252_sm_sync0_app/src", files=["emcy.h"], dest_dir_in_cmp = "src", is_skip_copy_sources = False)

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

comp.build()

comp.build()

comp.build()

vitis.dispose()

