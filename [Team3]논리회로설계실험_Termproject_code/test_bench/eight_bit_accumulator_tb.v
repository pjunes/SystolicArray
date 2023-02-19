`timescale 1ns / 1ps

module eight_bit_accumulator_tb;
    
    reg clk, clear;
    reg [7:0] acc_in;
    
    wire [7:0] acc_out;
    
    eight_bit_accumulator eight_bit_accumulator_tb(clk, clear, acc_in, acc_out);

    initial
    begin
        clk = 1'b0;
        clear = 1'b0;
        acc_in = 8'd0;
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
	   clear = 1'b1; #20;
	   clear = 1'b0; #20;
	   acc_in = 8'd1; #20;
	   acc_in = 8'd2; #20;
	   acc_in = 8'd3; #20;
	   acc_in = 8'd4; #20;
	   acc_in = 8'd5; #20;
	   acc_in = 8'd0; #20;
	   clear = 1'b1; #20;
	   clear = 1'b0; #20;
	   acc_in = 8'd1; #20;
	   acc_in = 8'd2; #20;
	   acc_in = 8'd3; #20;
	   acc_in = 8'd4; #20;
	   acc_in = 8'd5; #20;
	   
	   
	end	

endmodule
