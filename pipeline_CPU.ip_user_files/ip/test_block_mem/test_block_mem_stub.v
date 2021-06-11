// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Wed Jun  9 09:37:00 2021
// Host        : LAPTOP-0FSA8U4L running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/University/CPU/SingleCycle/SingleCycle.gen/sources_1/ip/test_block_mem/test_block_mem_stub.v
// Design      : test_block_mem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *)
module test_block_mem(clka, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[1:0],addra[7:0],dina[15:0],douta[15:0]" */;
  input clka;
  input [1:0]wea;
  input [7:0]addra;
  input [15:0]dina;
  output [15:0]douta;
endmodule
