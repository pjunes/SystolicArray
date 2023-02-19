`timescale 1ns / 1ps

module eight_bit_multiplier(a, b, out);

    input [7:0] a, b;
    
    output [7:0] out;
    
    wire and_out_0_0, and_out_0_1, and_out_0_2, and_out_0_3, and_out_0_4, and_out_0_5, and_out_0_6, and_out_0_7;
    wire and_out_1_0, and_out_1_1, and_out_1_2, and_out_1_3, and_out_1_4, and_out_1_5, and_out_1_6;
    wire and_out_2_0, and_out_2_1, and_out_2_2, and_out_2_3, and_out_2_4, and_out_2_5;
    wire and_out_3_0, and_out_3_1, and_out_3_2, and_out_3_3, and_out_3_4;
    wire and_out_4_0, and_out_4_1, and_out_4_2, and_out_4_3;
    wire and_out_5_0, and_out_5_1, and_out_5_2;
    wire and_out_6_0, and_out_6_1;
    wire and_out_7_0;
    
//    wire full_sum_1_6, full_sum_1_5, full_sum_1_4, full_sum_1_3, full_sum_1_2, full_sum_1_1, half_sum_1_0;
//    wire full_sum_2_5, full_sum_2_4, full_sum_2_3, full_sum_2_2, full_sum_2_1, half_sum_2_0;
//    wire full_sum_3_4, full_sum_3_3, full_sum_3_2, full_sum_3_1, half_sum_3_0;
//    wire full_sum_4_3, full_sum_4_2, full_sum_4_1, half_sum_4_0;
//    wire full_sum_5_2, full_sum_5_1, half_sum_5_0;
//    wire full_sum_6_1, half_sum_6_0;
//    wire half_sum_7_0;

//    wire               full_cout_1_5, full_cout_1_4, full_cout_1_3, full_cout_1_2, full_cout_1_1, half_cout_1_0;
//    wire               full_cout_2_4, full_cout_2_3, full_cout_2_2, full_cout_2_1, half_cout_2_0;
//    wire               full_cout_3_3, full_cout_3_2, full_cout_3_1, half_cout_3_0;
//    wire               full_cout_4_2, full_cout_4_1, half_cout_4_0;
//    wire               full_cout_5_1, full_cout_5_0;
//    wire               full_cout_6_0;

//    wire sum_1_6, sum_1_5, sum_1_4, sum_1_3, sum_1_2, sum_1_1, sum_1_0;
//    wire sum_2_5, sum_2_4, sum_2_3, sum_2_2, sum_2_1, sum_2_0;
//    wire sum_3_4, sum_3_3, sum_3_2, sum_3_1, sum_3_0;
//    wire sum_4_3, sum_4_2, sum_4_1, sum_4_0;
//    wire sum_5_2, sum_5_1, sum_5_0;
//    wire sum_6_1, sum_6_0;
//    wire sum_7_0;
    
    wire sum_1_6, sum_1_5, sum_1_4, sum_1_3, sum_1_2, sum_1_1;
    wire sum_2_5, sum_2_4, sum_2_3, sum_2_2, sum_2_1;
    wire sum_3_4, sum_3_3, sum_3_2, sum_3_1;
    wire sum_4_3, sum_4_2, sum_4_1;
    wire sum_5_2, sum_5_1;
    wire sum_6_1;
    
    wire               cout_1_5, cout_1_4, cout_1_3, cout_1_2, cout_1_1, cout_1_0;
    wire               cout_2_4, cout_2_3, cout_2_2, cout_2_1, cout_2_0;
    wire               cout_3_3, cout_3_2, cout_3_1, cout_3_0;
    wire               cout_4_2, cout_4_1, cout_4_0;
    wire               cout_5_1, cout_5_0;
    wire               cout_6_0;
    
//    and_gate and_0_0 (.a(a[0]), .b(b[0]), .out(and_out_0_0));
    and_gate and_0_0 (.a(a[0]), .b(b[0]), .out(out[0]));
    and_gate and_0_1 (.a(a[0]), .b(b[1]), .out(and_out_0_1));
    and_gate and_0_2 (.a(a[0]), .b(b[2]), .out(and_out_0_2));
    and_gate and_0_3 (.a(a[0]), .b(b[3]), .out(and_out_0_3));
    and_gate and_0_4 (.a(a[0]), .b(b[4]), .out(and_out_0_4));
    and_gate and_0_5 (.a(a[0]), .b(b[5]), .out(and_out_0_5));
    and_gate and_0_6 (.a(a[0]), .b(b[6]), .out(and_out_0_6));
    and_gate and_0_7 (.a(a[0]), .b(b[7]), .out(and_out_0_7));
    
    and_gate and_1_0 (.a(a[1]), .b(b[0]), .out(and_out_1_0));
    and_gate and_1_1 (.a(a[1]), .b(b[1]), .out(and_out_1_1));
    and_gate and_1_2 (.a(a[1]), .b(b[2]), .out(and_out_1_2));
    and_gate and_1_3 (.a(a[1]), .b(b[3]), .out(and_out_1_3));
    and_gate and_1_4 (.a(a[1]), .b(b[4]), .out(and_out_1_4));
    and_gate and_1_5 (.a(a[1]), .b(b[5]), .out(and_out_1_5));
    and_gate and_1_6 (.a(a[1]), .b(b[6]), .out(and_out_1_6));
    
    and_gate and_2_0 (.a(a[2]), .b(b[0]), .out(and_out_2_0));
    and_gate and_2_1 (.a(a[2]), .b(b[1]), .out(and_out_2_1));
    and_gate and_2_2 (.a(a[2]), .b(b[2]), .out(and_out_2_2));
    and_gate and_2_3 (.a(a[2]), .b(b[3]), .out(and_out_2_3));
    and_gate and_2_4 (.a(a[2]), .b(b[4]), .out(and_out_2_4));
    and_gate and_2_5 (.a(a[2]), .b(b[5]), .out(and_out_2_5));
    
    and_gate and_3_0 (.a(a[3]), .b(b[0]), .out(and_out_3_0));
    and_gate and_3_1 (.a(a[3]), .b(b[1]), .out(and_out_3_1));
    and_gate and_3_2 (.a(a[3]), .b(b[2]), .out(and_out_3_2));
    and_gate and_3_3 (.a(a[3]), .b(b[3]), .out(and_out_3_3));
    and_gate and_3_4 (.a(a[3]), .b(b[4]), .out(and_out_3_4));
    
    and_gate and_4_0 (.a(a[4]), .b(b[0]), .out(and_out_4_0));
    and_gate and_4_1 (.a(a[4]), .b(b[1]), .out(and_out_4_1));
    and_gate and_4_2 (.a(a[4]), .b(b[2]), .out(and_out_4_2));
    and_gate and_4_3 (.a(a[4]), .b(b[3]), .out(and_out_4_3));
    
    and_gate and_5_0 (.a(a[5]), .b(b[0]), .out(and_out_5_0));
    and_gate and_5_1 (.a(a[5]), .b(b[1]), .out(and_out_5_1));
    and_gate and_5_2 (.a(a[5]), .b(b[2]), .out(and_out_5_2));
    
    and_gate and_6_0 (.a(a[6]), .b(b[0]), .out(and_out_6_0));
    and_gate and_6_1 (.a(a[6]), .b(b[1]), .out(and_out_6_1));
    
    and_gate and_7_0 (.a(a[7]), .b(b[0]), .out(and_out_7_0));

//    full_adder full_adder__(.a(), .b(), .cin(), .sum(), .cout());
//    full_sum full_sum__(.a(), .b(), .cin(), .sum());
//    half_sum half_sum__(.a(), .b(), .sum());

//    half_adder half_adder_1_0(.a(and_out_1_0), .b(and_out_0_1),                 .sum(sum_1_0), .cout(cout_1_0)); // xline : 1, yline : 0
    half_adder half_adder_1_0(.a(and_out_1_0), .b(and_out_0_1),                 .sum(out[1]),  .cout(cout_1_0));
    full_adder full_adder_1_1(.a(and_out_1_1), .b(and_out_0_2), .cin(cout_1_0), .sum(sum_1_1), .cout(cout_1_1));
    full_adder full_adder_1_2(.a(and_out_1_2), .b(and_out_0_3), .cin(cout_1_1), .sum(sum_1_2), .cout(cout_1_2));
    full_adder full_adder_1_3(.a(and_out_1_3), .b(and_out_0_4), .cin(cout_1_2), .sum(sum_1_3), .cout(cout_1_3));
    full_adder full_adder_1_4(.a(and_out_1_4), .b(and_out_0_5), .cin(cout_1_3), .sum(sum_1_4), .cout(cout_1_4));
    full_adder full_adder_1_5(.a(and_out_1_5), .b(and_out_0_6), .cin(cout_1_4), .sum(sum_1_5), .cout(cout_1_5));
    full_sum   full_sumer_1_6(.a(and_out_1_6), .b(and_out_0_7), .cin(cout_1_5), .sum(sum_1_6));
    
    
//    half_adder half_adder_2_0(.a(sum_1_1), .b(and_out_2_0),                 .sum(sum_2_0), .cout(cout_2_0));
    half_adder half_adder_2_0(.a(sum_1_1), .b(and_out_2_0),                 .sum(out[2]),  .cout(cout_2_0));
    full_adder full_adder_2_1(.a(sum_1_2), .b(and_out_2_1), .cin(cout_2_0), .sum(sum_2_1), .cout(cout_2_1));
    full_adder full_adder_2_2(.a(sum_1_3), .b(and_out_2_2), .cin(cout_2_1), .sum(sum_2_2), .cout(cout_2_2));
    full_adder full_adder_2_3(.a(sum_1_4), .b(and_out_2_3), .cin(cout_2_2), .sum(sum_2_3), .cout(cout_2_3));
    full_adder full_adder_2_4(.a(sum_1_5), .b(and_out_2_4), .cin(cout_2_3), .sum(sum_2_4), .cout(cout_2_4));
    full_sum   full_sumer_2_5(.a(sum_1_6), .b(and_out_2_5), .cin(cout_2_4), .sum(sum_2_5));
    
    
//    half_adder half_adder_3_0(.a(sum_2_1), .b(and_out_3_0),                 .sum(sum_3_0), .cout(cout_3_0));
    half_adder half_adder_3_0(.a(sum_2_1), .b(and_out_3_0),                 .sum(out[3]),  .cout(cout_3_0));
    full_adder full_adder_3_1(.a(sum_2_2), .b(and_out_3_1), .cin(cout_3_0), .sum(sum_3_1), .cout(cout_3_1));
    full_adder full_adder_3_2(.a(sum_2_3), .b(and_out_3_2), .cin(cout_3_1), .sum(sum_3_2), .cout(cout_3_2));
    full_adder full_adder_3_3(.a(sum_2_4), .b(and_out_3_3), .cin(cout_3_2), .sum(sum_3_3), .cout(cout_3_3));
    full_sum   full_sumer_3_4(.a(sum_2_5), .b(and_out_3_4), .cin(cout_3_3), .sum(sum_3_4));
    
    
//    half_adder half_adder_4_0(.a(sum_3_1), .b(and_out_4_0),                 .sum(sum_4_0), .cout(cout_4_0));
    half_adder half_adder_4_0(.a(sum_3_1), .b(and_out_4_0),                 .sum(out[4]),  .cout(cout_4_0));
    full_adder full_adder_4_1(.a(sum_3_2), .b(and_out_4_1), .cin(cout_4_0), .sum(sum_4_1), .cout(cout_4_1));
    full_adder full_adder_4_2(.a(sum_3_3), .b(and_out_4_2), .cin(cout_4_1), .sum(sum_4_2), .cout(cout_4_2));
    full_sum   full_sumer_4_3(.a(sum_3_4), .b(and_out_4_3), .cin(cout_4_2), .sum(sum_4_3));
    
    
//    half_adder half_adder_5_0(.a(sum_4_1), .b(and_out_5_0),                 .sum(sum_5_0), .cout(cout_5_0));
    half_adder half_adder_5_0(.a(sum_4_1), .b(and_out_5_0),                 .sum(out[5]),  .cout(cout_5_0));
    full_adder full_adder_5_1(.a(sum_4_2), .b(and_out_5_1), .cin(cout_5_0), .sum(sum_5_1), .cout(cout_5_1));
    full_sum   full_sumer_5_2(.a(sum_4_3), .b(and_out_5_2), .cin(cout_5_1), .sum(sum_5_2));
    
    
//    half_adder half_adder_6_0(.a(sum_5_1), .b(and_out_6_0),                 .sum(sum_6_0), .cout(cout_6_0));
    half_adder half_adder_6_0(.a(sum_5_1), .b(and_out_6_0),                 .sum(out[6]), .cout(cout_6_0));
    full_sum   full_sumer_6_1(.a(sum_5_2), .b(and_out_6_1), .cin(cout_6_0), .sum(sum_6_1));
    
    
//    half_sum half_sumer_7_0(.a(sum_6_1), .b(and_out_7_0), .sum(sum_7_0));
    half_sum half_sumer_7_0(.a(sum_6_1), .b(and_out_7_0), .sum(out[7]));
    
endmodule
