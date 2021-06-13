`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/26 21:36:44
// Design Name:
// Module Name: Registers
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

//* Register Module
module Registers#(parameter WIDTH = 32)
                 (input clk,
                  input [4:0] Ra,
                  input [4:0] Rb,
                  input [4:0] Rw,
                  input WE,
                  input [WIDTH-1:0] busW,
                  output [WIDTH-1:0] reg1,reg2,reg3,reg4,
                  output reg [WIDTH-1:0] busA,
                  output reg [WIDTH-1:0] busB);
    reg [WIDTH-1:0] Registers [31:0];
    //initialize registers
    //initialize read data
    integer i;
    initial
    begin
        busA = 32'h0000_0000;
        busB = 32'h0000_0000;
        for(i = 0;i<32;i = i+1)
        begin
            Registers[i] = 32'h0000_0000;
        end
    end
    //read data from registers
    assign reg1=Registers[8]; 
    assign reg2=Registers[9]; 
    assign reg3=Registers[10]; 
    assign reg4=Registers[11]; 
    always @ (*)
    begin
        busA <= Registers[Ra];
        busB <= Registers[Rb];
    end
    //write
    always @ (posedge clk)
    begin
        if (WE == 1)
        begin
            Registers[Rw] <= busW;
        end
    end
endmodule
