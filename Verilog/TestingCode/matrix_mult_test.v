module matrix_mult_test(A,x,y);
	input [23:0] A;	//3*2*4-1
	input [7:0] x;		//2*4-1
	output[11:0] y;	//3*4-1

	wire [3:0] A_arr [2:0][1:0];
	wire [3:0] x_arr [1:0];
	reg [7:0] y1_arr[2:0][1:0];
	reg [3:0] y_arr [2:0][1:0];	
	
	assign {{A_arr[0][0], A_arr[0][1]},
			  {A_arr[1][0], A_arr[1][1]},
			  {A_arr[2][0], A_arr[2][1]}} = A;

	assign {x_arr[0], x_arr[1]} = x;
	
	integer i,j;
	always @*
	begin
		for(i=0; i<3; i=i+1)
		begin
			for(j=0; j<2; j=j+1)
			begin
				y1_arr[i][j] <= A_arr[i][j]*x_arr[j];
				if (j==0)
					y_arr[i][j] <= y1_arr[i][j][3:0];
				else
					y_arr[i][j] <= y_arr[i][j-1] + y1_arr[i][j][3:0];
			end
		end
	end
	
	assign y = {y_arr[0][1], y_arr[1][1], y_arr[2][1]};
					
endmodule
