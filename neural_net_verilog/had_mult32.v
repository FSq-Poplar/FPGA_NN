module had_mult32(x,y,z);
	input  [1023:0] x, y;
	output [1023:0] z;
	
	wire signed [31:0] x_arr [31:0];
	wire signed [31:0] y_arr [31:0];
	reg signed [63:0] z1_arr[31:0];
	reg signed [31:0] z_arr [31:0];


	assign {x_arr[0], x_arr[1], x_arr[2], x_arr[3], x_arr[4], x_arr[5], x_arr[6], x_arr[7], x_arr[8], x_arr[9],
			  x_arr[10], x_arr[11], x_arr[12], x_arr[13], x_arr[14], x_arr[15], x_arr[16], x_arr[17], x_arr[18], x_arr[19],
			  x_arr[20], x_arr[21], x_arr[22], x_arr[23], x_arr[24], x_arr[25], x_arr[26], x_arr[27], x_arr[28], x_arr[29],
			  x_arr[30], x_arr[31]} = x;
	assign {y_arr[0], y_arr[1], y_arr[2], y_arr[3], y_arr[4], y_arr[5], y_arr[6], y_arr[7], y_arr[8], y_arr[9],
			  y_arr[10], y_arr[11], y_arr[12], y_arr[13], y_arr[14], y_arr[15], y_arr[16], y_arr[17], y_arr[18], y_arr[19],
			  y_arr[20], y_arr[21], y_arr[22], y_arr[23], y_arr[24], y_arr[25], y_arr[26], y_arr[27], y_arr[28], y_arr[29],
			  y_arr[30], y_arr[31]} = y;
	
	integer i;
	always @*
	begin
		for(i=0; i<32; i=i+1)
		begin
			z1_arr[i] <= x_arr[i]*y_arr[i];
			z_arr[i] <= {z1_arr[63],z1_arr[i][54:24]};			
		end
	end
	
	assign z= {z_arr[0], z_arr[1], z_arr[2], z_arr[3], z_arr[4], z_arr[5], z_arr[6], z_arr[7], z_arr[8], z_arr[9],
				  z_arr[10], z_arr[11], z_arr[12], z_arr[13], z_arr[14], z_arr[15], z_arr[16], z_arr[17], z_arr[18], z_arr[19],
				  z_arr[20], z_arr[21], z_arr[22], z_arr[23], z_arr[24], z_arr[25], z_arr[26], z_arr[27], z_arr[28], z_arr[29],
				  z_arr[30], z_arr[31]};
endmodule

//tested