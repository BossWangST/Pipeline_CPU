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
                  input rst,
                  input [4:0] Ra,
                  input [4:0] Rb,
                  input [4:0] Rw,
                  input WE,
                  input [WIDTH-1:0] busW,
                  (*mark_debug = "true"*)output [WIDTH-1:0] reg1,
                  output[WIDTH-1:0] reg2, reg3, 
                  output [WIDTH-1:0] busA, 
                  output [WIDTH-1:0] busB);
    reg [WIDTH-1:0] Registers [31:0];
    //initialize registers
    //initialize read data
    //integer i;
    //initial
    //begin
    //    busA = 32'h0000_0000;
    //    busB = 32'h0000_0000;
    //    for(i = 0;i<32;i = i+1)
    //    begin
    //        Registers[i] = 32'h0000_0000;
    //    end
    //end
    //read data from registers
    //(*mark_debug = "true"*)wire [31:0] reg1;
    //(*mark_debug = "true"*)wire [31:0] reg2;
    //(*mark_debug = "true"*)wire [31:0] reg3;
    //(*mark_debug = "true"*)wire [31:0] reg4;
    assign reg1 = Registers[8];
    assign reg2 = Registers[9];
    assign reg3 = Registers[10];

    (*mark_debug = "true"*)wire[31:0] reg_a0,reg_s0,reg_s1,reg_k0,reg_k1;
    assign reg_a0 = Registers[4];
    assign reg_s0 = Registers[16];
    assign reg_s1 = Registers[17];
    assign reg_k0 = Registers[26];
    assign reg_k1 = Registers[27];


    assign busA = ((Ra==Rw)&WE)?busW:Registers[Ra];
    assign busB = ((Rb==Rw)&WE)?busW:Registers[Rb];
    //write
    always @ (posedge clk, posedge rst)
    begin
        if (rst)
        begin
            Registers[0]<=32'h0000_0000;
            Registers[1]<=32'h0000_0000;
            Registers[2]<=32'h0000_0000;
            Registers[3]<=32'h0000_0000;
            Registers[4]<=32'h0000_0000;
            Registers[5]<=32'h0000_0000;
            Registers[6]<=32'h0000_0000;
            Registers[7]<=32'h0000_0000;
            Registers[8]<=32'h0000_0000;
            Registers[9]<=32'h0000_0000;
            Registers[10]<=32'h0000_0000;
            Registers[11]<=32'h0000_0000;
            Registers[12]<=32'h0000_0000;
            Registers[13]<=32'h0000_0000;
            Registers[14]<=32'h0000_0000;
            Registers[15]<=32'h0000_0000;
            Registers[16]<=32'h0000_0000;
            Registers[17]<=32'h0000_0000;
            Registers[18]<=32'h0000_0000;
            Registers[19]<=32'h0000_0000;
            Registers[20]<=32'h0000_0000;
            Registers[21]<=32'h0000_0000;
            Registers[22]<=32'h0000_0000;
            Registers[23]<=32'h0000_0000;
            Registers[24]<=32'h0000_0000;
            Registers[25]<=32'h0000_0000;
            Registers[26]<=32'h0000_0000;
            Registers[27]<=32'h0000_0000;
            Registers[28]<=32'h0000_0000;
            Registers[29]<=32'h0000_0000;
            Registers[30]<=32'h0000_0000;
            Registers[31]<=32'h0000_0000;
            //for(i = 0;i<32;i = i+1)
            //begin
            //    Registers[i] = 32'h0000_0000;
            //end
        end
        else if (WE == 1)
        begin
            Registers[Rw] <= busW;
        end
    end
endmodule
