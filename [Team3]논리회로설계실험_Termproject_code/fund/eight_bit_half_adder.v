`timescale 1ns / 1ps

module eight_bit_half_adder(a, b, out); // no carry in/out
    input [7:0] a;
    input [7:0] b;
    output [7:0] out;
    
    wire carry;
    
    four_bit_half_adder four_bit_half_adder_1(.a(a[3:0]), .b(b[3:0]), .sum(out[3:0]), .cout(carry));
    four_bit_full_adder four_bit_full_adder_2(.a(a[7:4]), .b(b[7:4]), .cin(carry), .sum(out[7:4]), .cout());

endmodule
