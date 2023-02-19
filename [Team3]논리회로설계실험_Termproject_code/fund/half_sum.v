`timescale 1ns / 1ps

module half_sum(a, b, sum);
	input a, b;
	
	output sum;
	
	wire xnor_out;
	
	xnor_gate xnor_1(.a(a), .b(b), .out(xnor_out));
	not_gate not_1(.a(xnor_out), .out(sum));
endmodule
