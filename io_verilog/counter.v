module counter(CLOCK, resetn, max, out, over);
    input CLOCK, resetn;
    input[4:0] max;
    output reg over;
    output reg[4:0] out;

    always @(posedge CLOCK) begin
        if (!resetn) begin
            out <= 1'b0;
            over <= 1'b0;
        end
        else if (out == max) begin
            out <= 1'b0;
            over <= 1'b1;
        end
        else begin
            out <= out + 1'b1;
            over <= 1'b0;
        end
    end
endmodule
