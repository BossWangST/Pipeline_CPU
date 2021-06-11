onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib Inst_mem_1_opt

do {wave.do}

view wave
view structure
view signals

do {Inst_mem_1.udo}

run -all

quit -force
