`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/05/03 15:51:55
// Design Name:
// Module Name: DataRoad
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


module DataRoad#(parameter WIDTH = 32)
                (input clk,
                 input clk_50M,
                 input rst,
                 input RegWr,
                 input ExtOp,
                 input[3:0] ALUctr,
                 input[2:0] Branch,
                 input MemWr,
                 input MemtoReg,
                 input ALUSrc,
                 input RegDst,
                 input Jump,
                 input ALU_A,
                 input ByteGet,
                 input ByteStore,
                 input MemRead,
                 output START,
                 output[31:0] Inst_ID,
                 output [31:0]reg1,
                 reg2,
                 reg3,
                 input RUN,
                 
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
    
    
    wire[WIDTH-1:0] pc_add_4;
    (*mark_debug = "true"*)wire[WIDTH-1:0] Inst;
    
    //wire temp_test;
    //clock_out clock_out(.clk(clk_50M),.test(temp_test));
    wire Zero;
    
    wire beq_real;//wait until WR segment
    wire [25:0] target_real;
    wire [31:0] beq_target_real;
    wire load_use_pause;
    wire branch_real;
    
    assign load_use_pause  = !load_use;
    assign branch_real     = real_branch_select;
    assign target_real     = target;
    assign beq_target_real = beq_target;
    PC pc(
    .clk(clk),
    .clk_50M(clk_50M),
    .rst(rst),
    .en(load_use_pause),
    .branch(branch_real),
    .Jump(Jump),
    .RUN(RUN),
    .beq_target(beq_target_real),
    .target(target_real),
    .pc_add_4(pc_add_4),
    .Inst(Inst),

    .base_data_wire(base_data_wire),
    .base_addr(base_addr),
    .base_byte(base_byte),
    .base_ce(base_ce),
    .base_oe(base_oe),
    .base_we(base_we)
    );
    
    wire[63:0] IF_In;
    assign IF_In = {Inst,pc_add_4};
    wire [63:0] ID_Out;
    wire IF_ID_clear = branch_real;
    //* IF/ID Reg
    D_Trigger #(64)IF_ID(
    .clk(clk),
    .rst(rst),
    .en(load_use_pause),
    .clear(IF_ID_clear|load_use_clear_MEM),
    .d(IF_In),
    .q(ID_Out)
    );
    
    //& ID parse
    //wire [WIDTH-1:0] Inst_ID;
    wire [WIDTH-1:0] pc_add_4_ID = ID_Out[31:0];
    assign Inst_ID               = ID_Out[63:32];
    //assign pc_add_4_ID         = ID_Out[31:0];
    //wire[5:0] op                 = Inst_ID[31:26];
    wire[4:0] Rs                 = Inst_ID[25:21];
    wire[4:0] Rt                 = Inst_ID[20:16];
    wire[4:0] Rd                 = Inst_ID[15:11];
    wire[15:0] imme16            = Inst_ID[15:0];
    wire[25:0] target            = Inst_ID[25:0];
    wire[4:0] sa                 = Inst_ID[10:6];
    
    assign START = |Inst_ID;
    //* Extend immediate
    wire [WIDTH-1:0] real_imme16;
    wire [WIDTH-1:0] zero_ext_imme16={16'h0000,imme16[15:0]};
    wire [WIDTH-1:0] sign_ext_imme16={{16{imme16[15]}},imme16[15:0]};
    assign real_imme16 =ExtOp?sign_ext_imme16:zero_ext_imme16;
    //Extend extend(
    //.ExtOp(ExtOp),
    //.imme16(imme16),
    //.real_imme16(real_imme16)
    //);
    
    wire[WIDTH-1:0] busA,busB;
    wire[WIDTH-1:0] busW;
    wire[4:0] Rw;
    //wire RegWr_real;//wait until segment
    //assign RegWr_real = RegWr_WR;
    //wire[4:0] Rw_real;
    //assign Rw_real = Rw_WR;
    //* Reg
    Registers regs(
    .clk(clk),
    .rst(rst),
    .Ra(Rs),
    .Rb(Rt),
    .Rw(Rw_WR),
    .WE(RegWr_WR),
    .reg1(reg1),
    .reg2(reg2),
    .reg3(reg3),
    .busW(busW),
    .busA(busA),
    .busB(busB)
    );
    
    wire [4:0] now_Rw_EX;
    assign now_Rw_EX = Rw;
    wire store_forward;
    assign store_forward = RegWr_EX&(|now_Rw_EX)&(Rt == now_Rw_EX);
    
    
    wire[169:0] ID_In;
    assign ID_In = {store_forward,ByteStore,ByteGet,ALU_A,sa,MemRead,Rs,RegWr,MemWr,MemtoReg,ALUctr,ALUSrc,RegDst,Branch,busA,busB,Rt,Rd,real_imme16,pc_add_4_ID};//! data lies in the lower bit!
    wire [169:0]EX_Out;
    //* ID/EX Reg
    wire load_use_clear;
    assign load_use_clear = load_use;
    D_Trigger #(170)ID_EX(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .clear(load_use_clear),
    .d(ID_In),
    .q(EX_Out)
    );
    
    //& EX parse
    wire store_forward_EX = EX_Out[164];
    wire ByteStore_EX     = EX_Out[163];
    wire ByteGet_EX       = EX_Out[162];
    wire ALU_A_EX         = EX_Out[161];
    wire [4:0]sa_EX       = EX_Out[160:156];
    wire MemRead_EX       = EX_Out[155];
    wire [4:0]Rs_EX       = EX_Out[154:150];
    wire RegWr_EX         = EX_Out[149];
    wire MemWr_EX         = EX_Out[148];
    wire MemtoReg_EX      = EX_Out[147];
    wire [3:0]ALUctr_EX   = EX_Out[146:143];
    wire ALUSrc_EX        = EX_Out[142];
    wire RegDst_EX        = EX_Out[141];
    wire [2:0]Branch_EX   = EX_Out[140:138];
    //-----------------------------
    wire [31:0]busA_EX        = EX_Out[137:106];
    wire [31:0]busB_EX        = EX_Out[105:74];
    wire [4:0]Rt_EX           = EX_Out[73:69];
    wire [4:0]Rd_EX           = EX_Out[68:64];
    wire [31:0]real_imme16_EX = EX_Out[63:32];
    wire [31:0] pc_add_4_EX   = EX_Out[31:0];

    
    // //* ALU B select
    // mux2to1 mux_busB(
    // .select(ALUSrc_EX),
    // .a(busB_EX),
    // .b(real_imme16_EX),
    // .Result(real_busB)
    // );
    
    //* ALU A select
    wire [WIDTH-1:0]busA_sa;
    assign busA_sa = (ALU_A_EX == 0) ?busA_EX:sa_EX;
    
    //*---------Forward module------------
    
    wire [WIDTH-1:0] real_busA;
    wire [WIDTH-1:0] real_busB;
    wire [WIDTH-1:0] last_alu_result;
    wire [WIDTH-1:0] last_before_last_alu_result;
    wire [1:0] real_ALUSrcA;
    wire [1:0] real_ALUSrcB;
    
    assign last_alu_result             = alu_result_MEM;
    assign last_before_last_alu_result = busW;
    assign real_ALUSrcA                = ALUSrcA;
    assign real_ALUSrcB                = ALUSrcB;
    assign real_busA=(real_ALUSrcA==2'b00)?busA_sa:
                     (real_ALUSrcA==2'b01)?last_alu_result:
                     last_before_last_alu_result;
    //mux3to1 mux_busA(
    //.select(real_ALUSrcA),
    //.a(busA_sa),
    //.b(last_alu_result),
    //.c(last_before_last_alu_result),
    //.Result(real_busA)
    //);
    
    assign real_busB=(real_ALUSrcB==2'b00)?busB_EX:
                     (real_ALUSrcB == 2'b01)?last_alu_result:
                     (real_ALUSrcB == 2'b10)?last_before_last_alu_result:
                     real_imme16_EX;
    //mux4to1 mux_busB(
    //.select(real_ALUSrcB),
    //.a(busB_EX),
    //.b(last_alu_result),
    //.c(last_before_last_alu_result),
    //.d(real_imme16_EX),
    //.Result(real_busB)
    //);
    //*-----------------------------------
    wire[WIDTH-1:0] alu_result;
    //* ALU
    ALU alu(
    .A(real_busA),
    .B(real_busB),
    .ALUctr(ALUctr_EX),
    .Zero(Zero),
    .Result(alu_result)
    );
    
    //* branch select(bne,beq...)
    wire real_branch_select;
    branch_select branch_select(
        .branch(Branch_EX),
        .zero(Zero),
        .rs(Rs_EX),
        .real_branch(real_branch_select)
    );
    //assign branch_select = (Branch_EX == 3'b001)?(Branch_EX[0]&Zero):
    //(Branch_EX == 3'b010)?(Branch_EX[1]&(!Zero)):0;
    wire[WIDTH-1:0] beq_target;
    wire[WIDTH-1:0] imme16_shift={real_imme16_EX[29:0],2'b00};
    assign beq_target = pc_add_4_EX+imme16_shift;

    //* Reg write select
    assign Rw=RegDst_EX?Rd_EX:Rt_EX;
    //mux2to1 mux_reg(
    //.select(RegDst_EX),
    //.a(Rt_EX),
    //.b(Rd_EX),
    //.Result(Rw)
    //);
    // load-use
    wire load_use = MemRead_EX&((Rw == Rt)|(Rw == Rs));
    
    
    wire[127:0] EX_In;
    assign EX_In = {load_use_clear,store_forward_EX,ByteStore_EX,ByteGet_EX,RegWr_EX,MemWr_EX,MemtoReg_EX,alu_result,busB_EX,Rw};
    wire[127:0] MEM_Out;
    //* EX/MEM reg
    D_Trigger #(128)EX_MEM(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .clear(1'b0),
    .d(EX_In),
    .q(MEM_Out)
    );
    
    //& MEM parse
    wire load_use_clear_MEM   = MEM_Out[75];
    wire store_forward_MEM    = MEM_Out[74];
    wire ByteStore_MEM        = MEM_Out[73];
    wire ByteGet_MEM          = MEM_Out[72];
    wire RegWr_MEM            = MEM_Out[71];
    wire MemWr_MEM            = MEM_Out[70];
    wire MemtoReg_MEM         = MEM_Out[69];
    //wire [2:0]Branch_MEM      = MEM_Out[104:102];
    wire [31:0]alu_result_MEM = MEM_Out[68:37];
    //wire Zero_MEM             = MEM_Out[69];
    wire [31:0]busB_MEM       = MEM_Out[36:5];
    //wire [31:0]beq_target_MEM = MEM_Out[36:5];
    wire [4:0]Rw_MEM          = MEM_Out[4:0];
    
    
    //* store forward
    wire[WIDTH-1:0] now_busW;
    assign now_busW = busW;
    wire [WIDTH-1:0] real_DataIn;
    wire [WIDTH-1:0] real_DataIn_2;
    assign real_DataIn = (store_forward_MEM == 1)?now_busW:busB_MEM;
    assign real_DataIn_2 = real_DataIn;
    
    //?wire ce,oe,we;
    //?assign {ce,oe,we}=MemWr_MEM?3'b010:3'b001;
    //?wire[3:0] byte=4'b0000;
    wire[WIDTH-1:0] DataOut;
    //?wire[19:0] physical_addr=alu_result_MEM[21:2];
    //* Mem
    //?ext_sram_control ext_control(
    //?    .clk(clk),
    //?    .rst(rst),
    //?    .ce(ce),
    //?    .oe(oe),
    //?    .we(we),
    //?    .datain(real_DataIn),
    //?    .addr(physical_addr),
    //?    .byte(4'b0000),
    //?    .dataout(DataOut),

    //?    .ext_data_wire(ext_data_wire),
    //?    .ext_addr(ext_addr),
    //?    .ext_byte(ext_byte),
    //?    .ext_ce(ext_ce),
    //?    .ext_oe(ext_oe),
    //?    .ext_we(ext_we)
    //?);
    Mem mem(
    .clk(clk),
    .clk_50M(clk_50M),
    .ByteStore(ByteStore_MEM),
    .Mem_Wr(MemWr_MEM),
    .Addr(alu_result_MEM),
    .DataIn(real_DataIn),
    .DataOut(DataOut),

    .ext_data_wire(ext_data_wire),
    .ext_addr(ext_addr),
    .ext_byte(ext_byte),
    .ext_ce(ext_ce),
    .ext_oe(ext_oe),
    .ext_we(ext_we)
    );
    
    wire [WIDTH-1:0] DataByte;
    assign DataByte = {{24{DataOut[31]}},DataOut[31:24]};
    
    wire [WIDTH-1:0] real_DataOut;
    wire [WIDTH-1:0] DataOut_1;
    assign DataOut_1 = (ByteGet_MEM == 0)?DataOut:DataByte;
    assign real_DataOut =(last_sw_lw_WR)?last_DataIn_WR:DataOut_1;
    
    //*Forward module
    wire sw_lw=MemWr_MEM&MemtoReg_EX&(~(|(alu_result_MEM^alu_result)));
    
    wire [4:0]real_Rw_WR;
    wire [4:0]real_RegWr_WR;
    assign real_Rw_WR    = Rw_WR;
    assign real_RegWr_WR = RegWr_WR;
    wire [1:0] ALUSrcA;
    wire [1:0] ALUSrcB;
    Forward_detect forward(
    .ALUSrc(ALUSrc_EX),
    .Rs(Rs_EX),
    .Rt(Rt_EX),
    .RegWr_MEM(RegWr_MEM),
    .Rw_MEM(Rw_MEM),
    .Rw_WR(real_Rw_WR),
    .RegWr_WR(real_RegWr_WR),
    .ALUSrcA(ALUSrcA),
    .ALUSrcB(ALUSrcB)
    );
    
    //*Forward module
    
    
    wire [159:0] MEM_In;
    assign MEM_In = {sw_lw_WR,sw_lw,DataIn_WR,real_DataIn_2,RegWr_MEM,MemtoReg_MEM,alu_result_MEM,real_DataOut,Rw_MEM};
    wire [159:0] WR_Out;
    //* MEM/WR reg
    D_Trigger #(160)MEM_WR(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .clear(1'b0),
    .d(MEM_In),
    .q(WR_Out)
    );
    
    //& WR parse
    wire last_sw_lw_WR = WR_Out[136];
    wire sw_lw_WR          =WR_Out[135];
    wire [31:0] last_DataIn_WR = WR_Out [134:103];
    wire [31:0] DataIn_WR    = WR_Out[102:71];
    wire RegWr_WR            = WR_Out[70];
    wire MemtoReg_WR         = WR_Out[69];
    wire[31:0] alu_result_WR = WR_Out[68:37];
    wire[31:0] DataOut_WR    = WR_Out[36:5];
    wire[4:0] Rw_WR          = WR_Out[4:0];
    
    //* reg write data select
    assign busW=MemtoReg_WR?real_DataOut:alu_result_WR;
    //mux2to1 mux_reg_write(
    //.select(MemtoReg_WR),
    //.a(alu_result_WR),
    //.b(DataOut_WR),
    //.Result(busW)
    //);
    
    
endmodule
