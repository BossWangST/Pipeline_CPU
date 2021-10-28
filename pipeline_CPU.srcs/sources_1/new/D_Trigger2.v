`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/05/18 20:18:26
// Design Name:
// Module Name: D_Trigger
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


module D_Trigger2#(parameter WIDTH = 32)
                 (input clk,
                  input rst,
                  input clear,
                  input allowin,// if this reg can get the data
                  input validin,//if the datain is valid
                  output reg valid,//if the data in the reg is valid
                  input[WIDTH-1:0] d,
                  output reg[WIDTH-1:0] q);
    
    always@(posedge clk,posedge rst)
    begin
        if (rst)
        begin
            valid<=1'b0;
            q <= {WIDTH{1'b0}};
        end
        else
        begin
            if (clear)
            begin
                valid <=1'b0;
                q <= {WIDTH{1'b0}};
            end
            else if (allowin)
            begin
                valid<=validin;
            end
            if (validin & allowin)
            begin
                q <= d;
            end
        end
    end
endmodule
