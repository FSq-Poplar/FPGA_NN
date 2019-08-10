module mod10(clock, inputx, outputx);
    input clock;
    input[7:0] inputx;
    output reg[7:0] outputx;
    reg[7:0] check;
    integer i;

    always@(posedge clock)
        begin
            for(i = 1; i < 15; i++)
                begin
                    if(i == 1) check <= inputx;
                    else if(check > 10) check <= check - 10;
                    else outputx <= inputx - check;
                end
        end
endmodule
