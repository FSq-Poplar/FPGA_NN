module nn_interface(CLOCK, KEY, PS2_CLK, PS2_DAT, VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK_N,
    VGA_SYNC_N, VGA_R, VGA_G, VGA_B, colour, xdraw, ydraw, resetn, writeEn, mousex, mousey,
    leftclick, rightclick, count);
    input CLOCK;
    input[3:0] KEY;
    inout PS2_CLK, PS2_DAT;
    output VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N;
    output[9:0]	VGA_R, VGA_G, VGA_B;
    wire[14:0] colour;
    wire[7:0] xdraw;
    wire[6:0] ydraw;
    wire resetn, writeEn;
    reg[8:0] mousex, mousey;
    reg leftclick, rightclick;
    reg[3:0] count;

    assign resetn = KEY[0];

    vga_adapter VGA(resetn, CLOCK, colour, x, y, writeEn, VGA_R, VGA_G,
        VGA_B, VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
    defparam VGA.RESOLUTION = "320x240";
    defparam VGA.MONOCHROME = "FALSE";
    defparam VGA.BITS_PER_COLOUR_CHANNEL = 5;
    defparam VGA.BACKGROUND_IMAGE = "background.mif";

    PS2_Mouse_Controller mouse(CLOCK, resetn, 1'b1, PS2_CLK, PS2_DAT,
        mousex, mousey, rightclick, leftclick, count);
    defparam mouse.XMIN = 9'd86;
    defparam mouse.XMAX = 9'd233;
    defparam mouse.YMIN = 9'd12;
    defparam mouse.YMAX = 9'd239;

    interface_datapath_control master(resetn, CLOCK, leftclick, mousex,
        mousey, xdraw, ydraw, colour, writeEn);
    defparam master.drawcolour = 15'b111111111111111;
    defparam master.pixelx = 6'd10;
    defparam master.pixely = 6'd14;
endmodule
