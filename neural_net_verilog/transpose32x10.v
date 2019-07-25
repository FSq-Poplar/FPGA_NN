module transpose32x10(A,B);

	input [10239:0] A;	//32*10*32-1
	output[10239:0] B;	//10*32*32-1

	
	wire signed [31:0] A_arr [31:0][9:0];
	reg signed [31:0] B_arr [9:0][31:0];

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

	integer i,j;
	always @*
	begin
		for(i=0; i<10; i=i+1)
		begin
			for(j=0; j<32; j=j+1)
				B_arr[i][j] = A_arr[j][i];
		end
	end
	
	assign B = {{B_arr[0][0], B_arr[0][1], B_arr[0][2], B_arr[0][3], B_arr[0][4], B_arr[0][5], B_arr[0][6], B_arr[0][7], B_arr[0][8], B_arr[0][9],
					 B_arr[0][10], B_arr[0][11], B_arr[0][12], B_arr[0][13], B_arr[0][14], B_arr[0][15], B_arr[0][16], B_arr[0][17], B_arr[0][18], B_arr[0][19],
					 B_arr[0][20], B_arr[0][21], B_arr[0][22], B_arr[0][23], B_arr[0][24], B_arr[0][25], B_arr[0][26], B_arr[0][27], B_arr[0][28], B_arr[0][29],
					 B_arr[0][30], B_arr[0][31]},
					{B_arr[1][0], B_arr[1][1], B_arr[1][2], B_arr[1][3], B_arr[1][4], B_arr[1][5], B_arr[1][6], B_arr[1][7], B_arr[1][8], B_arr[1][9],
					 B_arr[1][10], B_arr[1][11], B_arr[1][12], B_arr[1][13], B_arr[1][14], B_arr[1][15], B_arr[1][16], B_arr[1][17], B_arr[1][18], B_arr[1][19],
					 B_arr[1][20], B_arr[1][21], B_arr[1][22], B_arr[1][23], B_arr[1][24], B_arr[1][25], B_arr[1][26], B_arr[1][27], B_arr[1][28], B_arr[1][29],
					 B_arr[1][30], B_arr[1][31]},
					{B_arr[2][0], B_arr[2][1], B_arr[2][2], B_arr[2][3], B_arr[2][4], B_arr[2][5], B_arr[2][6], B_arr[2][7], B_arr[2][8], B_arr[2][9],
					 B_arr[2][10], B_arr[2][11], B_arr[2][12], B_arr[2][13], B_arr[2][14], B_arr[2][15], B_arr[2][16], B_arr[2][17], B_arr[2][18], B_arr[2][19], 
					 B_arr[2][20], B_arr[2][21], B_arr[2][22], B_arr[2][23], B_arr[2][24], B_arr[2][25], B_arr[2][26], B_arr[2][27], B_arr[2][28], B_arr[2][29], 
					 B_arr[2][30], B_arr[2][31]},
					{B_arr[3][0], B_arr[3][1], B_arr[3][2], B_arr[3][3], B_arr[3][4], B_arr[3][5], B_arr[3][6], B_arr[3][7], B_arr[3][8], B_arr[3][9], 
					 B_arr[3][10], B_arr[3][11], B_arr[3][12], B_arr[3][13], B_arr[3][14], B_arr[3][15], B_arr[3][16], B_arr[3][17], B_arr[3][18], B_arr[3][19], 
					 B_arr[3][20], B_arr[3][21], B_arr[3][22], B_arr[3][23], B_arr[3][24], B_arr[3][25], B_arr[3][26], B_arr[3][27], B_arr[3][28], B_arr[3][29], 
					 B_arr[3][30], B_arr[3][31]},
					{B_arr[4][0], B_arr[4][1], B_arr[4][2], B_arr[4][3], B_arr[4][4], B_arr[4][5], B_arr[4][6], B_arr[4][7], B_arr[4][8], B_arr[4][9], 
					 B_arr[4][10], B_arr[4][11], B_arr[4][12], B_arr[4][13], B_arr[4][14], B_arr[4][15], B_arr[4][16], B_arr[4][17], B_arr[4][18], B_arr[4][19], 
					 B_arr[4][20], B_arr[4][21], B_arr[4][22], B_arr[4][23], B_arr[4][24], B_arr[4][25], B_arr[4][26], B_arr[4][27], B_arr[4][28], B_arr[4][29], 
					 B_arr[4][30], B_arr[4][31]},
					{B_arr[5][0], B_arr[5][1], B_arr[5][2], B_arr[5][3], B_arr[5][4], B_arr[5][5], B_arr[5][6], B_arr[5][7], B_arr[5][8], B_arr[5][9], 
					 B_arr[5][10], B_arr[5][11], B_arr[5][12], B_arr[5][13], B_arr[5][14], B_arr[5][15], B_arr[5][16], B_arr[5][17], B_arr[5][18], B_arr[5][19], 
					 B_arr[5][20], B_arr[5][21], B_arr[5][22], B_arr[5][23], B_arr[5][24], B_arr[5][25], B_arr[5][26], B_arr[5][27], B_arr[5][28], B_arr[5][29], 
					 B_arr[5][30], B_arr[5][31]},
					{B_arr[6][0], B_arr[6][1], B_arr[6][2], B_arr[6][3], B_arr[6][4], B_arr[6][5], B_arr[6][6], B_arr[6][7], B_arr[6][8], B_arr[6][9], 
					 B_arr[6][10], B_arr[6][11], B_arr[6][12], B_arr[6][13], B_arr[6][14], B_arr[6][15], B_arr[6][16], B_arr[6][17], B_arr[6][18], B_arr[6][19], 
					 B_arr[6][20], B_arr[6][21], B_arr[6][22], B_arr[6][23], B_arr[6][24], B_arr[6][25], B_arr[6][26], B_arr[6][27], B_arr[6][28], B_arr[6][29], 
					 B_arr[6][30], B_arr[6][31]},
					{B_arr[7][0], B_arr[7][1], B_arr[7][2], B_arr[7][3], B_arr[7][4], B_arr[7][5], B_arr[7][6], B_arr[7][7], B_arr[7][8], B_arr[7][9], 
					 B_arr[7][10], B_arr[7][11], B_arr[7][12], B_arr[7][13], B_arr[7][14], B_arr[7][15], B_arr[7][16], B_arr[7][17], B_arr[7][18], B_arr[7][19], 
					 B_arr[7][20], B_arr[7][21], B_arr[7][22], B_arr[7][23], B_arr[7][24], B_arr[7][25], B_arr[7][26], B_arr[7][27], B_arr[7][28], B_arr[7][29], 
					 B_arr[7][30], B_arr[7][31]},
					{B_arr[8][0], B_arr[8][1], B_arr[8][2], B_arr[8][3], B_arr[8][4], B_arr[8][5], B_arr[8][6], B_arr[8][7], B_arr[8][8], B_arr[8][9], 
					 B_arr[8][10], B_arr[8][11], B_arr[8][12], B_arr[8][13], B_arr[8][14], B_arr[8][15], B_arr[8][16], B_arr[8][17], B_arr[8][18], B_arr[8][19], 
					 B_arr[8][20], B_arr[8][21], B_arr[8][22], B_arr[8][23], B_arr[8][24], B_arr[8][25], B_arr[8][26], B_arr[8][27], B_arr[8][28], B_arr[8][29], 
					 B_arr[8][30], B_arr[8][31]},
					{B_arr[9][0], B_arr[9][1], B_arr[9][2], B_arr[9][3], B_arr[9][4], B_arr[9][5], B_arr[9][6], B_arr[9][7], B_arr[9][8], B_arr[9][9], 
					 B_arr[9][10], B_arr[9][11], B_arr[9][12], B_arr[9][13], B_arr[9][14], B_arr[9][15], B_arr[9][16], B_arr[9][17], B_arr[9][18], B_arr[9][19], 
					 B_arr[9][20], B_arr[9][21], B_arr[9][22], B_arr[9][23], B_arr[9][24], B_arr[9][25], B_arr[9][26], B_arr[9][27], B_arr[9][28], B_arr[9][29], 
					 B_arr[9][30], B_arr[9][31]}};
	
endmodule

//tested