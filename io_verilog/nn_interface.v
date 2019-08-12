module nn_interface(CLOCK_50, KEY, PS2_CLK, PS2_DAT, VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK_N,
    VGA_SYNC_N, VGA_R, VGA_G, VGA_B, LEDR, HEX5);
    input CLOCK_50;
    input[3:0] KEY;
    inout PS2_CLK, PS2_DAT;
    output VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N;
    output[9:0]	VGA_R, VGA_G, VGA_B;
    output[9:0] LEDR;
	 output[6:0] HEX5;
    wire count_reset, usererase;
    wire draw, erase, slow_clock;
	 wire[3:0] prediction;
    wire[8:0] x, y;
    wire[14:0] color;
	 wire[48:0] wooyer;
    reg[8:0] mousex, mousey, drawx, drawy, passx, passy;
    reg leftclick, rightclick;
    reg[3:0] count;

    assign count_reset = KEY[3];
    assign usererase = !KEY[0];
	 assign predict = !KEY[1];

    vga_adapter VGA(count_reset, CLOCK_50, color, x, y, draw, VGA_R, VGA_G,
        VGA_B, VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
    defparam VGA.RESOLUTION = "320x240";
    defparam VGA.MONOCHROME = "FALSE";
    defparam VGA.BITS_PER_COLOUR_CHANNEL = 5;
    defparam VGA.BACKGROUND_IMAGE = "background.mif";

    mouse_tracker mouse(CLOCK_50, count_reset, 1'b1, PS2_CLK, PS2_DAT,
        mousex, mousey, rightclick, leftclick, count);
    defparam mouse.XMIN = 9'd89;
    defparam mouse.XMAX = 9'd229 - 9'd10;
    defparam mouse.YMIN = 9'd33;
    defparam mouse.YMAX = 9'd229 - 9'd10;
    defparam mouse.YSTART = 9'd126;
    defparam mouse.XSTART = 9'd160;

    rate_divider slowclock(1'b1, CLOCK_50, count_reset, 28'd100, slow_clock);

    mod mod1(CLOCK_50, 5'd10, mousex - 0, drawx);
    mod mod2(CLOCK_50, 5'd14, mousey - 6, drawy);
	 mod mod3(CLOCK_50, 5'd20, mousex - 10, passx);
	 mod mod4(CLOCK_50, 5'd28, mousey - 6, passy);

    io_datapath datapath(slow_clock, count_reset, draw, erase, drawx, drawy + 6, x, y);

    io_control control(slow_clock, usererase, leftclick, draw, erase, color);

    image_decoder decoder(CLOCK_50, usererase, passx + 11, passy + 7, leftclick, wooyer);
	 
	 predict predicter(predict, wooyer, prediction);
	 
	 hex_decoder(prediction, HEX5);

    assign LEDR[9:0] = wooyer[9:0];
endmodule
