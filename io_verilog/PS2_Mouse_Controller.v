/**
 * #############
 * INSTRUCTIONS
 * #############
 *
 * This file contains modules that provide a high-level interface for
 * a PS/2 mouse, outputting the mouse's current X and Y position in 9 bits,
 * and left/right click signal. The origin (0, 0) is set at the top-left
 * corner of the screen. A position (X, Y) is X pixels to the right and
 * Y pixels down from the origin. Coordinate widths support up to 1023 pixel
 * resolutions in both dimensions.
 *
 * The modules contained in this file are designed for, and were tested on,
 * a DE1_SoC FPGA board. Be warned that performance is not guaranteed on
 * other boards.
 *
 * An additional test module has been provided to ensure the mouse controller
 * works properly. It is recommended to load the test module onto the board
 * before incorporating the mouse controller into any design.
 * See documentation for the mouse_interface_test module for more details.
 *
 *
 * #############################
 * RESOLUTION AND RANGE OPTIONS
 * #############################
 *
 * To limit the controller to operate in smaller dimensions, max X and Y
 * coordinate parameters have been provided. These can be set as follows:
 *
 * defparam XMAX 9'd319
 * defparam YMAX 9'b239
 *
 * Where the defparam statement can be placed in a module you define, near
 * the mouse controller module's instantiation. This particular example
 * sets the mouse to operate on a 320x240 pixel screen. Note that the values
 * set as the parameters must be one less than the actual screen width.
 * Specifing limits is necessary for both coordinates. If no defparam
 * statements are made, the controller will default to 160x120 resolution.
 *
 * In case the mouse is meant to operate inside a box and should not be
 * allowed to reach the edge of the screen, additional XMIN and YMIN
 * parameters have been provided. These can be defined in the same way as
 * XMAX and YMAX.
 * For example, suppose a mouse controller is instantiated as follows:
 *
 * mouse_tracker my_module(
 *                   ...
 *                   inputs/outputs
 *                   ...
 *                   );
 * 
 * To work with 320x240 screen resolution and prevent the mouse from being
 * within 5 pixels of the edge of the screen, write the following lines after
 * the module instantiation:
 *
 * defparam my_module.XMAX = 324,
 *          my_module.YMAX = 114,
 *          my_module.XMIN = 5,
 *          my_module.YMIN = 5;
 *
 * XMIN and YMIN are set to 0 by default, which will not restrict the mouse.
 *
 * Additionally, the mouse's initial position can be set with the XSTART and
 * YSTART parameters. These parameters should be set inside of the boundaries
 * XMAX, YMIN, etc. If not specified they will be set to the center of a screen
 * assuming 160x120 resolution, which is the default resolution.
 *
 *
 * ################################
 * INPUT AND OUTPUT SPECIFICATIONS
 * ################################
 *
 * clock - Main clock signal for the controller. This signal is separate from
 *         the mouse's clock signal, PS2_CLK. This input should be plugged into
 *         the same clock as the rest of the system is synchronized to.
 *
 * reset - Synchronous active-low reset signal. Resetting the controller will
 *         cause the mouse position to revert to its starting location specified
 *         by XSTART and YSTART. Resetting will also cause the mouse to go through
 *         its initialization sequence again.
 *
 * enable_tracking - Lowering this input will prevent the mouse's position from
 *                   changing even if the mouse is physically moving. This signal
 *                   must be kept high when mouse movement is to be recorded.
 *
 * PS2_CLK and PS2_DAT -
 *    These inputs correspond to the PS2_CLK and PS2_DAT signals from the board.
 *    Do NOT use PS2_CLK2 or PS2_DAT2 unless using a 2-1 splitter cable, or else
 *    neither input will be connected to anything.
 *
 *    These signals should be declared as inout (bidirectionals) ports in any
 *    ancestor modules to the mouse controller. Do NOT attempt to change the value
 *    of the clock or data wires or else indeterminate behaviour will result.
 *
 *
 * x_pos -
 *    Current X coordinate. Moving the mouse to the right causes this coordinate
 *    to increase; moving the mouse left causes the coordinate to decrease.
 *
 * y_pos -
 *    Current Y coordinate. Moving the mouse upward causes this coordinate
 *    to decrease; moving the mouse downward causes the coordinate to increase.
 *
 * right-click -
 *    High if the right mouse button is being pressed or held down, and low if
 *    the right mouse is not being pressed.
 *
 * right-click -
 *    High if the left mouse button is being pressed or held down, and low if
 *    the left mouse is not being pressed.
 *
 *
 * #################
 * ACKNOWLEDGEMENTS
 * #################
 *
 * Credit for low-level PS/2 driver module (also a resource for PS/2 protocol):
 * http://www.eecg.toronto.edu/~jayar/ece241_08F/AudioVideoCores/ps2/ps2.html
 */
module mouse_tracker(
    input clock,
	 input reset,
	 input enable_tracking,
	 
	 inout PS2_CLK,
	 inout PS2_DAT,
	 
	 output reg [8:0] x_pos,
	 output reg [8:0] y_pos,
	 output reg right_click,
	 output reg left_click,
	 output reg [3:0] count
    );

	 // A flag indicating when the mouse has sent a new byte.
	 wire byte_received;
	 // The most recent byte received from the mouse.
	 wire [7:0] newest_byte;
	 
	 // Registers hold bytes from each 3-byte packet received from the mouse.
	 reg [7:0] byte1;
	 reg [7:0] byte2;
	 reg [7:0] byte3;
	 
	 // The location of the mouse after the newest X and Y offsets have been
	 // added. This value will become the new X and Y position if it is in
	 // bounds. Otherwise the nearest in-bounds value will be used.
	 wire [8:0] new_x;
	 wire [8:0] new_y;
	 
	 assign new_x = x_pos + {byte1[4], byte2};
	 // New Y offset is subtracted from the previous position because the mouse
	 // reports Y offsets inverted relative to this controller's scheme (i.e.
	 // the origin is placed at the bottom left corner, so moving the mouse down
	 // causes its position to decrease instead of increase).
	 assign new_y = y_pos - {byte1[5], byte3};
	 
	 PS2_Controller #(.INITIALIZE_MOUSE(1)) tracker2(
	     .CLOCK_50(clock),
		  .reset(~reset),
		  .PS2_CLK(PS2_CLK),
		  .PS2_DAT(PS2_DAT),
		  .received_data(newest_byte),
		  .received_data_en(byte_received)
		  );
	 
	 reg [2:0] curr_state;
	 reg [2:0] next_state;
	 
	 // Flag indicating whether the first of the two initialization signals
	 // has been received from the mouse upon startup. This flag is not
	 // important if the controller is not in the WAIT_INIT state.
	 reg init_byte_received;
	 
	 localparam WAIT_INIT   = 3'b000, // Receive initial two mouse signals on startup.
	            GET_BYTE_1  = 3'b001, // Wait for mouse to send first byte of packet.
					LOAD_BYTE_1 = 3'b011, // Store the first byte of the packet.
					GET_BYTE_2  = 3'b010, // Wait for mouse to send second byte of packet.
					LOAD_BYTE_2 = 3'b110, // Store the second byte of the packet.
					GET_BYTE_3  = 3'b100, // Wait for mouse to send third byte of packet.
					LOAD_BYTE_3 = 3'b101, // Store the third byte of the packet.
					PROCESS     = 3'b111; // Extract new mouse state from 3-byte packet.

    parameter  XMIN        = 9'd0,   // Left boundary for X position.
	            YMIN        = 9'b0,   // Top boundary for Y position.
					XMAX        = 9'd159, // Right boundary for X position.
					YMAX        = 9'd119, // Bottom boundary for Y position.
					XSTART      = 9'd79,  // Initial X position on reset.
					YSTART      = 9'd59;  // Initial Y position on reset.
    
	 always @(*) begin: state_transitions
	     case (curr_state)
		      WAIT_INIT:  next_state = init_byte_received && byte_received ? GET_BYTE_1 : WAIT_INIT;
		      GET_BYTE_1: next_state = byte_received ? LOAD_BYTE_1 : GET_BYTE_1;
				LOAD_BYTE_1: next_state = GET_BYTE_2;
				GET_BYTE_2: next_state = byte_received ? LOAD_BYTE_2 : GET_BYTE_2;
				LOAD_BYTE_2: next_state = GET_BYTE_3;
				GET_BYTE_3: next_state = byte_received ? LOAD_BYTE_3 : GET_BYTE_3;
				LOAD_BYTE_3: next_state = PROCESS;
				PROCESS: next_state = GET_BYTE_1;
        endcase
    end  // state_transitions
	 
	 
	 always @(posedge clock) begin: receive_data
	     // All signals hold their values by default.
	     byte1 <= byte1;
		  byte2 <= byte2;
		  byte3 <= byte3;
		  x_pos <= x_pos;
		  y_pos <= y_pos;
		  left_click <= left_click;
		  init_byte_received <= init_byte_received;
		  count <= count;
		  
		  if (~reset) begin
		      byte1 <= 8'b0;
				byte2 <= 8'b0;
				byte3 <= 8'b0;
				x_pos <= XSTART;
				y_pos <= YSTART;
				left_click  <= 1'b0;
				right_click <= 1'b0;
				init_byte_received <= 1'b0;
				count <= 4'd15;
        end
		  if (byte_received)
		      init_byte_received <= 1'b1;
        if (curr_state == LOAD_BYTE_1)
		      // Store the newly received first byte of the new package.
            byte1 <= newest_byte;
        if (curr_state == LOAD_BYTE_2)
		      // Store the new second byte of the new package.
            byte2 <= newest_byte;
        if (curr_state == LOAD_BYTE_3)
		      // Store the third byte of the new package.
		      byte3 <= newest_byte;
        if (curr_state == PROCESS) begin
		      // Compute new X and Y locations from offsets.
				// See a page on PS/2 mouse protocol for interpretations of bytes
				// in byte1, byte2, and byte3.
		      x_pos <= ~enable_tracking || byte1[6] ? x_pos
				           // Mouse disabled/overflowed, so keep previous position.
                     : (new_x < XMIN || (byte1[4] && new_x > x_pos) ? XMIN
                       // Mouse has moved past its left boundary.
                     : (new_x > XMAX ? XMAX
                       // Mouse has moved past its right boundary.
                     : new_x));
                       // New mouse X position is in bounds.
							  
            y_pos <= ~enable_tracking || byte1[7] ? y_pos
                       // Mouse disabled/overflowed, so keep previous position.
                     : (new_y < YMIN || (~byte1[5] && new_y > y_pos) ? YMIN
							  // Mouse has moved past its upper boundary.
                     : (new_y > YMAX ? YMAX
							  // Mouse has moved past its lower boundary.
							: new_y));
							  // New mouse Y position is in bounds.

            // Right and left clicks are indicated by flag bits in byte1.
            right_click <= byte1[1];
				left_click  <= byte1[0];
				count <= count - 4'b1;
        end
    end  // receive_data
	 
	 
	 always @(posedge clock) begin: increment_state
	     if (~reset) begin
		      // Prepare to receive initialization bits from the mouse.
		      curr_state <= WAIT_INIT;
		  end
		  else begin
		      curr_state <= next_state;
		  end
    end  // increment_state
endmodule


/**
 * This module is meant to test that the mouse controller outputs the expected
 * signals when the mouse is moved and clicked. The mouse's X position is
 * displayed on hex displays HEX0 to HEX2, and the Y coordinate is displayed
 * on HEX3 to HEX5. Left click and right click are dispayed on LEDR[1] and
 * LEDR[0] respectively. Middle mouse buttons are currently not supported.
 * Press KEY[0] to reset the device. This will restore the mouse to its
 * starting position, set to its default of X = 79 and Y = 59.
 *
 * As specified above, moving the mouse right should increase
 * its recorded X coordinate, and moving the mouse down should increase its Y
 * coordinate. In addition, X coordinates should stay between XMIN and XMAX,
 * and Y coordinates should stay between YMIN and YMAX. The mouse should not
 * be able to loop from the top to the bottom when moved up, or from the left
 * to the right when moved left.
 *
 * If the coordinates do not change when the mouse is moved, the core driver
 * does not work with your board and you should try another mouse controller
 * entirely. If X and Y are getting reversed (i.e. Y coordinates show up on
 * HEX0 to HEX2) then the problem lies in the first setup state in the
 * mouse_tracker module. Any other problems will likely be found in the
 * calculations in module mouse_tracker.
 */
module mouse_interface_test(
    input CLOCK_50,
	 input [3:0] KEY,
	 
	 inout PS2_CLK,
	 inout PS2_DAT,
	 
	 output [6:0] HEX0,
	 output [6:0] HEX1,
	 output [6:0] HEX2,
	 output [6:0] HEX3,
	 output [6:0] HEX4,
	 output [6:0] HEX5,
	 output [9:0] LEDR
	 );
	 
	 wire [8:0] x_coord;
	 wire [8:0] y_coord;
	 
	 mouse_tracker tester(
	     .clock(CLOCK_50),
		  .reset(KEY[0]),
		  .enable_tracking(1'b1),
		  .PS2_CLK(PS2_CLK),
		  .PS2_DAT(PS2_DAT),
		  .x_pos(x_coord),
		  .y_pos(y_coord),
		  .left_click(LEDR[1]),
		  .right_click(LEDR[0])
		  );

    // Put X coordinates on hex displays 0-2

    hex_decoder hex0(
	     .hex_digit(x_coord[3:0]),
		  .segments(HEX0)
		  );

    hex_decoder hex1(
	     .hex_digit(x_coord[7:4]),
		  .segments(HEX1)
		  );

    hex_decoder hex2(
	     .hex_digit({3'b0, x_coord[8]}),
		  .segments(HEX2)
		  );

    // Put Y coordinates on hex displays 3-5

    hex_decoder hex3(
	     .hex_digit(y_coord[3:0]),
		  .segments(HEX3)
		  );

    hex_decoder hex4(
	     .hex_digit(y_coord[7:4]),
		  .segments(HEX4)
		  );

    hex_decoder hex5(
	     .hex_digit({3'b0, y_coord[8]}),
		  .segments(HEX5)
		  );
endmodule


/**
 * Hex decoder module provided for convenient testing. Displays all characters
 * from 0 to F.
 */
module hex_decoder(hex_digit, segments);
    input [3:0] hex_digit;
    output reg [6:0] segments;
   
    always @(*)
        case (hex_digit)
            4'h0: segments = 7'b100_0000;
            4'h1: segments = 7'b111_1001;
            4'h2: segments = 7'b010_0100;
            4'h3: segments = 7'b011_0000;
            4'h4: segments = 7'b001_1001;
            4'h5: segments = 7'b001_0010;
            4'h6: segments = 7'b000_0010;
            4'h7: segments = 7'b111_1000;
            4'h8: segments = 7'b000_0000;
            4'h9: segments = 7'b001_1000;
            4'hA: segments = 7'b000_1000;
            4'hB: segments = 7'b000_0011;
            4'hC: segments = 7'b100_0110;
            4'hD: segments = 7'b010_0001;
            4'hE: segments = 7'b000_0110;
            4'hF: segments = 7'b000_1110;   
            default: segments = 7'h7f;
        endcase
endmodule