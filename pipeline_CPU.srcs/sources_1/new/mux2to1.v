module mux2to1#(parameter k = 32)
               (input select,
                input [k-1:0]a,
                b,
                output reg[k-1:0]Result);
    
    always@(*)
    begin
        if (select == 0)
        begin
            Result = a;
        end
        else
        begin
            Result = b;
        end
    end
endmodule
