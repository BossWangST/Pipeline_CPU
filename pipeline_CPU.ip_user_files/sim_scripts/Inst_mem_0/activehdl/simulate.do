onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Inst_mem_0 -L dist_mem_gen_v8_0_13 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Inst_mem_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {Inst_mem_0.udo}

run -all

endsim

quit -force
