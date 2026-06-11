#*****************************************************************************#
#* FILE        : MotorStatus.Py                                              *# 
#* DESCRIPTION : Sample to acquire servo status.                             *#
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
    Wmx3Lib.SetDeviceName('MotorStatus')
    
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
    
    # Create a command value.
    posCommand                          = Motion_PosCommand()
    posCommand.profile.type             = ProfileType.Trapezoidal
    posCommand.axis                     = 0;
    posCommand.target                   = 1000000
    posCommand.profile.velocity         = 100000
    posCommand.profile.acc              = 1000000
    posCommand.profile.dec              = 1000000

    # Rotate the motor at the specified speed.
    Wmx3Lib_cm.motion.StartMov(posCommand)
  
    # Dump data.
    while True:
        print('1:status dump else: end')
        print('->')
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
            
        if (selectNum != 1):
            break

        #---------------------------------------------------------------------------
        # Dump information on specified axis.
        #---------------------------------------------------------------------------
        ret, CmStatus = Wmx3Lib_cm.GetStatus()
        cmAxis = CmStatus.GetAxesStatus(0)

        print(" 1.PosCmd    :%-11.3f" % cmAxis.posCmd);             # 1. PosCmd
        print(" 2.ActPos    :%-11.3f" % cmAxis.actualPos);          # 2. ActualPos
        print(" 3.ActVel    :%-11.3f" % cmAxis.actualVelocity);     # 3. ActualVelocity
        print(" 4.ActTrq    :%-11.3f" % cmAxis.actualTorque);       # 4. ActualTorque 
        print(" 5.AmpAlm    :%-3d"    % cmAxis.ampAlarm);           # 5. AmpAlarm
        print(" 6.AmpAlmCode:0x%05x"  % cmAxis.ampAlarmCode);       # 6. AmpAlarmCode 
        print(" 7.SrvOn     :%-3d"    % cmAxis.servoOn);            # 7. ServoOn
        print(" 8.HomeDone  :%-4d"    % cmAxis.homeDone);           # 8. HomeDone 
        print(" 9.InPos     :%-3d"    % cmAxis.inPos);              # 9. InPos
        print("10.NegLS     :%-3d"    % cmAxis.negativeLS);         # 10.negativeLS
        print("11.PosLS     :%-3d"    % cmAxis.positiveLS);         # 11.positiveLS
        print("12.HomeSw    :%-4d"    % cmAxis.homeSwitch);         # 12.homeSwitch
        print("13.OpState   :%s"      % OP_STATE(cmAxis.opState));  # 13.OperationState
        
    # Motor stop.
    Wmx3Lib_cm.motion.ExecQuickStop(0);
    
    # Wait until the axis stops.
    Wmx3Lib_cm.motion.Wait(0)

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

    print('Program End.')
    sleep(3)
    return 0

def OP_STATE(state):
    if state == OperationState.Idle:
        return "Idle"
    elif state == OperationState.Pos:
        return "Pos"
    elif state == OperationState.Jog:
        return "Jog"
    elif state == OperationState.Home:
        return "Home"
    elif state == OperationState.Sync:
        return "Sync"
    elif state == OperationState.GantryHome:
        return "GantryHome"
    elif state == OperationState.Stop:
        return "Stop"
    elif state == OperationState.Intpl:
        return "Intpl"
    elif state == OperationState.ConstLinearVelocity:
        return "ConstLinearVelocity"
    elif state == OperationState.Trq:
        return "Trq"
    elif state == OperationState.DirectControl:
        return "DirectControl"
    elif state == OperationState.PVT:
        return "PVT"
    elif state == OperationState.ECAM:
        return "ECAM"
    elif state == OperationState.SyncCatchUp:
        return "SyncCatchUp"
    elif state == OperationState.DancerControl:
        return "DancerControl"
    else:
        return ""
        
if __name__ == '__main__':
    main()

