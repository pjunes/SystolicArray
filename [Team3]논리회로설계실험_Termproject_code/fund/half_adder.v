`timescale 1ns / 1ps

module half_adder (a, b, sum, cout);
	input a, b;
	
	output sum, cout;
	
	wire xnor_out;
	
	xnor_gate xnor_1(.a(a), .b(b), .out(xnor_out));
	not_gate not_1(.a(xnor_out), .out(sum));
	
	and_gate and_1(.a(a), .b(b), .out(cout));
	
endmodule