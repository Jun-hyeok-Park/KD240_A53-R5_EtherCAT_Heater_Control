# KD240 EtherCAT Virtual Heater PI Controller

## 1. 프로젝트 개요

본 프로젝트는 **AMD Kria KD240 / K24 SOM 기반 EtherCAT Slave + R5 실시간 히터 제어 + Auto Tune 실험 구조**를 구현한 프로젝트이다.

전체 구조는 다음과 같이 역할을 분리한다.

```text
PC GUI / WMX3 EtherCAT Master
        ↓ EtherCAT
A53 Core
        - EtherCAT Slave Stack 실행
        - LAN9252 ESC 제어
        - RxPDO 수신
        - TxPDO 송신
        - R5와 Shared Memory로 명령/상태 교환
        - PC GUI/WMX3와 R5 제어 앱 사이의 Bridge 역할
        ↓ Shared Memory
R5 Core
        - 100 ms 제어 주기 생성
        - Shared Memory에서 A53 command 읽기
        - Heater PI 제어 수행
        - Auto Tune 수행
        - tuned K/L/T/Kp/Ki 계산
        - PL Heater AXI IP에 output 전달
        - Shared Memory status block에 상태 기록
        ↓ AXI
PL
        - Virtual Heater Plant
        - Heater AXI Register
        - PWM / Time Proportioning
        - Temperature / Duty / Fault Status 제공
```

핵심 설계 방향은 다음과 같다.

```text
A53 = EtherCAT 통신 및 Bridge 전용
R5  = 실시간 제어, Stable 판단, Auto Tune 전용
PL  = Heater I/O, Virtual Plant, PWM, Fault Interface 담당
GUI = WMX3 기반 제어/모니터링/분석 도구
```

---

## 2. 전체 시스템 아키텍처

```text
PC GUI v4.5
  │
  │ EtherCAT
  ▼
A53 EtherCAT Slave
  │
  ├─ LAN9252 ESC SPI/PDI Access
  ├─ EtherCAT SSC Stack
  ├─ RxPDO 14 byte parsing
  ├─ TxPDO 48 byte build
  └─ Shared Memory Bridge
        │
        ▼
R5 Heater Application
  │
  ├─ TTC6 100 ms Control Tick
  ├─ Heater PI Control
  ├─ Stable / Fault FSM
  ├─ Step Response Auto Tune
  └─ Status Update
        │
        ▼
PL Heater AXI IP
  │
  ├─ Virtual Heater Plant
  ├─ Sensor Delay / Noise
  ├─ PWM / Time Proportioning
  └─ Fault / Status Register
```

---

## 3. A53 프로젝트 구조

경로:

```text
KD240/02_vitis/kd240_ecat_slave_app/src
```

A53의 역할:

```text
- EtherCAT Slave Stack 실행
- LAN9252 ESC 제어
- RxPDO 수신
- TxPDO 송신
- R5와 Shared Memory로 명령/상태 교환
- PC GUI/WMX3와 R5 제어 앱 사이의 Bridge 역할
```

파일 구조:

```text
kd240_ecat_slave_app/src
│
├─ main.c                                A53 부팅, LAN9252 초기화, EtherCAT MainLoop 실행
│
├─ [EtherCAT SSC Stack]
│  ├─ ecatslv.c/h                        EtherCAT Slave State Machine 핵심
│  ├─ ecatappl.c/h                       Process Data 처리 흐름, APPL_InputMapping/OutputMapping 호출
│  ├─ ecatcoe.c/h                        CoE 통신 처리
│  ├─ coeappl.c/h                        CoE application layer
│  ├─ mailbox.c/h                        Mailbox 통신
│  ├─ objdef.c/h                         Object Dictionary 처리
│  ├─ sdoserv.c/h                        SDO server
│  ├─ emcy.c/h                           Emergency object 처리
│  ├─ ecat_def.h                         EtherCAT 기본 타입/상수
│  └─ applInterface.h                    Application interface 정의
│
├─ [LAN9252 / SPI / PDI Port]
│  ├─ 9252_HW.c/h                        EtherCAT Stack에서 LAN9252 ESC에 접근하는 HW abstraction
│  ├─ SPIDriver.c/h                      LAN9252 SPI 통신 드라이버
│  ├─ lan9252_spi.c/h                    KD240 환경용 LAN9252 SPI low-level 처리
│  └─ esc.h                              ESC 관련 정의
│
├─ [EtherCAT Application / PDO Mapping]
│  ├─ PIC32_EtherCAT_Slave.c             실제 RxPDO/TxPDO Mapping, R5 Shared Memory 연동
│  ├─ PIC32_EtherCAT_Slave.h             Application object 정의
│  └─ PIC32_EtherCAT_SlaveObjects.h      Object Dictionary / PDO object 정의
│
├─ [A53-R5 Shared Memory]
│  ├─ shared_memory.h                    A53/R5 공통 Shared Memory 구조체
│  └─ a53_shared_memory.c/h              A53 측 command write, status read API
│
├─ [A53 Test / Monitor]
│  ├─ a53_auto_tune_test.c/h             A53 내부 Auto Tune 테스트 시나리오
│  └─ a53_ecat_monitor.c/h               AL Status, AL Code 등 EtherCAT 상태 출력
│
└─ [Debug]
   ├─ ecat_debug.c/h                     A53 EtherCAT/Shared Memory debug macro
   └─ debug_log.h                        debug log 관련 보조 header
```

---

## 4. R5 프로젝트 구조

경로:

```text
KD240/02_vitis/r5_heater_axi_test/src
```

R5의 역할:

```text
- 100 ms 제어 주기 생성
- Shared Memory에서 A53 command 읽기
- Heater PI 제어 수행
- Auto Tune 수행
- tuned K/L/T/Kp/Ki 계산
- PL Heater AXI IP에 output 전달
- Shared Memory status block에 상태 기록
```

파일 구조:

```text
r5_heater_axi_test/src
│
├─ main.c                                R5 부팅, 초기화, main loop
│
├─ [R5 Heater Application]
│  └─ r5_heater_app.c/h                  R5 heater application 흐름 정리용 모듈
│
├─ [A53-R5 Shared Memory]
│  ├─ shared_memory.h                    A53/R5 공통 Shared Memory 구조체
│  └─ r5_shared_memory.c/h               R5 측 command read, status write API
│
├─ [Heater AXI Interface]
│  └─ heater_axi.c/h                     PL Heater AXI IP register read/write
│
├─ [Heater PI Control]
│  └─ heater_control.c/h                 PI 제어, stable 판단, state 관리
│
├─ [Auto Tune Control]
│  └─ auto_tune.c/h                      Step Response 기반 Auto Tune, FOPDT 모델 계산
│
├─ [Timer / Scheduler]
│  └─ r5_ttc_timer.c/h                   TTC6 기반 제어 tick 생성
│
└─ [Debug]
   ├─ uart_debug.c/h                     R5 UART debug 출력
   └─ debug_log.h                        debug log 관련 보조 header
```

---

## 5. PL 구조

PL은 현재 Virtual Heater 기반의 실험용 Heater AXI IP 구조이다.

```text
heater_core.sv
    ├── timer_gen.sv
    ├── system_fsm.sv
    ├── pi_controller.sv
    ├── virtual_plant.sv
    ├── sensor_delay_float.sv
    ├── sensor_noise_float.sv
    └── pwm_gen_float.sv
```

PL 역할:

```text
- R5가 쓰는 control output 수신
- Virtual Heater Plant 계산
- Current Temperature 제공
- PWM / Time Proportioning 출력 생성
- Fault / Status Register 제공
```

---

## 6. 주요 모듈 설명

### 6.1 LAN9252 / SPI / PDI Port

관련 파일:

```text
9252_HW.c/h
SPIDriver.c/h
lan9252_spi.c/h
esc.h
```

역할:

```text
A53 ↔ SPI ↔ LAN9252 ESC
```

설명:

- EtherCAT SSC Stack이 LAN9252 ESC 내부 register, DPRAM, mailbox, process data 영역에 접근할 수 있도록 만든 포팅 계층이다.
- KD240 환경에서는 `lan9252_spi.c/h`가 low-level SPI 접근을 담당한다.
- `9252_HW.c/h`는 SSC Stack에서 호출하는 hardware abstraction 역할을 한다.
- IRQ / SYNC 신호 처리는 LAN9252와 EtherCAT State 전환, DC Sync 처리에 사용된다.

### 6.2 EtherCAT SSC Stack

관련 파일:

```text
ecatslv.c/h
ecatappl.c/h
ecatcoe.c/h
coeappl.c/h
mailbox.c/h
objdef.c/h
sdoserv.c/h
emcy.c/h
ecat_def.h
applInterface.h
```

역할:

```text
EtherCAT Slave State Machine
Mailbox
CoE
SDO
PDO process data flow
```

설명:

- Beckhoff ET9300 SSC 기반 EtherCAT Slave Stack이다.
- `ecatslv.c/h`는 EtherCAT Slave State Machine 핵심이다.
- `ecatappl.c/h`는 process data 흐름을 관리하며, application layer의 `APPL_InputMapping()`과 `APPL_OutputMapping()`을 호출한다.
- `ecatcoe.c/h`, `coeappl.c/h`, `sdoserv.c/h`는 CoE/SDO 통신을 담당한다.
- 이 영역은 generated stack에 가까우므로, 기능 수정은 최소화하는 것이 좋다.

### 6.3 EtherCAT Application / PDO Mapping

관련 파일:

```text
PIC32_EtherCAT_Slave.c
PIC32_EtherCAT_Slave.h
PIC32_EtherCAT_SlaveObjects.h
```

역할:

```text
RxPDO 14 byte 수신
TxPDO 48 byte 송신
ControlWord 해석
R5 command 전달
R5 status를 TxPDO로 변환
```

주요 함수:

```text
APPL_OutputMapping()
- Master → Slave RxPDO 수신
- ControlWord / Target / Kp / Ki 해석
- A53_SharedMemory_SendRun()
- A53_SharedMemory_SendStop()
- A53_SharedMemory_SendAutoTuneStart()
- A53_SharedMemory_ApplyTunedGainAndRun()

APPL_InputMapping()
- R5 status block read
- StatusWord 생성
- State packing
- Current Temp / Error / Output / Duty / Tune result를 TxPDO로 전달
```

### 6.4 A53-R5 Shared Memory

관련 파일:

```text
shared_memory.h
a53_shared_memory.c/h
r5_shared_memory.c/h
```

역할:

```text
A53 → R5 Command 전달
R5 → A53 Status 전달
Cache-line 분리
Odd/Even Seqlock Snapshot 기반 데이터 무결성 보장
```

Command block:

```text
A53 → R5
- control_word
- target_temp
- kp
- ki
- auto_step_mv
- auto_noise_band
- auto_slope_band
- auto_max_time_ms
- a53_heartbeat
```

Status block:

```text
R5 → A53
- heater_state
- auto_tune_state
- current_temp
- error
- u_ctrl
- duty_count
- tune_K
- tune_L
- tune_T
- tune_kp
- tune_ki
- tuned_gain_valid
- r5_heartbeat
```

설계 포인트:

```text
- A53 command block과 R5 status block을 64-byte cache line 단위로 분리
- A53은 command block만 write
- R5는 status block만 write
- 전체 shared memory를 주기적으로 flush/invalidate하지 않음
- 각자 소유한 block에 대해서만 cache sync 수행
- multi-field 데이터는 odd/even sequence counter로 snapshot 검증
```

### 6.5 Heater AXI Interface

관련 파일:

```text
heater_axi.c/h
```

역할:

```text
R5 ↔ PL Heater AXI IP
```

담당 기능:

```text
- 현재 온도 읽기
- Duty count 읽기
- R5 제어 모드 설정
- Run enable/disable
- u_ctrl 출력 쓰기
- error/state 쓰기
```

### 6.6 Heater PI Control

관련 파일:

```text
heater_control.c/h
```

역할:

```text
PI 제어
Anti-Windup
Output Limit
Stable 판단
Fault 판단
Heater State 관리
```

Heater State:

```text
0: IDLE
1: RUN
2: STABLE
3: FAULT
4: AUTO_TUNE
```

Stable 진입 조건:

```text
|error| <= 1.0°C
|temp_slope| <= 0.10°C/s
0.02 < u_ctrl < 0.98
fault_active == 0
위 조건이 10초 유지
```

Stable 이탈 조건:

```text
|error| > 2.0°C
또는 fault_active != 0
위 조건이 3초 유지
```

PI 제어 구조:

```text
P = Kp * error
I[k] = I[k-1] + Ki * error * dt
u_ctrl = clamp(P + I, 0.0, 1.0)
```

Anti-Windup:

```text
- 출력이 포화되지 않았을 때 적분 허용
- 상한 포화 시 error가 출력을 낮추는 방향이면 적분 허용
- 하한 포화 시 error가 출력을 높이는 방향이면 적분 허용
```

### 6.7 Auto Tune Control

관련 파일:

```text
auto_tune.c/h
```

역할:

```text
Step Response 기반 Auto Tune
FOPDT 모델 식별
K, L, T 계산
tuned Kp, Ki 계산
```

Auto Tune State:

```text
0: IDLE
1: STABILIZE
2: STEP_TEST
3: CALCULATE
4: DONE
5: FAIL
6: ABORT
```

정상 흐름:

```text
IDLE
→ STABILIZE
→ STEP_TEST
→ CALCULATE
→ DONE
```

결과 파라미터:

```text
K       Process Gain
L       Dead Time
T       Time Constant
tune_kp Tuned proportional gain
tune_ki Tuned integral gain
```

### 6.8 R5 Heater Application

관련 파일:

```text
r5_heater_app.c/h
```

역할:

```text
R5 전체 제어 흐름 orchestration
```

주요 흐름:

```text
R5_HeaterApp_Step()
  ├─ A53 command read
  ├─ STOP 확인
  ├─ AUTO_TUNE_ABORT 확인
  ├─ AUTO_TUNE_START 확인
  ├─ AutoTune_IsRunning()이면 AutoTune_Update()
  ├─ RUN command이면 Heater_ControlStep()
  ├─ command 없으면 IDLE/OFF
  ├─ R5 status write
  └─ UART log 출력
```

명령 우선순위:

```text
1. STOP
2. AUTO_TUNE_ABORT
3. AUTO_TUNE_START
4. Auto Tune running
5. RUN
6. No command → IDLE/OFF
```

---

## 7. EtherCAT PDO 프로토콜

### 7.1 RxPDO: Master → Slave, 14 bytes

```text
Offset  Size  Type    Name
0       2     UINT16  ControlWord
2       4     FLOAT   Target Temp
6       4     FLOAT   Kp
10      4     FLOAT   Ki
```

ControlWord:

```text
0x0001  RUN
0x0002  STOP
0x0004  RESET
0x0008  AUTO_TUNE_START
0x0010  AUTO_TUNE_ABORT or APPLY_TUNED_GAIN depending mapping version
0x0020  APPLY_TUNED_GAIN in Shared Memory definition
```

주의:

```text
GUI / A53 / Shared Memory의 ControlWord bit 정의가 서로 일치해야 한다.
특히 APPLY_TUNED_GAIN bit는 GUI 버전과 A53 mapping 파일 기준으로 반드시 확인해야 한다.
```

### 7.2 TxPDO: Slave → Master, 48 bytes

```text
Offset  Size  Type    Name
0       2     UINT16  StatusWord
2       2     UINT16  State
4       4     FLOAT   Current Temp
8       4     FLOAT   Error
12      4     FLOAT   Controller Output
16      4     UINT32  Duty Count
20      4     FLOAT   Tune K
24      4     FLOAT   Tune L
28      4     FLOAT   Tune T
32      4     FLOAT   Tuned Kp
36      4     FLOAT   Tuned Ki
40      4     UINT32  Tuned Gain Valid
44      4     UINT32  Auto Tune Error
```

State packing:

```text
State low byte  = Heater State
State high byte = Auto Tune State
```

StatusWord:

```text
0x0001  RUN
0x0002  STABLE
0x0004  FAULT
0x0008  AUTO_TUNE
0x0010  AUTO_TUNE_DONE
0x0020  AUTO_TUNE_FAIL_OR_ABORT
0x0040  TUNED_GAIN_VALID
```

예시:

```text
0x0008 = Auto Tune 진행 중
0x0052 = STABLE + AUTO_TUNE_DONE + TUNED_GAIN_VALID
```

---

## 8. GUI v4.5

GUI는 다음 환경을 기준으로 한다.

```text
Windows
Python 3.6
Movensys WMX3 Python API
Tkinter
Matplotlib
```

GUI는 RxPDO 14 bytes와 TxPDO 48 bytes를 사용하며, Auto Tune 결과 표시, tuned gain 적용, recipe 저장/불러오기, CSV/PNG 저장, Control Quality Report 기능을 제공한다.

### 8.1 화면 구성

| 영역 | 설명 |
|---|---|
| Header | 프로그램 제목, RxPDO/TxPDO byte 정보, RUN/STOP/Auto Tune 지원 범위 표시 |
| Connection | Connect, Disconnect, connection status 표시 |
| Live Status / TxPDO | Heater State, Auto Tune State, StatusWord, Current Temp, Error, Controller Output, Duty, tuned result 표시 |
| Manual Control / RxPDO | Target Temp, Kp, Ki 입력. RESET/RUN/STOP/Send Params 버튼 |
| Auto Tune Control | Auto Tune Start, Copy Tuned Gain, Auto Copy & RUN 옵션 |
| Recipe | 현재 target/gain/tuned result를 JSON recipe로 저장/불러오기 |
| Live Trend | Target, Current Temp, Controller Output, Duty, Settling Band 그래프 |
| Graph Toolbar | Save CSV, Save PNG, Analyze, Clear Plot |
| Log Console | Tx/Rx PDO hex, status decode, command/event log, error traceback 표시 |

### 8.2 GUI 핵심 기능

| 기능 | 설명 | 관련 프로토콜 |
|---|---|---|
| Connect / Disconnect | WMX3 device 생성 및 I/O object 연결/해제 | WMX3 API |
| Read / Polling | TxPDO 48 bytes를 읽고 Live Status/Trend 갱신 | GetInBytes(INPUT_ADDR, 48) |
| RUN | 입력한 Target/Kp/Ki와 RUN bit를 RxPDO로 송신 | ControlWord 0x0001 |
| STOP | STOP pulse 송신 후 clear control | ControlWord 0x0002 |
| RESET | RESET pulse 송신 후 clear control | ControlWord 0x0004 |
| Send Params | Target/Kp/Ki만 갱신하거나 command 전송 없이 값 반영 | RxPDO payload |
| Auto Tune Start | Auto Tune start pulse 송신 | ControlWord 0x0008 |
| Copy Tuned Gain | tuned Kp/Ki를 manual gain 입력창에 복사 | GUI internal |
| Auto Copy & RUN | Auto Tune DONE + valid 시 tuned gain으로 자동 RUN | StatusWord DONE/VALID 확인 |
| Save CSV | 현재 trend 데이터를 CSV로 저장 | 로컬 파일 |
| Save PNG | 현재 trend 그래프를 PNG로 저장 | 로컬 파일 |
| Analyze | Control Quality Report 창 생성 | 로컬 분석 |
| Clear Plot | trend buffer 초기화 | GUI internal |
| Recipe Save/Load | target, manual gain, tuned gain, valid flag, result metadata JSON 저장/복원 | 로컬 JSON |

### 8.3 Analyze / Control Quality Report

Analyze 기능은 GUI trend 데이터를 기반으로 제어 품질을 분석하는 report 화면이다.

분석 기준:

```text
Analysis Range
- Latest RUN segment
- RUN 이후 구간 또는 사용자가 지정한 분석 구간

Overshoot Limit
- 기본 5°C

Final Error Limit
- 기본 1°C

Stable Band
- 기본 ±1°C

Saturation Limit
- 기본 20%
```

Report 주요 항목:

| 항목 | 의미 | 판정 |
|---|---|---|
| Stable Reached | R5 heater state가 STABLE에 도달했는지 | OK / NG |
| Time to STABLE | RUN 시작 후 STABLE까지 걸린 시간 | INFO |
| Settling Time | ±stable band 내에 들어간 뒤 유지된 시간 | INFO |
| Max Temp | 분석 구간 내 최대 온도 | INFO |
| Overshoot | 목표 온도 초과량 | OK / NG |
| Final Error Avg | 최종 구간 평균 오차 | OK / NG |
| Oscillation Count | 목표값 crossing 횟수 | INFO |
| Output Saturation | 제어 출력이 포화 영역에 머문 비율 | OK / NG |
| Fault Occurred | 분석 구간 중 fault 발생 여부 | OK / NG |

주의:

```text
Analyze 기능은 제어 튜닝 및 품질 확인용 보조 기능이다.
실제 PASS/CHECK 기준은 설비 요구사항과 공정 조건에 맞게 조정해야 한다.
```

### 8.4 GUI 상태 해석

| 표시 | 해석 |
|---|---|
| Heater State = IDLE | R5 heater output OFF |
| Heater State = RUN | PI 제어 수행 중 |
| Heater State = STABLE | stable 조건을 만족한 상태. 제어는 계속 유지 |
| Heater State = AUTO_TUNE | Auto Tune open-loop step test 또는 안정화 수행 중 |
| Auto Tune = DONE | Auto Tune 결과 K/L/T/Kp/Ki 계산 완료 |
| Tune Valid = 1 | tuned Kp/Ki를 적용할 수 있음 |
| StatusWord 0x0008 | AUTO_TUNE 진행 중 |
| StatusWord 0x0052 | STABLE + AUTO_TUNE_DONE + TUNED_GAIN_VALID |

---

## 9. State Machine 정리

### 9.1 Heater State Machine

```text
IDLE
  │ RUN command
  ▼
RUN
  │ stable condition 10초 유지
  ▼
STABLE
  │ unstable condition 3초 유지
  ▼
RUN
```

Fault 발생:

```text
IDLE / RUN / STABLE / AUTO_TUNE
  │ current_temp < 0°C or current_temp > 150°C
  ▼
FAULT
```

STOP 또는 command 없음:

```text
RUN / STABLE / AUTO_TUNE
  │ STOP or no command
  ▼
IDLE
```

### 9.2 Auto Tune State Machine

```text
IDLE
  │ AUTO_TUNE_START
  ▼
STABILIZE
  ▼
STEP_TEST
  ▼
CALCULATE
  ▼
DONE
```

Fail / Abort:

```text
STABILIZE / STEP_TEST / CALCULATE
  │ timeout / invalid parameter / small response
  ▼
FAIL

STABILIZE / STEP_TEST / CALCULATE
  │ AUTO_TUNE_ABORT
  ▼
ABORT
```

---

## 10. Build / Run 순서

권장 순서:

```text
1. Vivado hardware bitstream 생성
2. XSA export
3. Vitis platform update
4. R5 application build
5. A53 application build
6. KD240 programming
7. R5 실행
8. A53 실행
9. WMX3 EtherCAT Master communication start
10. GUI v4.5 Connect
11. RUN / Auto Tune / Apply Tuned Gain 테스트
```

---

## 11. 기본 테스트 시나리오

### 11.1 EtherCAT 2-byte Loopback 이후 확장 확인

```text
1. WMX3 Master에서 Slave OP 진입 확인
2. RxPDO 14 byte 전송 확인
3. TxPDO 48 byte 수신 확인
4. StatusWord / State decode 확인
```

### 11.2 PI RUN 테스트

```text
1. GUI Connect
2. Target Temp = 80°C
3. Kp/Ki 입력
4. RUN
5. Current Temp 상승 확인
6. RUN → STABLE 진입 확인
```

### 11.3 Auto Tune 테스트

```text
1. GUI Auto Tune Start
2. Heater State = AUTO_TUNE 확인
3. Auto Tune State = STABILIZE → STEP_TEST → CALCULATE → DONE 확인
4. K/L/T/Kp/Ki 표시 확인
5. Copy Tuned Gain 또는 Auto Copy & RUN
6. RUN → STABLE 확인
```

### 11.4 Analyze Report 테스트

```text
1. RUN 또는 Auto Tune 후 RUN 완료
2. Trend 데이터 축적
3. Analyze 클릭
4. Control Quality Report 확인
5. Overshoot / Final Error / Output Saturation / Fault 판정 확인
```
