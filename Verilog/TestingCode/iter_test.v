module iter_test(n,out);
	input  [3:0] n;
	output [27:0] out;
	
	reg [3:0] array [0:7];
	
	integer i;
	always @*
	begin
		for(i=0; i<n; i=i+1)
		begin
			array[i] <= i;
		end
	end

	assign out = {array[7], array[6], array[5], array[4], array[3], array[2], array[1], array[0]};

endmodule
