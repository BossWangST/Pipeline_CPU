`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/05/29 19:47:42
// Design Name:
// Module Name: Forward_detect
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


module Forward_detect(input ALUSrc,
                      input[4:0] Rs,
                      Rt,
                      input RegWr_MEM,
                      input[4:0] Rw_MEM,
                      Rw_WR,
                      input RegWr_WR,
                      output [2:0]ALUSrcA,
                      ALUSrcB);
    
    wire C1_A;
    wire C1_B;
    wire C2_A;
    wire C2_B;
    
    assign C1_A = RegWr_MEM&(|Rw_MEM)&(Rw_MEM == Rs);
    assign C1_B = RegWr_MEM&(|Rw_MEM)&(Rw_MEM == Rt);
    assign C2_A = RegWr_WR&(|Rw_WR)&(Rw_MEM != Rs)&(Rw_WR == Rs);
    assign C2_B = RegWr_WR&(|Rw_WR)&(Rw_MEM != Rt)&(Rw_WR == Rt);
    
    assign ALUSrcA = (C1_A == 1)?2'b01:
    (C2_A == 1)?2'b10:
    2'b00;
    //assign ALUSrcB = (C1_B == 1)?2'b01:
    //(C2_B == 1)?2'b10:
    //(ALUSrc == 1)?2'b11:
    //2'b00;
    assign ALUSrcB = (ALUSrc==1)?2'b11:
    (C1_B==1)?2'b01:
    (C2_B==1)?2'b10:
    2'b00; 
    endmodule
