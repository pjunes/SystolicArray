`timescale 1ns / 1ps
// ver. 0531

module PE(clk, reset, weight_in, subject_in, calc_in, subject_out, pe_out);
    // controll bits
    input clk;
    input reset;
    
    input [7:0] weight_in;
    input [7:0] subject_in;
    input [7:0] calc_in;
    
    wire [7:0] calc_out; // for calc register
    wire [7:0] weight_out; // for weight register
    
    wire [7:0] multiplier_out; // for multiplier
//    wire [7:0] adder_out; // for adder
    
    output [7:0] subject_out; // for subject register
    output [7:0] pe_out; // for result
    
    eight_bit_register      eight_bit_register_subject   (.in(subject_in), .clk(clk), .reset(reset), .out(subject_out));
    eight_bit_register      eight_bit_register_weight    (.in(weight_in),  .clk(clk), .reset(reset), .out(weight_out));
    eight_bit_register      eight_bit_register_calc      (.in(calc_in),    .clk(clk), .reset(reset), .out(calc_out));
//    eight_bit_register      eight_bit_register_result    (.in(adder_out),  .clk(clk), .reset(reset), .out(result));
    
    eight_bit_multiplier    eight_bit_multiplier         (.a(subject_out),    .b(weight_out), .out(multiplier_out));
    eight_bit_half_adder    eight_bit_adder              (.a(multiplier_out), .b(calc_out),   .out(pe_out));
endmodule

