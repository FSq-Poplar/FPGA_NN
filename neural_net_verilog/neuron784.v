module neuron784(prev_activ, weights, bias, activ, sigma_prime);
	input  prev_activ [25087:0];		//784*32-1
	input  weights	   [25087:0];		//784*32-1
	input  bias		   [31:0];
	output activ		[31:0];
	output sigma_prime[31:0];
	
	wire [25087:0] wires;
	wire [31:0] w1, w2;
	
	had_mult784 hm (prev_activ, weights, wires);
	
	wire sum = 0;

	integer i;	
	always @*
	begin
		while(i < 784)
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
