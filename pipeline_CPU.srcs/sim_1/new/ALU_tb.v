`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/06 16:44:46
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
reg [31:0] A;
reg signed[31:0] B;
reg [3:0] ALUctr;
wire Zero;
wire Overflow;
wire [31:0]Result;

initial begin
    ALUctr=4'b1000;
    //leftshift
    A=32'h0000_0001;
    B=32'h0000_00ff;
    #5;
    A=32'h0000_0002;
    #5;
    A=32'h0000_001f;
    #5;
    A=32'h0000_0020;
    #5;
    ALUctr=4'b1001;
    //arith right shift
    A=32'h0000_0001;
    B=32'h7f00_0000;
    #5;
    A=32'h0000_0002;
    #5;
    A=32'h0000_001e;
    #5;
    A=32'h0000_001f;
    #5;
    A=32'h0000_0001;
    B=32'hff00_0000;
    #5;
    A=32'h0000_0002;
    #5;
    A=32'h0000_001e;
    #5;
    A=32'h0000_001f;
    #5;
    ALUctr=4'b1010;
    //logic right shift
    A=32'h0000_0001;
    B=32'h7f00_0000;
    #5;
    A=32'h0000_0002;
    #5;
    A=32'h0000_001e;
    #5;
    A=32'h0000_001f;
    #5;
    A=32'h0000_0001;
    B=32'hff00_0000;
    #5;
    A=32'h0000_0002;
    #5;
    A=32'h0000_001e;
    #5;
    A=32'h0000_001f;
    #5;
    ALUctr=4'b0000;
    #5;
    ALUctr=4'b1011;
    //and
    A=32'h00f0_00f0;
    B=32'h1234_5678;
    #5;
    ALUctr=4'b1100;
    //xor
    A=32'h00f0_00f0;
    B=32'h1234_5678;
    #5;
    ALUctr=4'b1101;
    B=32'h0000_1234;
    #5;
    
    $finish;
end
ALU alu(
    .A(A),
    .B(B),
    .ALUctr(ALUctr),
    .Zero(Zero),
    .Overflow(Overflow),
    .Result(Result)
);

endmodule
