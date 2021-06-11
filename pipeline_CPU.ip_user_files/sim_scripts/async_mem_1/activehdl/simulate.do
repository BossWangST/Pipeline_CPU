onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+async_mem_1 -L dist_mem_gen_v8_0_13 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.async_mem_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {async_mem_1.udo}

run -all

endsim

quit -force
