`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/05/02 21:10:03
// Design Name:
// Module Name: Control
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


module Control(input [31:0] Inst,
               input RUN,
               output reg [3:0]Branch,
               output reg Jump,
               output reg RegDst,
               output reg ALU_A,         //* busA or SA
               output reg ALUSrc,
               output reg ByteGet,       //* get the highest byte of read data
               output reg ByteStore,   //* storebyte
               output reg[3:0] ALUctr,
               output reg MemtoReg,
               output reg RegWr,
               output reg MemWr,
               output reg MemRead,
               output reg ExtOp,
               output reg Link,
               output reg JR);
wire[5:0] op;
wire[5:0] func;
assign op   = Inst[31:26];
assign func = Inst[5:0];
wire[4:0] reggim;
assign reggim = Inst[20:16];

wire opZero;
assign opZero = op[5]|op[4]|op[3]|op[2]|op[1]|op[0];

//wire Branch;
//assign Branch = opZero&(
//!(!op[5]&!op[4]&op[3]&op[2]&!op[1]&op[0])|//* 001101
//!(!op[5]&!op[4]&op[3]&!op[2]&!op[1]&op[0])|//* 001001
//!(op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0])|//* 100011
//!(op[5]&!op[4]&op[3]&!op[2]&op[1]&op[0])|//* 101011
//(!op[5]&!op[4]&!op[3]&op[2]&!op[1]&!op[0])|//* 000100
//!(!op[5]&!op[4]&!op[3]&!op[2]&op[1]&!op[0])//* 000010
//);

//wire Jump;
//assign Jump = opZero&(
//!(!op[5]&!op[4]&op[3]&op[2]&!op[1]&op[0])|//* 001101
//!(!op[5]&!op[4]&op[3]&!op[2]&!op[1]&op[0])|//* 001001
//!(op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0])|//* 100011
//!(op[5]&!op[4]&op[3]&!op[2]&op[1]&op[0])|//* 101011
//!(!op[5]&!op[4]&!op[3]&op[2]&!op[1]&!op[0])|//* 000100
//(!op[5]&!op[4]&!op[3]&!op[2]&op[1]&!op[0])//* 000010
//);

//wire RegDst;
//assign RegDst = !(opZero&(
//(!op[5]&!op[4]&op[3]&op[2]&!op[1]&op[0])|//* 001101
//(!op[5]&!op[4]&op[3]&!op[2]&!op[1]&op[0])|//* 001001
//(op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0])//* 100011
//));

////wire ALUSrc;
//assign ALUSrc = opZero&(
//(!op[5]&!op[4]&op[3]&op[2]&!op[1]&op[0])|//* 001101
//(!op[5]&!op[4]&op[3]&!op[2]&!op[1]&op[0])|//* 001001
//(op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0])|//* 100011
//(op[5]&!op[4]&op[3]&!op[2]&op[1]&op[0])|//* 101011
//!(!op[5]&!op[4]&!op[3]&op[2]&!op[1]&!op[0])//* 000100
//);

wire[3:0] add,sub,subu,slt,sltu,_or,addu;
wire[3:0] leftshift,arithrightshift,logicalrightshift,_and,_xor,lui;
assign addu              = 4'b0000;
assign add               = 4'b0001;
assign _or               = 4'b0010;
assign subu              = 4'b0100;
assign sub               = 4'b0101;
assign sltu              = 4'b0110;
assign slt               = 4'b0111;
assign leftshift         = 4'b1000;
assign arithrightshift   = 4'b1001;
assign logicalrightshift = 4'b1010;
assign _and              = 4'b1011;
assign _xor              = 4'b1100;
assign lui               = 4'b1101;

//wire[2:0] ALUctr;
always@(*)
begin
    if (RUN == 1)
    begin
        if ((op == 6'b000_000)&&(func!=6'b001000))
        begin
            case(func)
                6'b100000://* add
                begin
                    ALUctr = add;
                    ALU_A  = 1'b0;
                end
                6'b100001://* addu
                begin
                    ALUctr = addu;
                    ALU_A  = 1'b0;
                end
                6'b100010://* sub
                begin
                    ALUctr = sub;
                    ALU_A  = 1'b0;
                end
                6'b100011://* subu
                begin
                    ALUctr = subu;
                    ALU_A  = 1'b0;
                end
                6'b101010://* slt
                begin
                    ALUctr = slt;
                    ALU_A  = 1'b0;
                end
                6'b101011://* sltu
                begin
                    ALUctr = sltu;
                    ALU_A  = 1'b0;
                end
                6'b000100://* sllv
                begin
                    ALUctr = leftshift;
                    ALU_A  = 1'b0;
                end
                6'b100110://* xor
                begin
                    ALUctr = _xor;
                    ALU_A = 1'b0;
                end
                6'b100101://* or
                begin
                    ALUctr = _or;
                    ALU_A = 1'b0;
                end
                6'b000000://* sll
                begin
                    ALUctr = leftshift;
                    ALU_A  = 1'b1;
                end
                6'b000011://* sra
                begin
                    ALUctr = arithrightshift;
                    ALU_A  = 1'b1;
                end
                6'b000111://* srav
                begin
                    ALUctr = arithrightshift;
                    ALU_A = 1'b0;
                end
                6'b000110://* srlv
                begin
                    ALUctr = logicalrightshift;
                    ALU_A = 1'b0;
                end
                6'b000010://* srl
                begin
                    ALUctr = logicalrightshift;
                    ALU_A = 1'b1;
                end
            endcase
            RegWr     = 1'b1;
            Branch    = 4'b0000;
            Jump      = 1'b0;
            RegDst    = 1'b1;
            ALUSrc    = 1'b0;
            MemtoReg  = 1'b0;
            MemWr     = 1'b0;
            MemRead   = 1'b0;
            ByteGet   = 1'b0;
            ByteStore = 1'b0;
            ExtOp     = 1'b0;
            Link = 1'b0;
            JR = 1'b0;
        end
        else if ((op == 6'b000000)&&(func == 6'b001000))//* jr
        begin
            Branch   = 4'b0111;
            Jump = 1'b0;
            RegWr     = 1'b0;
            RegDst = 1'b1;
            ALUSrc    = 1'b0;
            MemtoReg = 1'b0;
            MemWr = 1'b0;
            MemRead   = 1'b0;
            ByteGet   = 1'b0;
            ByteStore = 1'b0;
            ExtOp    = 1'b0;
            Link = 1'b0;
            JR = 1'b1;
        end
        else
        begin
            case(op)
                6'b001101://* ori
                begin
                    ALUctr   = _or;
                    RegWr    = 1'b1;
                    Branch   = 4'b0000;
                    Jump     = 1'b0;
                    RegDst   = 1'b0;
                    ALUSrc   = 1'b1;
                    MemtoReg = 1'b0;
                    MemWr    = 1'b0;
                    ExtOp    = 1'b0;
                    MemRead  = 1'b0;
                    ALU_A    = 1'b0;
                    ByteStore = 1'b0;
                    Link = 1'b0;
                end
                6'b001001://* addiu
                begin
                    ALUctr   = addu;
                    RegWr    = 1'b1;
                    Branch   = 4'b0000;
                    Jump     = 1'b0;
                    RegDst   = 1'b0;
                    ALUSrc   = 1'b1;
                    MemtoReg = 1'b0;
                    MemWr    = 1'b0;
                    ExtOp    = 1'b1;
                    MemRead  = 1'b0;
                    ALU_A    = 1'b0;
                    ByteStore = 1'b0;
                    Link = 1'b0;
                end
                6'b100011://* lw
                begin
                    ALUctr   = addu;
                    RegWr    = 1'b1;
                    Branch   = 4'b0000;
                    Jump     = 1'b0;
                    RegDst   = 1'b0;
                    ALUSrc   = 1'b1;
                    MemtoReg = 1'b1;
                    MemWr    = 1'b0;
                    ExtOp    = 1'b1;
                    MemRead  = 1'b1;
                    ALU_A    = 1'b0;
                    ByteGet  = 1'b0;
                    ByteStore = 1'b0;
                    Link = 1'b0;
                end
                6'b101011://* sw
                begin
                    ALUctr    = addu;
                    RegWr     = 1'b0;
                    Branch    = 4'b0000;
                    Jump      = 1'b0;
                    ALUSrc    = 1'b1;
                    MemWr     = 1'b1;
                    ExtOp     = 1'b1;
                    MemRead   = 1'b0;
                    ALU_A     = 1'b0;
                    ByteStore = 1'b0;
                    Link = 1'b0;
                end
                6'b000100://* beq
                begin
                    ALUctr  = subu;
                    RegWr   = 1'b0;
                    Branch  = 4'b0001;
                    Jump    = 1'b0;
                    ALUSrc  = 1'b0;
                    MemWr   = 1'b0;
                    MemRead = 1'b0;
                    ExtOp   = 1'b1;
                    ALU_A   = 1'b0;
                    ByteStore = 1'b0;
                    Link = 1'b0;
                    JR = 1'b0;
                end
                6'b000010://* jump
                begin
                    RegWr   = 1'b0;
                    Branch  = 4'b0000;
                    Jump    = 1'b1;
                    MemWr   = 1'b0;
                    MemRead = 1'b0;
                    ALU_A   = 1'b0;
                    ByteStore = 1'b0;
                    Link = 1'b0;
                end
                6'b001000://* addi
                begin
                    ALUctr   = add;
                    Branch   = 4'b0000;
                    Jump     = 1'b0;
                    RegDst   = 1'b0;
                    ALUSrc   = 1'b1;
                    MemtoReg = 1'b0;
                    RegWr    = 1'b1;
                    MemWr    = 1'b0;
                    ExtOp    = 1'b1;
                    MemRead  = 1'b0;
                    ALU_A    = 1'b0;
                    ByteStore = 1'b0;
                    Link = 1'b0;
                end
                6'b000101: //*bne
                begin
                    ALUctr  = subu;
                    Branch  = 4'b0010;
                    Jump    = 1'b0;
                    ALUSrc  = 1'b0;
                    RegWr   = 1'b0;
                    MemWr   = 1'b0;
                    MemRead = 1'b0;
                    ALU_A   = 1'b0;
                    ExtOp   = 1'b1;
                    ByteStore = 1'b0;
                    Link = 1'b0;
                    JR = 1'b0;
                end
                6'b000110: //*blez
                begin
                    ALUctr = subu;
                    Branch = 4'b0101;
                    Jump = 1'b0;
                    ALUSrc = 1'b0;
                    RegWr = 1'b0;
                    MemWr = 1'b0;
                    MemRead   = 1'b0;
                    ALU_A     = 1'b0;
                    ExtOp    = 1'b1;
                    ByteStore = 1'b0;
                    MemtoReg = 1'b0;
                    Link = 1'b0;
                    JR = 1'b0;
                end
                6'b000111://*bgtz
                begin
                    ALUctr = subu;
                    Branch    = 4'b0110;
                    Jump =1'b0;
                    ALUSrc    = 1'b0;
                    RegWr = 1'b0;
                    MemWr = 1'b0;
                    MemRead   = 1'b0;
                    ALU_A     = 1'b0;
                    ExtOp    = 1'b1;
                    ByteStore = 1'b0;
                    MemtoReg = 1'b0;
                    Link = 1'b0;
                    JR = 1'b0;
                end
                6'b000011://*jal
                begin
                    ALUctr = addu;
                    Branch   = 4'b0111;
                    Jump = 1'b1;
                    ALUSrc    = 1'b0;
                    RegWr     = 1'b1;
                    MemWr = 1'b0;
                    MemRead   = 1'b0;
                    ALU_A     = 1'b0;
                    ExtOp    = 1'b1;
                    ByteStore = 1'b0;
                    MemtoReg = 1'b0;
                    Link = 1'b1;
                    JR = 1'b0;
                end
                6'b100000: //*lb
                begin
                    ALUctr   = addu;
                    Branch   = 4'b0000;
                    Jump     = 1'b0;
                    MemWr    = 1'b0;
                    MemtoReg = 1'b1;
                    ALUSrc   = 1'b1;
                    RegDst   = 1'b0;
                    ExtOp    = 1'b1;
                    MemRead  = 1'b1;
                    ALU_A    = 1'b0;
                    RegWr    = 1'b1;
                    ByteGet  = 1'b1;
                    ByteStore = 1'b0;
                    Link = 1'b0;
                end
                6'b101000://*sb
                begin
                    ALUctr    = addu;
                    Branch   = 4'b0000;
                    Jump      = 1'b0;
                    MemWr     = 1'b1;
                    MemtoReg  = 1'b0;
                    ALUSrc    = 1'b1;
                    ExtOp     = 1'b1;
                    MemRead   = 1'b0;
                    ALU_A     = 1'b0;
                    RegWr     = 1'b0;
                    ByteGet   = 1'b0;
                    ByteStore = 1'b1;
                    Link = 1'b0;
                end
                6'b001111://*lui
                begin
                    ALUctr    = lui;
                    Branch   = 4'b0000;
                    Jump      = 1'b0;
                    MemWr     = 1'b0;
                    MemtoReg  = 1'b0;
                    ALUSrc    = 1'b1;
                    MemRead   = 1'b0;
                    ALU_A     = 1'b0;
                    RegWr     = 1'b1;
                    ByteGet   = 1'b0;
                    ByteStore = 1'b0;
                    Link = 1'b0;
                end
                6'b001100://* andi
                begin
                    Branch   = 4'b0000;
                    Jump      = 1'b0;
                    RegDst    = 1'b0;
                    ALUSrc    = 1'b1;
                    ALUctr    = _and;
                    MemtoReg  = 1'b0;
                    RegWr     = 1'b1;
                    MemWr     = 1'b0;
                    MemRead   = 1'b0;
                    ALU_A     = 1'b0;
                    ByteGet   = 1'b0;
                    ByteStore = 1'b0;
                    ExtOp     = 1'b0;
                    Link = 1'b0;
                end
                6'b001110://*xori
                begin
                    Branch   = 4'b0000;
                    Jump     = 1'b0;
                    RegDst    = 1'b0;
                    ALUSrc    = 1'b1;
                    ALUctr    = _xor;
                    MemtoReg  = 1'b0;
                    RegWr     = 1'b1;
                    MemWr     = 1'b0;
                    MemRead   = 1'b0;
                    ALU_A     = 1'b0;
                    ByteGet   = 1'b0;
                    ByteStore = 1'b0;
                    ExtOp    = 1'b0;
                    Link = 1'b0;
                end
                6'b000001://*REG IMM
                begin
                    case(reggim)
                        5'b00001://*bgez
                        begin
                            Branch   = 4'b0011;
                            Jump     = 1'b0;
                            MemWr    = 1'b0;
                            MemtoReg = 1'b0;
                            RegWr    = 1'b0;
                            ALUSrc   = 1'b1;
                            ExtOp    = 1'b1;
                            ByteStore = 1'b0;
                            Link = 1'b0;
                            JR = 1'b0;
                        end
                    endcase
                end
            endcase
        end
    end
    else
    begin
        RegWr     = 1'b0;
        Branch   = 4'b0000;
        Jump      = 1'b0;
        MemWr     = 1'b0;
        MemtoReg  = 1'b0;
        ALUSrc    = 1'b0;
        ALUctr    = 4'b0000;
        RegDst    = 1'b0;
        ExtOp     = 1'b0;
        MemRead   = 1'b0;
        ALU_A     = 1'b0;
        ByteGet   = 1'b0;
        ByteStore = 1'b0;
    end
end

//assign MemtoReg = opZero&(
//!(!op[5]&!op[4]&op[3]&op[2]&!op[1]&op[0])|//* 001101
//!(!op[5]&!op[4]&op[3]&!op[2]&!op[1]&op[0])|//* 001001
//(op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0])//* 100011
//);

// assign RegWr = opZero|(
// !(!op[5]&!op[4]&op[3]&op[2]&!op[1]&op[0])|//* 001101
// !(!op[5]&!op[4]&op[3]&!op[2]&!op[1]&op[0])|//* 001001
// !(op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0])|//* 100011
// (op[5]&!op[4]&op[3]&!op[2]&op[1]&op[0])|//* 101011
// (!op[5]&!op[4]&!op[3]&op[2]&!op[1]&!op[0])|//* 000100
// (!op[5]&!op[4]&!op[3]&!op[2]&op[1]&!op[0])//* 000010
// );

//assign MemWr = opZero&(
//!(!op[5]&!op[4]&op[3]&op[2]&!op[1]&op[0])|//* 001101
//!(!op[5]&!op[4]&op[3]&!op[2]&!op[1]&op[0])|//* 001001
//!(op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0])|//* 100011
//(op[5]&!op[4]&op[3]&!op[2]&op[1]&op[0])|//* 101011
//!(!op[5]&!op[4]&!op[3]&op[2]&!op[1]&!op[0])|//* 000100
//!(!op[5]&!op[4]&!op[3]&!op[2]&op[1]&!op[0])//* 000010
//);

//assign ExtOp = (
//!(!op[5]&!op[4]&op[3]&op[2]&!op[1]&op[0])|//* 001101
//(!op[5]&!op[4]&op[3]&!op[2]&!op[1]&op[0])|//* 001001
//(op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0])|//* 100011
//(op[5]&!op[4]&op[3]&!op[2]&op[1]&op[0])//* 101011
//);
endmodule
