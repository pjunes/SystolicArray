`timescale 1ns / 1ps

module SA_tb;

    reg clk, reset;
    reg [7:0] 
        weight_in_1_1, weight_in_1_2, weight_in_1_3, 
        weight_in_2_1, weight_in_2_2, weight_in_2_3, 
        weight_in_3_1, weight_in_3_2, weight_in_3_3;

    reg [7:0] subject_in_1, subject_in_2, subject_in_3;
    
    wire [7:0] result;
    
//    wire sa_en_result;
//    wire [7:0] sa_result;
    
//SA(clk, reset,
//weight_in_1_1, weight_in_1_2, weight_in_1_3, 
//weight_in_2_1, weight_in_2_2, weight_in_2_3, 
//weight_in_3_1, weight_in_3_2, weight_in_3_3, 
//subject_in_1, subject_in_2, subject_in_3, 
//result);

    SA SA_tb (.clk(clk), .reset(reset),
.weight_in_1_1(weight_in_1_1), .weight_in_1_2(weight_in_1_2), .weight_in_1_3(weight_in_1_3),
.weight_in_2_1(weight_in_2_1), .weight_in_2_2(weight_in_2_2), .weight_in_2_3(weight_in_2_3),
.weight_in_3_1(weight_in_3_1), .weight_in_3_2(weight_in_3_2), .weight_in_3_3(weight_in_3_3),
.subject_in_1(subject_in_1), .subject_in_2(subject_in_2), .subject_in_3(subject_in_3),
.result(result));
    
    initial
	begin	   
        clk = 1'b0;
        reset = 1'b0;
//        a_1_1 = 8'd233;   a_1_2 = 8'd123;   a_1_3 = 8'd12;   a_1_4 = 8'd3;
//        a_2_1 = 8'd5;   a_2_2 = 8'd2;   a_2_3 = 8'd3;   a_2_4 = 8'd3;
//        a_3_1 = 8'd9;   a_3_2 = 8'd255;   a_3_3 = 8'd1;   a_3_4 = 8'd12;
//        a_4_1 = 8'd13;   a_4_2 = 8'd64;   a_4_3 = 8'd55;   a_4_4 = 8'd27;
        subject_in_1  = 8'd0;    subject_in_2  = 8'd0;    subject_in_3  = 8'd0;
        weight_in_1_1 = 8'd13;   weight_in_1_2 = 8'd2;    weight_in_1_3 = 8'd3;
        weight_in_2_1 = 8'd2;    weight_in_2_2 = 8'd1;    weight_in_2_3 = 8'd50;
        weight_in_3_1 = 8'd51;   weight_in_3_2 = 8'd52;   weight_in_3_3 = 8'd1;
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
	   
	   subject_in_1  = 8'd13;    subject_in_2  = 8'd0;    subject_in_3  = 8'd0; #20;
	   subject_in_1  = 8'd9;    subject_in_2  = 8'd64;    subject_in_3  = 8'd0; #20;
	   subject_in_1  = 8'd5;    subject_in_2  = 8'd255;    subject_in_3  = 8'd55; #20;
	   subject_in_1  = 8'd233;    subject_in_2  = 8'd2;    subject_in_3  = 8'd1; #20;
	   subject_in_1  = 8'd64;    subject_in_2  = 8'd123;    subject_in_3  = 8'd3; #20;
	   subject_in_1  = 8'd255;    subject_in_2  = 8'd55;    subject_in_3  = 8'd12; #20;
	   subject_in_1  = 8'd2;    subject_in_2  = 8'd1;    subject_in_3  = 8'd27; #20;
	   subject_in_1  = 8'd123;    subject_in_2  = 8'd3;    subject_in_3  = 8'd12; #20;
	   subject_in_1  = 8'd0;    subject_in_2  = 8'd12;    subject_in_3  = 8'd3; #20;
	   subject_in_1  = 8'd0;    subject_in_2  = 8'd0;    subject_in_3  = 8'd3; #20;
	   
	   subject_in_1  = 8'd0;    subject_in_2  = 8'd0;    subject_in_3  = 8'd0;
	   
//        a_1_1 = 8'd233;   a_1_2 = 8'd123;   a_1_3 = 8'd12;   a_1_4 = 8'd3;
//        a_2_1 = 8'd5;   a_2_2 = 8'd2;   a_2_3 = 8'd3;   a_2_4 = 8'd3;
//        a_3_1 = 8'd9;   a_3_2 = 8'd255;   a_3_3 = 8'd1;   a_3_4 = 8'd12;
//        a_4_1 = 8'd13;   a_4_2 = 8'd64;   a_4_3 = 8'd55;   a_4_4 = 8'd27;
	   
	end	

endmodule