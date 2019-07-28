module interface_datapath_control(resetn, CLOCK, leftclick, mousex, mousey, xdraw, ydraw, colour, writeEn);
    input resetn, CLOCK, leftclick;
    input[8:0] mousex, mousey;
    output[7:0] xdraw;
    output[6:0] ydraw;
    output[14:0] colour;
    output writeEn;
    reg drawing;
    reg[7:0] xdrawing; reg[6:0] ydrawing;
    reg[4:0] xcounter, ycounter;
    reg dummy;
    wire xclock;

    parameter drawcolour = 15'b111111111111111, pixelx = 6'd10, pixely = 6'd14;

    assign colour = drawcolour;

    modulo mod10(mousex, pixelx, xchange);
    modulo mod14(mousey - 6'd34, pixely, ychange);
    counter xcounter(CLOCK, resetn, pixelx, xdraw, xclock);
    counter ycounter(xclock, resetn, pixely, ydraw, dummy);

    always @(posedge CLOCK) begin
        if (!resetn) begin
            drawing = 1'b0;
            writeEn = 1'b0;
        end else if (drawing) begin
            writeEn = 1'b1;
            if (xdraw == pixelx && ydraw == pixely) drawing = 1'b0;
        end else if (leftclick) begin
            drawing <= 1'b1;
            xdrawing <= mousex[7:0] - xchange;
            ydrawing <= mousey[6:0] - ychange;
        end
    end
endmodule
