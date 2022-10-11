`timescale 1ns / 1ps


module decoder_2x4(
    input[1:0] i_digitSelect,
    output[3:0] o_digit
    );

    reg[3:0] r_digit;
    assign o_digit = r_digit;

    always @(i_digitSelect) begin
        r_digit = 4'b1111;

        case(i_digitSelect)
            2'h0 : r_digit = 4'b1110;
            2'h1 : r_digit = 4'b1101;
            2'h2 : r_digit = 4'b1011;
            2'h3 : r_digit = 4'b0111;
        endcase
    end
endmodule
