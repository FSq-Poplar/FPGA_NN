module predict(enable,img,digit);
	
	input enable;
	input [48:0] img;
	output reg [3:0] digit;
	
	wire signed [5:0] vert1, vert2, vert3, vert4, vert5, vert6,
						   curveul1, curveul2, curveul3, curveul4, curveul5, curveul6, curveul7,
						   curveur1, curveur2, curveur3, curveur4, curveur5, curveur6, curveur7,
						   curvell1, curvell2, curvell3, curvell4, curvell5, curvell6, curvell7,
						   curvelr1, curvelr2, curvelr3, curvelr4, curvelr5, curvelr6, curvelr7,
						   horzlow1, horzlow2, horzlow3, horzlow4,
						   looplow1, looplow2, looplow3, looplow4, looplow5, looplow6, looplow7, looplow8,
						   loophigh1, loophigh2, loophigh3, loophigh4, loophigh5, loophigh6, loophigh7, loophigh8,
						   fourm1, fourm2, fourm3, fourm4, fourh1, fourh2, fourh3, fourh4, fourl1, fourl2, fourl3, fourl4,
						   diag1, diag2, diag3;				 
	wire is0, is1, is2, is3, is4;

	assign vert1 = {3'b0,img[0]} + {3'b0,img[1]} + {3'b0,img[7]} + {3'b0,img[8]} + {3'b0,img[14]} + {3'b0,img[15]} + {3'b0,img[21]} + {3'b0,img[22]}
				+{3'b0,img[28]} + {3'b0,img[29]} + {3'b0,img[35]} + {3'b0,img[36]} + {3'b0,img[42]} + {3'b0,img[43]} + {3'b0,img[9]}
			   -{3'b0,img[16]} - {3'b0,img[17]} - {3'b0,img[23]} - {3'b0,img[24]} - {3'b0,img[30]} - {3'b0,img[31]} - {3'b0,img[37]} ;
	assign vert2 = {3'b0,img[1]} + {3'b0,img[2]} + {3'b0,img[8]} + {3'b0,img[9]} + {3'b0,img[15]} + {3'b0,img[16]} + {3'b0,img[22]} + {3'b0,img[23]}
				+ {3'b0,img[29]} + {3'b0,img[30]} + {3'b0,img[36]} + {3'b0,img[37]} + {3'b0,img[43]} + {3'b0,img[44]} + {3'b0,img[14]}
				- {3'b0,img[21]} - {3'b0,img[28]} - {3'b0,img[35]} - {3'b0,img[10]} - {3'b0,img[17]} - {3'b0,img[24]} - {3'b0,img[31]}
				- {3'b0,img[38]} - {3'b0,img[18]} - {3'b0,img[35]} - {3'b0,img[32]} ;
	assign vert3 = {3'b0,img[2]} + {3'b0,img[3]} + {3'b0,img[9]} + {3'b0,img[10]} + {3'b0,img[16]} + {3'b0,img[17]} + {3'b0,img[23]} + {3'b0,img[24]}
				+ {3'b0,img[30]} + {3'b0,img[31]} + {3'b0,img[37]} + {3'b0,img[38]} + {3'b0,img[44]} + {3'b0,img[45]} + {3'b0,img[21]}
				- {3'b0,img[28]} - {3'b0,img[15]} - {3'b0,img[22]} - {3'b0,img[29]} - {3'b0,img[36]} - {3'b0,img[11]} - {3'b0,img[18]}
				- {3'b0,img[25]} - {3'b0,img[32]} - {3'b0,img[39]} - {3'b0,img[19]} - {3'b0,img[26]} - {3'b0,img[33]} ;
	assign vert4 = {3'b0,img[3]} + {3'b0,img[4]} + {3'b0,img[10]} + {3'b0,img[11]} + {3'b0,img[17]} + {3'b0,img[18]} + {3'b0,img[24]} + {3'b0,img[25]}
				+ {3'b0,img[31]} + {3'b0,img[32]} + {3'b0,img[36]} + {3'b0,img[37]} + {3'b0,img[43]} + {3'b0,img[44]} + {3'b0,img[22]}
				- {3'b0,img[29]} - {3'b0,img[16]} - {3'b0,img[23]} - {3'b0,img[30]} - {3'b0,img[37]} - {3'b0,img[12]} - {3'b0,img[19]}
				- {3'b0,img[26]} - {3'b0,img[33]} - {3'b0,img[40]} - {3'b0,img[20]} - {3'b0,img[27]} - {3'b0,img[34]} ;
	assign vert5 = {3'b0,img[4]} + {3'b0,img[5]} + {3'b0,img[11]} + {3'b0,img[12]} + {3'b0,img[18]} + {3'b0,img[19]} + {3'b0,img[25]} + {3'b0,img[26]}
				+ {3'b0,img[32]} + {3'b0,img[33]} + {3'b0,img[37]} + {3'b0,img[38]} + {3'b0,img[44]} + {3'b0,img[45]} + {3'b0,img[23]}
				- {3'b0,img[30]} - {3'b0,img[17]} - {3'b0,img[24]} - {3'b0,img[31]} - {3'b0,img[38]} - {3'b0,img[13]} - {3'b0,img[20]}
				- {3'b0,img[27]} - {3'b0,img[34]} - {3'b0,img[41]} ;	
	assign vert6 = {3'b0,img[5]} + {3'b0,img[6]} + {3'b0,img[12]} + {3'b0,img[13]} + {3'b0,img[19]} + {3'b0,img[20]} + {3'b0,img[26]} + {3'b0,img[27]}
				+ {3'b0,img[33]} + {3'b0,img[34]} + {3'b0,img[38]} + {3'b0,img[39]} + {3'b0,img[45]} + {3'b0,img[46]} + {3'b0,img[24]}
				- {3'b0,img[31]} - {3'b0,img[18]} - {3'b0,img[25]} - {3'b0,img[32]} - {3'b0,img[39]} ;
				
	assign curveul1 = {3'b0,img[1]} + {3'b0,img[2]} + {3'b0,img[7]} + {3'b0,img[8]} + {3'b0,img[14]} + {3'b0,img[21]} + {3'b0,img[0]} - {3'b0,img[15]} ;
	assign curveul2 = {3'b0,img[2]} + {3'b0,img[3]} + {3'b0,img[8]} + {3'b0,img[9]} + {3'b0,img[15]} + {3'b0,img[22]} + {3'b0,img[1]} - {3'b0,img[16]} ;
	assign curveul3 = {3'b0,img[3]} + {3'b0,img[4]} + {3'b0,img[9]} + {3'b0,img[10]} + {3'b0,img[16]} + {3'b0,img[23]} + {3'b0,img[2]} - {3'b0,img[17]} ;
	assign curveul4 = {3'b0,img[8]} + {3'b0,img[9]} + {3'b0,img[14]} + {3'b0,img[15]} + {3'b0,img[21]} + {3'b0,img[28]} + {3'b0,img[7]} - {3'b0,img[22]} ;
	assign curveul5 = {3'b0,img[9]} + {3'b0,img[10]} + {3'b0,img[15]} + {3'b0,img[16]} + {3'b0,img[22]} + {3'b0,img[29]} + {3'b0,img[8]} - {3'b0,img[23]} ;
	assign curveul6 = {3'b0,img[15]} + {3'b0,img[16]} + {3'b0,img[21]} + {3'b0,img[22]} + {3'b0,img[28]} + {3'b0,img[35]} + {3'b0,img[14]} - {3'b0,img[29]}; 
	assign curveul7 = {3'b0,img[16]} + {3'b0,img[17]} + {3'b0,img[22]} + {3'b0,img[23]} + {3'b0,img[29]} + {3'b0,img[36]} + {3'b0,img[15]} - {3'b0,img[30]} ;

	assign curveur1 = {3'b0,img[4]} + {3'b0,img[5]} + {3'b0,img[12]} + {3'b0,img[13]} + {3'b0,img[20]} + {3'b0,img[27]} + {3'b0,img[6]} - {3'b0,img[19]} ;
	assign curveur2 = {3'b0,img[3]} + {3'b0,img[4]} + {3'b0,img[11]} + {3'b0,img[12]} + {3'b0,img[19]} + {3'b0,img[26]} + {3'b0,img[5]} - {3'b0,img[18]} ;
	assign curveur3 = {3'b0,img[2]} + {3'b0,img[3]} + {3'b0,img[10]} + {3'b0,img[11]} + {3'b0,img[18]} + {3'b0,img[25]} + {3'b0,img[4]} - {3'b0,img[17]} ;
	assign curveur4 = {3'b0,img[11]} + {3'b0,img[12]} + {3'b0,img[19]} + {3'b0,img[20]} + {3'b0,img[27]} + {3'b0,img[34]} + {3'b0,img[13]} - {3'b0,img[26]} ;
	assign curveur5 = {3'b0,img[10]} + {3'b0,img[11]} + {3'b0,img[18]} + {3'b0,img[19]} + {3'b0,img[26]} + {3'b0,img[33]} + {3'b0,img[12]} - {3'b0,img[25]} ;
	assign curveur6 = {3'b0,img[18]} + {3'b0,img[19]} + {3'b0,img[26]} + {3'b0,img[27]} + {3'b0,img[33]} + {3'b0,img[41]} + {3'b0,img[20]} - {3'b0,img[33]} ;
	assign curveur7 = {3'b0,img[17]} + {3'b0,img[18]} + {3'b0,img[25]} + {3'b0,img[26]} + {3'b0,img[33]} + {3'b0,img[40]} + {3'b0,img[19]} - {3'b0,img[32]} ;

	assign curvell1 = {3'b0,img[21]} + {3'b0,img[28]} + {3'b0,img[35]} + {3'b0,img[36]} + {3'b0,img[43]} + {3'b0,img[44]} + {3'b0,img[29]} - {3'b0,img[42]} ;
	assign curvell2 = {3'b0,img[22]} + {3'b0,img[29]} + {3'b0,img[36]} + {3'b0,img[37]} + {3'b0,img[44]} + {3'b0,img[45]} + {3'b0,img[30]} - {3'b0,img[43]} ;
	assign curvell3 = {3'b0,img[23]} + {3'b0,img[30]} + {3'b0,img[37]} + {3'b0,img[38]} + {3'b0,img[45]} + {3'b0,img[46]} + {3'b0,img[31]} - {3'b0,img[44]} ;
	assign curvell4 = {3'b0,img[13]} + {3'b0,img[21]} + {3'b0,img[28]} + {3'b0,img[29]} + {3'b0,img[36]} + {3'b0,img[37]} + {3'b0,img[22]} - {3'b0,img[35]} ;	
	assign curvell5 = {3'b0,img[14]} + {3'b0,img[22]} + {3'b0,img[29]} + {3'b0,img[30]} + {3'b0,img[37]} + {3'b0,img[38]} + {3'b0,img[23]} - {3'b0,img[36]} ;
	assign curvell6 = {3'b0,img[7]} + {3'b0,img[14]} + {3'b0,img[21]} + {3'b0,img[22]} + {3'b0,img[29]} + {3'b0,img[30]} + {3'b0,img[15]} - {3'b0,img[28]} ;
	assign curvell7 = {3'b0,img[8]} + {3'b0,img[15]} + {3'b0,img[22]} + {3'b0,img[23]} + {3'b0,img[30]} + {3'b0,img[31]} + {3'b0,img[16]} - {3'b0,img[29]} ;

	assign curvelr1 = {3'b0,img[26]} + {3'b0,img[33]} + {3'b0,img[39]} + {3'b0,img[40]} + {3'b0,img[45]} + {3'b0,img[46]} + {3'b0,img[32]} - {3'b0,img[47]} ;
	assign curvelr2 = {3'b0,img[25]} + {3'b0,img[32]} + {3'b0,img[38]} + {3'b0,img[39]} + {3'b0,img[44]} + {3'b0,img[45]} + {3'b0,img[31]} - {3'b0,img[46]} ;
	assign curvelr3 = {3'b0,img[24]} + {3'b0,img[31]} + {3'b0,img[37]} + {3'b0,img[38]} + {3'b0,img[43]} + {3'b0,img[44]} + {3'b0,img[30]} - {3'b0,img[45]} ;
	assign curvelr4 = {3'b0,img[20]} + {3'b0,img[27]} + {3'b0,img[33]} + {3'b0,img[34]} + {3'b0,img[39]} + {3'b0,img[40]} + {3'b0,img[26]} - {3'b0,img[41]} ;
	assign curvelr5 = {3'b0,img[19]} + {3'b0,img[26]} + {3'b0,img[32]} + {3'b0,img[33]} + {3'b0,img[38]} + {3'b0,img[39]} + {3'b0,img[25]} - {3'b0,img[40]} ;
	assign curvelr6 = {3'b0,img[13]} + {3'b0,img[20]} + {3'b0,img[26]} + {3'b0,img[27]} + {3'b0,img[32]} + {3'b0,img[33]} + {3'b0,img[19]} - {3'b0,img[34]} ;
	assign curvelr7 = {3'b0,img[12]} + {3'b0,img[19]} + {3'b0,img[25]} + {3'b0,img[26]} + {3'b0,img[31]} + {3'b0,img[32]} + {3'b0,img[18]} - {3'b0,img[33]} ;

	assign horzlow1 = {3'b0,img[36]} + {3'b0,img[42]} + {3'b0,img[43]} + {3'b0,img[44]} + {3'b0,img[45]} + {3'b0,img[46]} + {3'b0,img[35]} - {3'b0,img[38]} ;
	assign horzlow2 = {3'b0,img[37]} + {3'b0,img[43]} + {3'b0,img[44]} + {3'b0,img[45]} + {3'b0,img[46]} + {3'b0,img[47]} + {3'b0,img[36]} - {3'b0,img[39]} ;
	assign horzlow3 = {3'b0,img[38]} + {3'b0,img[44]} + {3'b0,img[45]} + {3'b0,img[46]} + {3'b0,img[47]} + {3'b0,img[48]} + {3'b0,img[37]} - {3'b0,img[40]} ;
	assign horzlow4 = {3'b0,img[39]} + {3'b0,img[45]} + {3'b0,img[46]} + {3'b0,img[47]} + {3'b0,img[48]} + {3'b0,img[38]} - {3'b0,img[41]} ;

	assign looplow1 = {3'b0,img[35]} + {3'b0,img[36]} + {3'b0,img[38]} + {3'b0,img[39]} + {3'b0,img[43]} + {3'b0,img[44]} + {3'b0,img[45]}
					+ {3'b0,img[42]} - {3'b0,img[46]} ;
	assign looplow2 = {3'b0,img[36]} + {3'b0,img[37]} + {3'b0,img[39]} + {3'b0,img[40]} + {3'b0,img[44]} + {3'b0,img[45]} + {3'b0,img[46]}
					+ {3'b0,img[35]} - {3'b0,img[43]} - {3'b0,img[47]} ;
	assign looplow3 = {3'b0,img[37]} + {3'b0,img[38]} + {3'b0,img[40]} + {3'b0,img[41]} + {3'b0,img[45]} + {3'b0,img[46]} + {3'b0,img[47]}
					+ {3'b0,img[36]} - {3'b0,img[44]} - {3'b0,img[48]} ;
	assign looplow4 = {3'b0,img[38]} + {3'b0,img[39]} + {3'b0,img[41]} + {3'b0,img[46]} + {3'b0,img[47]} + {3'b0,img[48]} + {3'b0,img[37]}
					- {3'b0,img[45]} ;
	assign looplow5 = {3'b0,img[28]} + {3'b0,img[29]} + {3'b0,img[31]} + {3'b0,img[32]} + {3'b0,img[36]} + {3'b0,img[37]} + {3'b0,img[38]}
					+ {3'b0,img[35]} - {3'b0,img[39]} ;
	assign looplow6 = {3'b0,img[29]} + {3'b0,img[30]} + {3'b0,img[32]} + {3'b0,img[33]} + {3'b0,img[37]} + {3'b0,img[38]} + {3'b0,img[39]}
					+ {3'b0,img[28]} - {3'b0,img[36]} - {3'b0,img[40]} ;
	assign looplow7 = {3'b0,img[30]} + {3'b0,img[31]} + {3'b0,img[33]} + {3'b0,img[34]} + {3'b0,img[38]} + {3'b0,img[39]} + {3'b0,img[40]}
					+ {3'b0,img[29]} - {3'b0,img[37]} - {3'b0,img[41]} ;
	assign looplow8 = {3'b0,img[31]} + {3'b0,img[32]} + {3'b0,img[34]} + {3'b0,img[39]} + {3'b0,img[40]} + {3'b0,img[41]} + {3'b0,img[30]}
					- {3'b0,img[38]} ;
	
	assign loophigh1 = {3'b0,img[1]} + {3'b0,img[2]} + {3'b0,img[3]} + {3'b0,img[7]} + {3'b0,img[8]} + {3'b0,img[10]} + {3'b0,img[11]}
					+ {3'b0,img[0]} - {3'b0,img[4]} ;
	assign loophigh2 = {3'b0,img[2]} + {3'b0,img[3]} + {3'b0,img[4]} + {3'b0,img[8]} + {3'b0,img[9]} + {3'b0,img[11]} + {3'b0,img[12]}
					+ {3'b0,img[1]} - {3'b0,img[5]} - {3'b0,img[7]} ;
	assign loophigh3 = {3'b0,img[3]} + {3'b0,img[4]} + {3'b0,img[5]} + {3'b0,img[9]} + {3'b0,img[10]} + {3'b0,img[12]} + {3'b0,img[13]}
					+ {3'b0,img[2]} - {3'b0,img[6]} - {3'b0,img[8]} ;
	assign loophigh4 = {3'b0,img[4]} + {3'b0,img[5]} + {3'b0,img[6]} + {3'b0,img[10]} + {3'b0,img[11]} + {3'b0,img[13]} + {3'b0,img[3]}
					- {3'b0,img[9]} ;
	assign loophigh5 = {3'b0,img[8]} + {3'b0,img[9]} + {3'b0,img[10]} + {3'b0,img[14]} + {3'b0,img[15]} + {3'b0,img[17]} + {3'b0,img[18]}
					+ {3'b0,img[7]} - {3'b0,img[11]} ;
	assign loophigh6 = {3'b0,img[9]} + {3'b0,img[10]} + {3'b0,img[11]} + {3'b0,img[15]} + {3'b0,img[16]} + {3'b0,img[18]} + {3'b0,img[19]}
					+ {3'b0,img[8]} - {3'b0,img[12]} - {3'b0,img[14]} ;
	assign loophigh7 = {3'b0,img[10]} + {3'b0,img[11]} + {3'b0,img[12]} + {3'b0,img[16]} + {3'b0,img[17]} + {3'b0,img[19]} + {3'b0,img[20]}
					+ {3'b0,img[9]} - {3'b0,img[13]} - {3'b0,img[15]} ;
	assign loophigh8 = {3'b0,img[11]} + {3'b0,img[12]} + {3'b0,img[13]} + {3'b0,img[17]} + {3'b0,img[18]} + {3'b0,img[20]} + {3'b0,img[10]}
					- {3'b0,img[16]} ;

	assign fourm1 = {3'b0,img[0]} + {3'b0,img[7]} + {3'b0,img[14]} + {3'b0,img[21]} + {3'b0,img[2]} + {3'b0,img[9]} + {3'b0,img[16]}
				+ {3'b0,img[23]} + {3'b0,img[30]} + {3'b0,img[37]} + {3'b0,img[44]} + {3'b0,img[24]} + {3'b0,img[28]} - {3'b0,img[29]} - {3'b0,img[35]} ;
	assign fourm2 = {3'b0,img[21]} + {3'b0,img[1]} + {3'b0,img[8]} + {3'b0,img[15]} + {3'b0,img[22]} + {3'b0,img[3]} + {3'b0,img[10]}
				+ {3'b0,img[17]} + {3'b0,img[24]} + {3'b0,img[31]} + {3'b0,img[38]} + {3'b0,img[45]} + {3'b0,img[25]} + {3'b0,img[28]} - {3'b0,img[29]}
				- {3'b0,img[30]} - {3'b0,img[35]} - {3'b0,img[36]} ;
	assign fourm3 = {3'b0,img[22]} + {3'b0,img[2]} + {3'b0,img[9]} + {3'b0,img[16]} + {3'b0,img[23]} + {3'b0,img[4]} + {3'b0,img[11]}
				+ {3'b0,img[18]} + {3'b0,img[25]} + {3'b0,img[32]} + {3'b0,img[39]} + {3'b0,img[46]} + {3'b0,img[26]} + {3'b0,img[29]} - {3'b0,img[30]}
				- {3'b0,img[31]} - {3'b0,img[36]} - {3'b0,img[37]} ;
	assign fourm4 = {3'b0,img[23]} + {3'b0,img[3]} + {3'b0,img[10]} + {3'b0,img[17]} + {3'b0,img[24]} + {3'b0,img[5]} + {3'b0,img[12]}
				+ {3'b0,img[19]} + {3'b0,img[26]} + {3'b0,img[33]} + {3'b0,img[40]} + {3'b0,img[47]} + {3'b0,img[27]} + {3'b0,img[30]} - {3'b0,img[31]}
				- {3'b0,img[32]} - {3'b0,img[37]} - {3'b0,img[38]} ;
	assign fourm5 = {3'b0,img[24]} + {3'b0,img[4]} + {3'b0,img[11]} + {3'b0,img[18]} + {3'b0,img[25]} + {3'b0,img[6]} + {3'b0,img[13]}
				+ {3'b0,img[20]} + {3'b0,img[27]} + {3'b0,img[34]} + {3'b0,img[41]} + {3'b0,img[48]} + {3'b0,img[31]} - {3'b0,img[32]} - {3'b0,img[33]}
				- {3'b0,img[38]} - {3'b0,img[39]} ;

	assign fourh1 = {3'b0,img[0]} + {3'b0,img[7]} + {3'b0,img[14]} + {3'b0,img[2]} + {3'b0,img[9]} + {3'b0,img[16]} + {3'b0,img[23]} + {3'b0,img[30]}
				+ {3'b0,img[37]} + {3'b0,img[17]} + {3'b0,img[21]} - {3'b0,img[22]} - {3'b0,img[28]} ;
	assign fourh2 = {3'b0,img[14]} + {3'b0,img[1]} + {3'b0,img[8]} + {3'b0,img[15]} + {3'b0,img[3]} + {3'b0,img[10]} + {3'b0,img[17]} + {3'b0,img[24]}
				+ {3'b0,img[31]} + {3'b0,img[38]} + {3'b0,img[45]} + {3'b0,img[18]} + {3'b0,img[21]} - {3'b0,img[22]} - {3'b0,img[33]} - {3'b0,img[28]}
				- {3'b0,img[29]} ;
	assign fourh3 = {3'b0,img[15]} + {3'b0,img[2]} + {3'b0,img[9]} + {3'b0,img[16]} + {3'b0,img[4]} + {3'b0,img[11]} + {3'b0,img[18]} + {3'b0,img[25]}
				+ {3'b0,img[32]} + {3'b0,img[39]} + {3'b0,img[46]} + {3'b0,img[19]} + {3'b0,img[22]} - {3'b0,img[23]} - {3'b0,img[24]} - {3'b0,img[29]}
				- {3'b0,img[30]} ;
	assign fourh4 = {3'b0,img[16]} + {3'b0,img[3]} + {3'b0,img[10]} + {3'b0,img[17]} + {3'b0,img[5]} + {3'b0,img[12]} + {3'b0,img[19]} + {3'b0,img[26]}
				+ {3'b0,img[33]} + {3'b0,img[40]} + {3'b0,img[47]} + {3'b0,img[10]} + {3'b0,img[23]} - {3'b0,img[24]} - {3'b0,img[25]} - {3'b0,img[30]}
				- {3'b0,img[31]} ;
	assign fourh5 = {3'b0,img[17]} + {3'b0,img[4]} + {3'b0,img[11]} + {3'b0,img[18]} + {3'b0,img[6]} + {3'b0,img[13]} + {3'b0,img[20]} + {3'b0,img[27]}
				+ {3'b0,img[34]} + {3'b0,img[41]} + {3'b0,img[48]} + {3'b0,img[24]} - {3'b0,img[25]} - {3'b0,img[26]} - {3'b0,img[31]} - {3'b0,img[32]} ;

	assign fourl1 = {3'b0,img[0]} + {3'b0,img[7]} + {3'b0,img[14]} + {3'b0,img[21]} + {3'b0,img[28]} + {3'b0,img[2]} + {3'b0,img[9]} + {3'b0,img[16]}
				+ {3'b0,img[23]} + {3'b0,img[30]} + {3'b0,img[37]} + {3'b0,img[44]} + {3'b0,img[31]} + {3'b0,img[35]} - {3'b0,img[36]} - {3'b0,img[42]} ;
	assign fourl2 = {3'b0,img[28]} + {3'b0,img[1]} + {3'b0,img[8]} + {3'b0,img[15]} + {3'b0,img[22]} + {3'b0,img[29]} + {3'b0,img[3]} + {3'b0,img[10]}
				+ {3'b0,img[17]} + {3'b0,img[24]} + {3'b0,img[31]} + {3'b0,img[38]} + {3'b0,img[45]} + {3'b0,img[32]} + {3'b0,img[35]} - {3'b0,img[36]}
				- {3'b0,img[37]} - {3'b0,img[42]}- {3'b0,img[43]} ;
	assign fourl3 = {3'b0,img[29]} + {3'b0,img[2]} + {3'b0,img[9]} + {3'b0,img[16]} + {3'b0,img[23]} + {3'b0,img[30]} + {3'b0,img[4]} + {3'b0,img[11]}
				+ {3'b0,img[18]} + {3'b0,img[25]} + {3'b0,img[32]} + {3'b0,img[39]} + {3'b0,img[46]} + {3'b0,img[33]} + {3'b0,img[36]} - {3'b0,img[37]}
				- {3'b0,img[38]} - {3'b0,img[43]} - {3'b0,img[44]} ;
	assign fourl4 = {3'b0,img[30]} + {3'b0,img[3]} + {3'b0,img[10]} + {3'b0,img[17]} + {3'b0,img[24]} + {3'b0,img[31]} + {3'b0,img[5]} + {3'b0,img[12]}
				+ {3'b0,img[19]} + {3'b0,img[26]} + {3'b0,img[33]} + {3'b0,img[40]} + {3'b0,img[47]} + {3'b0,img[34]} + {3'b0,img[37]} - {3'b0,img[38]}
				- {3'b0,img[39]} - {3'b0,img[44]} - {3'b0,img[45]} ;
	assign fourl5 = {3'b0,img[31]} + {3'b0,img[4]} + {3'b0,img[11]} + {3'b0,img[18]} + {3'b0,img[25]} + {3'b0,img[32]} + {3'b0,img[6]} + {3'b0,img[13]}
				+ {3'b0,img[20]} + {3'b0,img[27]} + {3'b0,img[34]} + {3'b0,img[41]} + {3'b0,img[48]} + {3'b0,img[38]} - {3'b0,img[39]} - {3'b0,img[40]}
				- {3'b0,img[45]} - {3'b0,img[46]} ;

	assign diag1 = {3'b0,img[17]} + {3'b0,img[23]} + {3'b0,img[24]} + {3'b0,img[29]} + {3'b0,img[30]} + {3'b0,img[35]} + {3'b0,img[36]} + {3'b0,img[22]}
				- {3'b0,img[25]}- {3'b0,img[28]} - {3'b0,img[31]} ;
	assign diag2 = {3'b0,img[18]} + {3'b0,img[23]} + {3'b0,img[25]} + {3'b0,img[30]} + {3'b0,img[31]} + {3'b0,img[36]} + {3'b0,img[37]} + {3'b0,img[23]}
				- {3'b0,img[26]} - {3'b0,img[29]} - {3'b0,img[32]} ;
	assign diag3 = {3'b0,img[19]} + {3'b0,img[24]} + {3'b0,img[26]} + {3'b0,img[31]} + {3'b0,img[32]} + {3'b0,img[37]} + {3'b0,img[38]} + {3'b0,img[24]}
				- {3'b0,img[25]} - {3'b0,img[30]} - {3'b0,img[33]} ;

	
	
	assign is4 = (fourh1 > $signed(6'd6)) | (fourh2 > $signed(6'd6)) | (fourh3 > $signed(6'd6)) | (fourh4 > $signed(6'd6))
					 | (fourm1 > $signed(6'd6)) | (fourm2 > $signed(6'd6)) | (fourm3 > $signed(6'd6)) | (fourm4 > $signed(6'd6))
					 | (fourl1 > 6'd6) | (fourl2 > 6'd6) | (fourl3 > 6'd6) | (fourl4 > 6'd6);
					 
	assign is0ul = (curveul1 > $signed(6'd3)) | (curveul2 > $signed(6'd3)) | (curveul3 > $signed(6'd3)) | (curveul4 > $signed(6'd3))
						| (curveul5 > $signed(6'd3)) | (curveul6 > $signed(6'd3)) | (curveul7 > $signed(6'd3));
	assign is0ur = (curveur1 > $signed(6'd3)) | (curveur2 > $signed(6'd3)) | (curveur3 > $signed(6'd3)) | (curveur4 > $signed(6'd3))
						| (curveur5 > $signed(6'd3)) | (curveur6 > $signed(6'd3)) | (curveur7 > $signed(6'd3));
	assign is0ll = (curvell1 > $signed(6'd3)) | (curvell2 > $signed(6'd3)) | (curvell3 > $signed(6'd3)) | (curvell4 > $signed(6'd3))
						| (curvell5 > $signed(6'd3)) | (curvell6 > $signed(6'd3)) | (curvell7 > $signed(6'd3));
	assign is0lr = (curvelr1 > $signed(6'd3)) | (curvelr2 > $signed(6'd3)) | (curvelr3 > $signed(6'd3)) | (curvelr4 > $signed(6'd3))
						| (curvelr5 > $signed(6'd3)) | (curvelr6 > $signed(6'd3)) | (curvelr7 > $signed(6'd3));
	assign is0 = ({2'b0, is0ul} + {2'b0,is0ur} + {2'b0,is0ll} + {2'b0, is0lr} >= 3'd3);
	
	assign is1 = (vert1 > $signed(6'd4)) | (vert1 > $signed(6'd4)) | (vert1 > $signed(6'd4)) | (vert1 > $signed(6'd4)) | (vert1 > $signed(6'd4)) | (vert1 > $signed(6'd4));
	
	assign is3 = ((loophigh1 > $signed(6'd3)) | (loophigh2 > $signed(6'd3)) | (loophigh3 > $signed(6'd3)) | (loophigh4 > $signed(6'd3))
						| (loophigh5 > $signed(6'd3)) | (loophigh6 > $signed(6'd3)) | (loophigh7 > $signed(6'd3)) | (loophigh8 > $signed(6'd3))) &
					 ((looplow1 > $signed(6'd3)) | (looplow2 > $signed(6'd3)) | (looplow3 > $signed(6'd3)) | (looplow4 > $signed(6'd3))
						| (looplow5 > $signed(6'd3)) | (looplow6 > $signed(6'd3)) | (looplow7 > $signed(6'd3)) | (looplow1 > $signed(6'd3)));
	
	assign is2 = ((horzlow1 > $signed(6'd2)) | (horzlow1 > $signed(6'd2)) | (horzlow1 > $signed(6'd2)) | (horzlow1 > $signed(6'd2)))
						& ((diag1 > $signed(6'd3)) | (diag2 > $signed(6'd3)) | (diag2 > $signed(6'd3)));
	
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
				digit <= 4'd2;			
		end
	end
endmodule
