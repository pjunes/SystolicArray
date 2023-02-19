`timescale 1ns / 1ps

module PE_single_mode_controller(clk, reset, en_single,
a_1_1, a_1_2, a_1_3, a_1_4,  
a_2_1, a_2_2, a_2_3, a_2_4, 
a_3_1, a_3_2, a_3_3, a_3_4, 
a_4_1, a_4_2, a_4_3, a_4_4, 
b_1_1, b_1_2, b_1_3, 
b_2_1, b_2_2, b_2_3, 
b_3_1, b_3_2, b_3_3, 
a_in, b_in,
en_result,pe_done, clear);

    input clk, reset, en_single;
    input [7:0] a_1_1, a_1_2, a_1_3, a_1_4;
	input [7:0] a_2_1, a_2_2, a_2_3, a_2_4;
	input [7:0] a_3_1, a_3_2, a_3_3, a_3_4;
	input [7:0] a_4_1, a_4_2, a_4_3, a_4_4;
	
	input [7:0] b_1_1, b_1_2, b_1_3;
	input [7:0] b_2_1, b_2_2, b_2_3;
	input [7:0] b_3_1, b_3_2, b_3_3;
	
	
	output reg en_result;
	output reg clear;
	
	output reg pe_done;
	output reg [7:0]a_in, b_in;
		
    reg [6:0]state, next_state;
    
    parameter wait_state = 0, init = 1, c11_1 = 2, c11_2 = 3, c11_3 = 4, c11_4 = 5, c11_5 = 6, c11_6 = 7, c11_7 = 8, c11_8 = 9, c11_9 = 10, c11_done = 12,
    c11_result = 13,c11_end = 14, c11_reset = 15, 
    c12_1 = 16, c12_2 = 17, c12_3 = 18, c12_4 = 19, c12_5 = 20, c12_6 = 21, c12_7 = 22, c12_8 = 23, c12_9 = 24, c12_done = 25, c12_result = 26, c12_end = 27, c12_reset = 28,
    c21_1 = 29, c21_2 = 30, c21_3 = 31, c21_4 = 32, c21_5 = 33, c21_6 = 34, c21_7 = 35, c21_8 = 36, c21_9 = 37, c21_done = 38, c21_result = 39, c21_end = 40, c21_reset = 41,
    c22_1 = 42, c22_2 = 43, c22_3 = 44, c22_4 = 45, c22_5 = 46, c22_6 = 47, c22_7 = 48, c22_8 = 49, c22_9 = 50, c22_done = 51, c22_result = 52, c22_end = 53, c22_reset = 54, 
    end_phase = 55;

    //Update the current state
   always @ (posedge clk) 
   begin
      if (reset)
      begin
         state <= wait_state;
        end
      else
      begin
         state <= next_state;
        end
   end

    //Determine the next state
   
   always @ (*) 
   begin
      if (reset) // action
        begin
            next_state <= wait_state;
        end
        else if (en_single)
        begin
            next_state <= init;
        end
        else
        begin
            case (state)
                init:
                begin
                    next_state <= c11_1;
                end
                c11_1:
                begin
                    next_state <= c11_2;
                end
                c11_2:
                begin
                    next_state <= c11_3;
                end   
                c11_3:
                begin
                    next_state <= c11_4;
                end
                c11_4:
                begin
                    next_state <= c11_5;
                end
                c11_5:
                begin
                    next_state <= c11_6;
                end
                c11_6:
                begin
                    next_state <= c11_7;
                end
                c11_7:
                begin
                    next_state <= c11_8;
                end
                c11_8:
                begin
                    next_state <= c11_9;
                end
                c11_9:
                begin
                    next_state <= c11_done;
                end
                c11_done:
                begin
                    next_state <= c11_result;
                end
                c11_result:
                begin
                    next_state <= c11_end;
                end
                c11_end:
                begin
                    next_state <= c11_reset;
                end
                c11_reset:
                begin
                    next_state <= c12_1;
                end
                c12_1:
                begin
                    next_state <= c12_2;
                end  
                c12_2:
                begin
                    next_state <= c12_3;
                end   
                c12_3:
                begin
                    next_state <= c12_4;
                end
                c12_4:
                begin
                    next_state <= c12_5;
                end
                c12_5:
                begin
                    next_state <= c12_6;
                end
                c12_6:
                begin
                    next_state <= c12_7;
                end
                c12_7:
                begin
                    next_state <= c12_8;
                end
                c12_8:
                begin
                    next_state <= c12_9;
                end
                c12_9:
                begin
                    next_state <= c12_done;
                end
                c12_done:
                begin
                    next_state <= c12_result;
                end
                c12_result:
                begin
                    next_state <= c12_end;
                end
                c12_end:
                begin
                    next_state <= c12_reset;
                end
                c12_reset:
                begin
                    next_state <= c21_1;
                end
                c21_1:
                begin
                    next_state <= c21_2;
                end
                c21_2:
                begin
                    next_state <= c21_3;
                end   
                c21_3:
                begin
                    next_state <= c21_4;
                end
                c21_4:
                begin
                    next_state <= c21_5;
                end
                c21_5:
                begin
                    next_state <= c21_6;
                end
                c21_6:
                begin
                    next_state <= c21_7;
                end
                c21_7:
                begin
                    next_state <= c21_8;
                end
                c21_8:
                begin
                    next_state <= c21_9;
                end
                c21_9:
                begin
                    next_state <= c21_done;
                end
                c21_done:
                begin
                    next_state <= c21_result;
                end
                c21_result:
                begin
                    next_state <= c21_end;
                end
                c21_end:
                begin
                    next_state <= c21_reset;
                end
                c21_reset:
                begin
                    next_state <= c22_1;
                end
                c22_1:
                begin
                    next_state <= c22_2;
                end
                c22_2:
                begin
                    next_state <= c22_3;
                end   
                c22_3:
                begin
                    next_state <= c22_4;
                end
                c22_4:
                begin
                    next_state <= c22_5;
                end
                c22_5:
                begin
                    next_state <= c22_6;
                end
                c22_6:
                begin
                    next_state <= c22_7;
                end
                c22_7:
                begin
                    next_state <= c22_8;
                end
                c22_8:
                begin
                    next_state <= c22_9;
                end
                c22_9:
                begin
                    next_state <= c22_done;
                end
                c22_done:
                begin
                    next_state <= c22_result;
                end
                c22_result:
                begin
                    next_state <= c22_end;
                end
                c22_end:
                begin
                    next_state <= c22_reset;
                end
                c22_reset:
                begin
                    next_state <= end_phase;
                end
                 
                
                endcase
        end
   end
     
     always @ (state) 
    begin
      case (state)
         wait_state: // wait
         begin
            a_in <= 8'b0;
            b_in <= 8'b0;
         end
            
         init:
         begin
            a_in <= 8'b0;
            b_in <= 8'b0;
         end
            
         c11_1:
         begin
            a_in <= a_1_1;
            b_in <= b_1_1;
         end
         c11_2:
         begin
            a_in <= a_1_2;
            b_in <= b_2_1;
         end
         c11_3:
         begin
            a_in <= a_1_3;
            b_in <= b_3_1;
         end
         c11_4:
         begin
            a_in <= a_2_1;
            b_in <= b_1_2;
         end
         c11_5:
         begin
            a_in <= a_2_2;
            b_in <= b_2_2;
         end
         c11_6:
         begin
            a_in <= a_2_3;
            b_in <= b_3_2;
         end
         c11_7:
         begin
            a_in <= a_3_1;
            b_in <= b_1_3;
         end
         c11_8:
         begin
            a_in <= a_3_2;
            b_in <= b_2_3;
         end
        c11_9:
         begin
            a_in <= a_3_3;
            b_in <= b_3_3;
         end
//         c11_end:
//         begin
//            a_in <= 8'd0;
//            b_in <= 8'd0;
//         end
         c12_1:
         begin
            a_in <= a_1_2;
            b_in <= b_1_1;
         end
         c12_2:
         begin
            a_in <= a_1_3;
            b_in <= b_2_1;
         end
         c12_3:
         begin
            a_in <= a_1_4;
            b_in <= b_3_1;
         end
         c12_4:
         begin
            a_in <= a_2_2;
            b_in <= b_1_2;
         end
         c12_5:
         begin
            a_in <= a_2_3;
            b_in <= b_2_2;
         end
         c12_6:
         begin
            a_in <= a_2_4;
            b_in <= b_3_2;
         end
         c12_7:
         begin
            a_in <= a_3_2;
            b_in <= b_1_3;
         end
         c12_8:
         begin
            a_in <= a_3_3;
            b_in <= b_2_3;
         end
         c12_9:
         begin
            a_in <= a_3_4;
            b_in <= b_3_3;
         end
         c21_1:
         begin
            a_in <= a_2_1;
            b_in <= b_1_1;
         end
         c21_2:
         begin
            a_in <= a_2_2;
            b_in <= b_2_1;
         end
         c21_3:
         begin
            a_in <= a_2_3;
            b_in <= b_3_1;
         end
         c21_4:
         begin
            a_in <= a_3_1;
            b_in <= b_1_2;
         end
         c21_5:
         begin
            a_in <= a_3_2;
            b_in <= b_2_2;
         end
         c21_6:
         begin
            a_in <= a_3_3;
            b_in <= b_3_2;
         end
         c21_7:
         begin
            a_in <= a_4_1;
            b_in <= b_1_3;
         end
         c21_8:
         begin
            a_in <= a_4_2;
            b_in <= b_2_3;
         end
         c21_9:
         begin
            a_in <= a_4_3;
            b_in <= b_3_3;
         end 
         c22_1:
         begin
            a_in <= a_2_2;
            b_in <= b_1_1;
         end
         c22_2:
         begin
            a_in <= a_2_3;
            b_in <= b_2_1;
         end
         c22_3:
         begin
            a_in <= a_2_4;
            b_in <= b_3_1;
         end
         c22_4:
         begin
            a_in <= a_3_2;
            b_in <= b_1_2;
         end
         c22_5:
         begin
            a_in <= a_3_3;
            b_in <= b_2_2;
         end
         c22_6:
         begin
            a_in <= a_3_4;
            b_in <= b_3_2;
         end
         c22_7:
         begin
            a_in <= a_4_2;
            b_in <= b_1_3;
         end
         c22_8:
         begin
            a_in <= a_4_3;
            b_in <= b_2_3;
         end
         c22_9:
         begin
            a_in <= a_4_4;
            b_in <= b_3_3;
         end      
         default:
         begin
            a_in <= 8'd0;
            b_in <= 8'd0;
         end   
      endcase
    end
  
    
   always @ (state) 
    begin
      case (state)
         wait_state: // wait
         begin
                en_result <= 1'b0;
                clear <= 1'b1;  
                pe_done <= 1'b0;
         end
         
         init:
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;  
         end
         
         c11_1: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c11_2: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c11_3: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c11_4: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c11_5: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c11_6: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c11_7: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c11_8: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c11_9: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c11_done: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c11_result:
         begin
                en_result <=1'b1;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c11_end:
         begin
                en_result <=1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c11_reset:
         begin
                en_result <=1'b0;
                clear <= 1'b1;
                pe_done <= 1'b0;
         end
         c12_1: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c12_2: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c12_3: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c12_4: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c12_5: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c12_6: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c12_7: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c12_8: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c12_9: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c12_done: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c12_result:
         begin
                en_result <=1'b1;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c12_end:
         begin
                en_result <=1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c12_reset:
         begin
                en_result <=1'b0;
                clear <= 1'b1;
                pe_done <= 1'b0;
         end
         c21_1: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c21_2: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c21_3: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c21_4: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c21_5: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c21_6: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c21_7: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c21_8: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c21_9: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c21_done: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c21_result:
         begin
                en_result <=1'b1;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c21_end:
         begin
                en_result <=1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c21_reset:
         begin
                en_result <=1'b0;
                clear <= 1'b1;
                pe_done <= 1'b0;
         end
         c22_1: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c22_2: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c22_3: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c22_4: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c22_5: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
         end
         c22_6: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
         end
         c22_7: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c22_8: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c22_9: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c22_done: 
         begin
                en_result <= 1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c22_result:
         begin
                en_result <=1'b1;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c22_end:
         begin
                en_result <=1'b0;
                clear <= 1'b0;
                pe_done <= 1'b0;
         end
         c22_reset:
         begin
                en_result <=1'b0;
                clear <= 1'b1;
                pe_done <= 1'b1;
         end
       endcase      
      end      
       
endmodule
