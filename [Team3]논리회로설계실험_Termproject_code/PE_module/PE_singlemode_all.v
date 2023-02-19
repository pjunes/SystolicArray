`timescale 1ns / 1ps
module PE_single_module(clk, reset, en_single,
a_1_1, a_1_2, a_1_3, a_1_4, a_2_1, a_2_2, a_2_3, a_2_4, a_3_1, a_3_2, a_3_3, a_3_4, a_4_1, a_4_2, a_4_3, a_4_4, 
b_1_1, b_1_2, b_1_3, b_2_1, b_2_2, b_2_3, b_3_1, b_3_2, b_3_3, en_result, acc_out, pe_done);

input clk, reset, en_single;
input [7:0]a_1_1, a_1_2, a_1_3, a_1_4, a_2_1, a_2_2, a_2_3, a_2_4, a_3_1, a_3_2, a_3_3, a_3_4, a_4_1, a_4_2, a_4_3, a_4_4; 
input [7:0]b_1_1, b_1_2, b_1_3, b_2_1, b_2_2, b_2_3, b_3_1, b_3_2, b_3_3;

wire [7:0]a_in, b_in;
wire clear;
wire [7:0]multi_out;

output [7:0]acc_out;
output pe_done, en_result;
    
PE_single_mode_controller PE_single_mode_controller_1(.clk(clk), .reset(reset), .en_single(en_single),
.a_1_1(a_1_1), .a_1_2(a_1_2), .a_1_3(a_1_3), .a_1_4(a_1_4), 
.a_2_1(a_2_1), .a_2_2(a_2_2), .a_2_3(a_2_3), .a_2_4(a_2_4), 
.a_3_1(a_3_1), .a_3_2(a_3_2), .a_3_3(a_3_3), .a_3_4(a_3_4), 
.a_4_1(a_4_1), .a_4_2(a_4_2), .a_4_3(a_4_3), .a_4_4(a_4_4), 
.b_1_1(b_1_1), .b_1_2(b_1_2), .b_1_3(b_1_3), 
.b_2_1(b_2_1), .b_2_2(b_2_2), .b_2_3(b_2_3), 
.b_3_1(b_3_1), .b_3_2(b_3_2), .b_3_3(b_3_3), 
.a_in(a_in), .b_in(b_in),
.en_result(en_result), .pe_done(pe_done), .clear(clear));
    
PE_single PE_1(.clk(clk), .clear(clear), .weight_control(1'b1), .weight_in(b_in), .subject_in(a_in), .calc_in(8'd0), .weight_out(), .subject_out(), .adder_out(multi_out));
eight_bit_accumulator acuum_1(.clk(clk), .clear(clear), .acc_in(multi_out), .acc_out(acc_out));

    
    
endmodule
