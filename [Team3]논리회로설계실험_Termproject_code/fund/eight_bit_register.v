`timescale 1ns / 1ps

module eight_bit_register(in, clk, reset, out);

	input [7:0] in;
	input clk;
	input reset;

	output [7:0] out;

	d_flip_flop d_flip_flop_0(.d(in[0]), .clk(clk), .reset(reset), .q(out[0]));
	d_flip_flop d_flip_flop_1(.d(in[1]), .clk(clk), .reset(reset), .q(out[1]));
	d_flip_flop d_flip_flop_2(.d(in[2]), .clk(clk), .reset(reset), .q(out[2]));
	d_flip_flop d_flip_flop_3(.d(in[3]), .clk(clk), .reset(reset), .q(out[3]));
	d_flip_flop d_flip_flop_4(.d(in[4]), .clk(clk), .reset(reset), .q(out[4]));
	d_flip_flop d_flip_flop_5(.d(in[5]), .clk(clk), .reset(reset), .q(out[5]));
	d_flip_flop d_flip_flop_6(.d(in[6]), .clk(clk), .reset(reset), .q(out[6]));
	d_flip_flop d_flip_flop_7(.d(in[7]), .clk(clk), .reset(reset), .q(out[7]));

endmodule