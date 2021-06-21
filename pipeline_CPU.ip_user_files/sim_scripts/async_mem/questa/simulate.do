onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib async_mem_opt

do {wave.do}

view wave
view structure
view signals

do {async_mem.udo}

run -all

quit -force
