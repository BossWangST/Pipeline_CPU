`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/06/10 13:35:57
// Design Name:
// Module Name: sram_control
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


module base_sram_control(input clk,
                    input rst,
                    input ce,
                    input oe,
                    input we,
                    input[31:0] datain,
                    input[31:0] addr,
                    input[3:0] byte,
                    output reg[31:0] dataout,

                    inout wire[31:0] base_data_wire,
                    output reg[19:0] base_addr,
                    output wire[3:0] base_byte,
                    output wire base_ce,
                    output reg base_oe,
                    output reg base_we

                    //?input uart,
                    //?output reg rdn,// 读锁存信号
                    //?output reg wrn,// 写锁存信号
                    //?input data_ready,
                    //?input tbre,// 接收成功信号
                    //?input tsre
                    
                    );
    
    assign base_byte = byte;
    
    assign base_ce= ce;
    //* ce = 1 --> ext; ce = 0 --> base
    //! LOW VALID
    
    reg data_z;

    //?reg[7:0] data;
    //* provide High Z state for reading; --> data_z = 1 == > read;
    //! HIGH Z --> READ
    reg[31:0] base_datain;
    //?assign base_data_wire = data_z?32'bz:uart?{24'h0,data}:base_datain;
    assign base_data_wire = data_z?32'bz:base_datain;
    
    localparam IDLE        = 4'b0000;
    localparam READ_START  = 4'b0001;
    localparam READ_END    = 4'b0010;
    localparam WRITE_START = 4'b0011;
    localparam WRITE_END   = 4'b0100;
    //?localparam UART_IDLE = 4'b1000;
    //?localparam UART_READ_START= 4'b1001;
    //?localparam UART_READ_END= 4'b1010;
    //?localparam UART_WRITE_START= 4'b1011;
    //?localparam UART_WRITE_END= 4'b1100;
    //?localparam UART_WRITE_WAIT= 4'b1101;
    //?localparam UART_WRITE_OK= 4'b1110;
    
    reg[3:0] state = IDLE;
    
    always@(posedge clk or posedge rst)
    begin
        if (rst)
        begin
            state            <= IDLE;
            base_we <= 1'b1;
            base_oe<= 1'b1;
            base_addr        <= 20'h00000;
            dataout          <= 32'h00000000;
            data_z           <= 1'b1;
            //?{rdn,wrn}<=2'b11;

        end
        else
        begin
            //?if(uart)
            //?begin
            //?case(state)
            //?    UART_IDLE:
            //?    begin
            //?        if(~oe)
            //?        begin
            //?            data_z<=1'b1;
            //?            state<=UART_READ_START;
            //?        end
            //?        else if(~we)
            //?        begin
            //?            data_z<=1'b0;
            //?            data<=datain;
            //?            state<=UART_WRITE_START;
            //?        end
            //?        else
            //?        begin
            //?            data_z<=1'b1;
            //?        end
            //?    end

            //?    UART_READ_START:
            //?    begin
            //?        if(oe)
            //?        begin
            //?            state<=UART_IDLE;
            //?        end
            //?        else if(data_ready)
            //?        begin
            //?            rdn<=1'b0;//读锁存输入数据
            //?            state<=UART_READ_END;
            //?        end
            //?    end

            //?    UART_READ_END:
            //?    begin
            //?        dataout<=base_data_wire[7:0];
            //?        rdn<=1'b1;//锁住读到的数据
            //?        state<=UART_IDLE;
            //?    end

            //?    UART_WRITE_START:
            //?    begin
            //?        wrn<=1'b0;//写锁存输入数据
            //?        state<=UART_WRITE_END;
            //?    end

            //?    UART_WRITE_END:
            //?    begin
            //?        wrn<=1'b1;
            //?        state<=UART_WRITE_WAIT;
            //?    end

            //?    UART_WRITE_WAIT:
            //?    begin
            //?        if(tbre)//接收ok
            //?        begin
            //?            state<=UART_WRITE_OK;
            //?        end
            //?    end
            //?    
            //?    UART_WRITE_OK:
            //?    begin
            //?        if(tsre)
            //?        begin
            //?            state<=UART_IDLE;
            //?        end
            //?    end
            //?endcase

            //?end
            //?else
            //?begin
            case(state)
                IDLE:
                begin
                    if (~we||~oe)//* read or write enable. give addr
                    begin
                        base_addr <= addr;
                    end
                    if (~we)//* write
                    begin
                        state       <= WRITE_START;
                        base_datain <= datain;
                        data_z      <= 1'b0;//* datain, write
                    end
                    else if (~oe)//* read
                    begin
                        state  <= READ_START;
                        data_z <= 1'b1;//* High Z, read
                    end
                 end
                 READ_START:
                 begin
                    state <= READ_END;
                    base_oe = 1'b0;//* oe valid, read
                 end
                 READ_END:
                 begin
                    if (oe)//* stop reading signal
                    begin
                       state<=IDLE;
                       base_oe = 1'b1;//* stop reading 
                    end
                    else
                    begin
                        dataout<=base_data_wire;
                        base_addr<=addr;
                    end
                 end
                WRITE_START:
                begin
                    state<=WRITE_END;
                    base_we<=1'b0;//* write
                end
                WRITE_END:
                begin
                    state<=IDLE;
                    base_we<=1'b1;//* stop writing
                end
            endcase
            //?end
        end
    end
            
endmodule
