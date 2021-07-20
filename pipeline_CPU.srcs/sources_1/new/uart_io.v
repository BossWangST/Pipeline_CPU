`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/13 15:48:01
// Design Name: 
// Module Name: uart_io
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


module uart_io(
    input clk,
    input rst,
    input oe,
    input we,
    input [7:0] datain,
    output reg[7:0] dataout,

    inout wire[31:0] base_data_wire,

    output reg rdn,// 读锁存信号
    output reg wrn,// 写锁存信号
    input data_ready,
    input tbre,// 接收成功信号
    input tsre //发送成功信号
    );

    reg[7:0] data;
    reg data_z;
    assign base_data_wire=data_z?32'bz:{24'h000000,data};

    localparam IDLE = 3'b000;
    localparam READ_START= 3'b001;
    localparam READ_END= 3'b010;
    localparam WRITE_START= 3'b011;
    localparam WRITE_END= 3'b100;
    localparam WRITE_WAIT= 3'b101;
    localparam WRITE_OK= 3'b110;

    reg[2:0] state;
    
    always@(posedge clk,posedge rst)
    begin
        if(rst)
        begin
            {rdn,wrn}<=2'b11;
            data_z<=1'b1;
            state<=IDLE;
        end
        else
        begin
            case(state)
                IDLE:
                begin
                    if(~oe)
                    begin
                        data_z<=1'b1;
                        state<=READ_START;
                    end
                    else if(~we)
                    begin
                        data_z<=1'b0;
                        data<=datain;
                        state<=WRITE_START;
                    end
                    else
                    begin
                        data_z<=1'b1;
                    end
                end

                READ_START:
                begin
                    if(oe)
                    begin
                        state<=IDLE;
                    end
                    else if(data_ready)
                    begin
                        rdn<=1'b0;//读锁存输入数据
                        state<=READ_END;
                    end
                end

                READ_END:
                begin
                    dataout<=base_data_wire[7:0];
                    rdn<=1'b1;//锁住读到的数据
                    state<=IDLE;
                end

                WRITE_START:
                begin
                    wrn<=1'b0;//写锁存输入数据
                    state<=WRITE_END;
                end

                WRITE_END:
                begin
                    wrn<=1'b1;
                    state<=WRITE_WAIT;
                end

                WRITE_WAIT:
                begin
                    if(tbre)//接收ok
                    begin
                        state<=WRITE_OK;
                    end
                end
                
                WRITE_OK:
                begin
                    if(tsre)
                    begin
                        state<=IDLE;
                    end
                end
            endcase
        end
    end
endmodule
