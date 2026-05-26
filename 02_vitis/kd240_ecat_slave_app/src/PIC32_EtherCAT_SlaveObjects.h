/*
* This source file is part of the EtherCAT Slave Stack Code licensed by Beckhoff Automation GmbH & Co KG, 33415 Verl, Germany.
* The corresponding license agreement applies. This hint shall not be removed.
*/

/**
* \addtogroup PIC32_EtherCAT_Slave PIC32_EtherCAT_Slave
* @{
*/

/**
\file PIC32_EtherCAT_SlaveObjects
\author ET9300Utilities.ApplicationHandler (Version 1.6.4.0) | EthercatSSC@beckhoff.com

\brief PIC32_EtherCAT_Slave specific objects<br>
\brief NOTE : This file will be overwritten if a new object dictionary is generated!<br>
*/

#if defined(_PIC32__ETHER_CAT__SLAVE_) && (_PIC32__ETHER_CAT__SLAVE_ == 1)
#define PROTO
#else
#define PROTO extern
#endif
// /******************************************************************************
// *                    Object 0x1600 : Setpoint Values process data mapping
// ******************************************************************************/
// /**
// * \addtogroup 0x1600 0x1600 | Setpoint Values process data mapping
// * @{
// * \brief Object 0x1600 (Setpoint Values process data mapping) definition
// */
// #ifdef _OBJD_
// /**
// * \brief Object entry descriptions<br>
// * <br>
// * SubIndex 0<br>
// * SubIndex 1 - Reference to 0x7000.1<br>
// */
// OBJCONST TSDOINFOENTRYDESC    OBJMEM asEntryDesc0x1600[] = {
// { DEFTYPE_UNSIGNED8 , 0x8 , ACCESS_READ },
// { DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ }}; /* Subindex1 - Reference to 0x7000.1 */

// /**
// * \brief Object/Entry names
// */
// OBJCONST UCHAR OBJMEM aName0x1600[] = "Setpoint Values process data mapping\000"
// "SubIndex 001\000\377";
// #endif //#ifdef _OBJD_

// #ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_
// /**
// * \brief Object structure
// */
// typedef struct OBJ_STRUCT_PACKED_START {
// UINT16 u16SubIndex0;
// UINT32 SI1; /* Subindex1 - Reference to 0x7000.1 */
// } OBJ_STRUCT_PACKED_END
// TOBJ1600;
// #endif //#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_

// /**
// * \brief Object variable
// */
// PROTO TOBJ1600 SetpointValuesProcessDataMapping0x1600
// #if defined(_PIC32__ETHER_CAT__SLAVE_) && (_PIC32__ETHER_CAT__SLAVE_ == 1)
// ={1,0x70000110}
// #endif
// ;
// /** @}*/

/******************************************************************************
*                    Object 0x1600 : Heater Control process data mapping
******************************************************************************/
/**
* \addtogroup 0x1600 0x1600 | Heater Control process data mapping
* @{
* \brief Object 0x1600 (Heater Control process data mapping) definition
*/
#ifdef _OBJD_
/**
* \brief Object entry descriptions<br>
* <br>
* SubIndex 0<br>
* SubIndex 1 - Reference to 0x7000.1 ControlWord<br>
* SubIndex 2 - Reference to 0x7000.2 TargetTempRaw<br>
* SubIndex 3 - Reference to 0x7000.3 KpRaw<br>
* SubIndex 4 - Reference to 0x7000.4 KiRaw<br>
*/
OBJCONST TSDOINFOENTRYDESC OBJMEM asEntryDesc0x1600[] = {
{ DEFTYPE_UNSIGNED8  , 0x08 , ACCESS_READ },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ }}; 

/**
* \brief Object/Entry names
*/
OBJCONST UCHAR OBJMEM aName0x1600[] = "Heater Control process data mapping\000"
"ControlWord\000"
"TargetTempRaw\000"
"KpRaw\000"
"KiRaw\000\377";
#endif //#ifdef _OBJD_

#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_
/**
* \brief Object structure
*/
typedef struct OBJ_STRUCT_PACKED_START {
UINT16 u16SubIndex0;
UINT32 SI1; /* 0x7000.1 ControlWord   UINT16 */
UINT32 SI2; /* 0x7000.2 TargetTempRaw UINT32 */
UINT32 SI3; /* 0x7000.3 KpRaw         UINT32 */
UINT32 SI4; /* 0x7000.4 KiRaw         UINT32 */
} OBJ_STRUCT_PACKED_END
TOBJ1600;
#endif //#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_

/**
* \brief Object variable
*/
PROTO TOBJ1600 SetpointValuesProcessDataMapping0x1600
#if defined(_PIC32__ETHER_CAT__SLAVE_) && (_PIC32__ETHER_CAT__SLAVE_ == 1)
={4,0x70000110,0x70000220,0x70000320,0x70000420}
#endif
;
/** @}*/


// /******************************************************************************
// *                    Object 0x1A00 : Results process data mapping
// ******************************************************************************/
// /**
// * \addtogroup 0x1A00 0x1A00 | Results process data mapping
// * @{
// * \brief Object 0x1A00 (Results process data mapping) definition
// */
// #ifdef _OBJD_
// /**
// * \brief Object entry descriptions<br>
// * <br>
// * SubIndex 0<br>
// * SubIndex 1 - Reference to 0x6000.1<br>
// */
// OBJCONST TSDOINFOENTRYDESC    OBJMEM asEntryDesc0x1A00[] = {
// { DEFTYPE_UNSIGNED8 , 0x8 , ACCESS_READ },
// { DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ }}; /* Subindex1 - Reference to 0x6000.1 */

// /**
// * \brief Object/Entry names
// */
// OBJCONST UCHAR OBJMEM aName0x1A00[] = "Results process data mapping\000"
// "SubIndex 001\000\377";
// #endif //#ifdef _OBJD_

// #ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_
// /**
// * \brief Object structure
// */
// typedef struct OBJ_STRUCT_PACKED_START {
// UINT16 u16SubIndex0;
// UINT32 SI1; /* Subindex1 - Reference to 0x6000.1 */
// } OBJ_STRUCT_PACKED_END
// TOBJ1A00;
// #endif //#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_

// /**
// * \brief Object variable
// */
// PROTO TOBJ1A00 ResultsProcessDataMapping0x1A00
// #if defined(_PIC32__ETHER_CAT__SLAVE_) && (_PIC32__ETHER_CAT__SLAVE_ == 1)
// ={1,0x60000110}
// #endif
// ;
// /** @}*/

/******************************************************************************
*                    Object 0x1A00 : Heater Status process data mapping
******************************************************************************/
/**
* \addtogroup 0x1A00 0x1A00 | Heater Status process data mapping
* @{
* \brief Object 0x1A00 (Heater Status process data mapping) definition
*/
#ifdef _OBJD_
/**
* \brief Object entry descriptions<br>
* <br>
* SubIndex 0<br>
* SubIndex 1 - Reference to 0x6000.1 StatusWord<br>
* SubIndex 2 - Reference to 0x6000.2 State<br>
* SubIndex 3 - Reference to 0x6000.3 CurrentTempRaw<br>
* SubIndex 4 - Reference to 0x6000.4 ErrorRaw<br>
* SubIndex 5 - Reference to 0x6000.5 UCtrlRaw<br>
* SubIndex 6 - Reference to 0x6000.6 DutyCnt<br>
*/
OBJCONST TSDOINFOENTRYDESC OBJMEM asEntryDesc0x1A00[] = {
{ DEFTYPE_UNSIGNED8  , 0x08 , ACCESS_READ },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ }};

/**
* \brief Object/Entry names
*/
OBJCONST UCHAR OBJMEM aName0x1A00[] = "Heater Status process data mapping\000"
"StatusWord\000"
"State\000"
"CurrentTempRaw\000"
"ErrorRaw\000"
"UCtrlRaw\000"
"DutyCnt\000\377";
#endif //#ifdef _OBJD_

#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_
/**
* \brief Object structure
*/
typedef struct OBJ_STRUCT_PACKED_START {
UINT16 u16SubIndex0;
UINT32 SI1; /* 0x6000.1 StatusWord     UINT16 */
UINT32 SI2; /* 0x6000.2 State          UINT16 */
UINT32 SI3; /* 0x6000.3 CurrentTempRaw UINT32 */
UINT32 SI4; /* 0x6000.4 ErrorRaw       UINT32 */
UINT32 SI5; /* 0x6000.5 UCtrlRaw       UINT32 */
UINT32 SI6; /* 0x6000.6 DutyCnt        UINT32 */
} OBJ_STRUCT_PACKED_END
TOBJ1A00;
#endif //#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_

/**
* \brief Object variable
*/
PROTO TOBJ1A00 ResultsProcessDataMapping0x1A00
#if defined(_PIC32__ETHER_CAT__SLAVE_) && (_PIC32__ETHER_CAT__SLAVE_ == 1)
={6,0x60000110,0x60000210,0x60000320,0x60000420,0x60000520,0x60000620}
#endif
;
/** @}*/


/******************************************************************************
*                    Object 0x1C12 : SyncManager 2 assignment
******************************************************************************/
/**
* \addtogroup 0x1C12 0x1C12 | SyncManager 2 assignment
* @{
* \brief Object 0x1C12 (SyncManager 2 assignment) definition
*/
#ifdef _OBJD_
/**
* \brief Entry descriptions<br>
* 
* Subindex 0<br>
* Subindex 1 - n (the same entry description is used)<br>
*/
OBJCONST TSDOINFOENTRYDESC    OBJMEM asEntryDesc0x1C12[] = {
{ DEFTYPE_UNSIGNED8 , 0x8 , ACCESS_READ },
{ DEFTYPE_UNSIGNED16 , 0x10 , ACCESS_READ }};

/**
* \brief Object name definition<br>
* For Subindex 1 to n the syntax 'Subindex XXX' is used
*/
OBJCONST UCHAR OBJMEM aName0x1C12[] = "SyncManager 2 assignment\000\377";
#endif //#ifdef _OBJD_

#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_
/**
* \brief Object structure
*/
typedef struct OBJ_STRUCT_PACKED_START {
UINT16   u16SubIndex0;  /**< \brief Subindex 0 */
UINT16 aEntries[1];  /**< \brief Subindex 1 - 1 */
} OBJ_STRUCT_PACKED_END
TOBJ1C12;
#endif //#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_

/**
* \brief Object variable
*/
PROTO TOBJ1C12 sRxPDOassign
#if defined(_PIC32__ETHER_CAT__SLAVE_) && (_PIC32__ETHER_CAT__SLAVE_ == 1)
={1,{0x1600}}
#endif
;
/** @}*/



/******************************************************************************
*                    Object 0x1C13 : SyncManager 3 assignment
******************************************************************************/
/**
* \addtogroup 0x1C13 0x1C13 | SyncManager 3 assignment
* @{
* \brief Object 0x1C13 (SyncManager 3 assignment) definition
*/
#ifdef _OBJD_
/**
* \brief Entry descriptions<br>
* 
* Subindex 0<br>
* Subindex 1 - n (the same entry description is used)<br>
*/
OBJCONST TSDOINFOENTRYDESC    OBJMEM asEntryDesc0x1C13[] = {
{ DEFTYPE_UNSIGNED8 , 0x8 , ACCESS_READ },
{ DEFTYPE_UNSIGNED16 , 0x10 , ACCESS_READ }};

/**
* \brief Object name definition<br>
* For Subindex 1 to n the syntax 'Subindex XXX' is used
*/
OBJCONST UCHAR OBJMEM aName0x1C13[] = "SyncManager 3 assignment\000\377";
#endif //#ifdef _OBJD_

#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_
/**
* \brief Object structure
*/
typedef struct OBJ_STRUCT_PACKED_START {
UINT16   u16SubIndex0;  /**< \brief Subindex 0 */
UINT16 aEntries[1];  /**< \brief Subindex 1 - 1 */
} OBJ_STRUCT_PACKED_END
TOBJ1C13;
#endif //#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_

/**
* \brief Object variable
*/
PROTO TOBJ1C13 sTxPDOassign
#if defined(_PIC32__ETHER_CAT__SLAVE_) && (_PIC32__ETHER_CAT__SLAVE_ == 1)
={1,{0x1A00}}
#endif
;
/** @}*/



// /******************************************************************************
// *                    Object 0x6000 : Results
// ******************************************************************************/
// /**
// * \addtogroup 0x6000 0x6000 | Results
// * @{
// * \brief Object 0x6000 (Results) definition
// */
// #ifdef _OBJD_
// /**
// * \brief Object entry descriptions<br>
// * <br>
// * SubIndex 0<br>
// * SubIndex 1 - Results 1<br>
// */
// OBJCONST TSDOINFOENTRYDESC    OBJMEM asEntryDesc0x6000[] = {
// { DEFTYPE_UNSIGNED8 , 0x8 , ACCESS_READ },
// { DEFTYPE_UNSIGNED16 , 0x10 , ACCESS_READ | OBJACCESS_TXPDOMAPPING }}; /* Subindex1 - Results 1 */

// /**
// * \brief Object/Entry names
// */
// OBJCONST UCHAR OBJMEM aName0x6000[] = "Results\000"
// "Results 1\000\377";
// #endif //#ifdef _OBJD_

// #ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_
// /**
// * \brief Object structure
// */
// typedef struct OBJ_STRUCT_PACKED_START {
// UINT16 u16SubIndex0;
// UINT16 Results1; /* Subindex1 - Results 1 */
// } OBJ_STRUCT_PACKED_END
// TOBJ6000;
// #endif //#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_

// /**
// * \brief Object variable
// */
// PROTO TOBJ6000 Results0x6000
// #if defined(_PIC32__ETHER_CAT__SLAVE_) && (_PIC32__ETHER_CAT__SLAVE_ == 1)
// ={1,0}
// #endif
// ;
// /** @}*/

/******************************************************************************
*                    Object 0x6000 : Heater Status
******************************************************************************/
/**
* \addtogroup 0x6000 0x6000 | Heater Status
* @{
* \brief Object 0x6000 (Heater Status) definition
*/
#ifdef _OBJD_
/**
* \brief Object entry descriptions<br>
* <br>
* SubIndex 0<br>
* SubIndex 1 - StatusWord<br>
* SubIndex 2 - State<br>
* SubIndex 3 - CurrentTempRaw<br>
* SubIndex 4 - ErrorRaw<br>
* SubIndex 5 - UCtrlRaw<br>
* SubIndex 6 - DutyCnt<br>
*/
OBJCONST TSDOINFOENTRYDESC OBJMEM asEntryDesc0x6000[] = {
{ DEFTYPE_UNSIGNED8  , 0x08 , ACCESS_READ },
{ DEFTYPE_UNSIGNED16 , 0x10 , ACCESS_READ | OBJACCESS_TXPDOMAPPING },
{ DEFTYPE_UNSIGNED16 , 0x10 , ACCESS_READ | OBJACCESS_TXPDOMAPPING },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ | OBJACCESS_TXPDOMAPPING },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ | OBJACCESS_TXPDOMAPPING },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ | OBJACCESS_TXPDOMAPPING },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READ | OBJACCESS_TXPDOMAPPING }};

/**
* \brief Object/Entry names
*/
OBJCONST UCHAR OBJMEM aName0x6000[] = "Heater Status\000"
"StatusWord\000"
"State\000"
"CurrentTempRaw\000"
"ErrorRaw\000"
"UCtrlRaw\000"
"DutyCnt\000\377";
#endif //#ifdef _OBJD_

#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_
/**
* \brief Object structure
*/
typedef struct OBJ_STRUCT_PACKED_START {
UINT16 u16SubIndex0;
UINT16 StatusWord;     /* Subindex1 - StatusWord */
UINT16 State;          /* Subindex2 - State */
UINT32 CurrentTempRaw; /* Subindex3 - CurrentTempRaw */
UINT32 ErrorRaw;       /* Subindex4 - ErrorRaw */
UINT32 UCtrlRaw;       /* Subindex5 - UCtrlRaw */
UINT32 DutyCnt;        /* Subindex6 - DutyCnt */
} OBJ_STRUCT_PACKED_END
TOBJ6000;
#endif //#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_

/**
* \brief Object variable
*/
PROTO TOBJ6000 Results0x6000
#if defined(_PIC32__ETHER_CAT__SLAVE_) && (_PIC32__ETHER_CAT__SLAVE_ == 1)
={6,0,0,0,0,0,0}
#endif
;
/** @}*/


// /******************************************************************************
// *                    Object 0x7000 : Setpoint Values
// ******************************************************************************/
// /**
// * \addtogroup 0x7000 0x7000 | Setpoint Values
// * @{
// * \brief Object 0x7000 (Setpoint Values) definition
// */
// #ifdef _OBJD_
// /**
// * \brief Object entry descriptions<br>
// * <br>
// * SubIndex 0<br>
// * SubIndex 1 - Value 1<br>
// */
// OBJCONST TSDOINFOENTRYDESC    OBJMEM asEntryDesc0x7000[] = {
// { DEFTYPE_UNSIGNED8 , 0x8 , ACCESS_READ },
// { DEFTYPE_UNSIGNED16 , 0x10 , ACCESS_READWRITE | OBJACCESS_RXPDOMAPPING }}; /* Subindex1 - Value 1 */

// /**
// * \brief Object/Entry names
// */
// OBJCONST UCHAR OBJMEM aName0x7000[] = "Setpoint Values\000"
// "Value 1\000\377";
// #endif //#ifdef _OBJD_

// #ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_
// /**
// * \brief Object structure
// */
// typedef struct OBJ_STRUCT_PACKED_START {
// UINT16 u16SubIndex0;
// UINT16 Value1; /* Subindex1 - Value 1 */
// } OBJ_STRUCT_PACKED_END
// TOBJ7000;
// #endif //#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_

// /**
// * \brief Object variable
// */
// PROTO TOBJ7000 SetpointValues0x7000
// #if defined(_PIC32__ETHER_CAT__SLAVE_) && (_PIC32__ETHER_CAT__SLAVE_ == 1)
// ={1,0}
// #endif
// ;
// /** @}*/

/******************************************************************************
*                    Object 0x7000 : Heater Control
******************************************************************************/
/**
* \addtogroup 0x7000 0x7000 | Heater Control
* @{
* \brief Object 0x7000 (Heater Control) definition
*/
#ifdef _OBJD_
/**
* \brief Object entry descriptions<br>
* <br>
* SubIndex 0<br>
* SubIndex 1 - ControlWord<br>
* SubIndex 2 - TargetTempRaw<br>
* SubIndex 3 - KpRaw<br>
* SubIndex 4 - KiRaw<br>
*/
OBJCONST TSDOINFOENTRYDESC OBJMEM asEntryDesc0x7000[] = {
{ DEFTYPE_UNSIGNED8  , 0x08 , ACCESS_READ },
{ DEFTYPE_UNSIGNED16 , 0x10 , ACCESS_READWRITE | OBJACCESS_RXPDOMAPPING },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READWRITE | OBJACCESS_RXPDOMAPPING },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READWRITE | OBJACCESS_RXPDOMAPPING },
{ DEFTYPE_UNSIGNED32 , 0x20 , ACCESS_READWRITE | OBJACCESS_RXPDOMAPPING }};

/**
* \brief Object/Entry names
*/
OBJCONST UCHAR OBJMEM aName0x7000[] = "Heater Control\000"
"ControlWord\000"
"TargetTempRaw\000"
"KpRaw\000"
"KiRaw\000\377";
#endif //#ifdef _OBJD_

#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_
/**
* \brief Object structure
*/
typedef struct OBJ_STRUCT_PACKED_START {
UINT16 u16SubIndex0;
UINT16 ControlWord;   /* Subindex1 - ControlWord */
UINT32 TargetTempRaw; /* Subindex2 - TargetTempRaw */
UINT32 KpRaw;         /* Subindex3 - KpRaw */
UINT32 KiRaw;         /* Subindex4 - KiRaw */
} OBJ_STRUCT_PACKED_END
TOBJ7000;
#endif //#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_

/**
* \brief Object variable
*/
PROTO TOBJ7000 SetpointValues0x7000
#if defined(_PIC32__ETHER_CAT__SLAVE_) && (_PIC32__ETHER_CAT__SLAVE_ == 1)
={4,0,0,0,0}
#endif
;
/** @}*/


/******************************************************************************
*                    Object 0x8000 : Parameters
******************************************************************************/
/**
* \addtogroup 0x8000 0x8000 | Parameters
* @{
* \brief Object 0x8000 (Parameters) definition
*/
#ifdef _OBJD_
/**
* \brief Object entry descriptions<br>
* <br>
* SubIndex 0<br>
* SubIndex 1 - Inc 1<br>
*/
OBJCONST TSDOINFOENTRYDESC    OBJMEM asEntryDesc0x8000[] = {
{ DEFTYPE_UNSIGNED8 , 0x8 , ACCESS_READ },
{ DEFTYPE_INTEGER16 , 0x10 , ACCESS_READWRITE }}; /* Subindex1 - Inc 1 */

/**
* \brief Object/Entry names
*/
OBJCONST UCHAR OBJMEM aName0x8000[] = "Parameters\000"
"Inc 1\000\377";
#endif //#ifdef _OBJD_

#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_
/**
* \brief Object structure
*/
typedef struct OBJ_STRUCT_PACKED_START {
UINT16 u16SubIndex0;
INT16 Inc1; /* Subindex1 - Inc 1 */
} OBJ_STRUCT_PACKED_END
TOBJ8000;
#endif //#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_

/**
* \brief Object variable
*/
PROTO TOBJ8000 Parameters0x8000
#if defined(_PIC32__ETHER_CAT__SLAVE_) && (_PIC32__ETHER_CAT__SLAVE_ == 1)
={1,0}
#endif
;
/** @}*/



/******************************************************************************
*                    Object 0xF000 : Modular Device Profile
******************************************************************************/
/**
* \addtogroup 0xF000 0xF000 | Modular Device Profile
* @{
* \brief Object 0xF000 (Modular Device Profile) definition
*/
#ifdef _OBJD_
/**
* \brief Object entry descriptions<br>
* <br>
* SubIndex 0<br>
* SubIndex 1 - Index distance <br>
* SubIndex 2 - Maximum number of modules <br>
*/
OBJCONST TSDOINFOENTRYDESC    OBJMEM asEntryDesc0xF000[] = {
{ DEFTYPE_UNSIGNED8 , 0x8 , ACCESS_READ },
{ DEFTYPE_UNSIGNED16 , 0x10 , ACCESS_READ }, /* Subindex1 - Index distance  */
{ DEFTYPE_UNSIGNED16 , 0x10 , ACCESS_READ }}; /* Subindex2 - Maximum number of modules  */

/**
* \brief Object/Entry names
*/
OBJCONST UCHAR OBJMEM aName0xF000[] = "Modular Device Profile\000"
"Index distance \000"
"Maximum number of modules \000\377";
#endif //#ifdef _OBJD_

#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_
/**
* \brief Object structure
*/
typedef struct OBJ_STRUCT_PACKED_START {
UINT16 u16SubIndex0;
UINT16 IndexDistance; /* Subindex1 - Index distance  */
UINT16 MaximumNumberOfModules; /* Subindex2 - Maximum number of modules  */
} OBJ_STRUCT_PACKED_END
TOBJF000;
#endif //#ifndef _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_

/**
* \brief Object variable
*/
PROTO TOBJF000 ModularDeviceProfile0xF000
#if defined(_PIC32__ETHER_CAT__SLAVE_) && (_PIC32__ETHER_CAT__SLAVE_ == 1)
={2,0x0010,0}
#endif
;
/** @}*/







#ifdef _OBJD_
TOBJECT    OBJMEM ApplicationObjDic[] = {
// /* Object 0x1600 */
// {NULL , NULL ,  0x1600 , {DEFTYPE_PDOMAPPING , 1 | (OBJCODE_REC << 8)} , asEntryDesc0x1600 , aName0x1600 , &SetpointValuesProcessDataMapping0x1600 , NULL , NULL , 0x0000 },
// /* Object 0x1A00 */
// {NULL , NULL ,  0x1A00 , {DEFTYPE_PDOMAPPING , 1 | (OBJCODE_REC << 8)} , asEntryDesc0x1A00 , aName0x1A00 , &ResultsProcessDataMapping0x1A00 , NULL , NULL , 0x0000 },
// /* Object 0x1C12 */
// {NULL , NULL ,  0x1C12 , {DEFTYPE_UNSIGNED16 , 1 | (OBJCODE_ARR << 8)} , asEntryDesc0x1C12 , aName0x1C12 , &sRxPDOassign , NULL , NULL , 0x0000 },
// /* Object 0x1C13 */
// {NULL , NULL ,  0x1C13 , {DEFTYPE_UNSIGNED16 , 1 | (OBJCODE_ARR << 8)} , asEntryDesc0x1C13 , aName0x1C13 , &sTxPDOassign , NULL , NULL , 0x0000 },
// /* Object 0x6000 */
// {NULL , NULL ,  0x6000 , {DEFTYPE_RECORD , 1 | (OBJCODE_REC << 8)} , asEntryDesc0x6000 , aName0x6000 , &Results0x6000 , NULL , NULL , 0x0000 },
// /* Object 0x7000 */
// {NULL , NULL ,  0x7000 , {DEFTYPE_RECORD , 1 | (OBJCODE_REC << 8)} , asEntryDesc0x7000 , aName0x7000 , &SetpointValues0x7000 , NULL , NULL , 0x0000 },
/* Object 0x1600 */
{NULL , NULL ,  0x1600 , {DEFTYPE_PDOMAPPING , 4 | (OBJCODE_REC << 8)} , asEntryDesc0x1600 , aName0x1600 , &SetpointValuesProcessDataMapping0x1600 , NULL , NULL , 0x0000 },
/* Object 0x1A00 */
{NULL , NULL ,  0x1A00 , {DEFTYPE_PDOMAPPING , 6 | (OBJCODE_REC << 8)} , asEntryDesc0x1A00 , aName0x1A00 , &ResultsProcessDataMapping0x1A00 , NULL , NULL , 0x0000 },
/* Object 0x1C12 */
{NULL , NULL ,  0x1C12 , {DEFTYPE_UNSIGNED16 , 1 | (OBJCODE_ARR << 8)} , asEntryDesc0x1C12 , aName0x1C12 , &sRxPDOassign , NULL , NULL , 0x0000 },
/* Object 0x1C13 */
{NULL , NULL ,  0x1C13 , {DEFTYPE_UNSIGNED16 , 1 | (OBJCODE_ARR << 8)} , asEntryDesc0x1C13 , aName0x1C13 , &sTxPDOassign , NULL , NULL , 0x0000 },
/* Object 0x6000 */
{NULL , NULL ,  0x6000 , {DEFTYPE_RECORD , 6 | (OBJCODE_REC << 8)} , asEntryDesc0x6000 , aName0x6000 , &Results0x6000 , NULL , NULL , 0x0000 },
/* Object 0x7000 */
{NULL , NULL ,  0x7000 , {DEFTYPE_RECORD , 4 | (OBJCODE_REC << 8)} , asEntryDesc0x7000 , aName0x7000 , &SetpointValues0x7000 , NULL , NULL , 0x0000 },
/* Object 0x8000 */
{NULL , NULL ,  0x8000 , {DEFTYPE_RECORD , 1 | (OBJCODE_REC << 8)} , asEntryDesc0x8000 , aName0x8000 , &Parameters0x8000 , NULL , NULL , 0x0000 },
/* Object 0xF000 */
{NULL , NULL ,  0xF000 , {DEFTYPE_RECORD , 2 | (OBJCODE_REC << 8)} , asEntryDesc0xF000 , aName0xF000 , &ModularDeviceProfile0xF000 , NULL , NULL , 0x0000 },
{NULL,NULL, 0xFFFF, {0, 0}, NULL, NULL, NULL, NULL}};
#endif    //#ifdef _OBJD_

#undef PROTO

/** @}*/
#define _PIC32__ETHER_CAT__SLAVE_OBJECTS_H_
