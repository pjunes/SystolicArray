`timescale 1ns / 1ps

module top_module_tb;
    reg clk, switch, reset;
    
    wire all_done;
    
    top_module top_module_tb(.clk(clk), .switch(switch), .reset(reset), .all_done(all_done));
    
    initial
    begin
        clk = 1'b0;
        switch = 1'b0;
        reset = 1'b0;
    end
    
    initial
	begin
		 forever
		 begin
			#20 clk = !clk;
		 end
	end
        
    initial 
	begin	
	   #200; // wait for d ff works
	   reset = 1'b1; #20;
	   reset = 1'b0; #20;
	   switch = 1'b1; #20;
	   switch = 1'b0;
	end	

endmodule
