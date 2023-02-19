`timescale 1ns / 1ps

module PE_tb;
    reg clk, reset;
    reg [7:0] calc_in, subject_in, weight_in;
    
    wire [7:0] subject_out, result;
    
    reg valid;
    integer i, j, k, l;

//    PE PE_tb(clk, reset, weight_in, subject_in, calc_in, subject_out, result);
    PE PE_tb(.clk(clk), .reset(reset), .weight_in(weight_in), .subject_in(subject_in), .calc_in(calc_in), .subject_out(subject_out), .pe_out(result));

    initial
    begin
        clk = 1'b1;
        reset = 1'b1;
        calc_in = 8'd0;
        subject_in = 8'd0;
        weight_in = 8'd0;
    end

    initial
    begin
        forever
        begin
            #10 clk = !clk;
        end
    end
    
    initial
    begin
        forever
        begin
            #5
            if(l % 256 == result) 
                        begin
                            valid = 1'b1;
                        end
                        else 
                        begin
                            valid = 1'b0;
                        end
        end
    end
    
    initial
    begin
        #200;
        reset = 1'b0;
        for (i=0; i<256; i=i+1)
            for (j=0; j<256; j=j+1)
                for (k=0; k<256; k=k+1)
                    begin
                        weight_in = i; subject_in = j; calc_in = k; l = k + i * j; #20;
                    end
    end
endmodule
