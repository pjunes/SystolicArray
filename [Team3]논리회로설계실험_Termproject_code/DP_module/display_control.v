

module display_control(clk, reset, count, pe11, pe12, pe21, pe22, sa11, sa12, sa21, sa22, ct11, ct12, ct21, ct22, displayed);
  
        input clk, reset, count;

	output reg [7:0] displayed;
	
	input [7:0] pe11, pe12, pe21, pe22, sa11, sa12, sa21, sa22, ct11, ct12, ct21, ct22;

	reg [3:0] next_state;
	reg [3:0] state ;
	
	//next state decision + output decision
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8, S9 = 9, S10 = 10, S11 = 11, INITIAL = 15;	

	always @ (posedge clk or posedge reset)
	begin
		if (reset) begin
			state <= INITIAL;
		end else begin
			state <= next_state;
		end
	end 

	always @ (*) 
	begin
		case (state)
		INITIAL: begin
			if (count==1) begin
				next_state = S0;
				displayed = pe11;
			end else begin
				next_state = INITIAL;
				displayed = 0;
			end
		end	
		S0: begin
			if (count==1) begin
				next_state = S1;
				displayed = pe12;
			end else begin
				next_state = S0;
				displayed = pe11;
			end
		end
		S1: begin
			if (count==1) begin
				next_state = S2;
				displayed = pe21;
			end else begin
				next_state = S1;
				displayed = pe12;
			end
		end
		S2: begin
			if (count==1) begin
				next_state = S3;
				displayed = pe22;
			end else begin
				next_state = S2;
				displayed = pe21;
			end
		end
		S3: begin
			if (count==1) begin
				next_state = S4;
				displayed = sa11;
			end else begin
				next_state = S3;
				displayed = pe22;
			end
		end
		S4: begin
			if (count==1) begin
				next_state = S5;
				displayed = sa12;
			end else begin
				next_state = S4;
				displayed = sa11;
			end
		end
		S5: begin
			if (count==1) begin
				next_state = S6;
				displayed = sa21;
			end else begin
				next_state = S5;
				displayed = sa12;
			end
		end
		S6: begin
			if (count==1) begin
				next_state = S7;
				displayed = sa22;
			end else begin
				next_state = S6;
				displayed = sa21;
			end
		end
		S7: begin
			if (count==1) begin
				next_state = S8;
				displayed = ct11;
			end else begin
				next_state = S7;
				displayed = sa22;
			end
		end
		S8: begin
			if (count==1) begin
				next_state = S9;
				displayed = ct12;
			end else begin
				next_state = S8;
				displayed = ct11;
			end
		end
		S9: begin
			if (count==1) begin
				next_state = S10;
				displayed = ct21;
			end else begin
				next_state = S9;
				displayed = ct12;
			end
		end
		S10: begin
			if (count==1) begin
				next_state = S11;
				displayed = ct22;
			end else begin
				next_state = S10;
				displayed = ct21;
			end
		end
		S11: begin
			if (count==1) begin
				next_state = INITIAL;
				displayed = ct22;
			end else begin
				next_state = S11;
				displayed = ct22;
			end
		end
		default: begin
			displayed = 0;
			next_state = INITIAL;
		end
		endcase
	end
	
endmodule