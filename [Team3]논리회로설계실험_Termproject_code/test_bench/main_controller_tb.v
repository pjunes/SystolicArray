`timescale 1ns / 1ps

module main_controller_tb;

    reg clk, switch, reset;
    
    wire [7:0] q;
     
    reg pe_en_result, sa_en_result, ct_en_result;
    reg [7:0] pe_result, sa_result, ct_result; 
    reg pe_done, sa_done, ct_done;
     
    // output
    wire [7:0] data;
//    wire [7:0] dummy;
    wire [5:0] addr;
    wire we; 
    
    wire en_pe, en_sa, en_ct;
    
//    wire [7:0]
//    a_1_1_out, a_1_2_out, a_1_3_out, a_1_4_out, 
//    a_2_1_out, a_2_2_out, a_2_3_out, a_2_4_out, 
//    a_3_1_out, a_3_2_out, a_3_3_out, a_3_4_out, 
//    a_4_1_out, a_4_2_out, a_4_3_out, a_4_4_out, 
//    b_1_1_out, b_1_2_out, b_1_3_out, 
//    b_2_1_out, b_2_2_out, b_2_3_out, 
//    b_3_1_out, b_3_2_out, b_3_3_out;
    
    wire [7:0]
    a_1_1, a_1_2, a_1_3, a_1_4, 
    a_2_1, a_2_2, a_2_3, a_2_4, 
    a_3_1, a_3_2, a_3_3, a_3_4, 
    a_4_1, a_4_2, a_4_3, a_4_4, 
    b_1_1, b_1_2, b_1_3, 
    b_2_1, b_2_2, b_2_3, 
    b_3_1, b_3_2, b_3_3;
    
    wire all_done; 
    
    single_port_ram single_port_ram_tb(.data(data), .addr(addr), .we(we), .clk(clk), .q(q));
    
    main_controller main_controller_tb(
.clk(clk), .switch(switch), .reset(reset), 
.q(q),
.pe_en_result(pe_en_result), .sa_en_result(sa_en_result), .ct_en_result(ct_en_result),
.pe_result(pe_result), .sa_result(sa_result), .ct_result(ct_result), 
.pe_done(pe_done), .sa_done(sa_done), .ct_done(ct_done), 
.data(data), .addr(addr), .we(we), 
//.dummy(dummy),
.en_pe(en_pe), .en_sa(en_sa), .en_ct(en_ct),
.a_1_1_out(a_1_1), .a_1_2_out(a_1_2), .a_1_3_out(a_1_3), .a_1_4_out(a_1_4), 
.a_2_1_out(a_2_1), .a_2_2_out(a_2_2), .a_2_3_out(a_2_3), .a_2_4_out(a_2_4), 
.a_3_1_out(a_3_1), .a_3_2_out(a_3_2), .a_3_3_out(a_3_3), .a_3_4_out(a_3_4), 
.a_4_1_out(a_4_1), .a_4_2_out(a_4_2), .a_4_3_out(a_4_3), .a_4_4_out(a_4_4), 
.b_1_1_out(b_1_1), .b_1_2_out(b_1_2), .b_1_3_out(b_1_3), 
.b_2_1_out(b_2_1), .b_2_2_out(b_2_2), .b_2_3_out(b_2_3), 
.b_3_1_out(b_3_1), .b_3_2_out(b_3_2), .b_3_3_out(b_3_3),
.all_done(all_done) 
);

    initial
    begin
        clk = 1'b1;
        switch = 1'b0;
        reset = 1'b1;
     
        pe_en_result = 1'b0;
        sa_en_result = 1'b0;
        ct_en_result = 1'b0;
        pe_result = 8'd0;
        sa_result = 8'd0;
        ct_result = 8'd0;
        pe_done = 1'b0;
        sa_done = 1'b0; 
        ct_done = 1'b0;
    end

    initial
    begin
        forever
        begin
            clk = ~clk; #10;
        end
    end
    
    initial
    begin
        #200;
        reset = 1'b0; #20;
    
        switch = 1'b1; #20;
        switch = 1'b0; #2000;
        
        sa_en_result = 1'b1; sa_result = 8'd051; #20;
        sa_en_result = 1'b1; sa_result = 8'd127; #20;
        sa_en_result = 1'b0; #80;
        
        sa_en_result = 1'b1; sa_result = 8'd001; #20;
        sa_en_result = 1'b1; sa_result = 8'd255; #20;
        sa_en_result = 1'b0; sa_done = 1'b1; #20;
        sa_done = 1'b0;
        
    end
    
endmodule
