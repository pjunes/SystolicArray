`timescale 1ns / 1ps

module SA_module(clk, reset, en_sa, 
a_1_1, a_1_2, a_1_3, a_1_4, a_2_1, a_2_2, a_2_3, a_2_4, a_3_1, a_3_2, a_3_3, a_3_4, a_4_1, a_4_2, a_4_3, a_4_4, 
b_1_1, b_1_2, b_1_3, b_2_1, b_2_2, b_2_3, b_3_1, b_3_2, b_3_3, 
sa_en_result, sa_result, sa_done);
//c_1_1, c_1_2, c_2_1, c_2_2.

    input clk, reset, en_sa;
    input [7:0] a_1_1, a_1_2, a_1_3, a_1_4, a_2_1, a_2_2, a_2_3, a_2_4, a_3_1, a_3_2, a_3_3, a_3_4, a_4_1, a_4_2, a_4_3, a_4_4;
    input [7:0] b_1_1, b_1_2, b_1_3, b_2_1, b_2_2, b_2_3, b_3_1, b_3_2, b_3_3;
    
//    wire en_result, clear, input_control, weight_control, output_control;
    wire clear;
//    wire weight_control;
    wire [7:0] weight_in_1_1, weight_in_1_2, weight_in_1_3;
    wire [7:0] weight_in_2_1, weight_in_2_2, weight_in_2_3;
    wire [7:0] weight_in_3_1, weight_in_3_2, weight_in_3_3;
    wire [7:0] subject_in_1, subject_in_2, subject_in_3;
    
//    output [7:0] c_1_1, c_1_2, c_2_1, c_2_2;
    output sa_en_result;
    output [7:0] sa_result;
    output sa_done;

    SA_controller SA_controller(
    .clk(clk), .reset(reset), .en_sa(en_sa), 
    .a_1_1(a_1_1), .a_1_2(a_1_2), .a_1_3(a_1_3), .a_1_4(a_1_4), 
    .a_2_1(a_2_1), .a_2_2(a_2_2), .a_2_3(a_2_3), .a_2_4(a_2_4), 
    .a_3_1(a_3_1), .a_3_2(a_3_2), .a_3_3(a_3_3), .a_3_4(a_3_4), 
    .a_4_1(a_4_1), .a_4_2(a_4_2), .a_4_3(a_4_3), .a_4_4(a_4_4), 
    .b_1_1(b_1_1), .b_1_2(b_1_2), .b_1_3(b_1_3), 
    .b_2_1(b_2_1), .b_2_2(b_2_2), .b_2_3(b_2_3), 
    .b_3_1(b_3_1), .b_3_2(b_3_2), .b_3_3(b_3_3),
//    .result(result),
    .clear(clear),
    .weight_in_1_1(weight_in_1_1), .weight_in_1_2(weight_in_1_2), .weight_in_1_3(weight_in_1_3), 
    .weight_in_2_1(weight_in_2_1), .weight_in_2_2(weight_in_2_2), .weight_in_2_3(weight_in_2_3), 
    .weight_in_3_1(weight_in_3_1), .weight_in_3_2(weight_in_3_2), .weight_in_3_3(weight_in_3_3), 
    .subject_in_1(subject_in_1), .subject_in_2(subject_in_2), .subject_in_3(subject_in_3), 
//    .c_1_1(c_1_1), .c_1_2(c_1_2), .c_2_1(c_2_1), .c_2_2(c_2_2)
    .sa_en_result(sa_en_result), .sa_done(sa_done)
//    .result(result)
    );

    SA SA(
    .clk(clk), .reset(clear),
    .weight_in_1_1(weight_in_1_1), .weight_in_1_2(weight_in_1_2), .weight_in_1_3(weight_in_1_3), 
    .weight_in_2_1(weight_in_2_1), .weight_in_2_2(weight_in_2_2), .weight_in_2_3(weight_in_2_3), 
    .weight_in_3_1(weight_in_3_1), .weight_in_3_2(weight_in_3_2), .weight_in_3_3(weight_in_3_3), 
    .subject_in_1(subject_in_1), .subject_in_2(subject_in_2), .subject_in_3(subject_in_3), 
    .result(sa_result));
endmodule
