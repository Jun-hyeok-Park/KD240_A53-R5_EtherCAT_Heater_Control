#*****************************************************************************#
#* FILE        : MotorStop.Py                                                *# 
#* DESCRIPTION : Sample to stop servo by four methods.                       *#
#*****************************************************************************#

#*****************************************************************************#
#* Import                                                                    *#
#*****************************************************************************#
from WMX3ApiPython import *
from time import *
from sys import *

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
    Wmx3Lib.SetDeviceName('MotorStop')
    
    # Start Communication.
    ret = Wmx3Lib.StartCommunication(INFINITE)

    # Set servo on.
    Wmx3Lib_cm.axisControl.SetServoOn(0, 1)
    while True:
        ret, CmStatus = Wmx3Lib_cm.GetStatus()
        if (CmStatus.GetAxesStatus(0).servoOn):
            break
        sleep(0.1)

    # Homing.
    homeParam          = Config_HomeParam()
    ret, homeParam = Wmx3Lib_cm.config.GetHomeParam(0)
    homeParam.homeType = Config_HomeType.CurrentPos
    Wmx3Lib_cm.config.SetHomeParam(0, homeParam)
    Wmx3Lib_cm.home.StartHome(0)
    Wmx3Lib_cm.motion.Wait(0)
    
    # Create a command value.
    jogCommand                          = Motion_JogCommand()
    jogCommand.profile.type             = ProfileType.Trapezoidal
    jogCommand.axis                     = 0
    jogCommand.profile.velocity         = 100000
    jogCommand.profile.acc              = 1000000
    jogCommand.profile.dec              = 1000000

    # Rotate the motor at the specified speed.
    Wmx3Lib_cm.motion.StartJog(jogCommand)

    # --------------------------------------------------------------------------
    # Select the method of Motors Stop.
    # --------------------------------------------------------------------------
    print('Please select the stop method.')
    print('1.Normal Stop')
    print('2.Certain time Stop(10ms)')
    print('3.Quick Stop')
    print('4.Deceleration Stop')
    print('else. Normal Stop')
    print('->')

    #---------------------------------------------------------------------------
    # Stop the axis that is operating with the "Stop" function.
    #---------------------------------------------------------------------------
    input_error = False
    while True:
        try:
            if input_error:
                print('->')
            input_error = False
            selectNum = int(input())
            break
        except:
            input_error = True
            continue
                    
        
    if selectNum == 2: # Certain time Stop(10ms)
        print('Certain time Stop(10ms).')
        Wmx3Lib_cm.motion.ExecTimedStop_TimeMilli(0, 10)
    elif selectNum == 3:
        print('Quick Stop')
        Wmx3Lib_cm.motion.ExecQuickStop(0)
    elif selectNum == 4:
        print('Deceleration Stop')
        Wmx3Lib_cm.motion.Stop_Dec(0, 1000000)
    else:
        print('Normal Stop')
        Wmx3Lib_cm.motion.Stop(0)
        
    
    # Wait until the axis stops.
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

