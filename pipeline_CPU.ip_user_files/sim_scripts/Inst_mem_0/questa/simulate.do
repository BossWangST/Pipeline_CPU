onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Inst_mem_0_opt

do {wave.do}

view wave
view structure
view signals

do {Inst_mem_0.udo}

run -all

quit -force
