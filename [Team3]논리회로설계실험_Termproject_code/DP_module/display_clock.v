
module second_counter(clock_100Mhz, reset, count);

    input clock_100Mhz;
    input reset;
    wire one_second_enable;
    output count;
    reg count;
    reg [19:0] refresh_counter;
    reg [26:0] one_second_counter;

  

    always @(posedge clock_100Mhz or posedge reset)
    begin
        if(reset==1)begin
            one_second_counter <= 0;
	    count <= 0;
	end
        else begin
//            if(one_second_counter>=99999999) begin
	      if(one_second_counter>=99) begin 
                one_second_counter <= 0;
		count <= 1;
		end
              else begin
                one_second_counter <= one_second_counter + 1;
		count <= 0;
	end
        end
    end 
    assign one_second_enable = (one_second_counter==99999999)?1:0;
//    assign count = (one_second_counter==9)?1:0;
endmodule