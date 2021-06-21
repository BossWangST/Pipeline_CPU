// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Jun 14 13:46:21 2021
// Host        : LAPTOP-0FSA8U4L running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/University/CPU/pipeline_CPU/pipeline_CPU.srcs/sources_1/ip/async_mem/async_mem_stub.v
// Design      : async_mem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2" *)
module async_mem(a, d, clk, we, spo)
/* synthesis syn_black_box black_box_pad_pin="a[7:0],d[7:0],clk,we,spo[7:0]" */;
  input [7:0]a;
  input [7:0]d;
  input clk;
  input we;
  output [7:0]spo;
endmodule