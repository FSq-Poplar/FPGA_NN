module modulo(quotient, divisor, remainder);
    input[7:0] quotient;
    input[4:0] divisor;
    output[4:0] remainder;
    reg[7:0] reduction = 1'b0;

    always @(*) begin
        while (reduction > divisor) begin
            if(reduction == 0) reduction <= quotient;
            else reduction <= reduction - divisor;
        end
    end

    assign remainder = reduction;
endmodule
