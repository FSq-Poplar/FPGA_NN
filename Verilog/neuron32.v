module neuron32(prev_activ, weights, bias, activ, sigma_prime);
	input  prev_activ [1023:0];		//32*32-1
	input  weights	   [1023:0];		//32*32-1
	input  bias		   [31:0];
	output activ		[31:0];
	output sigma_prime[31:0];
	
	wire [1023:0] wires;
	wire [31:0] w1, w2;
	
	had_mult32 hm (prev_activ, weights, wires);
	
	wire sum = 0;

	integer i;	
	always @*
	begin
		while(i < 32)
		begin
			sum = sum + wires[i +: 7];
		end
	end
	assign sum = sum + bias;

	sigmoid s (sum, w1);
	mult m (1__0000_0000_0000_0000_0000_0000-w1, w1, w2);

	assign activ = w1;
	assign sigma_prime = w2;

endmodule
