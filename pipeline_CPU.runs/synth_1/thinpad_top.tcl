# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param tcl.collectionResultDisplayLimit 0
set_param chipscope.maxJobs 2
set_param xicom.use_bs_reader 1
set_msg_config  -id {DRC REQP-1582}  -string {{ERROR: [DRC REQP-1582] iobuf_io_loaded: IOBUF base_data_wire_IOBUF[1]_inst pin IO drives one or more invalid loads.}}  -suppress 
create_project -in_memory -part xc7a200tfbg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/University/CPU/pipeline_CPU/pipeline_CPU.cache/wt [current_project]
set_property parent.project_path D:/University/CPU/pipeline_CPU/pipeline_CPU.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/University/CPU/pipeline_CPU/pipeline_CPU.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/sim_coe/add_coe.coe
add_files D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/sim_coe/nop.coe
add_files {{D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/sim_coe/add_coe copy.coe}}
add_files D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/sim_coe/pipelinetest.coe
add_files D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/sim_coe/hazards_test.coe
add_files D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/sim_coe/loop_test.coe
add_files {{D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/sim_coe/load_use test.coe}}
add_files D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/sim_coe/shift_test.coe
add_files D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/sim_coe/lb_test.coe
add_files D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/sim_coe/store_forward_test.coe
add_files D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/sim_coe/lab1.coe
add_files {{D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/sim_coe/lab1 copy.coe}}
read_verilog -library xil_defaultlib {
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/ALU.v
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/Control.v
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/D_Trigger.v
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/DataRoad.v
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/Forward_detect.v
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/Mem.v
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/PC.v
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/Registers.v
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/SingleCycle.v
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/adder.v
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/base_sram_control.v
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/branch_select.v
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/ext_sram_control.v
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/uart.v
  D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/new/thinpad_top.v
}
read_ip -quiet D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all d:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all d:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/constrs_1/new/thinpad_top.xdc
set_property used_in_implementation false [get_files D:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/constrs_1/new/thinpad_top.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top thinpad_top -part xc7a200tfbg676-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef thinpad_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file thinpad_top_utilization_synth.rpt -pb thinpad_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
