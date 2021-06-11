module adder(input [31:0] A,B,input Cin,output Cout,Overflow,Sign,output reg Zero,output [31:0] Result);
	parameter n=32;
	assign {Cout,Result}=A+B+Cin;
	always@(*)
		if(Result==0)
			Zero=1;
		else
			Zero=0;
	assign Overflow=(A[n-1]&B[n-1]&(~Result[n-1]))|((~A[n-1])&(~B[n-1])&Result[n-1]);
	assign Sign=Result[n-1];
endmodule
