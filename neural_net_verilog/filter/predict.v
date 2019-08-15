module predict(enable,img,digit);
	
	input enable;
	input [48:0] img;
	output reg [3:0] digit;
	
	wire signed [5:0] vert1, vert2, vert3, vert4, vert5, vert6,
						   curveul1, curveul2, curveul3, curveul4, curveul5, curveul6, curveul7,
						   curveur1, curveur2, curveur3, curveur4, curveur5, curveur6, curveur7,
						   curvell1, curvell2, curvell3, curvell4, curvell5, curvell6, curvell7,
						   curvelr1, curvelr2, curvelr3, curvelr4, curvelr5, curvelr6, curvelr7,
							horzh1, horzh2, horzm1, horzm2, horzm3, horzl1, horzl2,
						   fourm1, fourm2, fourm3, fourm4, fourh1, fourh2, fourh3, fourh4, fourl1, fourl2, fourl3, fourl4,
						   diag1, diag2, diag3;				 
	wire is0, is1, is2, is3, is4;

	wire signed [5:0] thresh0, thresh1, thresh2, thresh3, thresh4;
	assign thresh0 = 6'd4;
	assign thresh1 = 6'd5;
	assign thresh2 = 6'd3;
	assign thresh3 = 6'd4;
	assign thresh4 = 6'd10;
	
	assign vert1 = {5'b0,img[0]} + {5'b0,img[1]} + {5'b0,img[7]} + {5'b0,img[8]} + {5'b0,img[14]} + {5'b0,img[15]} + {5'b0,img[21]} + {5'b0,img[22]}
				+{5'b0,img[28]} + {5'b0,img[29]} + {5'b0,img[35]} + {5'b0,img[36]} + {5'b0,img[42]} + {5'b0,img[43]} - {5'b0,img[9]}
			   -{5'b0,img[16]} - {5'b0,img[17]} - {5'b0,img[23]} - {5'b0,img[24]} - {5'b0,img[30]} - {5'b0,img[31]} - {5'b0,img[37]} ;
	assign vert2 = {5'b0,img[1]} + {5'b0,img[2]} + {5'b0,img[8]} + {5'b0,img[9]} + {5'b0,img[15]} + {5'b0,img[16]} + {5'b0,img[22]} + {5'b0,img[23]}
				+ {5'b0,img[29]} + {5'b0,img[30]} + {5'b0,img[36]} + {5'b0,img[37]} + {5'b0,img[43]} + {5'b0,img[44]} - {5'b0,img[14]}
				- {5'b0,img[21]} - {5'b0,img[28]} - {5'b0,img[35]} - {5'b0,img[10]} - {5'b0,img[17]} - {5'b0,img[24]} - {5'b0,img[31]}
				- {5'b0,img[38]} - {5'b0,img[18]} - {5'b0,img[35]} - {5'b0,img[32]} ;
	assign vert3 = {5'b0,img[2]} + {5'b0,img[3]} + {5'b0,img[9]} + {5'b0,img[10]} + {5'b0,img[16]} + {5'b0,img[17]} + {5'b0,img[23]} + {5'b0,img[24]}
				+ {5'b0,img[30]} + {5'b0,img[31]} + {5'b0,img[37]} + {5'b0,img[38]} + {5'b0,img[44]} + {5'b0,img[45]} - {5'b0,img[21]}
				- {5'b0,img[28]} - {5'b0,img[15]} - {5'b0,img[22]} - {5'b0,img[29]} - {5'b0,img[36]} - {5'b0,img[11]} - {5'b0,img[18]}
				- {5'b0,img[25]} - {5'b0,img[32]} - {5'b0,img[39]} - {5'b0,img[19]} - {5'b0,img[26]} - {5'b0,img[33]} ;
	assign vert4 = {5'b0,img[3]} + {5'b0,img[4]} + {5'b0,img[10]} + {5'b0,img[11]} + {5'b0,img[17]} + {5'b0,img[18]} + {5'b0,img[24]} + {5'b0,img[25]}
				+ {5'b0,img[31]} + {5'b0,img[32]} + {5'b0,img[36]} + {5'b0,img[37]} + {5'b0,img[43]} + {5'b0,img[44]} - {5'b0,img[22]}
				- {5'b0,img[29]} - {5'b0,img[16]} - {5'b0,img[23]} - {5'b0,img[30]} - {5'b0,img[37]} - {5'b0,img[12]} - {5'b0,img[19]}
				- {5'b0,img[26]} - {5'b0,img[33]} - {5'b0,img[40]} - {5'b0,img[20]} - {5'b0,img[27]} - {5'b0,img[34]} ;
	assign vert5 = {5'b0,img[4]} + {5'b0,img[5]} + {5'b0,img[11]} + {5'b0,img[12]} + {5'b0,img[18]} + {5'b0,img[19]} + {5'b0,img[25]} + {5'b0,img[26]}
				+ {5'b0,img[32]} + {5'b0,img[33]} + {5'b0,img[37]} + {5'b0,img[38]} + {5'b0,img[44]} + {5'b0,img[45]} - {5'b0,img[23]}
				- {5'b0,img[30]} - {5'b0,img[17]} - {5'b0,img[24]} - {5'b0,img[31]} - {5'b0,img[38]} - {5'b0,img[13]} - {5'b0,img[20]}
				- {5'b0,img[27]} - {5'b0,img[34]} - {5'b0,img[41]} ;	
	assign vert6 = {5'b0,img[5]} + {5'b0,img[6]} + {5'b0,img[12]} + {5'b0,img[13]} + {5'b0,img[19]} + {5'b0,img[20]} + {5'b0,img[26]} + {5'b0,img[27]}
				+ {5'b0,img[33]} + {5'b0,img[34]} + {5'b0,img[38]} + {5'b0,img[39]} + {5'b0,img[45]} + {5'b0,img[46]} - {5'b0,img[24]}
				- {5'b0,img[31]} - {5'b0,img[18]} - {5'b0,img[25]} - {5'b0,img[32]} - {5'b0,img[39]} ;
				
	assign curveul1 = {5'b0,img[1]} + {5'b0,img[2]} + {5'b0,img[7]} + {5'b0,img[8]} + {5'b0,img[14]} + {5'b0,img[21]} ;
	assign curveul2 = {5'b0,img[2]} + {5'b0,img[3]} + {5'b0,img[8]} + {5'b0,img[9]} + {5'b0,img[15]} + {5'b0,img[22]} ;
	assign curveul3 = {5'b0,img[3]} + {5'b0,img[4]} + {5'b0,img[9]} + {5'b0,img[10]} + {5'b0,img[16]} + {5'b0,img[23]} ;
	assign curveul4 = {5'b0,img[8]} + {5'b0,img[9]} + {5'b0,img[14]} + {5'b0,img[15]} + {5'b0,img[21]} + {5'b0,img[28]} ;
	assign curveul5 = {5'b0,img[9]} + {5'b0,img[10]} + {5'b0,img[15]} + {5'b0,img[16]} + {5'b0,img[22]} + {5'b0,img[29]} ;
	assign curveul6 = {5'b0,img[15]} + {5'b0,img[16]} + {5'b0,img[21]} + {5'b0,img[22]} + {5'b0,img[28]} + {5'b0,img[35]} ; 
	assign curveul7 = {5'b0,img[16]} + {5'b0,img[17]} + {5'b0,img[22]} + {5'b0,img[23]} + {5'b0,img[29]} + {5'b0,img[36]} ;

	assign curveur1 = {5'b0,img[4]} + {5'b0,img[5]} + {5'b0,img[12]} + {5'b0,img[13]} + {5'b0,img[20]} + {5'b0,img[27]} ;
	assign curveur2 = {5'b0,img[3]} + {5'b0,img[4]} + {5'b0,img[11]} + {5'b0,img[12]} + {5'b0,img[19]} + {5'b0,img[26]} ;
	assign curveur3 = {5'b0,img[2]} + {5'b0,img[3]} + {5'b0,img[10]} + {5'b0,img[11]} + {5'b0,img[18]} + {5'b0,img[25]} ;
	assign curveur4 = {5'b0,img[11]} + {5'b0,img[12]} + {5'b0,img[19]} + {5'b0,img[20]} + {5'b0,img[27]} + {5'b0,img[34]} ;
	assign curveur5 = {5'b0,img[10]} + {5'b0,img[11]} + {5'b0,img[18]} + {5'b0,img[19]} + {5'b0,img[26]} + {5'b0,img[33]} ;
	assign curveur6 = {5'b0,img[18]} + {5'b0,img[19]} + {5'b0,img[26]} + {5'b0,img[27]} + {5'b0,img[33]} + {5'b0,img[41]} ;
	assign curveur7 = {5'b0,img[17]} + {5'b0,img[18]} + {5'b0,img[25]} + {5'b0,img[26]} + {5'b0,img[33]} + {5'b0,img[40]} ;

	assign curvell1 = {5'b0,img[21]} + {5'b0,img[28]} + {5'b0,img[35]} + {5'b0,img[36]} + {5'b0,img[43]} + {5'b0,img[44]} ;
	assign curvell2 = {5'b0,img[22]} + {5'b0,img[29]} + {5'b0,img[36]} + {5'b0,img[37]} + {5'b0,img[44]} + {5'b0,img[45]} ;
	assign curvell3 = {5'b0,img[23]} + {5'b0,img[30]} + {5'b0,img[37]} + {5'b0,img[38]} + {5'b0,img[45]} + {5'b0,img[46]} ;
	assign curvell4 = {5'b0,img[13]} + {5'b0,img[21]} + {5'b0,img[28]} + {5'b0,img[29]} + {5'b0,img[36]} + {5'b0,img[37]} ;	
	assign curvell5 = {5'b0,img[14]} + {5'b0,img[22]} + {5'b0,img[29]} + {5'b0,img[30]} + {5'b0,img[37]} + {5'b0,img[38]} ;
	assign curvell6 = {5'b0,img[7]} + {5'b0,img[14]} + {5'b0,img[21]} + {5'b0,img[22]} + {5'b0,img[29]} + {5'b0,img[30]} ;
	assign curvell7 = {5'b0,img[8]} + {5'b0,img[15]} + {5'b0,img[22]} + {5'b0,img[23]} + {5'b0,img[30]} + {5'b0,img[31]} ;

	assign curvelr1 = {5'b0,img[26]} + {5'b0,img[33]} + {5'b0,img[39]} + {5'b0,img[40]} + {5'b0,img[45]} + {5'b0,img[46]} ;
	assign curvelr2 = {5'b0,img[25]} + {5'b0,img[32]} + {5'b0,img[38]} + {5'b0,img[39]} + {5'b0,img[44]} + {5'b0,img[45]} ;
	assign curvelr3 = {5'b0,img[24]} + {5'b0,img[31]} + {5'b0,img[37]} + {5'b0,img[38]} + {5'b0,img[43]} + {5'b0,img[44]} ;
	assign curvelr4 = {5'b0,img[20]} + {5'b0,img[27]} + {5'b0,img[33]} + {5'b0,img[34]} + {5'b0,img[39]} + {5'b0,img[40]} ;
	assign curvelr5 = {5'b0,img[19]} + {5'b0,img[26]} + {5'b0,img[32]} + {5'b0,img[33]} + {5'b0,img[38]} + {5'b0,img[39]} ;
	assign curvelr6 = {5'b0,img[13]} + {5'b0,img[20]} + {5'b0,img[26]} + {5'b0,img[27]} + {5'b0,img[32]} + {5'b0,img[33]} ;
	assign curvelr7 = {5'b0,img[12]} + {5'b0,img[19]} + {5'b0,img[25]} + {5'b0,img[26]} + {5'b0,img[31]} + {5'b0,img[32]} ;

	assign horzh1 = {5'b0,img[0]} + {5'b0,img[1]} + {5'b0,img[2]} + {5'b0,img[3]} + {5'b0,img[4]} + {5'b0,img[5]} + {5'b0,img[6]} ;
	assign horzh2 = {5'b0,img[7]} + {5'b0,img[8]} + {5'b0,img[9]} + {5'b0,img[10]} + {5'b0,img[11]} + {5'b0,img[12]} + {5'b0,img[13]} ;
	assign horzm1 = {5'b0,img[14]} + {5'b0,img[15]} + {5'b0,img[16]} + {5'b0,img[17]} + {5'b0,img[18]} + {5'b0,img[19]} + {5'b0,img[20]} ;
	assign horzm2 = {5'b0,img[21]} + {5'b0,img[22]} + {5'b0,img[23]} + {5'b0,img[24]} + {5'b0,img[25]} + {5'b0,img[26]} + {5'b0,img[27]} ;
	assign horzm3 = {5'b0,img[28]} + {5'b0,img[29]} + {5'b0,img[30]} + {5'b0,img[31]} + {5'b0,img[32]} + {5'b0,img[33]} + {5'b0,img[34]} ;	
	assign horzl1 = {5'b0,img[35]} + {5'b0,img[36]} + {5'b0,img[37]} + {5'b0,img[38]} + {5'b0,img[39]} + {5'b0,img[40]} + {5'b0,img[41]} ;
	assign horzl2 = {5'b0,img[42]} + {5'b0,img[43]} + {5'b0,img[44]} + {5'b0,img[45]} + {5'b0,img[46]} + {5'b0,img[47]} + {5'b0,img[48]} ;


	assign fourm1 = {5'b0,img[0]} + {5'b0,img[7]} + {5'b0,img[14]} + {5'b0,img[21]} + {5'b0,img[2]} + {5'b0,img[9]} + {5'b0,img[16]}
				+ {5'b0,img[23]} + {5'b0,img[30]} + {5'b0,img[37]} + {5'b0,img[44]} + {5'b0,img[24]} - {5'b0,img[28]} - {5'b0,img[29]} - {5'b0,img[35]} ;
	assign fourm2 = {5'b0,img[21]} + {5'b0,img[1]} + {5'b0,img[8]} + {5'b0,img[15]} + {5'b0,img[22]} + {5'b0,img[3]} + {5'b0,img[10]}
				+ {5'b0,img[17]} + {5'b0,img[24]} + {5'b0,img[31]} + {5'b0,img[38]} + {5'b0,img[45]} + {5'b0,img[25]} - {5'b0,img[28]} - {5'b0,img[29]}
				- {5'b0,img[30]} - {5'b0,img[35]} - {5'b0,img[36]} ;
	assign fourm3 = {5'b0,img[22]} + {5'b0,img[2]} + {5'b0,img[9]} + {5'b0,img[16]} + {5'b0,img[23]} + {5'b0,img[4]} + {5'b0,img[11]}
				+ {5'b0,img[18]} + {5'b0,img[25]} + {5'b0,img[32]} + {5'b0,img[39]} + {5'b0,img[46]} + {5'b0,img[26]} - {5'b0,img[29]} - {5'b0,img[30]}
				- {5'b0,img[31]} - {5'b0,img[36]} - {5'b0,img[37]} ;
	assign fourm4 = {5'b0,img[23]} + {5'b0,img[3]} + {5'b0,img[10]} + {5'b0,img[17]} + {5'b0,img[24]} + {5'b0,img[5]} + {5'b0,img[12]}
				+ {5'b0,img[19]} + {5'b0,img[26]} + {5'b0,img[33]} + {5'b0,img[40]} + {5'b0,img[47]} + {5'b0,img[27]} - {5'b0,img[30]} - {5'b0,img[31]}
				- {5'b0,img[32]} - {5'b0,img[37]} - {5'b0,img[38]} ;
	assign fourm5 = {5'b0,img[24]} + {5'b0,img[4]} + {5'b0,img[11]} + {5'b0,img[18]} + {5'b0,img[25]} + {5'b0,img[6]} + {5'b0,img[13]}
				+ {5'b0,img[20]} + {5'b0,img[27]} + {5'b0,img[34]} + {5'b0,img[41]} + {5'b0,img[48]} - {5'b0,img[31]} - {5'b0,img[32]} - {5'b0,img[33]}
				- {5'b0,img[38]} - {5'b0,img[39]} ;

	assign fourh1 = {5'b0,img[0]} + {5'b0,img[7]} + {5'b0,img[14]} + {5'b0,img[2]} + {5'b0,img[9]} + {5'b0,img[16]} + {5'b0,img[23]} + {5'b0,img[30]}
				+ {5'b0,img[37]} + {5'b0,img[17]} - {5'b0,img[21]} - {5'b0,img[22]} - {5'b0,img[28]} ;
	assign fourh2 = {5'b0,img[14]} + {5'b0,img[1]} + {5'b0,img[8]} + {5'b0,img[15]} + {5'b0,img[3]} + {5'b0,img[10]} + {5'b0,img[17]} + {5'b0,img[24]}
				+ {5'b0,img[31]} + {5'b0,img[38]} + {5'b0,img[45]} + {5'b0,img[18]} - {5'b0,img[21]} - {5'b0,img[22]} - {5'b0,img[33]} - {5'b0,img[28]}
				- {5'b0,img[29]} ;
	assign fourh3 = {5'b0,img[15]} + {5'b0,img[2]} + {5'b0,img[9]} + {5'b0,img[16]} + {5'b0,img[4]} + {5'b0,img[11]} + {5'b0,img[18]} + {5'b0,img[25]}
				+ {5'b0,img[32]} + {5'b0,img[39]} + {5'b0,img[46]} + {5'b0,img[19]} - {5'b0,img[22]} - {5'b0,img[23]} - {5'b0,img[24]} - {5'b0,img[29]}
				- {5'b0,img[30]} ;
	assign fourh4 = {5'b0,img[16]} + {5'b0,img[3]} + {5'b0,img[10]} + {5'b0,img[17]} + {5'b0,img[5]} + {5'b0,img[12]} + {5'b0,img[19]} + {5'b0,img[26]}
				+ {5'b0,img[33]} + {5'b0,img[40]} + {5'b0,img[47]} + {5'b0,img[10]} - {5'b0,img[23]} - {5'b0,img[24]} - {5'b0,img[25]} - {5'b0,img[30]}
				- {5'b0,img[31]} ;
	assign fourh5 = {5'b0,img[17]} + {5'b0,img[4]} + {5'b0,img[11]} + {5'b0,img[18]} + {5'b0,img[6]} + {5'b0,img[13]} + {5'b0,img[20]} + {5'b0,img[27]}
				+ {5'b0,img[34]} + {5'b0,img[41]} + {5'b0,img[48]} - {5'b0,img[24]} - {5'b0,img[25]} - {5'b0,img[26]} - {5'b0,img[31]} - {5'b0,img[32]} ;

	assign fourl1 = {5'b0,img[0]} + {5'b0,img[7]} + {5'b0,img[14]} + {5'b0,img[21]} + {5'b0,img[28]} + {5'b0,img[2]} + {5'b0,img[9]} + {5'b0,img[16]}
				+ {5'b0,img[23]} + {5'b0,img[30]} + {5'b0,img[37]} + {5'b0,img[44]} + {5'b0,img[31]} - {5'b0,img[35]} - {5'b0,img[36]} - {5'b0,img[42]} ;
	assign fourl2 = {5'b0,img[28]} + {5'b0,img[1]} + {5'b0,img[8]} + {5'b0,img[15]} + {5'b0,img[22]} + {5'b0,img[29]} + {5'b0,img[3]} + {5'b0,img[10]}
				+ {5'b0,img[17]} + {5'b0,img[24]} + {5'b0,img[31]} + {5'b0,img[38]} + {5'b0,img[45]} + {5'b0,img[32]} - {5'b0,img[35]} - {5'b0,img[36]}
				- {5'b0,img[37]} - {5'b0,img[42]} - {5'b0,img[43]} ;
	assign fourl3 = {5'b0,img[29]} + {5'b0,img[2]} + {5'b0,img[9]} + {5'b0,img[16]} + {5'b0,img[23]} + {5'b0,img[30]} + {5'b0,img[4]} + {5'b0,img[11]}
				+ {5'b0,img[18]} + {5'b0,img[25]} + {5'b0,img[32]} + {5'b0,img[39]} + {5'b0,img[46]} + {5'b0,img[33]} - {5'b0,img[36]} - {5'b0,img[37]}
				- {5'b0,img[38]} - {5'b0,img[43]} - {5'b0,img[44]} ;
	assign fourl4 = {5'b0,img[30]} + {5'b0,img[3]} + {5'b0,img[10]} + {5'b0,img[17]} + {5'b0,img[24]} + {5'b0,img[31]} + {5'b0,img[5]} + {5'b0,img[12]}
				+ {5'b0,img[19]} + {5'b0,img[26]} + {5'b0,img[33]} + {5'b0,img[40]} + {5'b0,img[47]} + {5'b0,img[34]} - {5'b0,img[37]} - {5'b0,img[38]}
				- {5'b0,img[39]} - {5'b0,img[44]} - {5'b0,img[45]} ;
	assign fourl5 = {5'b0,img[31]} + {5'b0,img[4]} + {5'b0,img[11]} + {5'b0,img[18]} + {5'b0,img[25]} + {5'b0,img[32]} + {5'b0,img[6]} + {5'b0,img[13]}
				+ {5'b0,img[20]} + {5'b0,img[27]} + {5'b0,img[34]} + {5'b0,img[41]} + {5'b0,img[48]} - {5'b0,img[38]} - {5'b0,img[39]} - {5'b0,img[40]}
				- {5'b0,img[45]} - {5'b0,img[46]} ;

	assign diag1 = {5'b0,img[17]} + {5'b0,img[23]} + {5'b0,img[24]} + {5'b0,img[29]} + {5'b0,img[30]} + {5'b0,img[35]} + {5'b0,img[36]} ;
	assign diag2 = {5'b0,img[18]} + {5'b0,img[23]} + {5'b0,img[25]} + {5'b0,img[30]} + {5'b0,img[31]} + {5'b0,img[36]} + {5'b0,img[37]} ;
	assign diag3 = {5'b0,img[19]} + {5'b0,img[24]} + {5'b0,img[26]} + {5'b0,img[31]} + {5'b0,img[32]} + {5'b0,img[37]} + {5'b0,img[38]} ;

	
	
	assign is4 = (fourh1 >= $signed(thresh4)) | (fourh2 >= $signed(thresh4)) | (fourh3 >= $signed(thresh4)) | (fourh4 >= $signed(thresh4))
					 | (fourm1 >= $signed(thresh4)) | (fourm2 >= $signed(thresh4)) | (fourm3 >= $signed(thresh4)) | (fourm4 >= $signed(thresh4))
					 | (fourl1 >= $signed(thresh4)) | (fourl2 >= $signed(thresh4)) | (fourl3 >= $signed(thresh4)) | (fourl4 >= $signed(thresh4));
					 
	assign is0ul = (curveul1 >= thresh0) | (curveul2 >= thresh0) | (curveul3 >= thresh0) | (curveul4 >= thresh0)
						| (curveul5 >= thresh0) | (curveul6 >= thresh0) | (curveul7 >= thresh0);
	assign is0ur = (curveur1 >= thresh0) | (curveur2 >= thresh0) | (curveur3 >= thresh0) | (curveur4 >= thresh0)
						| (curveur5 >= thresh0) | (curveur6 >= thresh0) | (curveur7 >= thresh0);
	assign is0ll = (curvell1 >= thresh0) | (curvell2 >= thresh0) | (curvell3 >= thresh0) | (curvell4 >= thresh0)
						| (curvell5 >= thresh0) | (curvell6 >= thresh0) | (curvell7 >= thresh0);
	assign is0lr = (curvelr1 >= thresh0) | (curvelr2 >= thresh0) | (curvelr3 >= thresh0) | (curvelr4 >= thresh0)
						| (curvelr5 >= thresh0) | (curvelr6 >= thresh0) | (curvelr7 >= thresh0);
	assign is0 = ({2'b0, is0ul} + {2'b0,is0ur} + {2'b0,is0ll} + {2'b0, is0lr} >= 3'd4) & (horzl2 < 5);
	
	assign is3 = ((horzh1 >= thresh3) | (horzh2 >= thresh3)) & ((horzm1 >= thresh3) | (horzm2 >= thresh3) | (horzm3 >= thresh3))
						& ((horzl1 >= thresh3) | (horzl2 >= thresh3));
	
	assign is1 = ((vert1 >= thresh1) | (vert2 >= thresh1) | (vert3 >= thresh1) | (vert4 >= thresh1) | (vert5 >= thresh1) | (vert6 >= thresh1))
						& (horzl1 < thresh3) & (horzl2 < thresh3);
	
	assign is2 = ((horzl1 >= thresh3) | (horzl2 >= thresh3)) & ((diag1 >= thresh3) | (diag2 >= thresh3) | (diag2 >= thresh3));
	
	always @*
	begin
		if (enable == 1'b1)
		begin
			if (is4 == 1'b1)
				digit <= 4'd4;
			else if (is0 == 1'b1)
				digit <= 4'd0;
			else if (is1 == 1'b1)
				digit <= 4'd1;
			else if (is3 == 1'b1)
				digit <= 4'd3;
			else if (is2 == 1'b1)
				digit <= 4'd2;
			else
				digit <= 4'd1;			
		end
	end
endmodule
