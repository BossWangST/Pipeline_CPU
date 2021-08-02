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

                 //?output rdn,// 读锁存信号
                 //?output wrn,// 写锁存信号
                 //?input data_ready,
                 //?input tbre,// 接收成功信号
                 //?input tsre, //发送成功信号
                 output txd,
                 input rxd,

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

    (*mark_debug = "true"*)wire uart;
    (*mark_debug = "true"*)wire uart_busy;
    wire uart_receiver_busy;
    wire read_base;//!no debug

    //base wire select
    //?wire [19:0]pc_base_addr;
    //?wire pc_base_ce,pc_base_oe,pc_base_we;
    //?wire[3:0] pc_base_byte;
    //?wire [19:0]mem_base_addr;
    //?wire mem_base_ce,mem_base_oe,mem_base_we;
    //?wire[3:0] mem_base_byte;
    
    //?assign base_addr=read_base?mem_base_addr:pc_base_addr;
    //?assign base_byte=read_base?mem_base_byte:pc_base_byte;
    //?assign base_ce=read_base?mem_base_ce:pc_base_ce;
    //?assign base_oe=read_base?mem_base_oe:pc_base_oe;
    //?assign base_we=read_base?mem_base_we:pc_base_we;

    //?wire[31:0] pc_base_data_wire;
    //?wire[31:0] mem_base_data_wire;
    //?assign base_data_wire=read_base?mem_base_data_wire:pc_base_data_wire;

    wire[19:0] physical_pc,physical_addr;
    (*mark_debug = "true"*)wire [31:0] base_DataOut; 
    wire pc_EN;
    assign pc_EN = load_use_pause&(!uart)&(!read_base)&(!read_base_MEM)&(!uart_busy)&(!uart_receiver_busy);
    PC pc(
    .clk(clk),
    .rst(rst),
    .en(pc_EN),
    .branch(branch_real),
    .Jump(Jump),
    .RUN(RUN),
    .beq_target(beq_target_real),
    .target(target_real),
    .pc_add_4(pc_add_4),
    .Inst(Inst),

    .physical_pc(physical_pc),
    .base_DataOut(base_DataOut)
    //?.uart(real_uart),

    //?.base_data_wire(base_data_wire),
    //?.base_addr(pc_base_addr),
    //?.base_byte(pc_base_byte),
    //?.base_ce(pc_base_ce),
    //?.base_oe(pc_base_oe),
    //?.base_we(pc_base_we)
    );
    wire ce,oe,we;
    //?wire uart_oe,uart_we;
    //?assign ce=uart|uart_WR;
    assign ce=1'b0;
    assign {oe,we}=2'b01;//?uart?{uart_oe,uart_we}:uart_WR?{uart_oe_ID,uart_we_ID}:2'b01;
    //?wire[31:0] real_base_datain;
    //?wire [31:0] real_DataIn_out;
    //?assign real_base_datain=uart?real_DataIn_out:uart_WR?real_DataIn_out_ID:32'h0000_0000;
    wire[3:0] byte;

    (*mark_debug = "true"*)wire [19:0] real_base_addr;
    wire[19:0] physical_addr_EX;
    assign physical_addr_EX = alu_result[21:2];
    assign real_base_addr = read_base?physical_addr_EX:physical_pc;

    //?(*mark_debug = "true"*)wire [19:0] disp_real_base_addr;
    //?assign disp_real_base_addr=real_base_addr;
    //?(*mark_debug = "true"*)wire [31:0] disp_base_DataOut;
    //?assign disp_base_DataOut=base_DataOut;
    
    base_sram_control base_control(
        .clk(clk),
        .rst(rst),
        .ce(ce),
        .oe(oe),
        .we(we),
        .datain(32'h0000_0000),
        .addr(real_base_addr),
        .byte(4'b0000),
        .dataout(base_DataOut),

        .base_data_wire(base_data_wire),
        .base_addr(base_addr),
        .base_byte(base_byte),
        .base_ce(base_ce),
        .base_oe(base_oe),
        .base_we(base_we)

        //?.rdn(rdn),
        //?.wrn(wrn),
        //?.data_ready(data_ready),
        //?.tbre(tbre),
        //?.tsre(tsre),
        //?.uart(uart|uart_WR)
    );

    wire[99:0] IF_In;
    assign IF_In = {Inst,pc_add_4};
    wire [99:0] ID_Out;
    wire IF_ID_clear = branch_real|(load_use_clear_MEM);
    //* IF/ID Reg
    wire IF_ID_EN;
    assign IF_ID_EN = load_use_pause&(!read_base)&(!uart)&(!uart_busy)&(!uart_receiver_busy);
    D_Trigger #(100)IF_ID(
    .clk(clk),
    .rst(rst),
    .en(IF_ID_EN),
    .clear(IF_ID_clear),
    .d(IF_In),
    .q(ID_Out)
    );
    
    //& ID parse
    //?wire [WIDTH-1:0] real_DataIn_out_ID = ID_Out[97:66];
    //?wire uart_oe_ID = ID_Out[65];
    //?wire uart_we_ID = ID_Out[64];
    ////wire [WIDTH-1:0] Inst_ID;

    wire [WIDTH-1:0] pc_add_4_ID;assign pc_add_4_ID = ID_Out[31:0];
    assign Inst_ID               = ID_Out[63:32];
    //assign pc_add_4_ID         = ID_Out[31:0];
    //wire[5:0] op                 = Inst_ID[31:26];
    wire[4:0] Rs;assign Rs = Inst_ID[25:21];//!no debug
    wire[4:0] Rt;assign Rt = Inst_ID[20:16];
    wire[4:0] Rd;assign Rd = Inst_ID[15:11];
    wire[15:0] imme16;assign imme16 = Inst_ID[15:0];
    wire[25:0] target;assign target = Inst_ID[25:0];
    wire[4:0] sa;assign sa = Inst_ID[10:6];
    
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
    assign load_use_clear = load_use&(!uart)&(!uart_busy);
    wire load_use;
    wire ID_EX_EN;
    assign ID_EX_EN = (!uart)&(!uart_busy)&(!uart_receiver_busy);
    D_Trigger #(170)ID_EX(
    .clk(clk),
    .rst(rst),
    .en(ID_EX_EN),
    .clear(load_use_clear),
    .d(ID_In),
    .q(EX_Out)
    );
    
    //& EX parse
    wire store_forward_EX; assign store_forward_EX = EX_Out[164];
    wire ByteStore_EX; assign ByteStore_EX = EX_Out[163];
    wire ByteGet_EX; assign ByteGet_EX = EX_Out[162];
    wire ALU_A_EX; assign ALU_A_EX = EX_Out[161];
    wire [4:0]sa_EX;assign sa_EX = EX_Out[160:156];
    wire MemRead_EX;assign MemRead_EX = EX_Out[155];
    wire [4:0]Rs_EX;assign Rs_EX = EX_Out[154:150];
    wire RegWr_EX;assign RegWr_EX = EX_Out[149];
    wire MemWr_EX;assign MemWr_EX = EX_Out[148];
    wire MemtoReg_EX;assign MemtoReg_EX = EX_Out[147];
    wire [3:0]ALUctr_EX;assign ALUctr_EX = EX_Out[146:143];
    wire ALUSrc_EX;assign ALUSrc_EX = EX_Out[142];
    wire RegDst_EX;assign RegDst_EX = EX_Out[141];
    wire [2:0]Branch_EX;assign Branch_EX = EX_Out[140:138];
    //-----------------------------
    wire [31:0]busA_EX;assign busA_EX = EX_Out[137:106];
    wire [31:0]busB_EX;assign busB_EX = EX_Out[105:74];
    wire [4:0]Rt_EX;assign Rt_EX = EX_Out[73:69];
    wire [4:0]Rd_EX;assign Rd_EX = EX_Out[68:64];
    wire [31:0]real_imme16_EX;assign real_imme16_EX = EX_Out[63:32];
    wire [31:0] pc_add_4_EX;assign pc_add_4_EX = EX_Out[31:0];

    
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
    assign load_use = MemRead_EX&((Rw == Rt)|(Rw == Rs));
    
    assign read_base=(!alu_result[22])&MemtoReg_EX;
    
    wire[127:0] EX_In;
    assign EX_In = {read_base,load_use_clear,store_forward_EX,ByteStore_EX,ByteGet_EX,RegWr_EX,MemWr_EX,MemtoReg_EX,alu_result,busB_EX,Rw};
    wire[127:0] MEM_Out;
    //* EX/MEM reg
    wire EX_MEM_EN;
    assign EX_MEM_EN = (!uart)&(!uart_busy)&(!uart_receiver_busy);
    D_Trigger #(128)EX_MEM(
    .clk(clk),
    .rst(rst),
    .en(EX_MEM_EN),
    .clear(1'b0),
    .d(EX_In),
    .q(MEM_Out)
    );
    
    //& MEM parse
    wire read_base_MEM;assign read_base_MEM = MEM_Out[76];
    wire load_use_clear_MEM;assign load_use_clear_MEM = MEM_Out[75];
    wire store_forward_MEM;assign store_forward_MEM = MEM_Out[74];
    wire ByteStore_MEM;assign ByteStore_MEM = MEM_Out[73];
    wire ByteGet_MEM;assign ByteGet_MEM = MEM_Out[72];
    wire RegWr_MEM;assign RegWr_MEM = MEM_Out[71];
    wire MemWr_MEM;assign MemWr_MEM = MEM_Out[70];
    wire MemtoReg_MEM;assign MemtoReg_MEM = MEM_Out[69];
    //wire [2:0]Branch_MEM      = MEM_Out[104:102];
    wire [31:0]alu_result_MEM;assign alu_result_MEM = MEM_Out[68:37];
    //wire Zero_MEM             = MEM_Out[69];
    wire [31:0]busB_MEM;assign busB_MEM = MEM_Out[36:5];
    //wire [31:0]beq_target_MEM = MEM_Out[36:5];
    wire [4:0]Rw_MEM;assign Rw_MEM = MEM_Out[4:0];
    
    
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


    wire uart_state_check;
    assign byte =(ByteStore_MEM==1'b0)?4'b0000:
                 ((alu_result_MEM[1:0]==2'b00)?4'b1110:
                  (alu_result_MEM[1:0]==2'b01)?4'b1101:
                  (alu_result_MEM[1:0]==2'b10)?4'b1011:
                  4'b0111);
    (*mark_debug = "true"*)wire uart_check_out;
    Mem mem(
    .clk(clk),
    .rst(rst),
    .clk_50M(clk_50M),
    .ByteStore(ByteStore_MEM),
    .Mem_Wr(MemWr_MEM),
    .Addr(alu_result_MEM),
    .DataIn(real_DataIn),
    .DataOut(DataOut),
    .MemtoReg(MemtoReg_MEM),

    .base_DataOut(base_DataOut),
    .alu_result(alu_result),
    .MemWr_EX(MemWr_EX),


    .txd(txd),
    .rxd(rxd),
    .uart(uart),
    .uart_busy_out(uart_busy),
    .uart_receiver_busy_out(uart_receiver_busy),
    .uart_check_out(uart_check_out),
    .uart_check_WR(uart_check_WR),
    //?.uart_WR(uart_WR),
    //?.uart_oe(uart_oe),
    //?.uart_we(uart_we),
    //?.real_DataIn_out(real_DataIn_out),

    .uart_state_check(uart_state_check),
    .uart_state_check_WR(uart_state_check_WR),

    .physical_addr(physical_addr),
    .read_base(read_base_WR),

    .ext_data_wire(ext_data_wire),
    .ext_addr(ext_addr),
    .ext_byte(ext_byte),
    .ext_ce(ext_ce),
    .ext_oe(ext_oe),
    .ext_we(ext_we)
    );

    //uart
    //?wire [7:0] uart_rx;
    //?reg [7:0] uart_buffer, uart_tx;
    //?wire uart_ready,uart_clear,uart_busy;
    //?reg uart_start,uart_available;

    //?//rxd_uart #(.ClkFrequency(50000000),.Baud(9600))
    //?//    uart_r(
    //?//        .clk(clk_50M),
    //?//        .RxD(rxd),
    //?//        .RxD_data_ready(uart_ready),
    //?//        .RxD_clear(uart_clear),
    //?//        .RxD_data(uart_rx)
    //?//    );

    //?txd_uart #(.ClkFrequency(50000000),.Baud(9600))
    //?    uart_t(
    //?        .clk(clk_50M),
    //?        .TxD(txd),
    //?        .TxD_busy(uart_busy),
    //?        .TxD_start(uart_start),
    //?        .TxD_data(uart_tx)
    //?    );
    //?always@(posedge clk_50M)
    //?begin
    //?    if(!uart_busy && uart_available && uart)
    //?    begin
    //?        uart_tx<=real_DataIn[7:0];
    //?        uart_start<=1;
    //?    end
    //?    else
    //?    begin
    //?        uart_start<=0;
    //?    end

    //?end




    //uart-end
    
    wire [WIDTH-1:0] DataByte;
    assign DataByte = (alu_result_WR[1:0]==2'b00)?{{24{DataOut[7]}},DataOut[7:0]}:
                      (alu_result_WR[1:0]==2'b01)?{{24{DataOut[15]}},DataOut[15:8]}:
                      (alu_result_WR[1:0]==2'b10)?{{24{DataOut[23]}},DataOut[23:16]}:
                      {{24{DataOut[31]}},DataOut[31:24]};
    
    wire [WIDTH-1:0] real_DataOut;
    wire [WIDTH-1:0] DataOut_1;
    assign DataOut_1 = ByteGet_WR?DataByte:DataOut;
    assign real_DataOut =(last_sw_lw_WR)?last_DataIn_WR:DataOut_1;
    
    //*Forward module
    wire sw_lw=MemWr_MEM&MemtoReg_EX&(~(|(alu_result_MEM^alu_result)));
    
    wire [4:0]real_Rw_WR;
    wire [4:0]real_RegWr_WR;
    assign real_Rw_WR    = Rw_WR;
    assign real_RegWr_WR = RegWr_WR;
    wire [1:0] ALUSrcA;
    wire [1:0] ALUSrcB;
    wire Forward_EN;
    assign Forward_EN = (!uart)&(!uart_busy)&(!uart_receiver_busy);
    Forward_detect forward(
    .ALUSrc(ALUSrc_EX),
    .Rs(Rs_EX),
    .Rt(Rt_EX),
    .RegWr_MEM(RegWr_MEM),
    .Rw_MEM(Rw_MEM),
    .Rw_WR(real_Rw_WR),
    .RegWr_WR(real_RegWr_WR),
    .EN(Forward_EN),
    .clk_50M(clk_50M),
    .ALUSrcA(ALUSrcA),
    .ALUSrcB(ALUSrcB)
    );
    
    //*Forward module
    
    
    wire [179:0] MEM_In;
    assign MEM_In = {uart_check_out,read_base_MEM,uart_state_check,ByteGet_MEM,sw_lw_WR,sw_lw,DataIn_WR,real_DataIn_2,RegWr_MEM,MemtoReg_MEM,alu_result_MEM,real_DataOut,Rw_MEM};
    wire [179:0] WR_Out;
    //* MEM/WR reg
    wire MEM_WR_EN;
    assign MEM_WR_EN = (!uart)&(!uart_busy)&(!uart_receiver_busy);
    D_Trigger #(180)MEM_WR(
    .clk(clk),
    .rst(rst),
    .en(MEM_WR_EN),
    .clear(1'b0),
    .d(MEM_In),
    .q(WR_Out)
    );
    
    //& WR parse
    (*mark_debug = "true"*)wire uart_check_WR;assign uart_check_WR = WR_Out[140];
    wire read_base_WR;assign read_base_WR = WR_Out[139];
    wire uart_state_check_WR;assign uart_state_check_WR= WR_Out[138];
    wire ByteGet_WR;assign ByteGet_WR  = WR_Out[137];
    wire last_sw_lw_WR;assign last_sw_lw_WR = WR_Out[136];
    wire sw_lw_WR;assign sw_lw_WR =WR_Out[135];
    wire [31:0] last_DataIn_WR;assign last_DataIn_WR= WR_Out [134:103];
    wire [31:0] DataIn_WR;assign DataIn_WR = WR_Out[102:71];
    wire RegWr_WR;assign RegWr_WR = WR_Out[70];
    wire MemtoReg_WR;assign MemtoReg_WR = WR_Out[69];
    wire[31:0] alu_result_WR;assign alu_result_WR= WR_Out[68:37];
    wire[31:0] DataOut_WR;assign DataOut_WR = WR_Out[36:5];
    wire[4:0] Rw_WR;assign Rw_WR = WR_Out[4:0];
    
    //* reg write data select
    assign busW=MemtoReg_WR?real_DataOut:alu_result_WR;
    //mux2to1 mux_reg_write(
    //.select(MemtoReg_WR),
    //.a(alu_result_WR),
    //.b(DataOut_WR),
    //.Result(busW)
    //);
    
    
endmodule
