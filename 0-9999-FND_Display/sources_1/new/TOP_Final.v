`timescale 1ns / 1ps

module TOP_Final(
    input i_clk,
    input i_reset,
    output[3:0] o_digit,
    output [7:0] o_font
    );

    wire w_clk_to_counter_FND;  // wire 1
    wire [1:0] w_counter_to_2_4_decoder;  // wire 2
    wire w_clk_to_counter_data;  // wire 3
    wire [13:0] w_counter_to_digit_divider;  // wire 4
    wire [3:0] w_1000, w_100, w_10, w_1;  // wire 5
    wire [3:0] w_MUX_to_BCD_to_decoder;  // wire 6
    
    // 윗 부분 
    clock_divider_1kHz clock_divider_1kHz_dut(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clk_to_counter_FND)  // wire 1
    );

    counter_FND counter_FND_dut(
        .i_clk(w_clk_to_counter_FND),
        .i_reset(i_reset),
        .o_counter(w_counter_to_2_4_decoder)  // wire 2
    );    

    decoder_2x4 decoder_2x4_dut(
        .i_digitSelect(w_counter_to_2_4_decoder),  // wire 2
        .o_digit(o_digit)
    );
    // 아랫부분 
    clock_divider_10Hz clock_divider_10Hz_dut(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clk_to_counter_data)  // wire 3
    );

    counter_data counter_data_dut(
        .i_clk(w_clk_to_counter_data),
        .i_reset(i_reset),
        .o_counter(w_counter_to_digit_divider)  // wire 4
    );

    digit_divider digit_divider_dut(
        .i_value(w_counter_to_digit_divider),  // wire 4
        .o_1000(w_1000),  // wire 5
        .o_100(w_100),
        .o_10(w_10),
        .o_1(w_1)
    );

    mux_4x1 mux_4x1_dut(
        .i_1000(w_1000), // wire 5
        .i_100(w_100), 
        .i_10(w_10),
        .i_1(w_1),
        .i_counter(w_counter_to_2_4_decoder),  // wire 2
        .o_value(w_MUX_to_BCD_to_decoder)  // wire 6
    );

    BCD_to_FND_decoder BCD_to_FND_decoder_dut(
        .i_value(w_MUX_to_BCD_to_decoder),  //wire 6
        .o_font(o_font)
    );

endmodule
