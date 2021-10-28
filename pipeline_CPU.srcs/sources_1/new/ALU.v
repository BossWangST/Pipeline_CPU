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
    wire[WIDTH-1:0] AorB;assign AorB = A|B;
    wire[WIDTH-1:0] AandB;assign AandB = A&B;
    wire[WIDTH-1:0] AxorB;assign AxorB = A^B;
    wire[WIDTH-1:0] LogicalResult;
    assign LogicalResult = (LOGICctr == 2'b00)?AorB:
    (LOGICctr == 2'b01)?AandB:
    AxorB;
    //mux3to1 logic_mux(
    //.select(LOGICctr),
    //.a(AorB),
    //.b(AandB),
    //.c(AxorB),
    //.Result(LogicalResult)
    //);
    
    //A B shift calculation
    //shift reg[rt]
    wire[4:0] shamt;assign shamt = A[4:0];
    wire[WIDTH-1:0] shift_B;
    assign shift_B = (SHIFTctr == 2'b00)?{
    B[0], B[1], B[2], B[3],
    B[4], B[5], B[6], B[7],
    B[8], B[9], B[10], B[11],
    B[12], B[13], B[14], B[15],
    B[16], B[17], B[18], B[19],
    B[20], B[21], B[22], B[23],
    B[24], B[25], B[26], B[27],
    B[28], B[29], B[30], B[31]
    }:B[31:0];
    wire[WIDTH-1:0] shift_result;assign shift_result = shift_B[31:0]>>shamt[4:0];
    wire[WIDTH-1:0] sra_mask;assign sra_mask = ~(32'hffff_ffff>>shamt[4:0]);
    wire[WIDTH-1:0] LeftShift;
    assign LeftShift = {
    shift_result[0], shift_result[1], shift_result[2],shift_result[3],
    shift_result[4], shift_result[5], shift_result[6],shift_result[7],
    shift_result[8], shift_result[9], shift_result[10],shift_result[11],
    shift_result[12], shift_result[13], shift_result[14],shift_result[15],
    shift_result[16], shift_result[17], shift_result[18],shift_result[19],
    shift_result[20], shift_result[21], shift_result[22],shift_result[23],
    shift_result[24], shift_result[25], shift_result[26],shift_result[27],
    shift_result[28], shift_result[29], shift_result[30],shift_result[31]
    };
    wire[WIDTH-1:0] ArithRightShift;assign ArithRightShift = ({32{B[31]}}&sra_mask)|shift_result;
    wire[WIDTH-1:0] LogicalRightShift;assign LogicalRightShift = shift_result;
    
    wire[WIDTH-1:0] LUI_result;assign LUI_result = {B[15:0],16'h0000};
    
    //reg signed [WIDTH-1:0] LeftShift        ;
    //reg signed [WIDTH-1:0] ArithRightShift  ;
    //reg signed [WIDTH-1:0] LogicalRightShift;
    //reg signed [WIDTH-1:0] Logical_B;
    //always@(*)
    //begin
    //    Logical_B         = B&32'hffff_ffff;
    //    LeftShift         = B<<left_A;
    //    ArithRightShift   = B>>left_A;
    //    LogicalRightShift = Logical_B>>>left_A;
    //end
    wire[WIDTH-1:0] ShiftResult;
    assign ShiftResult = (SHIFTctr == 2'b00)?LeftShift:
    (SHIFTctr == 2'b01)?ArithRightShift:
    LogicalRightShift;
    //mux3to1 shift_mux(
    //.select(SHIFTctr),
    //.a(LeftShift),
    //.b(ArithRightShift),
    //.c(LogicalRightShift),
    //.Result(ShiftResult)
    //);
    wire[WIDTH-1:0] Shift_Lui_result;
    assign Shift_Lui_result = LUIctr?LUI_result:ShiftResult;
    
    //A B arithmetical calculation
    wire Add_Cout;
    wire Add_Overflow;
    wire Add_Sign;
    wire [WIDTH-1:0] Add_Result;
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
    
    wire CF;
    wire OFandSign;
    
    assign CF        = SUBctr^Add_Cout;
    assign OFxorSign = Add_Overflow^Add_Sign;
    
    //slt part
    wire Less;
    wire[WIDTH-1:0] LessRes;
    
    assign Less = SIGctr?OFxorSign:CF;
    //mux2to1 mux1(
    //.select(SIGctr),
    //.a(CF),
    //.b(OFxorSign),
    //.Result(Less)
    //);
    //defparam mux1.k = 1;
    assign LessRes    = Less?32'h0000_0001:32'h0000_0000;
    //mux2to1 mux2(
    //.select(Less),
    //.a(32'h0000_0000),
    //.b(32'h0000_0001),
    //.Result(LessRes)
    //);
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
    Shift_Lui_result;
    
endmodule
