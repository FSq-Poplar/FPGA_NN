module mod(clock, div, inputval, outputval);
    input clock;
    input[4:0] div;
    input[7:0] inputval;
    output reg[7:0] outputval;
    reg[7:0] check;
    reg update = 1;

    always@(posedge clock) begin
        if(update)
            check <= inputval + 1;
        else if(check >= div)
            check <= check - div;
        if(check < div)
            outputval <= inputval - check;
        update <= (check < div) ? 1 : 0;
    end
endmodule
