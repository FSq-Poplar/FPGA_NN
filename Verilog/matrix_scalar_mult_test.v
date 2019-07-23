module matrix_scalar_mult_test(A,a,B);
	input [23:0] A;			//3*2*4-1
	input signed [3:0] a;	//4-1
	output[23:0] B;			//3*2*4-1

	wire signed [3:0] A_arr [2:0][1:0];
	reg signed [7:0] B1_arr[2:0][1:0];
	reg signed [3:0] B_arr [2:0][1:0];
	
	assign {{A_arr[0][0], A_arr[0][1]},
			  {A_arr[1][0], A_arr[1][1]},
			  {A_arr[2][0], A_arr[2][1]}} = A;
	
	integer i,j;
	always @*
	begin
		for(i=0; i<3; i=i+1)
		begin
			for(j=0; j<2; j=j+1)
			begin
				B1_arr[i][j] <= a*A_arr[i][j];
				B_arr[i][j] <= {B1_arr[i][j][7], B1_arr[i][j][3:1]};
			end
		end
	end
	
	assign B = {{B_arr[0][0], B_arr[0][1]},
					{B_arr[1][0], B_arr[1][1]},
					{B_arr[2][0], B_arr[2][1]}};
					
endmodule
