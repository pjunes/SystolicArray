`timescale 1ns / 1ps

module CT(clk, clear,
weight_out, 
subject_in_1, subject_in_2, subject_in_3, subject_in_4,
calc_out_1, calc_out_2, calc_out_3, calc_out_4);

    input clk;
    input clear;
    input [7:0] weight_out;
    
    input [7:0] subject_in_1;
    input [7:0] subject_in_2;
    input [7:0] subject_in_3;
    input [7:0] subject_in_4;
    
    wire [7:0] multiplier_out_1;
    wire [7:0] multiplier_out_2;
    wire [7:0] multiplier_out_3;
    wire [7:0] multiplier_out_4;
    
    wire [7:0] acc_out_1;
    wire [7:0] acc_out_2;
    wire [7:0] acc_out_3;
    wire [7:0] acc_out_4;
    
    output [7:0] calc_out_1;
    output [7:0] calc_out_2;
    output [7:0] calc_out_3;
    output [7:0] calc_out_4;
    
    //CT calculater
    eight_bit_multiplier    eight_bit_multiplier1         (.a(subject_in_1), .b(weight_out), .out(multiplier_out_1));
    eight_bit_multiplier    eight_bit_multiplier2         (.a(subject_in_2), .b(weight_out), .out(multiplier_out_2));
    eight_bit_multiplier    eight_bit_multiplier3         (.a(subject_in_3), .b(weight_out), .out(multiplier_out_3));
    eight_bit_multiplier    eight_bit_multiplier4         (.a(subject_in_4), .b(weight_out), .out(multiplier_out_4));
    
    eight_bit_accumulator   eight_bit_accumulator1        (.clk(clk), .clear(clear), .acc_in(multiplier_out_1), .acc_out(acc_out_1));
    eight_bit_accumulator   eight_bit_accumulator2        (.clk(clk), .clear(clear), .acc_in(multiplier_out_2), .acc_out(acc_out_2));
    eight_bit_accumulator   eight_bit_accumulator3        (.clk(clk), .clear(clear), .acc_in(multiplier_out_3), .acc_out(acc_out_3));
    eight_bit_accumulator   eight_bit_accumulator4        (.clk(clk), .clear(clear), .acc_in(multiplier_out_4), .acc_out(acc_out_4));
    
    eight_bit_register      eight_bit_register_calc1      (.in(acc_out_1), .clk(clk), .reset(clear), .out(calc_out_1));
    eight_bit_register      eight_bit_register_calc2      (.in(acc_out_2), .clk(clk), .reset(clear), .out(calc_out_2));
    eight_bit_register      eight_bit_register_calc3      (.in(acc_out_3), .clk(clk), .reset(clear), .out(calc_out_3));
    eight_bit_register      eight_bit_register_calc4      (.in(acc_out_4), .clk(clk), .reset(clear), .out(calc_out_4));
    
endmodule

