#*****************************************************************************#
#* FILE        : CreateDevice.Py                                             *# 
#* DESCRIPTION :  Sample from Device Creation to Close.                      *#
#*****************************************************************************#

#*****************************************************************************#
#* Import                                                                    *#
#*****************************************************************************#
from WMX3ApiPython import *
from time import *

#*****************************************************************************#
#* Constants                                                                 *#
#*****************************************************************************#
INFINITE = int(0xFFFFFFFF)

#*****************************************************************************#
# Function                                                                    #
#*****************************************************************************#

#-----------------------------------------------------------------------------#
# Function    : main                                                          #
# Description : Main Function.                                                #
#-----------------------------------------------------------------------------#
def main():

    # When all the devices are done, the WMX3 engine will also terminate.	
    Device = WMX3Api()

    print('Program Start.')

    # Get DevicesInfo to determine the type of device currently created.
    devInfo = DevicesInfo()

    # Create device.
    Device.CreateDevice('C:\\Program Files\\SoftServo\\WMX3\\', DeviceType.DeviceTypeNormal, INFINITE)

    # Set Device Name.
    Device.SetDeviceName('device')

    # Get created device state.
    ret, devInfo = Device.GetAllDevices()

    # Display the acquired device.
    print('device Id : %02d Name: %s' % (devInfo.GetDevices(0).id, devInfo.GetDevices(0).name))

    # Pause.
    print('Enter Waiting')
    input()

    # Close Device.
    Device.CloseDevice()

    print('Program End.')
    sleep(3)
    return 0
    
if __name__ == '__main__':
    main()

