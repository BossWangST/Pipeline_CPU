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


module ext_sram_control(input clk,
                    input rst,
                    input ce,
                    input oe,
                    input we,
                    input[31:0] datain,
                    input[31:0] addr,
                    input[3:0] byte,
                    output reg[31:0] dataout,

                    inout wire[31:0] ext_data_wire,
                    output reg[19:0] ext_addr,
                    output wire[3:0] ext_byte,
                    output wire ext_ce,
                    output reg ext_oe,
                    output reg ext_we
                    );
    
    assign ext_byte = byte;
    
    assign ext_ce= ce;
    //* ce = 1 --> ext; ce = 0 --> ext
    //! LOW VALID
    
    reg data_z;
    //* provide High Z state for reading; --> data_z = 1 == > read;
    //! HIGH Z --> READ
    reg[31:0] ext_datain;
    assign ext_data_wire = data_z?32'bz:ext_datain;
    
    localparam IDLE        = 3'b000;
    localparam READ_START  = 3'b001;
    localparam READ_END    = 3'b010;
    localparam WRITE_START = 3'b011;
    localparam WRITE_END   = 3'b100;
    
    reg[2:0] state = IDLE;
    
    always@(posedge clk or posedge rst)
    begin
        if (rst)
        begin
            state            <= IDLE;
            ext_we <= 1'b1;
            ext_oe<= 1'b1;
            ext_addr        <= 20'h00000;
            dataout          <= 32'h00000000;
            data_z           <= 1'b1;
        end
        else
        begin
            case(state)
                IDLE:
                begin
                    if (~we||~oe)//* read or write enable. give addr
                    begin
                        ext_addr <= addr;
                    end
                    if (~we)//* write
                    begin
                        state       <= WRITE_START;
                        ext_datain <= datain;
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
                    ext_oe <= 1'b0;//* oe valid, read
                    state <= READ_END;
                 end
                 READ_END:
                 begin
                    if (oe)//* stop reading signal
                    begin
                       ext_oe <= 1'b1;//* stop reading 
                       state<=IDLE;
                    end
                    else
                    begin
                        dataout<=ext_data_wire;
                        ext_addr<=addr;
                    end
                 end
                WRITE_START:
                begin
                    ext_oe<=1'b1;
                    ext_we<=1'b0;//* write
                    state<=WRITE_END;
                end
                WRITE_END:
                begin
                    ext_oe<=1'b0;
                    ext_we<=1'b1;//* stop writing
                    data_z<=1'b1;
                    state<=IDLE;
                end
            endcase
        end
    end
            
endmodule
