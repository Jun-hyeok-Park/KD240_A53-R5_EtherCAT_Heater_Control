#*****************************************************************************#
#* FILE        : ControlIO.Py                                                *# 
#* DESCRIPTION : Sample to read / write IO.                                  *#
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
    
    Wmx3Lib    = WMX3Api()
    Wmx3Lib_Io = Io(Wmx3Lib)
    ret        = 0
    
    inDataList = []
    inData     = 0
    outData    = 0
    
    print('Program Start.')
    sleep(1)

    # Create devices.
    Wmx3Lib.CreateDevice('C:\\Program Files\\SoftServo\\WMX3\\', DeviceType.DeviceTypeNormal, INFINITE)

    # Set Device Name.
    Wmx3Lib.SetDeviceName('ControlIO')
    
    # Start Communication.
    ret = Wmx3Lib.StartCommunication(INFINITE)

    #------------------------------------------------------------------------#
    # Execute IO Function.                                                   #
    #------------------------------------------------------------------------#
    # Multi Byte Get Input Memory Read
    print('3 Byte Get Input Memory Read')
    ret, inDataList = Wmx3Lib_Io.GetInBytes(0x00, 3)

    # Multi Byte Set Output Memory Write
    print('3 Byte Set Output Memory Write')
    Wmx3Lib_Io.SetOutBytes(0x00, 3, [0xFF, 0xAA, 0xBB])

    # Multi Byte Get Output Memory Read
    print('3 Byte Get Output Memory Read')
    ret, outData = Wmx3Lib_Io.GetOutBytes(0x00, 3)

    # 1Byte Get Input Memory Read
    print('1Byte Get Input Memory Read')
    ret, inData = Wmx3Lib_Io.GetInByte(0x03)

    # 1Byte Set Output Memory Write
    print('1Byte Set Output Memory Write')
    Wmx3Lib_Io.SetOutByte(0x03, 0xFF)
    
    # 1Byte Get Output Memory Read
    print('1Byte Get Output Memory Read')
    ret, outData = Wmx3Lib_Io.GetOutByte(0x03)

    # 1Bit Get Input Memory Read
    print('1Bit Get Input Memory Read')
    ret, inData = Wmx3Lib_Io.GetInBit(0x04, 0x00)
    
    # 1Bit Set Output Memory Write
    print('1Bit Set Output Memory Write')
    Wmx3Lib_Io.SetOutBit(0x04, 0x00, 0x01)
    
    # 1Bit Get Output Memory Read
    print('1Bit Get Output Memory Read')
    ret, outData = Wmx3Lib_Io.GetOutBit(0x04, 0x00)
    
    print('Enter Waiting...')
    input()
    
    # Stop Communication.
    Wmx3Lib.StopCommunication(INFINITE)

    # Close Device.
    Wmx3Lib.CloseDevice()

    print('Program End.')
    sleep(3)
    return 0

if __name__ == '__main__':
    main()

