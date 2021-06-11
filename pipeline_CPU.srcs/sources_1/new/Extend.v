`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/05/19 20:47:39
// Design Name:
// Module Name: Extend
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


module Extend(input ExtOp,
              input [15:0] imme16,
              output reg[31:0] real_imme16);
    always@(*)
    begin
        if (ExtOp == 0)
        begin
            real_imme16 = {16'h0000,imme16};
        end
        else
        begin
            real_imme16 = {{16{imme16[15]}},imme16};
        end
    end
endmodule
