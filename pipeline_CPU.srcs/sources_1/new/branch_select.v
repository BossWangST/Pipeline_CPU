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
    input [3:0] branch,
    input zero,
    input [31:0] rs,
    output real_branch
    );
    //?wire BGEZ;
    //?wire BGTZ;
    //?wire BLEZ;
    //?assign BGEZ = (rs>=32'h0)?1'b1:1'b0;//branch 011
    //?assign BGTZ = (rs>32'h0)?1'b1:1'b0;//branch 100
    //?assign BLEZ = (rs<=32'h0)?1'b1:1'b0;//branch 101
    (*mark_debug = "true"*)
    assign real_branch=(branch==4'b0001)?zero:
                       (branch==4'b0010)?(!zero):
                       (branch==4'b0011)?(!rs[31]):
                       (branch==4'b0101)?((rs[31])|(rs==32'h0)):
                       (branch==4'b0110)?((!rs[31])&(rs!=32'h0)):
                       (branch==4'b0111)?1'b1:1'b0;
                       //?(branch==3'b100)?(branch[2]&BGTZ):
                       //?(branch==3'b101)?(branch[2]&branch[0]&BLEZ):0;
endmodule
