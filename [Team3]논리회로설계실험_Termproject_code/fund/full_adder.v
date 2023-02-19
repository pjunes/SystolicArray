`timescale 1ns / 1ps

module full_adder (a, b, cin, sum, cout);
	input a;
	input b;
	input cin;
	
	output sum;
	output cout;

	wire xnor_out_1, xnor_out_2;
	wire not_out_1;

	wire and_out_1, and_out_2, and_out_3;
	wire or_out_1;

	xnor_gate xnor_1(.a(a), .b(b), .out(xnor_out_1));
	not_gate not_1(.a(xnor_out_1), .out(not_out_1));
	xnor_gate xnor_2(.a(not_out_1), .b(cin), .out(xnor_out_2));
	not_gate not_2(.a(xnor_out_2), .out(sum));

	and_gate and_1(.a(a), .b(b), .out(and_out_1));
	and_gate and_2(.a(a), .b(cin), .out(and_out_2));
	and_gate and_3(.a(b), .b(cin), .out(and_out_3));
	or_gate or_1(.a(and_out_1), .b(and_out_2), .out(or_out_1));
	or_gate or_2(.a(or_out_1), .b(and_out_3), .out(cout));

endmodule