`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/03 16:25:56
// Design Name: 
// Module Name: SingleCycle
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


module SingleCycle(
    input clk,
    input clk_50M,
    input RUN,
    input rst,
    output [31:0] reg1,reg2,reg3,
    output [31:0]Inst_out,

    inout wire[31:0] base_data_wire,
    output [19:0] base_addr,
    output [3:0] base_byte,
    output wire base_ce,
    output wire base_oe,
    output wire base_we,

    inout wire[31:0] ext_data_wire,
    output wire[19:0] ext_addr,
    output wire[3:0] ext_byte,
    output wire ext_ce,              //* select enable, select base ram or ext ram
    output wire ext_oe,               //* read enable
    output wire ext_we
    );

    wire RegWr;//*寄存器堆写使能
    wire ExtOp;//*扩展方式
    wire [3:0] ALUctr;//*ALU控制信号
    wire MemWr;//*存储器写使能
    wire MemtoReg;//*写回寄存器内容选择
    wire ALUSrc;//*ALU的输入端2选择
    wire RegDst;//*写入的寄存器号选择
    wire [2:0]Branch;//*分支指令信号
    wire Jump;//*跳转指令信号
    wire MemRead;//*判断lw指令
    wire ALU_A;//*ALU A口选择
    wire ByteGet;//*截取高8位的数据
    wire ByteStore;//*存储reg最低字节进那一个存储单元
    wire[31:0] Inst;//*指令
    wire START;//* 开始译码
    //wire RUN;

    assign Inst_out=Inst;
    DataRoad DataRoad(
        .clk(clk),
        .clk_50M(clk_50M),
        .rst(rst),
        .RegWr(RegWr),
        .ExtOp(ExtOp),
        .ALUctr(ALUctr),
        .MemWr(MemWr),
        .MemtoReg(MemtoReg),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .Branch(Branch),
        .MemRead(MemRead),
        .ALU_A(ALU_A),
        .ByteGet(ByteGet),
        .ByteStore(ByteStore),
        .Jump(Jump),
        .Inst_ID(Inst),
        .START(START),
        .RUN(RUN),

        .base_data_wire(base_data_wire),
        .base_addr(base_addr),
        .base_byte(base_byte),
        .base_ce(base_ce),
        .base_oe(base_oe),
        .base_we(base_we),

        .ext_data_wire(ext_data_wire),
        .ext_addr(ext_addr),
        .ext_byte(ext_byte),
        .ext_ce(ext_ce),
        .ext_oe(ext_oe),
        .ext_we(ext_we),
        .reg1(reg1),
        .reg2(reg2),
        .reg3(reg3)
    );

    Control Control(
        .Inst(Inst),
        .RUN(START),
        .Branch(Branch),
        .Jump(Jump),
        .RegDst(RegDst),
        .ALUSrc(ALUSrc),
        .ALUctr(ALUctr),
        .MemtoReg(MemtoReg),
        .RegWr(RegWr),
        .MemWr(MemWr),
        .MemRead(MemRead),
        .ALU_A(ALU_A),
        .ByteGet(ByteGet),
        .ByteStore(ByteStore),
        .ExtOp(ExtOp)
    );
endmodule
