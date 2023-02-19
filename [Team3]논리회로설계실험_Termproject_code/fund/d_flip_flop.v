`timescale 1ns / 1ps

module d_flip_flop(d, clk, reset, q);
    
    input d;
    input clk;
    input reset;
    
    output reg q;

    always @(posedge clk or posedge reset) 
    begin
        if (reset ==  1'b1)
            begin q <= 0; end
        else
            begin q <= d; end
    end
endmodule