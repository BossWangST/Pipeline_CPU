`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/05/01 17:48:37
// Design Name:
// Module Name: pc_tb
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


module pc_tb();
    reg clk;
    reg Branch;
    reg Zero;
    reg Jump;
    reg RUN;
    wire [31:0] Inst;
    
    PC pc(
    .clk(clk),
    .RUN(RUN),
    .Branch(Branch),
    .Zero(Zero),
    .Jump(Jump),
    .Inst(Inst)
    );
    initial
    begin
        clk = 1'b1;
    end
    always #3 clk = ~clk;
    
    initial
    begin
        RUN    = 0;
        Branch = 0;
        Zero   = 0;
        Jump   = 0;
        #3;
        RUN    = 1;
        Branch = 0;
        Zero   = 0;
        #5;
        Branch = 0;
        Zero   = 0;
        #5;
        Branch = 0;
        Zero   = 0;
        Jump   = 0;
        #5;
        Jump = 0;
        #5;
        Branch = 0;
        Zero   = 0;
        #5;
        $finish;
    end
    
endmodule
