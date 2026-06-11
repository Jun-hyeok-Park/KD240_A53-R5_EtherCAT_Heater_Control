#*****************************************************************************#
#* FILE        : MotorControl.Py                                             *# 
#* DESCRIPTION : Sample from Device Creation to Communication Establishment. *#
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
    ret        = 0
    
    print('Program Start.')
    sleep(1)

    # Create devices.
    Wmx3Lib.CreateDevice('C:\\Program Files\\SoftServo\\WMX3\\', DeviceType.DeviceTypeNormal, INFINITE)

    # Set Device Name.
    Wmx3Lib.SetDeviceName('MotorControl')
    
    # Start Communication.
    ret = Wmx3Lib.StartCommunication(INFINITE)

    # Set servo on.
    Wmx3Lib_cm.axisControl.SetServoOn(0, 1)
    while True:
        # GetStatus -> First return value : Error code, Second return value: CoreMotionStatus
        ret, CmStatus = Wmx3Lib_cm.GetStatus()
        if (CmStatus.GetAxesStatus(0).servoOn):
            break
        sleep(0.1)

    # Homing.
    homeParam = Config_HomeParam()
    ret, homeParam = Wmx3Lib_cm.config.GetHomeParam(0)
    homeParamError = Config_HomeParam()
    homeParam.homeType = Config_HomeType.CurrentPos

    # SetHomeParam -> First return value: Error code, Second return value: param error 
    ret, homeParamError = Wmx3Lib_cm.config.SetHomeParam(0, homeParam)
    
    Wmx3Lib_cm.home.StartHome(0)
    Wmx3Lib_cm.motion.Wait(0)
    
    # --------------------------------------------------------------------------
    # Create a command value.
    # --------------------------------------------------------------------------
    posCommand                          = Motion_PosCommand()
    posCommand.profile.type             = ProfileType.Trapezoidal
    posCommand.axis                     = 0;
    posCommand.target                   = 1000000
    posCommand.profile.velocity         = 100000
    posCommand.profile.acc              = 1000000
    posCommand.profile.dec              = 1000000

    # --------------------------------------------------------------------------
    # Execute command to move from current position to specified position.
    # --------------------------------------------------------------------------
    Wmx3Lib_cm.motion.StartMov(posCommand)

    # --------------------------------------------------------------------------
    # Wait until the axis moves to the target position and stops.
    # --------------------------------------------------------------------------
    Wmx3Lib_cm.motion.Wait(0)

    # Set servo off.
    Wmx3Lib_cm.axisControl.SetServoOn(0, 0)
    while True:
        ret, CmStatus = Wmx3Lib_cm.GetStatus()
        if (not CmStatus.GetAxesStatus(0).servoOn):
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

