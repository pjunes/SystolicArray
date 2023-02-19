`timescale 1ns / 1ps

module PE_single_mode_tb;

    reg clk, reset, en_single;
    reg [7:0] a_1_1, a_1_2, a_1_3, a_1_4, a_2_1, a_2_2, a_2_3, a_2_4, a_3_1, a_3_2, a_3_3, a_3_4, a_4_1, a_4_2, a_4_3, a_4_4;
    reg [7:0] b_1_1, b_1_2, b_1_3, b_2_1, b_2_2, b_2_3, b_3_1, b_3_2, b_3_3;
    
    wire en_result;
    wire pe_done;
    wire [7:0]acc_out;
    
PE_single_module PE_single_module_1(.clk(clk), .reset(reset), .en_single(en_single),
.a_1_1(a_1_1), .a_1_2(a_1_2), .a_1_3(a_1_3), .a_1_4(a_1_4), 
.a_2_1(a_2_1), .a_2_2(a_2_2), .a_2_3(a_2_3), .a_2_4(a_2_4), 
.a_3_1(a_3_1), .a_3_2(a_3_2), .a_3_3(a_3_3), .a_3_4(a_3_4), 
.a_4_1(a_4_1), .a_4_2(a_4_2), .a_4_3(a_4_3), .a_4_4(a_4_4), 
.b_1_1(b_1_1), .b_1_2(b_1_2), .b_1_3(b_1_3), 
.b_2_1(b_2_1), .b_2_2(b_2_2), .b_2_3(b_2_3), 
.b_3_1(b_3_1), .b_3_2(b_3_2), .b_3_3(b_3_3), 
.en_result(en_result), .acc_out(acc_out), .pe_done(pe_done));
    
    initial
	begin	   
        clk = 1'b0;
        reset = 1'b0;
        en_single = 1'b0;
        
        a_1_1 = 8'd233;   a_1_2 = 8'd123;   a_1_3 = 8'd12;   a_1_4 = 8'd3;
        a_2_1 = 8'd5;   a_2_2 = 8'd2;   a_2_3 = 8'd3;   a_2_4 = 8'd3;
        a_3_1 = 8'd9;   a_3_2 = 8'd255;   a_3_3 = 8'd1;   a_3_4 = 8'd12;
        a_4_1 = 8'd13;   a_4_2 = 8'd64;   a_4_3 = 8'd55;   a_4_4 = 8'd27;
        
        b_1_1 = 8'd13;   b_1_2 = 8'd2;   b_1_3 = 8'd3;
        b_2_1 = 8'd2;   b_2_2 = 8'd1;   b_2_3 = 8'd50;
        b_3_1 = 8'd51;   b_3_2 = 8'd52;   b_3_3 = 8'd1;
        
	end

	initial
	begin
		 forever
		 begin
			#10 clk = !clk;
		 end
	end
	
    initial 
	begin	
	   #200; // wait for d ff works
	   reset = 1'b1; #20;
	   reset = 1'b0; #20;
	   en_single = 1'b1; #20;
	   en_single = 1'b0; #20;
	   
	end	

endmodule