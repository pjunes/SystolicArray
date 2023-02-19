`timescale 1ns / 1ps

module CT_module(clk, reset, en_ct, 
a_1_1, a_1_2, a_1_3, a_1_4, a_2_1, a_2_2, a_2_3, a_2_4, a_3_1, a_3_2, a_3_3, a_3_4, a_4_1, a_4_2, a_4_3, a_4_4, 
b_1_1, b_1_2, b_1_3, b_2_1, b_2_2, b_2_3, b_3_1, b_3_2, b_3_3
, ct_done, ct_en_result, ct_result);


    input clk, reset, en_ct;
    input [7:0] a_1_1, a_1_2, a_1_3, a_1_4, a_2_1, a_2_2, a_2_3, a_2_4, a_3_1, a_3_2, a_3_3, a_3_4, a_4_1, a_4_2, a_4_3, a_4_4;
    input [7:0] b_1_1, b_1_2, b_1_3, b_2_1, b_2_2, b_2_3, b_3_1, b_3_2, b_3_3;
    

    wire clear;
    wire [7:0] weight_out;
    wire [7:0] subject_in_1, subject_in_2, subject_in_3, subject_in_4;
    
    output  ct_done;
    output ct_en_result;
    output [7:0] ct_result;
    
    wire [7:0] ct_result_1, ct_result_2, ct_result_3, ct_result_4;
    wire [1:0] sel;
    
    CT_controller CT_controller(
    .clk(clk), .reset(reset), .en_ct(en_ct), 
    .a_1_1(a_1_1), .a_1_2(a_1_2), .a_1_3(a_1_3), .a_1_4(a_1_4), 
    .a_2_1(a_2_1), .a_2_2(a_2_2), .a_2_3(a_2_3), .a_2_4(a_2_4), 
    .a_3_1(a_3_1), .a_3_2(a_3_2), .a_3_3(a_3_3), .a_3_4(a_3_4), 
    .a_4_1(a_4_1), .a_4_2(a_4_2), .a_4_3(a_4_3), .a_4_4(a_4_4), 
    .b_1_1(b_1_1), .b_1_2(b_1_2), .b_1_3(b_1_3), 
    .b_2_1(b_2_1), .b_2_2(b_2_2), .b_2_3(b_2_3), 
    .b_3_1(b_3_1), .b_3_2(b_3_2), .b_3_3(b_3_3),
    .c_1_1(ct_result_1), .c_1_2(ct_result_2), .c_2_1(ct_result_3), .c_2_2(ct_result_4),
    .clear(clear), .weight_out(weight_out), 
    .subject_in_1(subject_in_1), .subject_in_2(subject_in_2), .subject_in_3(subject_in_3), .subject_in_4(subject_in_4),
    .ct_en_result(ct_en_result), .ct_result(ct_result), .ct_done(ct_done));

//module CT_controller(clk, reset, en_ct, 
//a_1_1, a_1_2, a_1_3, a_1_4, 
//a_2_1, a_2_2, a_2_3, a_2_4, 
//a_3_1, a_3_2, a_3_3, a_3_4, 
//a_4_1, a_4_2, a_4_3, a_4_4, 
//b_1_1, b_1_2, b_1_3, 
//b_2_1, b_2_2, b_2_3, 
//b_3_1, b_3_2, b_3_3, 
//c_1_1, c_1_2, c_2_1, c_2_2,
//clear, weight_out, 
//subject_in_1, subject_in_2, subject_in_3, subject_in_4, 
//ct_en_result, ct_result, ct_done
//);

    CT CT(
    .clk(clk), .clear(clear), .weight_out(weight_out), 
    .subject_in_1(subject_in_1), .subject_in_2(subject_in_2), .subject_in_3(subject_in_3), .subject_in_4(subject_in_4),
    .calc_out_1(ct_result_1), .calc_out_2(ct_result_2), .calc_out_3(ct_result_3), .calc_out_4(ct_result_4));

//module CT(clk, clear,
//weight_out, 
//subject_in_1, subject_in_2, subject_in_3, subject_in_4,
//calc_out_1, calc_out_2, calc_out_3, calc_out_4);    
endmodule
