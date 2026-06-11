#*****************************************************************************#
#* FILE        : JerkRatioMotion.Py                                          *# 
#* DESCRIPTION : Sample to change the jerk ratio and operate the servo.      *#
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
# Global valiables                                                            #
#*****************************************************************************#

    
#*****************************************************************************#
# Function                                                                    #
#*****************************************************************************#

#-----------------------------------------------------------------------------#
# Function    : main                                                          #
# Description : Main Function.                                                #
#-----------------------------------------------------------------------------#
def main():
    
    print('Program Start.')
    sleep(1)

    global Wmx3Lib
    global CmStatus
    global Wmx3Lib_cm

    Wmx3Lib    = WMX3Api()
    CmStatus   = CoreMotionStatus()
    Wmx3Lib_cm = CoreMotion(Wmx3Lib)

    Initialize()

    # --------------------------------------------------------------------------
    # Select the method of Motors Stop.
    # --------------------------------------------------------------------------
    print('select jerkratio.')
    print('1.jerkratio    :25  percent.')
    print('2.jerkratio    :50  percent.')
    print('3.jerkratio    :75  percent.')
    print('4.jerkratio    :100 percent.')
    print('else.jerkratio :25  percent.')
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

    if selectNum == 2:
        print('jerkratio:50 percent.')
        jerkRatio = 0.50
    elif selectNum == 3:
        print('jerkratio:75 percent.')
        jerkRatio = 0.75
    elif selectNum == 4:
        print('jerkratio:100 percent.')
        jerkRatio = 1.00
    else:
        print('jerkratio:25 percent.')
        jerkRatio = 0.25
        
    print('Motion Start!(Wait for enter key.)');

    # Create a command value.
    posCommand                          = Motion_PosCommand()
    posCommand.profile.type             = ProfileType.JerkLimited
    posCommand.axis                     = 0
    posCommand.target                   = 1000000
    posCommand.profile.velocity         = 100000
    posCommand.profile.startingVelocity = 0
    posCommand.profile.endVelocity      = 0
    posCommand.profile.acc              = 1000000
    posCommand.profile.dec              = 1000000
    posCommand.profile.jerkAcc          = 1000
    posCommand.profile.jerkAccRatio     = jerkRatio
    posCommand.profile.jerkDec          = 1000
    posCommand.profile.jerkDecRatio     = jerkRatio

    # Rotate the motor at the specified speed.
    Wmx3Lib_cm.motion.StartMov(posCommand)
    
    # Wait for enter key.
    input()

    # Stop specified axis.    
    Wmx3Lib_cm.motion.ExecQuickStop(0)
        
    Finalize()

    print('Program End.')
    sleep(3)
    return 0

#---------------------------------------------------------------------------#
# Function    : Initialize                                                  #
# Description : Device creation ~ Run until Homing.                         #
#---------------------------------------------------------------------------#
def Initialize():
    ret = 0
    
    # Create devices.
    Wmx3Lib.CreateDevice('C:\\Program Files\\SoftServo\\WMX3\\', DeviceType.DeviceTypeNormal, INFINITE)

    # Set Device Name.
    Wmx3Lib.SetDeviceName('JerkRatioMotion')
    
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
    homeParam = Config_HomeParam()
    ret, homeParam = Wmx3Lib_cm.config.GetHomeParam(0)
    homeParam.homeType = Config_HomeType.CurrentPos
    Wmx3Lib_cm.config.SetHomeParam(0, homeParam)
    Wmx3Lib_cm.home.StartHome(0)
    Wmx3Lib_cm.motion.Wait(0)
	
#---------------------------------------------------------------------------#
# Function    : Finalize                                                    #
# Description : It executes from servo OFF to device close.                 #
#---------------------------------------------------------------------------#
def Finalize():
    ret = 0
    
     # Set servo off.
    Wmx3Lib_cm.axisControl.SetServoOn(0, 0)
    while True:
        ret, CmStatus = Wmx3Lib_cm.GetStatus()
        if (not CmStatus.GetAxesStatus(0).servoOn):
            break
        sleep(0.1)
        
    # Stop Communication.
    Wmx3Lib.StopCommunication(INFINITE)
    
    # Close Device.
    Wmx3Lib.CloseDevice()
    
if __name__ == '__main__':
    main()

