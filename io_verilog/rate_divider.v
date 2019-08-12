module rate_divider(enable, clock, clear, maximum, out);
    input enable, clock, clear;
    input[27:0] maximum;
    output reg out;
    reg[27:0] counter;

    always @(posedge clock, negedge clear)
        begin
            if(clear == 1'b0)
                begin
                    out <= 1'b0;
                    counter <= 28'b0;
                end
            else if(enable == 1'b1)
                begin
                    if(counter == maximum)
                        begin
                            out <= 1'b1;
                            counter <= 28'b0;
                        end
                    else
                        begin
                            out <= 1'b0;
                            counter <= counter+ 1'b1;
                        end
                end
        end
endmodule
