`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/05/01 17:38:48
// Design Name:
// Module Name: Mem
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module Mem(input Mem_Wr,
           input ByteStore,
           input [31:0] Addr,
           input [31:0] DataIn,
           input clk,
           output [31:0] DataOut);
    wire[31:0] Addr_0,Addr_1,Addr_2,Addr_3;
    assign Addr_0 = Addr;
    assign Addr_1 = Addr+1;
    assign Addr_2 = Addr+2;
    assign Addr_3 = Addr+3;
    
    async_mem_1 mem_0(
    .clk(clk),
    .a(Addr_0[7:0]),
    .we(Mem_Wr),
    .d(DataIn[7:0]),
    .spo(DataOut[7:0])
    );
    
    async_mem_1 mem_1(
    .clk(clk),
    .a(Addr_1[7:0]),
    .we(Mem_Wr&(!ByteStore)),
    .d(DataIn[15:8]),
    .spo(DataOut[15:8])
    );
    
    async_mem_1 mem_2(
    .clk(clk),
    .a(Addr_2[7:0]),
    .we(Mem_Wr&(!ByteStore)),
    .d(DataIn[23:16]),
    .spo(DataOut[23:16])
    );
    
    async_mem_1 mem_3(
    .clk(clk),
    .a(Addr_3[7:0]),
    .we(Mem_Wr&(!ByteStore)),
    .d(DataIn[31:24]),
    .spo(DataOut[31:24])
    );
endmodule
