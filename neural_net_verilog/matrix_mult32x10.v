module matrix_mult32x10(A,x,y);
	input [10239:0] A;	//32*10*32-1
	input [319:0] x;		//10*32-1
	output[1023:0] y;		//10*32-1

	wire signed [31:0] A_arr [31:0][9:0];
	wire signed [31:0] x_arr [9:0];
	reg signed [63:0] y1_arr[31:0][9:0];
	reg signed [31:0] y_arr [31:0][9:0];
	
	assign {{A_arr[0][0], A_arr[0][1], A_arr[0][2], A_arr[0][3], A_arr[0][4], A_arr[0][5], A_arr[0][6], A_arr[0][7], A_arr[0][8], A_arr[0][9]},
			  {A_arr[1][0], A_arr[1][1], A_arr[1][2], A_arr[1][3], A_arr[1][4], A_arr[1][5], A_arr[1][6], A_arr[1][7], A_arr[1][8], A_arr[1][9]},
			  {A_arr[2][0], A_arr[2][1], A_arr[2][2], A_arr[2][3], A_arr[2][4], A_arr[2][5], A_arr[2][6], A_arr[2][7], A_arr[2][8], A_arr[2][9]},
			  {A_arr[3][0], A_arr[3][1], A_arr[3][2], A_arr[3][3], A_arr[3][4], A_arr[3][5], A_arr[3][6], A_arr[3][7], A_arr[3][8], A_arr[3][9]},
			  {A_arr[4][0], A_arr[4][1], A_arr[4][2], A_arr[4][3], A_arr[4][4], A_arr[4][5], A_arr[4][6], A_arr[4][7], A_arr[4][8], A_arr[4][9]},
			  {A_arr[5][0], A_arr[5][1], A_arr[5][2], A_arr[5][3], A_arr[5][4], A_arr[5][5], A_arr[5][6], A_arr[5][7], A_arr[5][8], A_arr[5][9]},
			  {A_arr[6][0], A_arr[6][1], A_arr[6][2], A_arr[6][3], A_arr[6][4], A_arr[6][5], A_arr[6][6], A_arr[6][7], A_arr[6][8], A_arr[6][9]},
			  {A_arr[7][0], A_arr[7][1], A_arr[7][2], A_arr[7][3], A_arr[7][4], A_arr[7][5], A_arr[7][6], A_arr[7][7], A_arr[7][8], A_arr[7][9]},
			  {A_arr[8][0], A_arr[8][1], A_arr[8][2], A_arr[8][3], A_arr[8][4], A_arr[8][5], A_arr[8][6], A_arr[8][7], A_arr[8][8], A_arr[8][9]},
			  {A_arr[9][0], A_arr[9][1], A_arr[9][2], A_arr[9][3], A_arr[9][4], A_arr[9][5], A_arr[9][6], A_arr[9][7], A_arr[9][8], A_arr[9][9]},
			  {A_arr[10][0], A_arr[10][1], A_arr[10][2], A_arr[10][3], A_arr[10][4], A_arr[10][5], A_arr[10][6], A_arr[10][7], A_arr[10][8], A_arr[10][9]},
			  {A_arr[11][0], A_arr[11][1], A_arr[11][2], A_arr[11][3], A_arr[11][4], A_arr[11][5], A_arr[11][6], A_arr[11][7], A_arr[11][8], A_arr[11][9]},
			  {A_arr[12][0], A_arr[12][1], A_arr[12][2], A_arr[12][3], A_arr[12][4], A_arr[12][5], A_arr[12][6], A_arr[12][7], A_arr[12][8], A_arr[12][9]},
			  {A_arr[13][0], A_arr[13][1], A_arr[13][2], A_arr[13][3], A_arr[13][4], A_arr[13][5], A_arr[13][6], A_arr[13][7], A_arr[13][8], A_arr[13][9]},
			  {A_arr[14][0], A_arr[14][1], A_arr[14][2], A_arr[14][3], A_arr[14][4], A_arr[14][5], A_arr[14][6], A_arr[14][7], A_arr[14][8], A_arr[14][9]},
			  {A_arr[15][0], A_arr[15][1], A_arr[15][2], A_arr[15][3], A_arr[15][4], A_arr[15][5], A_arr[15][6], A_arr[15][7], A_arr[15][8], A_arr[15][9]},
			  {A_arr[16][0], A_arr[16][1], A_arr[16][2], A_arr[16][3], A_arr[16][4], A_arr[16][5], A_arr[16][6], A_arr[16][7], A_arr[16][8], A_arr[16][9]},
			  {A_arr[17][0], A_arr[17][1], A_arr[17][2], A_arr[17][3], A_arr[17][4], A_arr[17][5], A_arr[17][6], A_arr[17][7], A_arr[17][8], A_arr[17][9]},
			  {A_arr[18][0], A_arr[18][1], A_arr[18][2], A_arr[18][3], A_arr[18][4], A_arr[18][5], A_arr[18][6], A_arr[18][7], A_arr[18][8], A_arr[18][9]},
			  {A_arr[19][0], A_arr[19][1], A_arr[19][2], A_arr[19][3], A_arr[19][4], A_arr[19][5], A_arr[19][6], A_arr[19][7], A_arr[19][8], A_arr[19][9]},
			  {A_arr[20][0], A_arr[20][1], A_arr[20][2], A_arr[20][3], A_arr[20][4], A_arr[20][5], A_arr[20][6], A_arr[20][7], A_arr[20][8], A_arr[20][9]},
			  {A_arr[21][0], A_arr[21][1], A_arr[21][2], A_arr[21][3], A_arr[21][4], A_arr[21][5], A_arr[21][6], A_arr[21][7], A_arr[21][8], A_arr[21][9]},
			  {A_arr[22][0], A_arr[22][1], A_arr[22][2], A_arr[22][3], A_arr[22][4], A_arr[22][5], A_arr[22][6], A_arr[22][7], A_arr[22][8], A_arr[22][9]},
			  {A_arr[23][0], A_arr[23][1], A_arr[23][2], A_arr[23][3], A_arr[23][4], A_arr[23][5], A_arr[23][6], A_arr[23][7], A_arr[23][8], A_arr[23][9]},
			  {A_arr[24][0], A_arr[24][1], A_arr[24][2], A_arr[24][3], A_arr[24][4], A_arr[24][5], A_arr[24][6], A_arr[24][7], A_arr[24][8], A_arr[24][9]},
			  {A_arr[25][0], A_arr[25][1], A_arr[25][2], A_arr[25][3], A_arr[25][4], A_arr[25][5], A_arr[25][6], A_arr[25][7], A_arr[25][8], A_arr[25][9]},
			  {A_arr[26][0], A_arr[26][1], A_arr[26][2], A_arr[26][3], A_arr[26][4], A_arr[26][5], A_arr[26][6], A_arr[26][7], A_arr[26][8], A_arr[26][9]},
			  {A_arr[27][0], A_arr[27][1], A_arr[27][2], A_arr[27][3], A_arr[27][4], A_arr[27][5], A_arr[27][6], A_arr[27][7], A_arr[27][8], A_arr[27][9]},
			  {A_arr[28][0], A_arr[28][1], A_arr[28][2], A_arr[28][3], A_arr[28][4], A_arr[28][5], A_arr[28][6], A_arr[28][7], A_arr[28][8], A_arr[28][9]},
			  {A_arr[29][0], A_arr[29][1], A_arr[29][2], A_arr[29][3], A_arr[29][4], A_arr[29][5], A_arr[29][6], A_arr[29][7], A_arr[29][8], A_arr[29][9]},
			  {A_arr[30][0], A_arr[30][1], A_arr[30][2], A_arr[30][3], A_arr[30][4], A_arr[30][5], A_arr[30][6], A_arr[30][7], A_arr[30][8], A_arr[30][9]},
			  {A_arr[31][0], A_arr[31][1], A_arr[31][2], A_arr[31][3], A_arr[31][4], A_arr[31][5], A_arr[31][6], A_arr[31][7], A_arr[31][8], A_arr[31][9]}} = A;

	assign {x_arr[0], x_arr[1], x_arr[2], x_arr[3], x_arr[4], x_arr[5], x_arr[6], x_arr[7], x_arr[8], x_arr[9]} = x;
	
	integer i,j;
	always @*
	begin
		for(i=0; i<32; i=i+1)
		begin
			for(j=0; j<10; j=j+1)
			begin
				y1_arr[i][j] <= A_arr[i][j]*x_arr[j];
				if (j==0)
					y_arr[i][j] <= {y1_arr[i][j][63], y1_arr[i][j][54:24];
				else
					y_arr[i][j] <= y_arr[i][j-1] + {y1_arr[i][j][63], y1_arr[i][j][54:24]};
			end
		end
	end
	
	assign y = {y_arr[0][9], y_arr[1][9], y_arr[2][9], y_arr[3][9], y_arr[4][9], y_arr[5][9], y_arr[6][9], y_arr[7][9], y_arr[8][9], y_arr[9][9], 
					y_arr[10][9], y_arr[11][9], y_arr[12][9], y_arr[13][9], y_arr[14][9], y_arr[15][9], y_arr[16][9], y_arr[17][9], y_arr[18][9], y_arr[19][9], 
					y_arr[20][9], y_arr[21][9], y_arr[22][9], y_arr[23][9], y_arr[24][9], y_arr[25][9], y_arr[26][9], y_arr[27][9], y_arr[28][9], y_arr[29][9], 
					y_arr[30][9], y_arr[31][9]};
					
endmodule

//tested