`timescale 1ns / 1ps

module top_module(clk, switch, reset, all_done, 
q, sa_result
);
    input clk, switch, reset;
    
    output all_done;
    
    output [7:0] q, sa_result;
    
    // ram
    wire [7:0] q; 
    wire [7:0] data;
    wire [5:0] addr;
    wire we;
     
    wire en_pe, en_sa, en_ct;
     
    wire pe_en_result, sa_en_result, ct_en_result;
    wire [7:0] pe_result, sa_result, ct_result; 
    wire pe_done, sa_done, ct_done; 

    wire [7:0] a_1_1, a_1_2, a_1_3, a_1_4, a_2_1, a_2_2, a_2_3, a_2_4, a_3_1, a_3_2, a_3_3, a_3_4, a_4_1, a_4_2, a_4_3, a_4_4;
    wire [7:0] b_1_1, b_1_2, b_1_3, b_2_1, b_2_2, b_2_3, b_3_1, b_3_2, b_3_3;
    
    // for DP
    wire [7:0] pe11, pe12, pe21, pe22, sa11, sa12, sa21, sa22, ct11, ct12, ct21, ct22;
	wire [3:0] Anode_Activate;
	wire [6:0] LED_out;
	wire [7:0] displayed;
    
    main_controller main_controller(
.clk(clk), .switch(switch), .reset(reset), 
.q(q),
.pe_en_result(pe_en_result), .sa_en_result(sa_en_result), .ct_en_result(ct_en_result),
.pe_result(pe_result), .sa_result(sa_result), .ct_result(ct_result), 
.pe_done(pe_done), .sa_done(sa_done), .ct_done(ct_done), 
.data(data), .addr(addr), .we(we), 
.en_pe(en_pe), .en_sa(en_sa), .en_ct(en_ct),
.a_1_1_out(a_1_1), .a_1_2_out(a_1_2), .a_1_3_out(a_1_3), .a_1_4_out(a_1_4), 
.a_2_1_out(a_2_1), .a_2_2_out(a_2_2), .a_2_3_out(a_2_3), .a_2_4_out(a_2_4), 
.a_3_1_out(a_3_1), .a_3_2_out(a_3_2), .a_3_3_out(a_3_3), .a_3_4_out(a_3_4), 
.a_4_1_out(a_4_1), .a_4_2_out(a_4_2), .a_4_3_out(a_4_3), .a_4_4_out(a_4_4), 
.b_1_1_out(b_1_1), .b_1_2_out(b_1_2), .b_1_3_out(b_1_3), 
.b_2_1_out(b_2_1), .b_2_2_out(b_2_2), .b_2_3_out(b_2_3), 
.b_3_1_out(b_3_1), .b_3_2_out(b_3_2), .b_3_3_out(b_3_3),
.pe11(pe11), .pe12(pe12), .pe21(pe21), .pe22(pe22),
.sa11(sa11), .sa12(sa12), .sa21(sa21), .sa22(sa22),
.ct11(ct11), .ct12(ct12), .ct21(ct21), .ct22(ct22),
.all_done(all_done) 
);

    //RAM
    single_port_ram single_port_ram(.data(data), .addr(addr), .we(we), .clk(clk), .q(q));
    
    //single PE module
    PE_single_module PE_single_module(.clk(clk), .reset(reset), .en_single(en_pe),
.a_1_1(a_1_1), .a_1_2(a_1_2), .a_1_3(a_1_3), .a_1_4(a_1_4), 
.a_2_1(a_2_1), .a_2_2(a_2_2), .a_2_3(a_2_3), .a_2_4(a_2_4), 
.a_3_1(a_3_1), .a_3_2(a_3_2), .a_3_3(a_3_3), .a_3_4(a_3_4), 
.a_4_1(a_4_1), .a_4_2(a_4_2), .a_4_3(a_4_3), .a_4_4(a_4_4), 
.b_1_1(b_1_1), .b_1_2(b_1_2), .b_1_3(b_1_3), 
.b_2_1(b_2_1), .b_2_2(b_2_2), .b_2_3(b_2_3), 
.b_3_1(b_3_1), .b_3_2(b_3_2), .b_3_3(b_3_3),
.en_result(pe_en_result), .acc_out(pe_result), .pe_done(pe_done));
    
    //SA module
    SA_module SA_module(.clk(clk), .reset(reset), .en_sa(en_sa), 
.a_1_1(a_1_1), .a_1_2(a_1_2), .a_1_3(a_1_3), .a_1_4(a_1_4), 
.a_2_1(a_2_1), .a_2_2(a_2_2), .a_2_3(a_2_3), .a_2_4(a_2_4), 
.a_3_1(a_3_1), .a_3_2(a_3_2), .a_3_3(a_3_3), .a_3_4(a_3_4), 
.a_4_1(a_4_1), .a_4_2(a_4_2), .a_4_3(a_4_3), .a_4_4(a_4_4), 
.b_1_1(b_1_1), .b_1_2(b_1_2), .b_1_3(b_1_3), 
.b_2_1(b_2_1), .b_2_2(b_2_2), .b_2_3(b_2_3), 
.b_3_1(b_3_1), .b_3_2(b_3_2), .b_3_3(b_3_3),
.sa_en_result(sa_en_result), .sa_result(sa_result), .sa_done(sa_done));

    //CT module
    CT_module CT_module(.clk(clk), .reset(reset), .en_ct(en_ct), 
.a_1_1(a_1_1), .a_1_2(a_1_2), .a_1_3(a_1_3), .a_1_4(a_1_4), 
.a_2_1(a_2_1), .a_2_2(a_2_2), .a_2_3(a_2_3), .a_2_4(a_2_4), 
.a_3_1(a_3_1), .a_3_2(a_3_2), .a_3_3(a_3_3), .a_3_4(a_3_4), 
.a_4_1(a_4_1), .a_4_2(a_4_2), .a_4_3(a_4_3), .a_4_4(a_4_4), 
.b_1_1(b_1_1), .b_1_2(b_1_2), .b_1_3(b_1_3), 
.b_2_1(b_2_1), .b_2_2(b_2_2), .b_2_3(b_2_3), 
.b_3_1(b_3_1), .b_3_2(b_3_2), .b_3_3(b_3_3),
.ct_done(ct_done), .ct_en_result(ct_en_result), .ct_result(ct_result));

    //DP module
    display_module display_module(.clock_100Mhz(clk), .reset(reset), 
    .pe11(pe11), .pe12(pe12), .pe21(pe21), .pe22(pe22), 
    .sa11(sa11), .sa12(sa12), .sa21(sa21), .sa22(sa22), 
    .ct11(ct11), .ct12(ct12), .ct21(ct21), .ct22(ct22), 
    .Anode_Activate(Anode_Activate), .LED_out(LED_out), .displayed(displayed));
    
endmodule
