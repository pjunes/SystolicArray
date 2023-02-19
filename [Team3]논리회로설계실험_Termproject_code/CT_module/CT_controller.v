`timescale 1ns / 1ps

// waiting in wait_state
// when receive an en_sa signal, initialize
// when receive a reset signal, return to wait_state

module CT_controller(clk, reset, en_ct, 
a_1_1, a_1_2, a_1_3, a_1_4, 
a_2_1, a_2_2, a_2_3, a_2_4, 
a_3_1, a_3_2, a_3_3, a_3_4, 
a_4_1, a_4_2, a_4_3, a_4_4, 
b_1_1, b_1_2, b_1_3, 
b_2_1, b_2_2, b_2_3, 
b_3_1, b_3_2, b_3_3, 
c_1_1, c_1_2, c_2_1, c_2_2,
clear, weight_out, 
subject_in_1, subject_in_2, subject_in_3, subject_in_4, 
ct_en_result, ct_result, ct_done
);

    input clk;
    input reset;
    input en_ct;
    
    input [7:0] a_1_1, a_1_2, a_1_3, a_1_4;
	input [7:0] a_2_1, a_2_2, a_2_3, a_2_4;
	input [7:0] a_3_1, a_3_2, a_3_3, a_3_4;
	input [7:0] a_4_1, a_4_2, a_4_3, a_4_4;
	
	input [7:0] b_1_1, b_1_2, b_1_3;
	input [7:0] b_2_1, b_2_2, b_2_3;
	input [7:0] b_3_1, b_3_2, b_3_3;
	
	input [7:0] c_1_1, c_1_2, c_2_1, c_2_2;
    
    output reg clear;
    output reg [7:0] weight_out;
    
    output reg [7:0] subject_in_1;
    output reg [7:0] subject_in_2;
    output reg [7:0] subject_in_3;
    output reg [7:0] subject_in_4;
    
    output reg ct_en_result;
    output reg [7:0] ct_result;
    output reg ct_done;
    
	reg [5:0] state, next_state;
    
    parameter wait_state = 0, 
    init = 1,
    calc_1 = 16, calc_2 = 17, calc_3 = 18, calc_4 = 19, calc_5 = 20, calc_6 = 21,
    calc_7 = 22, calc_8 = 23, calc_9 = 24, delay_6 = 25, delay_7 = 26,
    end_phase_1 = 27, end_phase_2 = 28, end_phase_3 = 29, end_phase_4 = 30, end_phase_9 = 2, 
//    end_phase_5 = , end_phase_6 = 16, end_phase_7 = 17, end_phase_8 = 18, end_phase_9 = 19, 
    delay_1 = 3, delay_2 = 4, delay_3 = 5, delay_4 = 6, delay_5 = 7;
    
    // decide output control
    always @ (state) 
    begin
		case (state)
            wait_state: begin ct_en_result <= 1'b0; clear <= 1'b1; ct_done = 1'b0; ct_result <= 8'd0; end
			init: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			delay_1: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			delay_2: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			delay_3: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			delay_4: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			delay_5: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			calc_1: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			calc_2: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			calc_3: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			calc_4: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			calc_5: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			calc_6: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			calc_7: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			calc_8: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			calc_9: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			delay_6:  begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			delay_7:  begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
			end_phase_1: begin ct_en_result <= 1'b1; clear <= 1'b0; ct_done = 1'b0;  ct_result <= c_1_1; end
			end_phase_2: begin ct_en_result <= 1'b1; clear <= 1'b0; ct_done = 1'b0;  ct_result <= c_1_2; end
			end_phase_3: begin ct_en_result <= 1'b1; clear <= 1'b0; ct_done = 1'b0;  ct_result <= c_2_1; end
			end_phase_4: begin ct_en_result <= 1'b1; clear <= 1'b0; ct_done = 1'b0;  ct_result <= c_2_2; end
//			end_phase_5: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
//			end_phase_6: begin ct_en_result <= 1'b1; clear <= 1'b0; ct_done = 1'b0;  ct_result <= c_2_1; end
//			end_phase_7: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0;  ct_result <= 8'd0; end
//			end_phase_8: begin ct_en_result <= 1'b1; clear <= 1'b0; ct_done = 1'b0;  ct_result <= c_2_2; end
			end_phase_9: begin ct_en_result <= 1'b0; clear <= 1'b1; ct_done = 1'b1;  ct_result <= 8'd0; end
			default: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
	   endcase
	end
	
//	// decide output control 2
//    always @ (state) 
//    begin
//		case (state)
//            wait_state: begin ct_en_result <= 1'b0; clear <= 1'b1; ct_done = 1'b0; end
//			init: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			calc_1: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			calc_2: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			calc_3: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			calc_4: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			calc_5: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			calc_6: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			calc_7: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			calc_8: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			calc_9: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			delay:  begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			end_phase_1: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			end_phase_2: begin ct_en_result <= 1'b1; clear <= 1'b0; ct_done = 1'b0; end
//			end_phase_3: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			end_phase_4: begin ct_en_result <= 1'b1; clear <= 1'b0; ct_done = 1'b0; end
//			end_phase_5: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			end_phase_6: begin ct_en_result <= 1'b1; clear <= 1'b0; ct_done = 1'b0; end
//			end_phase_7: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//			end_phase_8: begin ct_en_result <= 1'b1; clear <= 1'b0; ct_done = 1'b0; end
//			end_phase_9: begin ct_en_result <= 1'b0; clear <= 1'b1; ct_done = 1'b1; end
//			default: begin ct_en_result <= 1'b0; clear <= 1'b0; ct_done = 1'b0; end
//	   endcase
//	end
	
    //value setting
	always @ (state) 
    begin
		case (state)
		    wait_state :
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
			end
            init: // init
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
			end
			
			delay_1:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
			end
			delay_2:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
			end
			delay_3:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
			end
			delay_4:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
			end
			delay_5:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
			end
			calc_1:
			begin
                subject_in_1 <= a_1_1;
                subject_in_2 <= a_1_2;
                subject_in_3 <= a_2_1;
                subject_in_4 <= a_2_2;
                weight_out <= b_1_1;
			end
			calc_2:
			begin
                subject_in_1 <= a_1_2;
                subject_in_2 <= a_1_3;
                subject_in_3 <= a_2_2;
                subject_in_4 <= a_2_3;
                weight_out <= b_2_1;
			end
			calc_3: 
			begin
                subject_in_1 <= a_1_3;
                subject_in_2 <= a_1_4;
                subject_in_3 <= a_2_3;
                subject_in_4 <= a_2_4;
                weight_out <= b_3_1;
			end 
			calc_4:
			begin
                subject_in_1 <= a_2_1;
                subject_in_2 <= a_2_2;
                subject_in_3 <= a_3_1;
                subject_in_4 <= a_3_2;
                weight_out <= b_1_2;
			end
			calc_5:
			begin
                subject_in_1 <= a_2_2;
                subject_in_2 <= a_2_3;
                subject_in_3 <= a_3_2;
                subject_in_4 <= a_3_3;
                weight_out <= b_2_2;
			end 
			calc_6:
			begin
                subject_in_1 <= a_2_3;
                subject_in_2 <= a_2_4;
                subject_in_3 <= a_3_3;
                subject_in_4 <= a_3_4;
                weight_out <= b_3_2;
			end 
			calc_7:
			begin
                subject_in_1 <= a_3_1;
                subject_in_2 <= a_3_2;
                subject_in_3 <= a_4_1;
                subject_in_4 <= a_4_2;
                weight_out <= b_1_3;
			end
			calc_8:
			begin
                subject_in_1 <= a_3_2;
                subject_in_2 <= a_3_3;
                subject_in_3 <= a_4_2;
                subject_in_4 <= a_4_3;
                weight_out <= b_2_3;
			end		
			calc_9:
			begin
                subject_in_1 <= a_3_3;
                subject_in_2 <= a_3_4;
                subject_in_3 <= a_4_3;
                subject_in_4 <= a_4_4;
                weight_out <= b_3_3;
			end	
			delay_6:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
			end
			delay_7:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
			end
			end_phase_1:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
			end
			end_phase_2:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
			end
			end_phase_3:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
			end
			end_phase_4:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
			end
//			end_phase_5:
//			begin
//                subject_in_1 <= 8'd0;
//                subject_in_2 <= 8'd0;
//                subject_in_3 <= 8'd0;
//                subject_in_4 <= 8'd0;
//                weight_out <= 8'd0;
//			end
//			end_phase_6:
//			begin
//                subject_in_1 <= 8'd0;
//                subject_in_2 <= 8'd0;
//                subject_in_3 <= 8'd0;
//                subject_in_4 <= 8'd0;
//                weight_out <= 8'd0;
//			end
//			end_phase_7:
//			begin
//                subject_in_1 <= 8'd0;
//                subject_in_2 <= 8'd0;
//                subject_in_3 <= 8'd0;
//                subject_in_4 <= 8'd0;
//                weight_out <= 8'd0;
//			end
//			end_phase_8:
//			begin
//                subject_in_1 <= 8'd0;
//                subject_in_2 <= 8'd0;
//                subject_in_3 <= 8'd0;
//                subject_in_4 <= 8'd0;
//                weight_out <= 8'd0;
//			end
			end_phase_9:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
			end
			default:
			begin
                subject_in_1 <= 8'd0;
                subject_in_2 <= 8'd0;
                subject_in_3 <= 8'd0;
                subject_in_4 <= 8'd0;
                weight_out <= 8'd0;
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
		if (reset) // action
        begin
            next_state <= wait_state;
        end
        else if (en_ct)
        begin
            next_state <= init;
        end
        else
        begin
            case (state)
                init: begin next_state <= delay_1; end
                delay_1: begin next_state <= delay_2; end
                delay_2: begin next_state <= delay_3; end
                delay_3: begin next_state <= delay_4; end
                delay_4: begin next_state <= delay_5; end
                delay_5: begin next_state <= calc_1; end
                calc_1: begin next_state <= calc_2; end
                calc_2: begin next_state <= calc_3; end
                calc_3: begin next_state <= calc_4; end
                calc_4: begin next_state <= calc_5; end
                calc_5: begin next_state <= calc_6; end
                calc_6: begin next_state <= calc_7; end
                calc_7: begin next_state <= calc_8; end
                calc_8: begin next_state <= calc_9; end
                calc_9: begin next_state <= delay_6; end
                delay_6: begin next_state <= delay_7; end
                delay_7: begin next_state <= end_phase_1; end
                end_phase_1: begin next_state <= end_phase_2; end
                end_phase_2: begin next_state <= end_phase_3; end
                end_phase_3: begin next_state <= end_phase_4; end
                end_phase_4: begin next_state <= end_phase_9; end
//                end_phase_5: begin next_state <= end_phase_6; end
//                end_phase_6: begin next_state <= end_phase_7; end
//                end_phase_7: begin next_state <= end_phase_8; end
//                end_phase_8: begin next_state <= end_phase_9; end
                end_phase_9: begin next_state <= end_phase_9; end
            endcase
        end
	end
endmodule