`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/26 21:46:14
// Design Name:
// Module Name: ALU
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

//* ALU module
module ALU#(parameter WIDTH = 32)
           (input [WIDTH-1:0]A,
            input [WIDTH-1:0]B,
            input [3:0]ALUctr,
            output Zero,
            output Overflow,
            output [WIDTH-1:0] Result);
    
    wire SUBctr;
    wire OVctr;
    wire SIGctr;
    wire[1:0] OPctr;
    wire LUIctr;
    wire[1:0] LOGICctr;
    wire[1:0] SHIFTctr;
    
    //ALUctr分配
    /*
     assign SUBctr   = ALUctr[2];
     assign OVctr    = (~ALUctr[1])&ALUctr[0];
     assign SIGctr   = ALUctr[0];
     assign Zeroctr  = ALUctr[2]|(~ALUctr[1]);
     assign OPctr[1] = ALUctr[2]&ALUctr[1];
     assign OPctr[0] = (~ALUctr[2])&ALUctr[1]&(~ALUctr[0]);
     */
    assign SUBctr = ALUctr[2];
    assign OVctr  = (~ALUctr[1])&ALUctr[0];
    assign SIGctr = ALUctr[0];
    assign OPctr[1] = (ALUctr == 4'b0110)?1:
    (ALUctr == 4'b0111)?1:
    (ALUctr == 4'b1000)?1:
    (ALUctr == 4'b1001)?1:
    (ALUctr == 4'b1010)?1:
    (ALUctr == 4'b1101)?1:
    0;
    assign OPctr[0] = (ALUctr == 4'b0010)?1:
    (ALUctr == 4'b1000)?1:
    (ALUctr == 4'b1001)?1:
    (ALUctr == 4'b1010)?1:
    (ALUctr == 4'b1011)?1:
    (ALUctr == 4'b1100)?1:
    (ALUctr == 4'b1101)?1:
    0;
    assign LUIctr      = (ALUctr == 4'b1101)?1:0;
    assign LOGICctr[1] = (ALUctr == 4'b1100)?1:0;
    assign LOGICctr[0] = (ALUctr == 4'b1011)?1:0;
    assign SHIFTctr[1] = (ALUctr == 4'b1010)?1:0;
    assign SHIFTctr[0] = (ALUctr == 4'b1001)?1:0;
    
    //A B logic calculation
    wire[WIDTH-1:0] AorB  = A|B;
    wire[WIDTH-1:0] AandB = A&B;
    wire[WIDTH-1:0] AxorB = A^B;
    wire[WIDTH-1:0] LogicalResult;
    mux3to1 logic_mux(
    .select(LOGICctr),
    .a(AorB),
    .b(AandB),
    .c(AxorB),
    .Result(LogicalResult)
    );
    
    //A B shift calculation
    //shift reg[rt]
    wire[WIDTH-1:0] lui_16            = 32'h0000_0010;
    wire[WIDTH-1:0] left_A            = (LUIctr == 1)?lui_16:A;
    //?wire[WIDTH-1:0] LeftShift         = B<<left_A;
    //?wire[WIDTH-1:0] ArithRightShift   = B>>>A;
    //?wire[WIDTH-1:0] LogicalRightShift = B>>A;
    
    reg signed [WIDTH-1:0] LeftShift        ;
    reg signed [WIDTH-1:0] ArithRightShift  ;
    reg signed [WIDTH-1:0] LogicalRightShift;
    reg signed [WIDTH-1:0] Logical_B;
    always@(*)
    begin
        Logical_B=B&32'hffff_ffff;
        LeftShift         = B<<left_A;       
        ArithRightShift   = B>>left_A;
        LogicalRightShift = Logical_B>>>left_A;
    end
    wire[WIDTH-1:0] ShiftResult;
    mux3to1 shift_mux(
    .select(SHIFTctr),
    .a(LeftShift),
    .b(ArithRightShift),
    .c(LogicalRightShift),
    .Result(ShiftResult)
    );
    
    //A B arithmetical calculation
    wire Add_Cout;
    wire Add_Overflow;
    wire Add_Sign;
    wire[WIDTH-1:0] Add_Result;
    wire [WIDTH-1:0] Real_B;
    
    assign Real_B = B^{WIDTH{SUBctr}};
    adder add(
    .A(A),
    .B(Real_B),
    .Cin(SUBctr),
    .Cout(Add_Cout),
    .Overflow(Add_Overflow),
    .Sign(Add_Sign),
    .Zero(Add_Zero),
    .Result(Add_Result)
    );
    
    assign Zero     = Add_Zero;// // &Zeroctr;
    assign Overflow = Add_Overflow&OVctr;
    
    wire CF;
    wire OFandSign;
    
    assign CF        = SUBctr^Add_Cout;
    assign OFxorSign = Add_Overflow^Add_Sign;
    
    //slt part
    wire Less;
    wire[WIDTH-1:0] LessRes;
    mux2to1 mux1(
    .select(SIGctr),
    .a(CF),
    .b(OFxorSign),
    .Result(Less)
    );
    defparam mux1.k = 1;
    mux2to1 mux2(
    .select(Less),
    .a(32'h0000_0000),
    .b(32'h0000_0001),
    .Result(LessRes)
    );
    /*
     mux3to1 mux3(
     .select(OPctr),
     .a(Add_Result),
     .b(AorB),
     .c(LessRes),
     .Result(Result)
     );
     */
    assign Result = (OPctr == 2'b00)?Add_Result:
    (OPctr == 2'b01)?LogicalResult:
    (OPctr == 2'b10)?LessRes:
    ShiftResult;
    
endmodule
