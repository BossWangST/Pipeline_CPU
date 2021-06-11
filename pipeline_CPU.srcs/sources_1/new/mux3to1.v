module mux3to1#(parameter k = 32)
              (input[1:0] select,
                input [k-1:0]a,
                b,
                c,
                output reg [k-1:0]Result);
    always@(*)
        case(select)
            2'b00:Result = a;
            2'b01:Result = b;
            2'b10:Result = c;
        endcase
endmodule
