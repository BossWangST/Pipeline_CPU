// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Jun  1 21:58:02 2021
// Host        : LAPTOP-0FSA8U4L running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top Inst_mem_1 -prefix
//               Inst_mem_1_ Inst_mem_1_stub.v
// Design      : Inst_mem_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.2" *)
module Inst_mem_1(a, d, clk, we, spo)
/* synthesis syn_black_box black_box_pad_pin="a[7:0],d[7:0],clk,we,spo[7:0]" */;
  input [7:0]a;
  input [7:0]d;
  input clk;
  input we;
  output [7:0]spo;
endmodule
