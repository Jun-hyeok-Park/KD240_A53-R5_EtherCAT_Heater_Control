#*****************************************************************************#
#* FILE        : GetApiCallError.Py                                          *# 
#* DESCRIPTION : Sample to intentionally generate an error and check the API *#
#*               error.                                                      *#
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
    CmStatus   = CoreMotionStatus()
    Wmx3Lib_cm = CoreMotion(Wmx3Lib)
    errString = ''
    
    print('Program Start.')
    sleep(1)

    # Create devices.
    Wmx3Lib.CreateDevice('C:\\Program Files\\SoftServo\\WMX3\\', DeviceType.DeviceTypeNormal, INFINITE)

    # Set Device Name.
    Wmx3Lib.SetDeviceName('device')

    # ------------------------------------------------------------------------
    # StartCommunication is not performed to intentionally generate an error.
    # ------------------------------------------------------------------------
    if not __debug__:
        # Start Communication.
        ret = Wmx3Lib.StartCommunication(INFINITE)
    
    # Confirm error when "Servo On" when communication is not possible.
    apiCallError = Wmx3Lib_cm.axisControl.SetServoOn(0, 1)
    if (apiCallError != None):
        errString = Wmx3Lib_cm.ErrorToString(apiCallError)

        print('SetServoOn Failed! %s' % errString)

        print('Discard the device after entering the key')
        input()

        Wmx3Lib.CloseDevice()
        print('Program End.')
        sleep(3)
        return 1

    print('Discard the device after entering the key')
    input()
    
    # Set servo off.
    Wmx3Lib_cm.axisControl.SetServoOn(0, 0)
    while True:
        apiCallError, CmStatus = Wmx3Lib_cm.GetStatus()
        if (CmStatus.GetAxesStatus(0).servoOn):
            break
        sleep(0.1)
        
    # ----------------------
    # Stop Communication.
    # ----------------------
    Wmx3Lib.StopCommunication(INFINITE)
    
    # Close Device.
    Wmx3Lib.CloseDevice()

    print('Program End.')
    sleep(3)
    return 0
    
if __name__ == '__main__':
    main()

