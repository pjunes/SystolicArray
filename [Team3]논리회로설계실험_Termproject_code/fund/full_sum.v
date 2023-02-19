`timescale 1ns / 1ps

module full_sum(a, b, cin, sum);
    input a;
	input b;
	input cin;
	
	output sum;

	wire xnor_out_1, xnor_out_2;
	wire not_out_1;

	xnor_gate xnor_1(.a(a), .b(b), .out(xnor_out_1));
	not_gate not_1(.a(xnor_out_1), .out(not_out_1));
	xnor_gate xnor_2(.a(not_out_1), .b(cin), .out(xnor_out_2));
	not_gate not_2(.a(xnor_out_2), .out(sum));
endmodule
