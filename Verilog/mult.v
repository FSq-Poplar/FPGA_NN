module mult(x,y,z);

	input  signed [31:0] x, y;
	output signed [31:0] z;
	
	wire signed [63:0] xy;
	
	assign xy = x*y;
	assign z = xy[55:24];

endmodule
