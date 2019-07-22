module had_mult_test(x,y,z);
	input [15:0] x, y;
	output[15:0] z;
	
	wire [3:0] x_arr [3:0];
	wire [3:0] y_arr [3:0];
	reg [7:0] z1_arr [3:0];
	reg [3:0] z_arr  [3:0];


	assign {x_arr[0], x_arr[1], x_arr[2], x_arr[3]} = x;
	assign {y_arr[0], y_arr[1], y_arr[2], y_arr[3]} = y;
	
	integer i;
	always @*
	begin
		for(i=0; i<4; i=i+1)
		begin
			z1_arr[i] <= x_arr[i]*y_arr[i];
			z_arr[i] <= z1_arr[i][3:0];			
		end
	end
	
	assign z= {z_arr[0], z_arr[1], z_arr[2], z_arr[3]};
endmodule
