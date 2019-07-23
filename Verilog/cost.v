module cost(answers, activ, loss, nabla_loss);
	input [319:0] answers; 		//10*32-1
	input [319:0] activ; 		//10*32-1
	output signed [31:0] loss;
	output[319:0] nabla_loss;	//10*32-1
	
	wire signed [31:0] delta [9:0];
	assign {delta[0], delta[1], delta[2], delta[3], delta[4],
	        delta[5], delta[6], delta[7], delta[8], delta[9]} =
	       {($signed(activ[31:0]) - $signed(answers[31:0])),
		    ($signed(activ[63:32]) - $signed(answers[63:32])),
			 ($signed(activ[95:64]) - $signed(answers[95:64])),
			 ($signed(activ[127:96]) - $signed(answers[127:96])),
			 ($signed(activ[159:128]) - $signed(answers[159:128])),
			 ($signed(activ[191:160]) - $signed(answers[191:160])),
			 ($signed(activ[223:192]) - $signed(answers[223:192])),
			 ($signed(activ[255:224]) - $signed(answers[255:224])),
			 ($signed(activ[287:256]) - $signed(answers[287:256])),
			 ($signed(activ[319:288]) - $signed(answers[319:288]))};
	
	reg signed [63:0] delta1 [31:0];
	reg signed [31:0] sum;

	integer i;
	always @*
	begin
		for(i=0; i<10; i=i+1)
		begin
			delta1[i] <= delta[i]*delta[i];
			begin
			if (i==0)
				sum <= 32'b0;
			else
				sum <= sum + {delta1[i][63], delta1[i][54:24]};
			end
		end
	end
	
	mult m (32'b00000000_1000_0000_0000_0000_0000_0000, sum, loss);

	assign nabla_loss = {delta[0], delta[1], delta[2], delta[3], delta[4],
								delta[5], delta[6], delta[7], delta[8], delta[9]};
	
endmodule

//combined cost and nabla_cost
//not tested
