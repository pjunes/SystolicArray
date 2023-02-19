`timescale 1ns / 1ps
// ver. 0524

module PE_single(clk, clear, weight_control, weight_in, subject_in, calc_in, weight_out, subject_out, adder_out);

    input clk;
    input clear;
    input weight_control; // for weight register
    
    input [7:0] weight_in;
    input [7:0] subject_in;
    input [7:0] calc_in;
    
    wire [7:0] calc_out; // for calc register
    wire [7:0] multiplier_out; // for multiplier
    
    output [7:0] weight_out; // for weight register
    output [7:0] subject_out; // for subject register
    output [7:0] adder_out; // for adder
    
    eight_bit_register      eight_bit_register_subject   (.in(subject_in), .clk(clk), .reset(clear), .out(subject_out));
    eight_bit_register      eight_bit_register_weight    (.in(weight_in), .clk(clk), .reset(clear), .out(weight_out));
    eight_bit_register      eight_bit_register_calc      (.in(calc_in), .clk(clk), .reset(clear), .out(calc_out));
    
    eight_bit_multiplier    eight_bit_multiplier         (.a(subject_out), .b(weight_out), .out(multiplier_out));
    eight_bit_half_adder    eight_bit_adder              (.a(multiplier_out), .b(calc_out), .out(adder_out));
endmodule

