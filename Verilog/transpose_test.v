module transpose_test(A,B);

	input [23:0] A;	//3*2*4-1
	output[23:0] B;	//2*3*4-1

	
	wire signed [3:0] A_arr [2:0][1:0];
	reg signed [3:0] B_arr [1:0][2:0];

	assign {{A_arr[0][0], A_arr[0][1]},
			  {A_arr[1][0], A_arr[1][1]},
			  {A_arr[2][0], A_arr[2][1]}} = A;

	integer i,j;
	always @*
	begin
		for(i=0; i<2; i=i+1)
		begin
			for(j=0; j<3; j=j+1)
				B_arr[i][j] = A_arr[j][i];
		end
	end
	
	assign B = {{B_arr[0][0], B_arr[0][1], B_arr[0][2]},
					{B_arr[1][0], B_arr[1][1], B_arr[1][2]}};
	
endmodule
