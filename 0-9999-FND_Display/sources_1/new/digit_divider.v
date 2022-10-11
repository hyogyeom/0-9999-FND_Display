`timescale 1ns / 1ps

module digit_divider(
    input[13:0] i_value,  // 9999까지니까 2^14
    output[3:0] o_1000, o_100, o_10, o_1
    );
    // 어떤 값이 들어갈지
    assign o_1    = i_value % 10;
    assign o_10   = i_value / 10 % 10;
    assign o_100  = i_value / 100 % 10;
    assign o_1000 = i_value / 1000 % 10;

    /*
    9876 % 10 = 6
    9876 / 10 = 987, 987 % 10 = 7
    9876 / 100 = 98, 98 % 10 8
    9876 / 1000 = 9, 9 % 10 = 9 , 9876 출력.
    */
endmodule
