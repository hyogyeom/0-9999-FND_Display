`timescale 1ns / 1ps

module counter(
    input i_clk,  
    input i_reset,
    output[1:0] o_counter // wire 타입임 
    );

    reg[1:0] r_counter = 0;
    assign o_counter = r_counter;  // 외부로 가져가고 싶음. 

    // 어떤식으로 감지할거냐 
    always @(posedge i_clk or posedge i_reset)begin  // posedge = 상승엣지 , 누를때 감지 
        if(i_reset) begin
            r_counter <= 0;  
        end
        else begin
            r_counter <= r_counter + 1;
        end
    end
endmodule
