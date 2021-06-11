`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/05/03 17:10:55
// Design Name:
// Module Name: singlecycle_tb
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


module singlecycle_tb();
    
    reg clk;
    reg RUN;
    reg rst;
    wire [31:0] Inst;
    wire [31:0]reg1,reg2,reg3,reg4;
    initial
    begin
        clk = 1'b1;
    end
    always #5 clk = ~clk;
    
    initial
    begin
        RUN = 0;
        rst = 1;
        #5;
        rst = 0;
        RUN = 1;
        //$stop;
        #2000;
        $finish;
    end
    
    SingleCycle singlecycle(
    .clk(clk),
    .rst(rst),
    .RUN(RUN),
    .reg1(reg1),
    .reg2(reg2),
    .reg3(reg3),
    .reg4(reg4),
    .Inst_out(Inst)
    );
endmodule
