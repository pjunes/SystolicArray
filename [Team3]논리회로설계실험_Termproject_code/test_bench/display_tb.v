
module test_display;
  
  	reg CLK;
	reg [7:0] PE11, PE12, PE21, PE22, SA11, SA12, SA21, SA22, CT11, CT12, CT21, CT22;	
	reg RESET;
		
	
	//output
	wire [3:0] Anode_Activate;
	wire [6:0] LED_out;
	wire [7:0] displayed;

	display_module display_module(.clock_100Mhz(CLK), .reset(RESET), .pe11(PE11), .pe12(PE12), .pe21(PE21), .pe22(PE22), .sa11(SA11), .sa12(SA12), .sa21(SA21), .sa22(SA22), .ct11(CT11), .ct12(CT12), .ct21(CT21), .ct22(CT22), .Anode_Activate(Anode_Activate), .LED_out(LED_out), .displayed(displayed));
	initial
	begin
		CLK = 1'b0;
	        RESET = 1'b1;
		PE11 = 0;	PE12 = 0;	PE21 = 0;	PE22 = 0;
		SA11 = 0;	SA12 = 0;	SA21 = 0;	SA22 = 0;
		CT11 = 0;	CT12 = 0;	CT21 = 0;	CT22 = 0;
	end
	
	//clock
	initial
	begin
		 forever
		 begin
			#10 CLK = !CLK;
		 end
	end
	 
	initial 
	begin	
		//test patterns 
		//Create a test pattern for the counter properly
		
		#20 
		RESET = 0;
		PE11 = 8'b00000011;	PE12 = 8'b00000101;	PE21 = 8'b00001001;	PE22 = 8'b00010001;
		SA11 = 8'b00000001;	SA12 = 8'b00000101;	SA21 = 8'b00001001;	SA22 = 8'b00010001;
		CT11 = 8'b11010001;	CT12 = 8'b11110001;	CT21 = 8'b11010101;	CT22 = 8'b11111111;
	end

endmodule