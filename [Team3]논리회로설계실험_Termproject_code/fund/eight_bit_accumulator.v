`timescale 1ns / 1ps
// ver. 0530

module eight_bit_accumulator(clk, clear, acc_in, acc_out);

    input clk;
    input clear;
    
    input [7:0] acc_in;
    
    wire [7:0] acc_in_register_out; // for calc register
    wire [7:0] acc_register_out; // for multiplier
    
    output [7:0] acc_out; // for adder
    
    eight_bit_register      acc_in_register (.in(acc_in), .clk(clk), .reset(clear), .out(acc_in_register_out));
    eight_bit_register      acc_register    (.in(acc_out), .clk(clk), .reset(clear), .out(acc_register_out));
    
    eight_bit_half_adder    eight_bit_adder (.a(acc_in_register_out), .b(acc_register_out), .out(acc_out));
endmodule

