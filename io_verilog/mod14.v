module mod14(clock, inputy, outputy);
    input clock;
    input[7:0] inputy;
    output reg[7:0] outputy;
    reg[7:0] check;
    integer i;

    always@(posedge clock)
        begin
            for(i = 1; i < 15; i = i + 1)
                begin
                    if(i == 1) check <= inputy - 6;
                    else if(check > 14) check <= check - 14;
                    else outputy <= inputy - check;
                end
        end
endmodule
