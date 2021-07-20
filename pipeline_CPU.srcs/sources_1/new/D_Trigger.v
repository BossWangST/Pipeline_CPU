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


module D_Trigger#(parameter WIDTH = 32)
                 (input clk,
                  input rst,
                  input clear,
                  input en,
                  input[WIDTH-1:0] d,
                  output reg[WIDTH-1:0] q);
    
    always@(posedge clk,posedge rst)
    begin
        if (rst)
        begin
            q <= {WIDTH{1'b0}};
        end
        else if (clear)
        begin
            q <= {WIDTH{1'b0}};
        end
            else if (en)
            begin
            q <= d;
            end
        else
        begin
            q <= q;
        end
    end
endmodule
