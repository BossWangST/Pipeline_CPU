`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/03 17:19:45
// Design Name: 
// Module Name: Mem_tb
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


module Mem_tb(
    );
    reg Mem_Wr;
    reg[31:0] Addr;
    reg[31:0] DataIn;
    reg clk;
    wire[31:0] DataOut;

    initial 
    begin
        clk=1'b1;
    end
    always #5 clk=~clk;

    initial
    begin
        Mem_Wr=1'b0;
        DataIn=32'h0000_0000;
        Addr=32'h0000_0000;
        #4;
        Addr=32'h0000_0001;
        #4;
        Addr=32'h0000_0002;
        #4;
        Addr=32'h0000_0003;
        #4;
        $finish;
    end

    Mem mem(
        .Mem_Wr(Mem_Wr),
        .Addr(Addr),
        .DataIn(DataIn),
        .clk(clk),
        .DataOut(DataOut)
    );
endmodule
