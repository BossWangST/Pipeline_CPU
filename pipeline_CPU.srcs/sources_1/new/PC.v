`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/05/01 17:17:08
// Design Name:
// Module Name: PC
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


module PC(input clk,
          input rst,
          input branch,
          input Jump,
          input RUN,
          input en,
          input [31:0] beq_target,
          input [25:0] target,
          output [31:0] pc_add_4,
          output [31:0] Inst);
    reg [31:0] pc;
    initial
    begin
        pc     = 32'h0000_0000;
        //Inst = 32'h0000_0000;
    end
    
    wire [31:0] pc_0,pc_1,pc_2,pc_3;
    assign pc_0 = pc;
    assign pc_1 = pc+1;
    assign pc_2 = pc+2;
    assign pc_3 = pc+3;
    
    wire[31:0] new_pc;
    wire[31:0] new_pc_0,new_pc_1,new_pc_2,new_pc_3;
    assign new_pc_0 = new_pc;
    assign new_pc_1 = new_pc+1;
    assign new_pc_2 = new_pc+2;
    assign new_pc_3 = new_pc+3;
    
    wire[7:0] test_Inst_0,test_Inst_1,test_Inst_2,test_Inst_3;
    blk_mem Inst_mem_0(
    .addra(new_pc_0[7:0]),
    .clka(clk),
    .dina(0),
    .douta(test_Inst_0),
    .wea(0)
    );
    
    blk_mem Inst_mem_1(
    .addra(new_pc_1[7:0]),
    .clka(clk),
    .dina(0),
    .douta(test_Inst_1),
    .wea(0)
    );
    
    blk_mem Inst_mem_2(
    .addra(new_pc_2[7:0]),
    .clka(clk),
    .dina(0),
    .douta(test_Inst_2),
    .wea(0)
    );
    
    blk_mem Inst_mem_3(
    .addra(new_pc_3[7:0]),
    .clka(clk),
    .dina(0),
    .douta(test_Inst_3),
    .wea(0)
    );
    assign Inst = {test_Inst_3,test_Inst_2,test_Inst_1,test_Inst_0};
    //*    Inst_mem_1 Inst_mem_0(
    //*    .a(pc_0[7:0]),
    //*    .d(0),
    //*    .clk(clk),
    //*    .we(1'b0),
    //*    .spo(Inst[7:0])
    //*    );
    //*
    //*    Inst_mem_1 Inst_mem_1(
    //*        .a(pc_1[7:0]),
    //*        .d(0),
    //*        .clk(clk),
    //*        .we(1'b0),
    //*        .spo(Inst[15:8])
    //*    );
    //*
    //*    Inst_mem_1 Inst_mem_2(
    //*        .a(pc_2[7:0]),
    //*        .d(0),
    //*        .clk(clk),
    //*        .we(1'b0),
    //*        .spo(Inst[23:16])
    //*    );
    //*
    //*    Inst_mem_1 Inst_mem_3(
    //*        .a(pc_3[7:0]),
    //*        .d(0),
    //*        .clk(clk),
    //*        .we(1'b0),
    //*        .spo(Inst[31:24])
    //*    );
    //*
    wire[31:0] imme16;
    wire[31:0] next_pc;
    wire[31:0] branch_pc;
    wire[31:0] new_pc_branch;
    //wire[31:0] new_pc;
    //?wire[25:0] target;
    wire[31:0] jump_pc;
    
    assign imme16      = {{16{Inst[15]}},Inst[15:0]};//sign extended imme16
    assign next_pc     = pc+4;
    assign pc_add_4    = next_pc;
    //assign branch_pc = next_pc+imme16;
    assign branch_pc   = beq_target;
    //?assign target   = Inst[25:0];
    assign jump_pc     = {pc[31:28],target,2'b00};
    //always@(*)
    //begin
    //    imme16    = {16{pc[15]},pc[15:0]};
    //    next_pc   = pc+4;
    //    branch_pc = next_pc+imme16;
    //    target    = pc[25:0];
    //    jump_pc   = {pc[31:28],target,2'b00};
    //    pc        = new_pc;
    //end
    mux2to1 mux(
    .select(branch),
    .a(next_pc),
    .b(branch_pc),
    .Result(new_pc_branch)
    );
    //? wire [25:0] target;
    //? assign target = pc[25:0];
    //? wire [31:0] jump_pc;
    //? assign jump_pc = {pc[31:28],target,2'b00};//*jump可能的pc
    mux2to1 mux2(
    .select(Jump),
    .a(new_pc_branch),
    .b(jump_pc),
    .Result(new_pc)
    );
    always@(posedge clk)
    begin
        if (rst == 1)
        begin
            pc = 0;
        end
        else if (RUN == 1)
        begin
            if (en)
                pc = new_pc;
            else
                pc = pc;
        end
    end
endmodule
