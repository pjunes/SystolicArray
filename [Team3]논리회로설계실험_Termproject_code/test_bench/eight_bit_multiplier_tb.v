`timescale 1ns / 1ps

module eight_bit_multiplier_tb;
    reg [7:0] a, b;
    wire [7:0] out;
    reg valid;
    integer i, j, k;
    
    eight_bit_multiplier eight_bit_multiplier_tb(.a(a), .b(b), .out(out));
    
    initial
    begin
        a = 8'd0;
        b = 8'd0;
    end
    
    initial
    begin
        for (i=0; i<256; i=i+1)
            for (j=0; j<256; j=j+1)
                begin
                    a = i; b = j; k = i * j; #1;
                    if(k%256 == out) 
                    begin
                        valid = 1'b1;
                    end
                    else 
                    begin
                        valid = 1'b0;
                    end
                        
                    #20;
                end
    end

endmodule
