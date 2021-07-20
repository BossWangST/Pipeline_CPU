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
           output [31:0] DataOut,
           input rst,

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
    
    wire uart=(Addr[31]&Addr[29]&Addr[28]&Addr[27]&
               Addr[26]&Addr[25]&Addr[24]&Addr[23]&
               Addr[22]&Addr[20]&Addr[9]&Addr[8]&
               Addr[7]&Addr[6]&Addr[5]&Addr[4]&
               Addr[3])&((!Addr[2])|(!Addr[1]));
    wire ce;
    wire oe,we;
    assign ce=uart?1'b1:1'b0;
    assign {oe,we}=(Mem_Wr==1'b1)?2'b10:2'b01;
    wire[3:0] byte;
    assign byte =(ByteStore==1'b0)?4'b0000:
                 ((Addr[1:0]==2'b00)?4'b1110:
                  (Addr[1:0]==2'b01)?4'b1101:
                  (Addr[1:0]==2'b10)?4'b1011:
                  4'b0111);

    //wire[31:0] temp;
    wire[31:0] real_datain;
    assign real_datain = (ByteStore==1'b0)?DataIn:
                         {4{DataIn[7:0]}};

    wire[19:0] physical_addr=Addr[21:2];
    
    wire[31:0] sram_DataOut;
    wire[7:0] uart_DataOut;
    ext_sram_control ext_control(
        .clk(clk_50M),
        .rst(rst),
        .ce(ce),
        .oe(oe),
        .we(we),
        .datain(real_DataIn),
        .addr(physical_addr),
        .byte(4'b0000),
        .dataout(sram_DataOut),

        .ext_data_wire(ext_data_wire),
        .ext_addr(ext_addr),
        .ext_byte(ext_byte),
        .ext_ce(ext_ce),
        .ext_oe(ext_oe),
        .ext_we(ext_we)
    );

    uart_io uart_io(
        .clk(clk),
        .rst(rst),
        .oe(oe),
        .we(we),
        .datain(real_DataIn[7:0]),
        .dataout(uart_DataOut),

        .
    )

    assign DataOut=uart?{24'h000_000,uart_DataOut}:sram_DataOut;
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
