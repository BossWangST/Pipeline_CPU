`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/05/29 19:28:01
// Design Name:
// Module Name: mux4to1
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


module mux4to1#(parameter k = 32)
               (input [1:0]select,
                input [k-1:0]a,
                b,
                c,
                d,
                output reg [k-1:0]Result);
    always@(*)
        case(select)
            2'b00:Result  = a;
            2'b01: Result = b;
            2'b10: Result = c;
            2'b11: Result = d;
        endcase
endmodule
