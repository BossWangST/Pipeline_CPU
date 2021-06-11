onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib test_block_mem_opt

do {wave.do}

view wave
view structure
view signals

do {test_block_mem.udo}

run -all

quit -force
