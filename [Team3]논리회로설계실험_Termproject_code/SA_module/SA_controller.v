`timescale 1ns / 1ps

// waiting in wait_state
// when receive an en_sa signal, initialize
// when receive a reset signal, return to wait_state

module SA_controller(clk, reset, en_sa, 
a_1_1, a_1_2, a_1_3, a_1_4, 
a_2_1, a_2_2, a_2_3, a_2_4, 
a_3_1, a_3_2, a_3_3, a_3_4, 
a_4_1, a_4_2, a_4_3, a_4_4, 
b_1_1, b_1_2, b_1_3, 
b_2_1, b_2_2, b_2_3, 
b_3_1, b_3_2, b_3_3, 
//result,
clear,
weight_in_1_1, weight_in_1_2, weight_in_1_3, 
weight_in_2_1, weight_in_2_2, weight_in_2_3, 
weight_in_3_1, weight_in_3_2, weight_in_3_3, 
subject_in_1, subject_in_2, subject_in_3, 
sa_en_result, sa_done
);
//c_1_1, c_1_2, c_2_1, c_2_2,

    input clk;
    input reset;
    input en_sa;
    
    input [7:0] a_1_1, a_1_2, a_1_3, a_1_4;
	input [7:0] a_2_1, a_2_2, a_2_3, a_2_4;
	input [7:0] a_3_1, a_3_2, a_3_3, a_3_4;
	input [7:0] a_4_1, a_4_2, a_4_3, a_4_4;
	
	input [7:0] b_1_1, b_1_2, b_1_3;
	input [7:0] b_2_1, b_2_2, b_2_3;
	input [7:0] b_3_1, b_3_2, b_3_3;
	
//	input [7:0] result;
    
    output reg clear;
    
    output reg [7:0] weight_in_1_1, weight_in_1_2, weight_in_1_3;
    output reg [7:0] weight_in_2_1, weight_in_2_2, weight_in_2_3;
    output reg [7:0] weight_in_3_1, weight_in_3_2, weight_in_3_3;
    
    output reg [7:0] subject_in_1;
    output reg [7:0] subject_in_2;
    output reg [7:0] subject_in_3;
    
//    output reg [7:0] c_1_1, c_1_2, c_2_1, c_2_2;
    output reg sa_en_result, sa_done;
    
	reg [5:0] state, next_state;
    
    parameter 
    wait_state = 0, 
    init = 26, 
    
    delay_1 = 1, delay_2 = 2 , 
//    delay_3 = 3, delay_4 = 4, delay_5 = 5, 
//    delay_6 = 6, delay_7 = 7 , delay_8 = 8, delay_9 = 9, delay_10 = 10, 
    
    calc_1 = 16, calc_2 = 17, calc_3 = 18, calc_4 = 19, calc_5  = 20,        // error if start from 3
    calc_6 = 21, calc_7 = 22, calc_8 = 23, calc_9 = 24, calc_10 = 25,
    
    end_phase_1 = 28, end_phase_2 = 29, end_phase_3 = 30, end_phase_4 = 31;
    
    // decide output control
    always @ (state) 
    begin
		case (state)
            wait_state: // wait
            begin
                sa_en_result <= 1'b0;
                clear <= 1'b1;
                sa_done <= 1'b0;
            end
            
            delay_1:
            begin
                sa_en_result <= 1'b0;
                clear <= 1'b0;
                sa_done <= 1'b0;
            end
            
            delay_2:
            begin
                sa_en_result <= 1'b0;
                clear <= 1'b0;
                sa_done <= 1'b0;
            end
            
			init:	// init
			begin
                sa_en_result <= 1'b0;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end
			
			calc_1: // start calc
			begin
                sa_en_result <= 1'b0;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end 
			
			calc_2:
			begin
                sa_en_result <= 1'b0;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end 
			
			calc_3:
			begin
                sa_en_result <= 1'b0;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end 
			
			calc_4:	// c 2
			begin
                sa_en_result <= 1'b0;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end 
			
			calc_5:	// c 3
			begin
                sa_en_result <= 1'b0;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end 
			
			calc_6: // c 4
			begin
                sa_en_result <= 1'b0;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end 
			
			calc_7:	// c 5
			begin
                sa_en_result <= 1'b0;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end 
			
			calc_8: // c 6
			begin
                sa_en_result <= 1'b1;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end 
			
			calc_9: // c 7
			begin
                sa_en_result <= 1'b1;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end 
			
            calc_10: // c 8
			begin
                sa_en_result <= 1'b0;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end 
			
			end_phase_1:
			begin
                sa_en_result <= 1'b0;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end
			
			end_phase_2:
			begin
                sa_en_result <= 1'b1;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end
			
			end_phase_3:
			begin
                sa_en_result <= 1'b1;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end
			
			end_phase_4:
			begin
                sa_en_result <= 1'b0;
                clear <= 1'b0;
                sa_done <= 1'b1;
			end
			
			default:
			begin
			    sa_en_result <= 1'b0;
                clear <= 1'b0;
                sa_done <= 1'b0;
			end
	   endcase
	end
    
    // decide output value weight
    always @ (state) 
    begin
		case (state)
            wait_state: // wait
			begin
                weight_in_1_1 <= 8'd0;
                weight_in_1_2 <= 8'd0;
                weight_in_1_3 <= 8'd0;
                weight_in_2_1 <= 8'd0;
                weight_in_2_2 <= 8'd0;
                weight_in_2_3 <= 8'd0;
                weight_in_3_1 <= 8'd0;
                weight_in_3_2 <= 8'd0;
                weight_in_3_3 <= 8'd0;
			end
			
			delay_1: // wait
			begin
                weight_in_1_1 <= 8'd0;
                weight_in_1_2 <= 8'd0;
                weight_in_1_3 <= 8'd0;
                weight_in_2_1 <= 8'd0;
                weight_in_2_2 <= 8'd0;
                weight_in_2_3 <= 8'd0;
                weight_in_3_1 <= 8'd0;
                weight_in_3_2 <= 8'd0;
                weight_in_3_3 <= 8'd0;
			end
			
			delay_2: // wait
			begin
                weight_in_1_1 <= 8'd0;
                weight_in_1_2 <= 8'd0;
                weight_in_1_3 <= 8'd0;
                weight_in_2_1 <= 8'd0;
                weight_in_2_2 <= 8'd0;
                weight_in_2_3 <= 8'd0;
                weight_in_3_1 <= 8'd0;
                weight_in_3_2 <= 8'd0;
                weight_in_3_3 <= 8'd0;
			end
			
			init:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
			
			calc_1:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
			calc_2:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
			calc_3:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
			calc_4:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
			calc_5:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
			calc_6:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
            calc_7:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
            calc_8:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
            calc_9:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
            calc_10:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
    
            end_phase_1:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
            end_phase_2:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
            end_phase_3:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
            end_phase_4:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
		
			default:
			begin
                weight_in_1_1 <= b_1_1;
                weight_in_1_2 <= b_1_2;
                weight_in_1_3 <= b_1_3;
                weight_in_2_1 <= b_2_1;
                weight_in_2_2 <= b_2_2;
                weight_in_2_3 <= b_2_3;
                weight_in_3_1 <= b_3_1;
                weight_in_3_2 <= b_3_2;
                weight_in_3_3 <= b_3_3;
			end
	   endcase
	end
	
	// decide output subject
	always @ (state) 
    begin
		case (state)
            wait_state: // wait
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
			end
			
			delay_1: // wait
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
			end
			
			delay_2: // wait
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
			end
		
            init: // init
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
			end
			
			calc_1:
			begin
                subject_in_1 <= a_4_1;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
			end
			calc_2:
			begin
                subject_in_1 <= a_3_1;
                subject_in_2 <= a_4_2;
                subject_in_3 <= 8'd0;
			end
			calc_3:
			begin
                subject_in_1 <= a_2_1;
                subject_in_2 <= a_3_2;
                subject_in_3 <= a_4_3;
			end 
			calc_4:	// c 2
			begin                
                subject_in_1 <= a_1_1;
                subject_in_2 <= a_2_2;
                subject_in_3 <= a_3_3;
			end 
			calc_5:	// c 3
			begin
                subject_in_1 <= a_4_2;
                subject_in_2 <= a_1_2;
                subject_in_3 <= a_2_3;
			end 
			calc_6: // c 4
			begin
                subject_in_1 <= a_3_2;
                subject_in_2 <= a_4_3;
                subject_in_3 <= a_1_3;
			end 
			calc_7:	// c 5
			begin
                subject_in_1 <= a_2_2;
                subject_in_2 <= a_3_3;
                subject_in_3 <= a_4_4;
			end  
			calc_8:	// c 6
			begin
                subject_in_1 <= a_1_2;
                subject_in_2 <= a_2_3;
                subject_in_3 <= a_3_4;
			end
			calc_9: // c 7
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= a_1_3;
                subject_in_3 <= a_2_4;
			end
			calc_10: // c 8
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= a_1_4;
			end
			
			end_phase_1:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
			end
			
			end_phase_2:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
			end
			
			end_phase_3:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
			end
			
			end_phase_4:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
			end
			
			default:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
			end
	   endcase
	end
    
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
	    case(state)
            default:
            begin
                next_state <= wait_state;
            end
                     
            wait_state: // wait state
            begin
                if (en_sa)
                    next_state <= delay_1;
                else
                    next_state <= wait_state;
            end
            
            delay_1: 
            begin
                next_state <= delay_2;
            end
            
            delay_2: 
            begin
                next_state <= init;
            end

            init: 
            begin
                next_state <= calc_1;
            end
            calc_1:
            begin
                next_state <= calc_2;
            end
            calc_2:
            begin
                next_state <= calc_3;
            end
            calc_3:
            begin
                next_state <= calc_4;
            end
            calc_4:
            begin
                next_state <= calc_5;
            end
            calc_5:
            begin
                next_state <= calc_6;
            end
            calc_6:
            begin
                next_state <= calc_7;
            end
            calc_7:
            begin
                next_state <= calc_8;
            end
            calc_8:
            begin
                next_state <= calc_9;
            end
            calc_9:
            begin
                next_state <= calc_10;
            end
            calc_10:
            begin
                next_state <= end_phase_1;
            end
            end_phase_1:
            begin
                next_state <= end_phase_2;
            end
            end_phase_2:
            begin
                next_state <= end_phase_3;
            end
            end_phase_3:
            begin
                next_state <= end_phase_4;
            end
            end_phase_4:
            begin
                next_state <= end_phase_4;
            end
        endcase
	end
endmodule