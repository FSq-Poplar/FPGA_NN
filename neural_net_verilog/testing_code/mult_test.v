module mult_test(x,y,z,w);

	//1 sign bit + 4 integer bits + 4 decimal bits
	input  signed [8:0] x, y;
	output signed [17:0] w;
	output signed [8:0] z;
		
	assign w = x*y;
	assign z = {w[17],w[11:4]};

endmodule
