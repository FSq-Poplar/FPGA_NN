module sigmoid(x, y);

	//Piecewise linear approximation

	input  signed [31:0] x;
	output reg signed [31:0] y;
	
	wire signed [31:0] w1, w2;
	mult m1 (x, $signed(32'b00000000_0000_0100_0000_0000_0000_0000), w1);			//0.015625
	mult m2 (x, $signed(32'b00000000_0100_0000_0000_0000_0000_0000), w2);			//0.25

	
	always @*
	begin
		if (x < $signed(32'b11111000_0000_0000_0000_0000_0000_0000))					//x < -8
			y <= $signed(32'b0);
			
		else if (x < $signed(32'b11111110_0110_0110_0110_0110_0110_0111))				//x < -1.6
			y <= $signed(32'b00000000_0010_0000_0000_0000_0000_0000) + w1;				//y = 0.125 + x*0.015625
		
		else if (x < $signed(32'b00000001_1001_1001_1001_1001_1001_1001))				//x - 1.6
			y <= $signed(32'b00000000_1000_0000_0000_0000_0000_0000) + w2;				//y = 0.5 + x*0.25
		
		else if (x < $signed(32'b00001000_0000_0000_0000_0000_0000_0000))				//x < 8
			y <= $signed(32'b00000000_1110_0000_0000_0000_0000_0000) + w1;				//y = 0.875 + x*0.015625
		
		else
			y <= $signed(32'b00000001_0000_0000_0000_0000_0000_0000);					//y = 1
	end

endmodule

//tested