module matrix_subtr32x10(A,B,C);

	input [10239:0] A;	//32*10*32-1
	input [10239:0] B;	//32*10*32-1
	output[10239:0] C;	//32*10*32-1

	
	wire signed [31:0] A_arr [31:0][9:0];
	wire signed [31:0] B_arr [31:0][9:0];
	reg signed [31:0] C_arr [31:0][9:0];

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

	assign {{B_arr[0][0], B_arr[0][1], B_arr[0][2], B_arr[0][3], B_arr[0][4], B_arr[0][5], B_arr[0][6], B_arr[0][7], B_arr[0][8], B_arr[0][9]},
			  {B_arr[1][0], B_arr[1][1], B_arr[1][2], B_arr[1][3], B_arr[1][4], B_arr[1][5], B_arr[1][6], B_arr[1][7], B_arr[1][8], B_arr[1][9]},
			  {B_arr[2][0], B_arr[2][1], B_arr[2][2], B_arr[2][3], B_arr[2][4], B_arr[2][5], B_arr[2][6], B_arr[2][7], B_arr[2][8], B_arr[2][9]},
			  {B_arr[3][0], B_arr[3][1], B_arr[3][2], B_arr[3][3], B_arr[3][4], B_arr[3][5], B_arr[3][6], B_arr[3][7], B_arr[3][8], B_arr[3][9]},
			  {B_arr[4][0], B_arr[4][1], B_arr[4][2], B_arr[4][3], B_arr[4][4], B_arr[4][5], B_arr[4][6], B_arr[4][7], B_arr[4][8], B_arr[4][9]},
			  {B_arr[5][0], B_arr[5][1], B_arr[5][2], B_arr[5][3], B_arr[5][4], B_arr[5][5], B_arr[5][6], B_arr[5][7], B_arr[5][8], B_arr[5][9]},
			  {B_arr[6][0], B_arr[6][1], B_arr[6][2], B_arr[6][3], B_arr[6][4], B_arr[6][5], B_arr[6][6], B_arr[6][7], B_arr[6][8], B_arr[6][9]},
			  {B_arr[7][0], B_arr[7][1], B_arr[7][2], B_arr[7][3], B_arr[7][4], B_arr[7][5], B_arr[7][6], B_arr[7][7], B_arr[7][8], B_arr[7][9]},
			  {B_arr[8][0], B_arr[8][1], B_arr[8][2], B_arr[8][3], B_arr[8][4], B_arr[8][5], B_arr[8][6], B_arr[8][7], B_arr[8][8], B_arr[8][9]},
			  {B_arr[9][0], B_arr[9][1], B_arr[9][2], B_arr[9][3], B_arr[9][4], B_arr[9][5], B_arr[9][6], B_arr[9][7], B_arr[9][8], B_arr[9][9]},
			  {B_arr[10][0], B_arr[10][1], B_arr[10][2], B_arr[10][3], B_arr[10][4], B_arr[10][5], B_arr[10][6], B_arr[10][7], B_arr[10][8], B_arr[10][9]},
			  {B_arr[11][0], B_arr[11][1], B_arr[11][2], B_arr[11][3], B_arr[11][4], B_arr[11][5], B_arr[11][6], B_arr[11][7], B_arr[11][8], B_arr[11][9]},
			  {B_arr[12][0], B_arr[12][1], B_arr[12][2], B_arr[12][3], B_arr[12][4], B_arr[12][5], B_arr[12][6], B_arr[12][7], B_arr[12][8], B_arr[12][9]},
			  {B_arr[13][0], B_arr[13][1], B_arr[13][2], B_arr[13][3], B_arr[13][4], B_arr[13][5], B_arr[13][6], B_arr[13][7], B_arr[13][8], B_arr[13][9]},
			  {B_arr[14][0], B_arr[14][1], B_arr[14][2], B_arr[14][3], B_arr[14][4], B_arr[14][5], B_arr[14][6], B_arr[14][7], B_arr[14][8], B_arr[14][9]},
			  {B_arr[15][0], B_arr[15][1], B_arr[15][2], B_arr[15][3], B_arr[15][4], B_arr[15][5], B_arr[15][6], B_arr[15][7], B_arr[15][8], B_arr[15][9]},
			  {B_arr[16][0], B_arr[16][1], B_arr[16][2], B_arr[16][3], B_arr[16][4], B_arr[16][5], B_arr[16][6], B_arr[16][7], B_arr[16][8], B_arr[16][9]},
			  {B_arr[17][0], B_arr[17][1], B_arr[17][2], B_arr[17][3], B_arr[17][4], B_arr[17][5], B_arr[17][6], B_arr[17][7], B_arr[17][8], B_arr[17][9]},
			  {B_arr[18][0], B_arr[18][1], B_arr[18][2], B_arr[18][3], B_arr[18][4], B_arr[18][5], B_arr[18][6], B_arr[18][7], B_arr[18][8], B_arr[18][9]},
			  {B_arr[19][0], B_arr[19][1], B_arr[19][2], B_arr[19][3], B_arr[19][4], B_arr[19][5], B_arr[19][6], B_arr[19][7], B_arr[19][8], B_arr[19][9]},
			  {B_arr[20][0], B_arr[20][1], B_arr[20][2], B_arr[20][3], B_arr[20][4], B_arr[20][5], B_arr[20][6], B_arr[20][7], B_arr[20][8], B_arr[20][9]},
			  {B_arr[21][0], B_arr[21][1], B_arr[21][2], B_arr[21][3], B_arr[21][4], B_arr[21][5], B_arr[21][6], B_arr[21][7], B_arr[21][8], B_arr[21][9]},
			  {B_arr[22][0], B_arr[22][1], B_arr[22][2], B_arr[22][3], B_arr[22][4], B_arr[22][5], B_arr[22][6], B_arr[22][7], B_arr[22][8], B_arr[22][9]},
			  {B_arr[23][0], B_arr[23][1], B_arr[23][2], B_arr[23][3], B_arr[23][4], B_arr[23][5], B_arr[23][6], B_arr[23][7], B_arr[23][8], B_arr[23][9]},
			  {B_arr[24][0], B_arr[24][1], B_arr[24][2], B_arr[24][3], B_arr[24][4], B_arr[24][5], B_arr[24][6], B_arr[24][7], B_arr[24][8], B_arr[24][9]},
			  {B_arr[25][0], B_arr[25][1], B_arr[25][2], B_arr[25][3], B_arr[25][4], B_arr[25][5], B_arr[25][6], B_arr[25][7], B_arr[25][8], B_arr[25][9]},
			  {B_arr[26][0], B_arr[26][1], B_arr[26][2], B_arr[26][3], B_arr[26][4], B_arr[26][5], B_arr[26][6], B_arr[26][7], B_arr[26][8], B_arr[26][9]},
			  {B_arr[27][0], B_arr[27][1], B_arr[27][2], B_arr[27][3], B_arr[27][4], B_arr[27][5], B_arr[27][6], B_arr[27][7], B_arr[27][8], B_arr[27][9]},
			  {B_arr[28][0], B_arr[28][1], B_arr[28][2], B_arr[28][3], B_arr[28][4], B_arr[28][5], B_arr[28][6], B_arr[28][7], B_arr[28][8], B_arr[28][9]},
			  {B_arr[29][0], B_arr[29][1], B_arr[29][2], B_arr[29][3], B_arr[29][4], B_arr[29][5], B_arr[29][6], B_arr[29][7], B_arr[29][8], B_arr[29][9]},
		 	  {B_arr[30][0], B_arr[30][1], B_arr[30][2], B_arr[30][3], B_arr[30][4], B_arr[30][5], B_arr[30][6], B_arr[30][7], B_arr[30][8], B_arr[30][9]},
			  {B_arr[31][0], B_arr[31][1], B_arr[31][2], B_arr[31][3], B_arr[31][4], B_arr[31][5], B_arr[31][6], B_arr[31][7], B_arr[31][8], B_arr[31][9]}} = B;
			  
	integer i,j;
	always @*
	begin
		for(i=0; i<32; i=i+1)
		begin
			for(j=0; j<10; j=j+1)
				C_arr[i][j] = A_arr[i][j] - B_arr[i][j];
		end
	end
	
	assign C = {{C_arr[0][0], C_arr[0][1], C_arr[0][2], C_arr[0][3], C_arr[0][4], C_arr[0][5], C_arr[0][6], C_arr[0][7], C_arr[0][8], C_arr[0][9]},
					{C_arr[1][0], C_arr[1][1], C_arr[1][2], C_arr[1][3], C_arr[1][4], C_arr[1][5], C_arr[1][6], C_arr[1][7], C_arr[1][8], C_arr[1][9]},
					{C_arr[2][0], C_arr[2][1], C_arr[2][2], C_arr[2][3], C_arr[2][4], C_arr[2][5], C_arr[2][6], C_arr[2][7], C_arr[2][8], C_arr[2][9]},
					{C_arr[3][0], C_arr[3][1], C_arr[3][2], C_arr[3][3], C_arr[3][4], C_arr[3][5], C_arr[3][6], C_arr[3][7], C_arr[3][8], C_arr[3][9]},
					{C_arr[4][0], C_arr[4][1], C_arr[4][2], C_arr[4][3], C_arr[4][4], C_arr[4][5], C_arr[4][6], C_arr[4][7], C_arr[4][8], C_arr[4][9]},
					{C_arr[5][0], C_arr[5][1], C_arr[5][2], C_arr[5][3], C_arr[5][4], C_arr[5][5], C_arr[5][6], C_arr[5][7], C_arr[5][8], C_arr[5][9]},
					{C_arr[6][0], C_arr[6][1], C_arr[6][2], C_arr[6][3], C_arr[6][4], C_arr[6][5], C_arr[6][6], C_arr[6][7], C_arr[6][8], C_arr[6][9]},
					{C_arr[7][0], C_arr[7][1], C_arr[7][2], C_arr[7][3], C_arr[7][4], C_arr[7][5], C_arr[7][6], C_arr[7][7], C_arr[7][8], C_arr[7][9]},
					{C_arr[8][0], C_arr[8][1], C_arr[8][2], C_arr[8][3], C_arr[8][4], C_arr[8][5], C_arr[8][6], C_arr[8][7], C_arr[8][8], C_arr[8][9]},
					{C_arr[9][0], C_arr[9][1], C_arr[9][2], C_arr[9][3], C_arr[9][4], C_arr[9][5], C_arr[9][6], C_arr[9][7], C_arr[9][8], C_arr[9][9]},
					{C_arr[10][0], C_arr[10][1], C_arr[10][2], C_arr[10][3], C_arr[10][4], C_arr[10][5], C_arr[10][6], C_arr[10][7], C_arr[10][8], C_arr[10][9]},
					{C_arr[11][0], C_arr[11][1], C_arr[11][2], C_arr[11][3], C_arr[11][4], C_arr[11][5], C_arr[11][6], C_arr[11][7], C_arr[11][8], C_arr[11][9]},
					{C_arr[12][0], C_arr[12][1], C_arr[12][2], C_arr[12][3], C_arr[12][4], C_arr[12][5], C_arr[12][6], C_arr[12][7], C_arr[12][8], C_arr[12][9]},
					{C_arr[13][0], C_arr[13][1], C_arr[13][2], C_arr[13][3], C_arr[13][4], C_arr[13][5], C_arr[13][6], C_arr[13][7], C_arr[13][8], C_arr[13][9]},
					{C_arr[14][0], C_arr[14][1], C_arr[14][2], C_arr[14][3], C_arr[14][4], C_arr[14][5], C_arr[14][6], C_arr[14][7], C_arr[14][8], C_arr[14][9]},
					{C_arr[15][0], C_arr[15][1], C_arr[15][2], C_arr[15][3], C_arr[15][4], C_arr[15][5], C_arr[15][6], C_arr[15][7], C_arr[15][8], C_arr[15][9]},
					{C_arr[16][0], C_arr[16][1], C_arr[16][2], C_arr[16][3], C_arr[16][4], C_arr[16][5], C_arr[16][6], C_arr[16][7], C_arr[16][8], C_arr[16][9]},
					{C_arr[17][0], C_arr[17][1], C_arr[17][2], C_arr[17][3], C_arr[17][4], C_arr[17][5], C_arr[17][6], C_arr[17][7], C_arr[17][8], C_arr[17][9]},
					{C_arr[18][0], C_arr[18][1], C_arr[18][2], C_arr[18][3], C_arr[18][4], C_arr[18][5], C_arr[18][6], C_arr[18][7], C_arr[18][8], C_arr[18][9]},
					{C_arr[19][0], C_arr[19][1], C_arr[19][2], C_arr[19][3], C_arr[19][4], C_arr[19][5], C_arr[19][6], C_arr[19][7], C_arr[19][8], C_arr[19][9]},
					{C_arr[20][0], C_arr[20][1], C_arr[20][2], C_arr[20][3], C_arr[20][4], C_arr[20][5], C_arr[20][6], C_arr[20][7], C_arr[20][8], C_arr[20][9]},
					{C_arr[21][0], C_arr[21][1], C_arr[21][2], C_arr[21][3], C_arr[21][4], C_arr[21][5], C_arr[21][6], C_arr[21][7], C_arr[21][8], C_arr[21][9]},
					{C_arr[22][0], C_arr[22][1], C_arr[22][2], C_arr[22][3], C_arr[22][4], C_arr[22][5], C_arr[22][6], C_arr[22][7], C_arr[22][8], C_arr[22][9]},
					{C_arr[23][0], C_arr[23][1], C_arr[23][2], C_arr[23][3], C_arr[23][4], C_arr[23][5], C_arr[23][6], C_arr[23][7], C_arr[23][8], C_arr[23][9]},
					{C_arr[24][0], C_arr[24][1], C_arr[24][2], C_arr[24][3], C_arr[24][4], C_arr[24][5], C_arr[24][6], C_arr[24][7], C_arr[24][8], C_arr[24][9]},
					{C_arr[25][0], C_arr[25][1], C_arr[25][2], C_arr[25][3], C_arr[25][4], C_arr[25][5], C_arr[25][6], C_arr[25][7], C_arr[25][8], C_arr[25][9]},
					{C_arr[26][0], C_arr[26][1], C_arr[26][2], C_arr[26][3], C_arr[26][4], C_arr[26][5], C_arr[26][6], C_arr[26][7], C_arr[26][8], C_arr[26][9]},
					{C_arr[27][0], C_arr[27][1], C_arr[27][2], C_arr[27][3], C_arr[27][4], C_arr[27][5], C_arr[27][6], C_arr[27][7], C_arr[27][8], C_arr[27][9]},
					{C_arr[28][0], C_arr[28][1], C_arr[28][2], C_arr[28][3], C_arr[28][4], C_arr[28][5], C_arr[28][6], C_arr[28][7], C_arr[28][8], C_arr[28][9]},
					{C_arr[29][0], C_arr[29][1], C_arr[29][2], C_arr[29][3], C_arr[29][4], C_arr[29][5], C_arr[29][6], C_arr[29][7], C_arr[29][8], C_arr[29][9]},
					{C_arr[30][0], C_arr[30][1], C_arr[30][2], C_arr[30][3], C_arr[30][4], C_arr[30][5], C_arr[30][6], C_arr[30][7], C_arr[30][8], C_arr[30][9]},
					{C_arr[31][0], C_arr[31][1], C_arr[31][2], C_arr[31][3], C_arr[31][4], C_arr[31][5], C_arr[31][6], C_arr[31][7], C_arr[31][8], C_arr[31][9]}};
	
endmodule

//tested