

module display_module(clock_100Mhz, reset, pe11, pe12, pe21, pe22, sa11, sa12, sa21, sa22, ct11, ct12, ct21, ct22, Anode_Activate, LED_out, displayed);
	
	//input
	input clock_100Mhz;
	input reset;
	input [7:0] pe11, pe12, pe21, pe22, sa11, sa12, sa21, sa22, ct11, ct12, ct21, ct22;

	//output
	output [3:0] Anode_Activate;
	output [6:0] LED_out;
	output [7:0] displayed;


	wire count;
	wire [7:0] displayed;
	wire [7:0] pe11, pe12, pe21, pe22, sa11, sa12, sa21, sa22, ct11, ct12, ct21, ct22;
	 
	//////////////////////////////////
	
	display_control display_control(.clk(clock_100Mhz), .reset(reset), .count(count), .pe11(pe11), .pe12(pe12), .pe21(pe21), .pe22(pe22), .sa11(sa11), .sa12(sa12), .sa21(sa21), .sa22(sa22), .ct11(ct11), .ct12(ct12), .ct21(ct21), .ct22(ct22), .displayed(displayed));
	second_counter second_counter(.clock_100Mhz(clock_100Mhz), .reset(reset), .count(count));
	segment_display segment_display(.clock_100Mhz(clock_100Mhz), .reset(reset), .displayed(displayed), .Anode_Activate(Anode_Activate), .LED_out(LED_out));
endmodule