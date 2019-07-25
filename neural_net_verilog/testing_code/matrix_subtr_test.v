module matrix_subtr_test(A,B,C);

	input [23:0] A;	//32*10*32-1
	input [23:0] B;	//32*10*32-1
	output[23:0] C;	//32*10*32-1

	
	wire signed [3:0] A_arr [2:0][1:0];
	wire signed [3:0] B_arr [2:0][1:0];
	reg signed [3:0] C_arr [2:0][1:0];

	assign {{A_arr[0][0], A_arr[0][1]},
			  {A_arr[1][0], A_arr[1][1]},
			  {A_arr[2][0], A_arr[2][1]}} = A;

	assign {{B_arr[0][0], B_arr[0][1]},
			  {B_arr[1][0], B_arr[1][1]},
			  {B_arr[2][0], B_arr[2][1]}} = B;
			  
	integer i,j;
	always @*
	begin
		for(i=0; i<3; i=i+1)
		begin
			for(j=0; j<2; j=j+1)
				C_arr[i][j] = A_arr[i][j] - B_arr[i][j];
		end
	end
	
	assign C = {{C_arr[0][0], C_arr[0][1]},
					{C_arr[1][0], C_arr[1][1]},
					{C_arr[2][0], C_arr[2][1]}};
	
endmodule
