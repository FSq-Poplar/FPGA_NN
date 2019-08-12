module image_decoder(clk,reset,xbad,ybad,leftclick,img);

    input clk, reset;
    input [8:0] xbad,ybad;
    input leftclick;
    output reg [48:0] img;

    wire [8:0] x,y;
    assign x = xbad - 9'd90;
    assign y = ybad - 9'd34;

    integer i,j;
    always @*
        begin
            for(i=0; i<7; i=i+1)
                begin
                    if(20*i == x)
                        j <= i;
                end
        end

    //set l = y
    integer k,l;
    always @*
        begin
            for(k=0; k<7; k=k+1)
                begin
                    if(28*k == y)
                        l <= k;
                end
        end

    //'color' pixels
    always @(posedge clk)
        begin
            if (reset == 1'b1)
                img <= 49'b0;
            else if (leftclick == 1'b1)
                img[7*l+j] <= 1;
        end

endmodule
