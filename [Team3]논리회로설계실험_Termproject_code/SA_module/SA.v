`timescale 1ns / 1ps
// ver. 0524

module SA(clk, reset,
weight_in_1_1, weight_in_1_2, weight_in_1_3, 
weight_in_2_1, weight_in_2_2, weight_in_2_3, 
weight_in_3_1, weight_in_3_2, weight_in_3_3, 
subject_in_1, subject_in_2, subject_in_3, 
result);

    input clk;
    input reset;
    
    input [7:0] weight_in_1_1, weight_in_1_2, weight_in_1_3;
    input [7:0] weight_in_2_1, weight_in_2_2, weight_in_2_3;
    input [7:0] weight_in_3_1, weight_in_3_2, weight_in_3_3;
    
    input [7:0] subject_in_1;
    input [7:0] subject_in_2;
    input [7:0] subject_in_3;
    
    wire [7:0] subject_out_1_1; 
    wire [7:0] subject_out_1_2; 
    
    wire [7:0] subject_out_2_1;
    wire [7:0] subject_out_2_2;
    
    wire [7:0] subject_out_3_1;
    wire [7:0] subject_out_3_2;

    wire [7:0] weight_out_1_1;
    wire [7:0] weight_out_1_2;
    wire [7:0] weight_out_1_3;
    
    wire [7:0] weight_out_2_1;
    wire [7:0] weight_out_2_2;
    wire [7:0] weight_out_2_3;
    
    wire [7:0] weight_out_3_1;
    wire [7:0] weight_out_3_2;
    wire [7:0] weight_out_3_3;
    
    wire [7:0] pe_out_1_1;
    wire [7:0] pe_out_1_2;
    wire [7:0] pe_out_1_3;
    
    wire [7:0] pe_out_2_1;
    wire [7:0] pe_out_2_2;
    wire [7:0] pe_out_2_3;
    
    wire [7:0] pe_out_3_1;
    wire [7:0] pe_out_3_2;
    wire [7:0] pe_out_3_3;
    
    wire [7:0] adder_in_1, adder_in_2, adder_in_3;
    wire [7:0] adder_out_1, adder_out_2;
    
    output [7:0] result;


//    PE(clk, reset, weight_in, subject_in, calc_in, subject_out, pe_out);
    PE PE_1_1(.clk(clk), .reset(reset), .weight_in(weight_in_1_1), .subject_in(subject_in_1), .calc_in(8'd0), .subject_out(subject_out_1_1), .pe_out(pe_out_1_1));
    PE PE_1_2(.clk(clk), .reset(reset), .weight_in(weight_in_1_2), .subject_in(subject_out_1_1), .calc_in(8'd0), .subject_out(subject_out_1_2), .pe_out(pe_out_1_2));
    PE PE_1_3(.clk(clk), .reset(reset), .weight_in(weight_in_1_3), .subject_in(subject_out_1_2), .calc_in(8'd0), .subject_out(), .pe_out(pe_out_1_3));
    
    PE PE_2_1(.clk(clk), .reset(reset), .weight_in(weight_in_2_1), .subject_in(subject_in_2), .calc_in(pe_out_1_1), .subject_out(subject_out_2_1), .pe_out(pe_out_2_1));
    PE PE_2_2(.clk(clk), .reset(reset), .weight_in(weight_in_2_2), .subject_in(subject_out_2_1), .calc_in(pe_out_1_2), .subject_out(subject_out_2_2), .pe_out(pe_out_2_2));
    PE PE_2_3(.clk(clk), .reset(reset), .weight_in(weight_in_2_3), .subject_in(subject_out_2_2), .calc_in(pe_out_1_3), .subject_out(), .pe_out(pe_out_2_3));
    
    PE PE_3_1(.clk(clk), .reset(reset), .weight_in(weight_in_3_1), .subject_in(subject_in_3), .calc_in(pe_out_2_1), .subject_out(subject_out_3_1), .pe_out(pe_out_3_1));
    PE PE_3_2(.clk(clk), .reset(reset), .weight_in(weight_in_3_2), .subject_in(subject_out_3_1), .calc_in(pe_out_2_2), .subject_out(subject_out_3_2), .pe_out(pe_out_3_2));
    PE PE_3_3(.clk(clk), .reset(reset), .weight_in(weight_in_3_3), .subject_in(subject_out_3_2), .calc_in(pe_out_2_3), .subject_out(), .pe_out(pe_out_3_3));

    eight_bit_register pe_out_3_1_register(.in(pe_out_3_1), .clk(clk), .reset(reset), .out(adder_in_1));
    eight_bit_register pe_out_3_2_register(.in(pe_out_3_2), .clk(clk), .reset(reset), .out(adder_in_2));
    eight_bit_register pe_out_3_3_register(.in(pe_out_3_3), .clk(clk), .reset(reset), .out(adder_in_3));

    eight_bit_half_adder eight_bit_half_adder_1(.a(adder_in_1), .b(adder_in_2), .out(adder_out_1));
    eight_bit_half_adder eight_bit_half_adder_2(.a(adder_out_1), .b(adder_in_3), .out(adder_out_2));
    
    eight_bit_register result_register(.in(adder_out_2), .clk(clk), .reset(reset), .out(result));
endmodule
