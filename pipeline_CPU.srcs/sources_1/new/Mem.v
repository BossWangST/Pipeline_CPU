`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/05/01 17:38:48
// Design Name:
// Module Name: Mem
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


module Mem(input Mem_Wr,
           input ByteStore,
           input [31:0] Addr,
           input [31:0] DataIn,
           input clk,
           input clk_50M,

           input [31:0]base_DataOut,
           output [31:0] DataOut,
           input rst,
           input MemtoReg,

           input read_base,
           output [19:0] physical_addr,

           //?inout wire[31:0] base_data_wire,
           //?output wire[19:0] base_addr,
           //?output wire[3:0] base_byte,
           //?output wire base_ce,              //* select enable, select base ram or ext ram
           //?output wire base_oe,               //* read enable
           //?output wire base_we,

           output uart,
           output uart_busy_out,
           //?output uart_oe,uart_we,
           //?output [3:0]out_byte,
           //?output [31:0] real_DataIn_out,

           input rxd,
           output txd,
           //?output rdn,// 读锁存信号
           //?output wrn,// 写锁存信号
           //?input data_ready,
           //?input tbre,// 接收成功信号
           //?input tsre, //发送成功信号
           output uart_state_check,
           input uart_state_check_WR,

           inout wire[31:0] ext_data_wire,
           output wire[19:0] ext_addr,
           output wire[3:0] ext_byte,
           output wire ext_ce,              //* select enable, select base ram or ext ram
           output wire ext_oe,               //* read enable
           output wire ext_we
           );
    
    //wire[31:0] Addr_0,Addr_1,Addr_2,Addr_3;
    //assign Addr_0 = Addr;
    //assign Addr_1 = Addr+1;
    //assign Addr_2 = Addr+2;
    //assign Addr_3 = Addr+3;
    localparam IDLE=2'b00;
    localparam UART_START = 2'b01;
    localparam UART_END = 2'b10;
    reg [1:0] state = IDLE;
    //?always@(posedge clk_50M)
    //?    case(state)
    //?        IDLE:
    //?        begin
    //?            uart<=1'b0;
    //?            if(Addr==32'hBFD003F8)
    //?                state <= UART_START;
    //?        end
    //?        UART_START:
    //?        begin
    //?            uart<=1'b1;
    //?            state<=UART_END;
    //?        end
    //?        UART_END:
    //?        begin
    //?            if(uart_busy)
    //?                state<=IDLE;
    //?        end
    //?    endcase

            
    assign uart=(Addr==32'hBFD003F8)?1'b1:1'b0;
    wire ce;
    wire oe,we;
    assign ce=1'b0;
    assign {oe,we}=(Mem_Wr==1'b1)?2'b10:2'b01;


    //?wire uart_oe,uart_we;
    //assign {uart_oe,uart_we}=uart?{oe,we}:2'b11;
    //?assign uart_oe=(uart|uart_WR)?oe:1'b1;
    //?assign uart_we=(uart|uart_WR)?we:1'b1;
    wire[3:0] byte;
    assign byte =(ByteStore==1'b0)?4'b0000:
                 ((Addr[1:0]==2'b00)?4'b1110:
                  (Addr[1:0]==2'b01)?4'b1101:
                  (Addr[1:0]==2'b10)?4'b1011:
                  4'b0111);

    //wire[31:0] temp;
    wire[31:0] real_DataIn;
    assign real_DataIn = (ByteStore==1'b0)?DataIn:
                         {4{DataIn[7:0]}};
    //?assign real_DataIn_out = real_DataIn;

    //wire[19:0] physical_addr=Addr[21:2];
    assign physical_addr=Addr[21:2];

    wire base_or_ext;
    assign base_or_ext=Addr[22];//1->ext, 0->base
    //wire uart_state_check;
    assign uart_state_check=(Addr==32'hBFD003FC)?1'b1 : 1'b0;
    
    //?(*mark_debug = "true"*)wire disp_uart_state_check;
    //?assign disp_uart_state_check=uart_state_check;
    //?(*mark_debug = "true"*)wire[1:0] state;
    //?assign state={tbre,tsre};
    //?assign read_base=(!base_or_ext)&MemtoReg;


    wire[31:0] ext_DataOut;
    //?wire[31:0] base_DataOut;
    //wire[7:0] uart_DataOut;
    ext_sram_control ext_control(
        .clk(clk_50M),
        .rst(rst),
        .ce(ce),
        .oe(oe),
        .we(we),
        .datain(real_DataIn),
        .addr(physical_addr),
        .byte(byte),
        .dataout(ext_DataOut),

        .ext_data_wire(ext_data_wire),
        .ext_addr(ext_addr),
        .ext_byte(ext_byte),
        .ext_ce(ext_ce),
        .ext_oe(ext_oe),
        .ext_we(ext_we)
    );

    //?base_sram_control base_control(
    //?    .clk(clk),
    //?    .rst(rst),
    //?    .ce(ce),
    //?    .oe(oe),
    //?    .we(we),
    //?    .datain(32'h0000_0000),
    //?    .addr(physical_addr),
    //?    .byte(byte),
    //?    .dataout(base_DataOut),

    //?    .base_data_wire(base_data_wire),
    //?    .base_addr(base_addr),
    //?    .base_byte(base_byte),
    //?    .base_ce(base_ce),
    //?    .base_oe(base_oe),
    //?    .base_we(base_we)
    //?);
    //?wire uart_rdn,uart_wrn;
    //?//assign {rdn,wrn}=uart?{uart_rdn,uart_wrn}:2'bz;
    //?assign rdn=(uart|uart_WR)?uart_rdn:1'bz;
    //?assign wrn=(uart|uart_WR)?uart_wrn:1'bz;
    //?wire [31:0]uart_data_wire;
    //?assign base_data_wire=(uart|uart_WR)?uart_data_wire:32'bz;
    //?uart_io uart_io(
    //?    .clk(clk),
    //?    .rst(rst),
    //?    .oe(uart_oe),
    //?    .we(uart_we),
    //?    .datain(real_DataIn[7:0]),
    //?    .dataout(uart_DataOut),
    //?    .base_data_wire(base_data_wire),
    //?    .rdn(uart_rdn),
    //?    .wrn(uart_wrn),
    //?    .data_ready(data_ready),
    //?    .tbre(tbre),
    //?    .tsre(tsre)
    //?);

    //?uart?{24'h000_000,base_DataOut[7:0]}:
    wire [7:0] uart_rx;
    reg [7:0] uart_buffer, uart_tx;
    wire uart_ready,uart_clear,uart_busy;
    reg uart_start,uart_available;
    assign uart_busy_out = uart_busy;

    //rxd_uart #(.ClkFrequency(50000000),.Baud(9600))
    //    uart_r(
    //        .clk(clk_50M),
    //        .RxD(rxd),
    //        .RxD_data_ready(uart_ready),
    //        .RxD_clear(uart_clear),
    //        .RxD_data(uart_rx)
    //    );

    txd_uart #(.ClkFrequency(50000000),.Baud(9600))
        uart_t(
            .clk(clk_50M),
            .TxD(txd),
            .TxD_busy(uart_busy),
            .TxD_start(uart_start),
            .TxD_data(uart_tx)
        );
    
    always@(posedge clk_50M)
    begin
        if(!uart_busy && uart)
        begin
            uart_tx<=real_DataIn[7:0];
            uart_start<=1;
        end
        else
        begin
            uart_start<=0;
        end

    end
    assign DataOut=uart_state_check_WR?32'h0000_0003:
                   read_base?base_DataOut:ext_DataOut;
    //Inst_mem_0 memory(
    //    .clk(clk),
    //    .a(physical_addr),
    //    .we(Mem_Wr),
    //    .d(DataIn),
    //    .spo(DataOut)
    //);

    //async_mem mem_0(
    //.clk(clk),
    //.a(Addr_0[7:0]),
    //.we(Mem_Wr),
    //.d(DataIn[7:0]),
    //.spo(DataOut[7:0])
    //);
    
    //async_mem mem_1(
    //.clk(clk),
    //.a(Addr_1[7:0]),
    //.we(Mem_Wr&(!ByteStore)),
    //.d(DataIn[15:8]),
    //.spo(DataOut[15:8])
    //);
    
    //async_mem mem_2(
    //.clk(clk),
    //.a(Addr_2[7:0]),
    //.we(Mem_Wr&(!ByteStore)),
    //.d(DataIn[23:16]),
    //.spo(DataOut[23:16])
    //);
    
    //async_mem mem_3(
    //.clk(clk),
    //.a(Addr_3[7:0]),
    //.we(Mem_Wr&(!ByteStore)),
    //.d(DataIn[31:24]),
    //.spo(DataOut[31:24])
    //);
endmodule
