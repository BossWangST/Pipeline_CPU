`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/20 09:54:34
// Design Name: 
// Module Name: branch_select
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


module branch_select(
    input [2:0] branch,
    input zero,
    input rs,
    output real_branch
    );
    wire BGEZ;
    wire BGTZ;
    assign BGEZ = (rs>=0) ?1:0;//branch 011
    assign BGTZ = (rs>0)?1:0;//branch 100
    assign real_branch=(branch==3'b001)?(branch[0]&zero):
                       (branch==3'b010)?(branch[1]&(!zero)):
                       (branch==3'b011)?(branch[1]&branch[0]&BGEZ):
                       (branch==3'b100)?(branch[2]&BGTZ):0;
endmodule
