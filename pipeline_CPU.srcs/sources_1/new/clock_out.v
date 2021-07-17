`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/14 15:39:49
// Design Name: 
// Module Name: clock_out
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


module clock_out(
    input clk,
    (*mark_debug = "true"*)output reg test
    );
    always@(posedge clk)
    begin
        test <= 1'b0;
    end
endmodule
