//HEX Display Decoder
//Note already encapsulated (DE1-SOC)
module hexdecoder(S, HEX);
	input [3:0]S;
	output [6:0]HEX;

	assign HEX[0] = ~S[3] & ~S[2] & ~S[1] & S[0] | ~S[3] & S[2] & ~S[1] & ~S[0] | S[3] & S[2] & ~S[1] & S[0] | S[3] & ~S[2] & S[1] & S[0];
	assign HEX[1] = S[3] & S[2] & ~S[0] | S[3] & S[1] & S[0] | S[2] & S[1] & ~S[0] | ~S[3] & S[2] & ~S[1] & S[0];
	assign HEX[2] = ~S[3] & ~S[2] & S[1] & ~S[0] | S[3] & S[2] & ~S[0] | S[3] & S[2] & S[1];
	assign HEX[3] = ~S[3] & S[2] & ~S[1] & ~S[0] | ~S[2] & ~S[1] & S[0] | S[2] & S[1] & S[0] | S[3] & ~S[2] & S[1] & ~S[0];
	assign HEX[4] = ~S[3] & S[0] | ~S[3] & S[2] & ~S[1] | ~S[2] & ~S[1] & S[0];
	assign HEX[5] = ~S[3] & ~S[2] & S[0] | ~S[3] & ~S[2] & S[1] | ~S[3] & S[1] & S[0] | S[3] & S[2] & ~S[1] & S[0];
	assign HEX[6] = ~S[3] & ~S[2] & ~S[1] | ~S[3] & S[2] & S[1] & S[0] | S[3] & S[2] & ~S[1] & ~S[0];
endmodule
