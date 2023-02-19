
module segment_display(input clock_100Mhz,
		       input reset,
		       input [7:0] displayed,
		       output reg [3:0] Anode_Activate,
		       output reg [6:0] LED_out);

    reg [19:0] refresh_counter;
    reg [15:0] displayed_number;
    wire [1:0] LED_activating_counter;
    reg [3:0] LED_BCD;



    always @(posedge clock_100Mhz or posedge reset)
    begin
        if(reset==1)
            displayed_number <=0;
        else 
            displayed_number <= displayed;
    end
    always @(posedge clock_100Mhz or posedge reset)
    begin 
        if(reset==1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end   
    assign LED_activating_counter = refresh_counter[19:18];
    //assign LED_activating_counter = refresh_counter[1:0];
    always @(*)
    begin
        case(LED_activating_counter)
        2'b00:
            begin
            Anode_Activate = 4'b1000;
            LED_BCD = displayed_number/1000;
            end
        2'b01:
            begin
            Anode_Activate = 4'b0100;
            LED_BCD = (displayed_number % 1000)/100;
            end
        2'b10:
            begin
            Anode_Activate = 4'b0010;
            LED_BCD = ((displayed_number % 1000)%100)/10;
            end
        2'b11:
            begin
            Anode_Activate = 4'b0001;
            LED_BCD = ((displayed_number % 1000)%100)%10;
            end
        endcase
    end
    
    always @(*) // segment number control
    begin
        case(LED_BCD)
        4'b0000: LED_out = 7'b0111111; //0
        4'b0001: LED_out = 7'b0000110; //1
        4'b0010: LED_out = 7'b1011011; //2
        4'b0011: LED_out = 7'b1001111; //3
        4'b0100: LED_out = 7'b1100110; //4
        4'b0101: LED_out = 7'b1101101; //5
        4'b0110: LED_out = 7'b1111101; //6
        4'b0111: LED_out = 7'b0100111; //7
        4'b1000: LED_out = 7'b1111111; //8
        4'b1001: LED_out = 7'b1101111; //9
        default: LED_out = 7'b0111111; //0
        endcase
    end
endmodule