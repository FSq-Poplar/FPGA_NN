module nn_interface(CLOCK_50, KEY, PS2_CLK, PS2_DAT, VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK_N,
    VGA_SYNC_N, VGA_R, VGA_G, VGA_B, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
    input CLOCK_50;
    input[3:0] KEY;
    inout PS2_CLK, PS2_DAT;
    output VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N;
    output[9:0]	VGA_R, VGA_G, VGA_B;
    output[6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
    wire count_reset, usererase;
    wire draw, erase;
    wire[8:0] x, y;
    wire[14:0] color;
    reg[8:0] mousex, mousey, drawx, drawy;
    reg leftclick, rightclick;
    reg[3:0] count;

    assign count_reset = KEY[3];
    assign usererase = !KEY[0];

    vga_adapter VGA(count_reset, CLOCK_50, color, x, y, draw, VGA_R, VGA_G,
        VGA_B, VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
    defparam VGA.RESOLUTION = "320x240";
    defparam VGA.MONOCHROME = "FALSE";
    defparam VGA.BITS_PER_COLOUR_CHANNEL = 5;
    defparam VGA.BACKGROUND_IMAGE = "background.mif";

    mouse_tracker mouse(CLOCK_50, count_reset, 1'b1, PS2_CLK, PS2_DAT,
        mousex, mousey, rightclick, leftclick, count);
    defparam mouse.XMIN = 9'd89;
    defparam mouse.XMAX = 9'd229;
    defparam mouse.YMIN = 9'd33;
    defparam mouse.YMAX = 9'd229;
    defparam mouse.YSTART = 9'd126;
    defparam mouse.XSTART = 9'd160;

//    mod10 mod1(mousex, drawx);
//    mod14 mod2(mousey, drawy);

    io_datapath datapath(CLOCK_50, count_reset, draw, erase, mousex, mousey, x, y);

    io_control control(CLOCK_50, usererase, leftclick, draw, erase, color);
endmodule
