module io_control(clk, reset, leftclick, draw, erase, color);
    input clk, reset, leftclick;
    output reg draw, erase; //Draw means whether the mouse is drawing, not if VGA is drawing
    output reg[14:0] color;
    reg[2:0] current, next;

    localparam  CHILL = 3'd0,
                DRAW = 3'd1,
                ERASE = 3'd2;
    always@(*)
        begin
            case(current)
                CHILL: begin
                    if (erase) next = ERASE;
                    else if (leftclick) next = DRAW;
                    else next = CHILL;
                end
                DRAW: begin
                    if (erase) next = ERASE;
                    else if (leftclick) next = DRAW;
                    else next = CHILL;
                end
                ERASE: next = reset ? ERASE : CHILL;
                default: next = CHILL;
            endcase
        end

    always@(*)
        begin
            //"when someone looks at our code, they'll think we're autistic" -Wentao
            case(current)
                CHILL: begin draw <= 1'b0; erase <= 1'b0; end
                DRAW: begin draw <= 1'b1; erase <= 1'b0; end
                ERASE: begin draw <= 1'b0; erase <= 1'b1; end
            endcase
        end

    always@(*)
        begin
            if (leftclick) color <= 15'b000000000011111;
            else if (erase) color <= 15'b111111111111111;
            else color <= 15'b111110000000000; //IF YOU SEE RED YOU DUN GOOFED
        end

    //Current state reg
    always@(posedge clk)
        begin
            if(!reset)
                current <= ERASE;
            else
                current <= next;
        end
endmodule
