`timescale 1ns / 1ps

module mux_4x1(
    input [3:0] i_1000, i_100, i_10, i_1,
    input [1:0] i_counter,
    output [3:0] o_value
    );

    reg [3:0] r_value;
    assign o_value = r_value;

    always @(i_counter) begin
        case(i_counter)
            // 값이 FND의 어느 자리에 들어갈지
            2'h0 : r_value = i_1;
            2'h1 : r_value = i_10;
            2'h2 : r_value = i_100;
            2'h3 : r_value = i_1000;
            /*
            o_1    = 9876 % 10 = 6
            o_10   = 9876 / 10 = 987, 987 % 10 = 7
            o_100  = 9876 / 100 = 98, 98 % 10 8
            o_1000 = 9876 / 1000 = 9, 9 % 10 = 9 , 9876 출력.
            */
        endcase
    end
endmodule