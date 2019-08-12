module io_datapath(clock, count_reset, draw, erase, x_in, y_in, x_out, y_out);
    input clock, count_reset;
    input draw, erase;
    input[7:0] x_in, y_in;
    output[7:0] x_out, y_out;

    reg[3:0] count_x_draw, count_y_draw;
    reg[7:0] count_x_erase, count_y_erase;
    wire y_enable_draw, y_enable_erase;

    always @(posedge clock) begin
        if (!count_reset)
            begin
                count_x_draw <= 4'd0;
                count_x_erase <= 8'd0;
            end
        else if(erase)
            begin
                if (count_x_erase == 8'd140)
                    count_x_erase <= 8'd0;
                else
                    count_x_erase <= count_x_erase + 8'd1;
            end
        else if(draw)
            begin
                if (count_x_draw == 4'd10)
                    count_x_draw <= 4'd0;
                else
                    count_x_draw <= count_x_draw + 4'd1;
            end
    end

    assign y_enable_draw = (count_x_draw == 4'd10) ? 1 : 0;
    assign y_enable_erase = (count_x_erase == 8'd140) ? 1 : 0;

    //always using x'd is kinda gay btw -Wentao
    always @(posedge clock) begin
        if (!count_reset)
            begin
                count_y_draw <= 4'd0;
                count_y_erase <= 8'd0;
            end
        else if (y_enable_draw && draw)
            begin
                if (count_y_draw != 4'd14)
                    count_y_draw <= count_y_draw + 4'd1;
                else
                    count_y_draw <= 4'd0;
            end
        else if (y_enable_erase && erase)
            begin
                if (count_y_erase != 8'd196)
                    count_y_erase <= count_y_erase + 8'd1;
                else
                    count_y_erase <= 8'd0;
            end
    end

    assign x_out = (x_in+count_x_draw)*!erase + (8'd89+count_x_erase)*erase;
    assign y_out = (y_in+count_y_draw)*!erase + (8'd33+count_y_erase)*erase;
endmodule
