module mod(clock, div, inputval, outputval);
    input clock;
    input[4:0] div;
    input[7:0] inputval;
    output reg[7:0] outputval;
    reg[7:0] check, origval;
    reg update = 1;

    always@(posedge clock) begin
        if(update) begin
            check <= inputval + 1;
            origval <= inputval; end
        else if(check >= div)
            check <= check - div;
        if(check < div)
            outputval <= origval - check;
        update <= (check < div) ? 1 : 0;
    end
endmodule
