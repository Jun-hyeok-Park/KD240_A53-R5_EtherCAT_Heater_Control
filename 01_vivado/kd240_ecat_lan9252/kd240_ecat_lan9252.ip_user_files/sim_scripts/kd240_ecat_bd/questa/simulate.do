onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib kd240_ecat_bd_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {kd240_ecat_bd.udo}

run 1000ns

quit -force
