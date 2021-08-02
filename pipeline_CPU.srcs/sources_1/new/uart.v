`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/30 14:41:37
// Design Name: 
// Module Name: txd_uart
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


module txd_uart(
    input wire clk,
    input wire TxD_start,
    input wire [7:0] TxD_data,
    output wire TxD,
    output wire TxD_busy
    );
parameter ClkFrequency = 25000000;	// 25MHz
parameter Baud = 115200;

wire tick;
TickGen #(ClkFrequency,Baud) tickgen(
    .clk(clk),
    .enable(TxD_busy),
    .tick(tick)
);

reg [3:0] TxD_state = 0;
wire TxD_ready = (TxD_state == 0);
assign TxD_busy = ~TxD_ready;

reg [7:0] TxD_shift = 0;
always@(posedge clk)
begin
    if(TxD_ready & TxD_start)
        TxD_shift<=TxD_data;
    else
    if(TxD_state[3] & tick)
        TxD_shift<=(TxD_shift>>1);

    case(TxD_state)
		4'b0000: if(TxD_start) TxD_state <= 4'b0100;
		4'b0100: if(tick) TxD_state <= 4'b1000;  // start bit
		4'b1000: if(tick) TxD_state <= 4'b1001;  // bit 0
		4'b1001: if(tick) TxD_state <= 4'b1010;  // bit 1
		4'b1010: if(tick) TxD_state <= 4'b1011;  // bit 2
		4'b1011: if(tick) TxD_state <= 4'b1100;  // bit 3
		4'b1100: if(tick) TxD_state <= 4'b1101;  // bit 4
		4'b1101: if(tick) TxD_state <= 4'b1110;  // bit 5
		4'b1110: if(tick) TxD_state <= 4'b1111;  // bit 6
		4'b1111: if(tick) TxD_state <= 4'b0010;  // bit 7
		4'b0010: if(tick) TxD_state <= 4'b0000;  // stop1
		default: if(tick) TxD_state <= 4'b0000;
    endcase

end
assign TxD=(TxD_state<4)|(TxD_state[3] & TxD_shift[0]);

endmodule

module rxd_uart(
    input wire clk,
    input wire RxD,
    output reg RxD_data_ready,
    input wire RxD_clear,
    output reg [7:0] RxD_data
);

parameter ClkFrequency = 25000000;
parameter Baud = 115200;

parameter Oversampling = 8;

wire RxD_idle;
reg RxD_endofpacket;

reg[3:0] RxD_state = 0;
wire tick;
TickGen #(ClkFrequency,Baud,Oversampling) tickgen(
    .clk(clk),
    .enable(1'b1),
    .tick(tick)
);

reg [1:0] RxD_sync = 2'b11;
always @(posedge clk)
    if(tick)
        RxD_sync <= {RxD_sync[0],RxD};
reg[1:0] Filter_cnt = 2'b11;
reg RxD_bit = 1'b1;

always @(posedge clk)
    if(tick)
        begin
	        if(RxD_sync[1]==1'b1 && Filter_cnt!=2'b11) Filter_cnt <= Filter_cnt + 1'd1;
	        else 
	        if(RxD_sync[1]==1'b0 && Filter_cnt!=2'b00) Filter_cnt <= Filter_cnt - 1'd1;

	        if(Filter_cnt==2'b11) RxD_bit <= 1'b1;
	        else
	        if(Filter_cnt==2'b00) RxD_bit <= 1'b0;
        end

function integer log2(input integer v); 
    begin 
        log2=0; 
        while(v>>log2) 
            log2=log2+1; 
    end 
endfunction

localparam l2o = log2(Oversampling);
reg [l2o-2:0] OversamplingCnt = 0;
always @(posedge clk) 
    if(tick) 
        OversamplingCnt <= (RxD_state==0) ? 1'd0 : OversamplingCnt + 1'd1;    

wire sampleNow = tick && (OversamplingCnt==Oversampling/2-1);

always @(posedge clk)
    case(RxD_state)
	    4'b0000: if(~RxD_bit) RxD_state <=  4'b0001;  // start bit found?
	    4'b0001: if(sampleNow) RxD_state <= 4'b1000;  // sync start bit to sampleNow
	    4'b1000: if(sampleNow) RxD_state <= 4'b1001;  // bit 0
	    4'b1001: if(sampleNow) RxD_state <= 4'b1010;  // bit 1
	    4'b1010: if(sampleNow) RxD_state <= 4'b1011;  // bit 2
	    4'b1011: if(sampleNow) RxD_state <= 4'b1100;  // bit 3
	    4'b1100: if(sampleNow) RxD_state <= 4'b1101;  // bit 4
	    4'b1101: if(sampleNow) RxD_state <= 4'b1110;  // bit 5
	    4'b1110: if(sampleNow) RxD_state <= 4'b1111;  // bit 6
	    4'b1111: if(sampleNow) RxD_state <= 4'b0010;  // bit 7
	    4'b0010: if(sampleNow) RxD_state <= 4'b0000;  // stop bit
	    default: RxD_state <= 4'b0000;
    endcase

always @(posedge clk)
if(sampleNow && RxD_state[3]) 
    RxD_data <= {RxD_bit, RxD_data[7:1]};

always @(posedge clk)
begin
	if(RxD_clear)
		RxD_data_ready <= 0;
	else
		RxD_data_ready <= RxD_data_ready | (sampleNow && RxD_state==4'b0010 && RxD_bit);  // make sure a stop bit is received
end

reg [l2o+1:0] GapCnt = 0;
always @(posedge clk) 
    if (RxD_state!=0) 
        GapCnt<=0; 
    else if(tick & ~GapCnt[log2(Oversampling)+1]) 
        GapCnt <= GapCnt + 1'h1;

assign RxD_idle = GapCnt[l2o+1];
always @(posedge clk) 
    RxD_endofpacket <= tick & ~GapCnt[l2o+1] & &GapCnt[l2o:0];

endmodule

module TickGen(
    input wire clk,enable,
    output wire tick
);

parameter ClkFrequency = 25000000;
parameter Baud = 115200;
parameter Oversampling = 1;

function integer log2(input integer v); 
    begin 
        log2=0; 
        while(v>>log2) 
            log2=log2+1; 
    end 
endfunction

localparam AccWidth = log2(ClkFrequency/Baud)+8;  // +/- 2% max timing error over a byte

reg [AccWidth:0] Acc = 0;
localparam ShiftLimiter = log2(Baud*Oversampling >> (31-AccWidth));  // this makes sure Inc calculation doesn't overflow
localparam Inc = ((Baud*Oversampling << (AccWidth-ShiftLimiter))+(ClkFrequency>>(ShiftLimiter+1)))/(ClkFrequency>>ShiftLimiter);
always @(posedge clk) 
    if(enable) 
        Acc <= Acc[AccWidth-1:0] + Inc[AccWidth:0]; 
    else 
        Acc <= Inc[AccWidth:0];
assign tick = Acc[AccWidth];

endmodule