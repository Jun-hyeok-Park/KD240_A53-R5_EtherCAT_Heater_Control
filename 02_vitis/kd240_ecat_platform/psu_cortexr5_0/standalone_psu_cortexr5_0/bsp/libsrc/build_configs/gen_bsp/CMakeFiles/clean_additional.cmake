# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\Users\\user\\Desktop\\KD240\\02_vitis\\kd240_ecat_platform\\psu_cortexr5_0\\standalone_psu_cortexr5_0\\bsp\\include\\sleep.h"
  "C:\\Users\\user\\Desktop\\KD240\\02_vitis\\kd240_ecat_platform\\psu_cortexr5_0\\standalone_psu_cortexr5_0\\bsp\\include\\xiltimer.h"
  "C:\\Users\\user\\Desktop\\KD240\\02_vitis\\kd240_ecat_platform\\psu_cortexr5_0\\standalone_psu_cortexr5_0\\bsp\\include\\xtimer_config.h"
  "C:\\Users\\user\\Desktop\\KD240\\02_vitis\\kd240_ecat_platform\\psu_cortexr5_0\\standalone_psu_cortexr5_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
