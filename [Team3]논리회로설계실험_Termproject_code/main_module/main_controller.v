`timescale 1ns / 1ps

module main_controller(
// input
clk, switch, reset, 
q, 
pe_en_result, sa_en_result, ct_en_result,
pe_result, sa_result, ct_result, 
pe_done, sa_done, ct_done, 
// output
data, addr, we,
en_pe, en_sa, en_ct,
a_1_1_out, a_1_2_out, a_1_3_out, a_1_4_out, 
a_2_1_out, a_2_2_out, a_2_3_out, a_2_4_out, 
a_3_1_out, a_3_2_out, a_3_3_out, a_3_4_out, 
a_4_1_out, a_4_2_out, a_4_3_out, a_4_4_out, 
b_1_1_out, b_1_2_out, b_1_3_out, 
b_2_1_out, b_2_2_out, b_2_3_out, 
b_3_1_out, b_3_2_out, b_3_3_out,
pe11, pe12, pe21, pe22,
sa11, sa12, sa21, sa22,
ct11, ct12, ct21, ct22,
all_done 
);
    input clk, switch, reset;
    input [7:0] q;
     
    input pe_en_result, sa_en_result, ct_en_result;
    input [7:0] pe_result, sa_result, ct_result; 
    input pe_done, sa_done, ct_done; 
    // output
    output reg [7:0] data;
    output reg [5:0] addr;
    output reg we; 
    
    output reg en_pe, en_sa, en_ct;
    output reg [7:0]
    a_1_1_out, a_1_2_out, a_1_3_out, a_1_4_out, 
    a_2_1_out, a_2_2_out, a_2_3_out, a_2_4_out, 
    a_3_1_out, a_3_2_out, a_3_3_out, a_3_4_out, 
    a_4_1_out, a_4_2_out, a_4_3_out, a_4_4_out, 
    b_1_1_out, b_1_2_out, b_1_3_out, 
    b_2_1_out, b_2_2_out, b_2_3_out, 
    b_3_1_out, b_3_2_out, b_3_3_out;
    
    output reg [7:0] 
    pe11, pe12, pe21, pe22,
    sa11, sa12, sa21, sa22,
    ct11, ct12, ct21, ct22;
    
//    output reg [7:0] dummy;
    output reg all_done;
    
    reg [7:0] state, next_state; // 0 ~ 256
    
    parameter INITIAL = 254;
    parameter // 25 states
    a_1_1_write =  1, a_1_2_write =  2, a_1_3_write =  3, a_1_4_write =  4, 
    a_2_1_write =  5, a_2_2_write =  6, a_2_3_write =  7, a_2_4_write =  8, 
    a_3_1_write =  9, a_3_2_write = 10, a_3_3_write = 11, a_3_4_write = 12, 
    a_4_1_write = 13, a_4_2_write = 14, a_4_3_write = 15, a_4_4_write = 16, 
    b_1_1_write = 17, b_1_2_write = 18, b_1_3_write = 19, 
    b_2_1_write = 20, b_2_2_write = 21, b_2_3_write = 22, 
    b_3_1_write = 23, b_3_2_write = 24, b_3_3_write = 25;
     
    parameter // 50 states
    a_1_1_load_1 = 31, a_1_1_load_2 = 32, a_1_2_load_1 = 33, a_1_2_load_2 = 34, a_1_3_load_1 = 35, a_1_3_load_2 = 36, a_1_4_load_1 = 37, a_1_4_load_2 = 38,
    a_2_1_load_1 = 39, a_2_1_load_2 = 40, a_2_2_load_1 = 41, a_2_2_load_2 = 42, a_2_3_load_1 = 43, a_2_3_load_2 = 44, a_2_4_load_1 = 45, a_2_4_load_2 = 46,
    a_3_1_load_1 = 47, a_3_1_load_2 = 48, a_3_2_load_1 = 49, a_3_2_load_2 = 50, a_3_3_load_1 = 51, a_3_3_load_2 = 52, a_3_4_load_1 = 53, a_3_4_load_2 = 54,
    a_4_1_load_1 = 55, a_4_1_load_2 = 56, a_4_2_load_1 = 57, a_4_2_load_2 = 58, a_4_3_load_1 = 59, a_4_3_load_2 = 60, a_4_4_load_1 = 61, a_4_4_load_2 = 62,
    b_1_1_load_1 = 63, b_1_1_load_2 = 64, b_1_2_load_1 = 65, b_1_2_load_2 = 66, b_1_3_load_1 = 67, b_1_3_load_2 = 68,
    b_2_1_load_1 = 69, b_2_1_load_2 = 70, b_2_2_load_1 = 71, b_2_2_load_2 = 72, b_2_3_load_1 = 73, b_2_3_load_2 = 74, 
    b_3_1_load_1 = 75, b_3_1_load_2 = 76, b_3_2_load_1 = 77, b_3_2_load_2 = 78, b_3_3_load_1 = 79, b_3_3_load_2 = 80;
    
    parameter
    pe11_load = 80, pe12_load = 81, pe21_load = 82, pe22_load = 83,
    sa11_load = 84, sa12_load = 85, sa21_load = 86, sa22_load = 87,
    ct11_load = 88, ct12_load = 89, ct21_load = 90, ct22_load = 91;
    
    parameter
    pe_start = 100, pe_wait = 101, pe_c_1_1_load = 102, pe_c_1_2_load = 103, pe_c_2_1_load = 104, pe_c_2_2_load = 105, pe_end = 106; 
    
    parameter
    sa_start = 120, sa_c_2_1_load = 121, sa_c_1_1_load = 122, sa_c_2_2_load = 123, sa_c_1_2_load = 124, sa_end = 125; 
    
    parameter
    ct_start = 130, ct_wait = 131, ct_c_2_1_load = 132, ct_c_1_1_load = 133, ct_c_2_2_load = 134, ct_c_1_2_load = 135, ct_end = 136;
    
//    parameter
//    pe_c_1_1_load_1 = 140, pe_c_1_1_load_2 = 141,
//    pe_c_1_2_load_1 = 142, pe_c_1_2_load_2 = 143,
//    pe_c_2_1_load_1 = 144, pe_c_2_1_load_2 = 145,
//    pe_c_2_2_load_1 = 146, pe_c_2_2_load_2 = 147,
    
//    sa_c_1_1_load_1 = 150, sa_c_1_1_load_2 = 151,
//    sa_c_1_2_load_1 = 152, sa_c_1_2_load_2 = 153,
//    sa_c_2_1_load_1 = 154, sa_c_2_1_load_2 = 155,
//    sa_c_2_2_load_1 = 156, sa_c_2_2_load_2 = 157,
    
//    ct_c_1_1_load_1 = 160, ct_c_1_1_load_2 = 161,
//    ct_c_1_2_load_1 = 162, ct_c_1_2_load_2 = 163,
//    ct_c_2_1_load_1 = 164, ct_c_2_1_load_2 = 165,
//    ct_c_2_2_load_1 = 166, ct_c_2_2_load_2 = 167;
    
    parameter
    dp_start = 200;
    
//    parameter
//    module_end = 255;
    
    // update state
    always @ (posedge clk, posedge reset)                        
    begin
        if (reset)  
            state <= INITIAL;
        else
            state <= next_state;
    end
    
    // decide next state
    always @ (*)
    begin
        case(state)
            default: begin next_state <= INITIAL; end
                     
            INITIAL:
            begin
                if (switch)
                    next_state <= a_1_1_write;
                else
                    next_state <= INITIAL;
            end
            
            a_1_1_write: begin next_state <= a_1_2_write; end a_1_2_write: begin next_state <= a_1_3_write; end a_1_3_write: begin next_state <= a_1_4_write; end a_1_4_write: begin next_state <= a_2_1_write; end
            a_2_1_write: begin next_state <= a_2_2_write; end a_2_2_write: begin next_state <= a_2_3_write; end a_2_3_write: begin next_state <= a_2_4_write; end a_2_4_write: begin next_state <= a_3_1_write; end
            a_3_1_write: begin next_state <= a_3_2_write; end a_3_2_write: begin next_state <= a_3_3_write; end a_3_3_write: begin next_state <= a_3_4_write; end a_3_4_write: begin next_state <= a_4_1_write; end
            a_4_1_write: begin next_state <= a_4_2_write; end a_4_2_write: begin next_state <= a_4_3_write; end a_4_3_write: begin next_state <= a_4_4_write; end a_4_4_write: begin next_state <= b_1_1_write; end
            
            b_1_1_write: begin next_state <= b_1_2_write; end b_1_2_write: begin next_state <= b_1_3_write; end b_1_3_write: begin next_state <= b_2_1_write; end
            b_2_1_write: begin next_state <= b_2_2_write; end b_2_2_write: begin next_state <= b_2_3_write; end b_2_3_write: begin next_state <= b_3_1_write; end
            b_3_1_write: begin next_state <= b_3_2_write; end b_3_2_write: begin next_state <= b_3_3_write; end b_3_3_write: begin next_state <= a_1_1_load_1; end
            
            a_1_1_load_1: begin next_state <= a_1_1_load_2; end a_1_1_load_2: begin next_state <= a_1_2_load_1; end a_1_2_load_1: begin next_state <= a_1_2_load_2; end a_1_2_load_2: begin next_state <= a_1_3_load_1; end
            a_1_3_load_1: begin next_state <= a_1_3_load_2; end a_1_3_load_2: begin next_state <= a_1_4_load_1; end a_1_4_load_1: begin next_state <= a_1_4_load_2; end a_1_4_load_2: begin next_state <= a_2_1_load_1; end
            a_2_1_load_1: begin next_state <= a_2_1_load_2; end a_2_1_load_2: begin next_state <= a_2_2_load_1; end a_2_2_load_1: begin next_state <= a_2_2_load_2; end a_2_2_load_2: begin next_state <= a_2_3_load_1; end
            a_2_3_load_1: begin next_state <= a_2_3_load_2; end a_2_3_load_2: begin next_state <= a_2_4_load_1; end a_2_4_load_1: begin next_state <= a_2_4_load_2; end a_2_4_load_2: begin next_state <= a_3_1_load_1; end
            a_3_1_load_1: begin next_state <= a_3_1_load_2; end a_3_1_load_2: begin next_state <= a_3_2_load_1; end a_3_2_load_1: begin next_state <= a_3_2_load_2; end a_3_2_load_2: begin next_state <= a_3_3_load_1; end
            a_3_3_load_1: begin next_state <= a_3_3_load_2; end a_3_3_load_2: begin next_state <= a_3_4_load_1; end a_3_4_load_1: begin next_state <= a_3_4_load_2; end a_3_4_load_2: begin next_state <= a_4_1_load_1; end
            a_4_1_load_1: begin next_state <= a_4_1_load_2; end a_4_1_load_2: begin next_state <= a_4_2_load_1; end a_4_2_load_1: begin next_state <= a_4_2_load_2; end a_4_2_load_2: begin next_state <= a_4_3_load_1; end
            a_4_3_load_1: begin next_state <= a_4_3_load_2; end a_4_3_load_2: begin next_state <= a_4_4_load_1; end a_4_4_load_1: begin next_state <= a_4_4_load_2; end a_4_4_load_2: begin next_state <= b_1_1_load_1; end
            
            b_1_1_load_1: begin next_state <= b_1_1_load_2; end b_1_1_load_2: begin next_state <= b_1_2_load_1; end b_1_2_load_1: begin next_state <= b_1_2_load_2; end b_1_2_load_2: begin next_state <= b_1_3_load_1; end b_1_3_load_1: begin next_state <= b_1_3_load_2; end b_1_3_load_2: begin next_state <= b_2_1_load_1; end
            b_2_1_load_1: begin next_state <= b_2_1_load_2; end b_2_1_load_2: begin next_state <= b_2_2_load_1; end b_2_2_load_1: begin next_state <= b_2_2_load_2; end b_2_2_load_2: begin next_state <= b_2_3_load_1; end b_2_3_load_1: begin next_state <= b_2_3_load_2; end b_2_3_load_2: begin next_state <= b_3_1_load_1; end
            b_3_1_load_1: begin next_state <= b_3_1_load_2; end b_3_1_load_2: begin next_state <= b_3_2_load_1; end b_3_2_load_1: begin next_state <= b_3_2_load_2; end b_3_2_load_2: begin next_state <= b_3_3_load_1; end b_3_3_load_1: begin next_state <= b_3_3_load_2; end b_3_3_load_2: begin next_state <= pe_start; end
            
            // PE
            pe_start:
            begin
                next_state <= pe_wait;
            end
            
            pe_wait:
            begin 
                if (pe_en_result)
                    next_state <= pe_c_1_1_load;
                else
                    next_state <= pe_wait;
            end
            
            pe_c_1_1_load:
            begin 
                if (pe_en_result)
                    next_state <= pe_c_1_2_load;
                else
                    next_state <= pe_c_1_1_load;
            end
            
            pe_c_1_2_load: 
            begin 
                if (pe_en_result)
                    next_state <= pe_c_2_1_load;
                else
                    next_state <= pe_c_1_2_load;
            end
            
            pe_c_2_1_load:
            begin 
                if (pe_en_result)
                    next_state <= pe_c_2_2_load;
                else
                    next_state <= pe_c_2_1_load;
            end
            
            pe_c_2_2_load: 
            begin 
                if (pe_done)
                    next_state <= pe_end;
                else
                    next_state <= pe_c_2_2_load;
            end
            
            pe_end: 
            begin
                next_state <= sa_start;
            end
            
            // SA
            
            sa_start:      
            begin 
                if (sa_en_result)
                    next_state <= sa_c_2_1_load;
                else
                    next_state <= sa_start;
            end
            
            sa_c_2_1_load:
            begin 
                if (sa_en_result)
                    next_state <= sa_c_1_1_load;
                else
                    next_state <= sa_c_2_1_load;
            end
            
            sa_c_1_1_load: 
            begin 
                if (sa_en_result)
                    next_state <= sa_c_2_2_load;
                else
                    next_state <= sa_c_1_1_load;
            end
            
            sa_c_2_2_load:
            begin 
                if (sa_en_result)
                    next_state <= sa_c_1_2_load;
                else
                    next_state <= sa_c_2_2_load;
            end
            
            sa_c_1_2_load: 
            begin 
                if (sa_done)
                    next_state <= sa_end;
                else
                    next_state <= sa_c_1_2_load;
            end
            
            sa_end: 
            begin
                next_state <= ct_start;
            end
            
            // CT
            
            ct_start:
            begin
                next_state <= ct_wait;
            end
            
            ct_wait:
            begin 
                if (ct_en_result)
                    next_state <= ct_c_1_1_load;
                else
                    next_state <= ct_wait;
            end
            
            ct_c_1_1_load:
            begin 
                if (ct_en_result)
                    next_state <= ct_c_1_2_load;
                else
                    next_state <= ct_c_1_1_load;
            end
            
            ct_c_1_2_load: 
            begin 
                if (ct_en_result)
                    next_state <= ct_c_2_1_load;
                else
                    next_state <= ct_c_1_2_load;
            end
            
            ct_c_2_1_load:
            begin 
                if (ct_en_result)
                    next_state <= ct_c_2_2_load;
                else
                    next_state <= ct_c_2_1_load;
            end
            
            ct_c_2_2_load: 
            begin 
                if (ct_done)
                    next_state <= ct_end;
                else
                    next_state <= ct_c_2_2_load;
            end
            
            ct_end: 
            begin
                next_state <= dp_start;
            end
            
            // load C11 ~ C22
            pe11_load: begin next_state <= pe12_load; end
            pe12_load: begin next_state <= pe21_load; end
            pe21_load: begin next_state <= pe22_load; end
            pe22_load: begin next_state <= sa11_load; end
            sa11_load: begin next_state <= sa12_load; end
            sa12_load: begin next_state <= sa21_load; end
            sa21_load: begin next_state <= sa22_load; end
            sa22_load: begin next_state <= ct11_load; end
            ct11_load: begin next_state <= ct12_load; end
            ct12_load: begin next_state <= ct21_load; end
            ct21_load: begin next_state <= ct22_load; end
            ct22_load: begin next_state <= dp_start; end
            
            // DP
            
            dp_start:
            begin
                next_state <= dp_start;
            end
        endcase
    end
    
    // decide data addr we : related to memory [ data <= 8'd0; addr <= 6'b000000; we <= 1'b0; ]
    // save data to RAM
    always @ (state)
    begin
        case(state)
            default:     begin data <= 8'd000; addr <= 6'd25; we <= 1'b0; end
        
            a_1_1_write: begin data <= 8'd233; addr <= 6'd00; we <= 1'b1; end
            a_1_2_write: begin data <= 8'd123; addr <= 6'd01; we <= 1'b1; end
            a_1_3_write: begin data <= 8'd012; addr <= 6'd02; we <= 1'b1; end
            a_1_4_write: begin data <= 8'd003; addr <= 6'd03; we <= 1'b1; end
            a_2_1_write: begin data <= 8'd005; addr <= 6'd04; we <= 1'b1; end
            a_2_2_write: begin data <= 8'd002; addr <= 6'd05; we <= 1'b1; end
            a_2_3_write: begin data <= 8'd003; addr <= 6'd06; we <= 1'b1; end
            a_2_4_write: begin data <= 8'd003; addr <= 6'd07; we <= 1'b1; end
            a_3_1_write: begin data <= 8'd009; addr <= 6'd08; we <= 1'b1; end
            a_3_2_write: begin data <= 8'd255; addr <= 6'd09; we <= 1'b1; end
            a_3_3_write: begin data <= 8'd001; addr <= 6'd10; we <= 1'b1; end
            a_3_4_write: begin data <= 8'd012; addr <= 6'd11; we <= 1'b1; end
            a_4_1_write: begin data <= 8'd013; addr <= 6'd12; we <= 1'b1; end
            a_4_2_write: begin data <= 8'd064; addr <= 6'd13; we <= 1'b1; end
            a_4_3_write: begin data <= 8'd055; addr <= 6'd14; we <= 1'b1; end
            a_4_4_write: begin data <= 8'd027; addr <= 6'd15; we <= 1'b1; end
            b_1_1_write: begin data <= 8'd013; addr <= 6'd16; we <= 1'b1; end
            b_1_2_write: begin data <= 8'd002; addr <= 6'd17; we <= 1'b1; end
            b_1_3_write: begin data <= 8'd003; addr <= 6'd18; we <= 1'b1; end
            b_2_1_write: begin data <= 8'd002; addr <= 6'd19; we <= 1'b1; end
            b_2_2_write: begin data <= 8'd001; addr <= 6'd20; we <= 1'b1; end
            b_2_3_write: begin data <= 8'd050; addr <= 6'd21; we <= 1'b1; end
            b_3_1_write: begin data <= 8'd051; addr <= 6'd22; we <= 1'b1; end
            b_3_2_write: begin data <= 8'd052; addr <= 6'd23; we <= 1'b1; end
            b_3_3_write: begin data <= 8'd001; addr <= 6'd24; we <= 1'b1; end
            
            pe_start:      begin data <= 8'd000; addr <= 6'd25; we <= 1'b0; end
            pe_wait:       begin data <= 8'd000; addr <= 6'd25; we <= 1'b0; end
            pe_c_1_1_load: begin data <= pe_result; addr <= 6'd32; we <= 1'b1; end
            pe_c_1_2_load: begin data <= pe_result; addr <= 6'd33; we <= 1'b1; end
            pe_c_2_1_load: begin data <= pe_result; addr <= 6'd34; we <= 1'b1; end
            pe_c_2_2_load: begin data <= pe_result; addr <= 6'd35; we <= 1'b1; end
            pe_end:        begin data <= 8'd000; addr <= 6'd25; we <= 1'b0; end
            
            sa_start:      begin data <= 8'd000; addr <= 6'd25; we <= 1'b0; end
            sa_c_2_1_load: begin data <= sa_result; addr <= 6'd39; we <= 1'b1; end
            sa_c_1_1_load: begin data <= sa_result; addr <= 6'd37; we <= 1'b1; end
            sa_c_2_2_load: begin data <= sa_result; addr <= 6'd40; we <= 1'b1; end
            sa_c_1_2_load: begin data <= sa_result; addr <= 6'd38; we <= 1'b1; end
            sa_end:        begin data <= 8'd000; addr <= 6'd25; we <= 1'b0; end
            
            ct_start:      begin data <= 8'd000; addr <= 6'd25; we <= 1'b0; end
            ct_wait:       begin data <= 8'd000; addr <= 6'd25; we <= 1'b0; end
            ct_c_1_1_load: begin data <= ct_result; addr <= 6'd42; we <= 1'b1; end
            ct_c_1_2_load: begin data <= ct_result; addr <= 6'd43; we <= 1'b1; end
            ct_c_2_1_load: begin data <= ct_result; addr <= 6'd44; we <= 1'b1; end
            ct_c_2_2_load: begin data <= ct_result; addr <= 6'd45; we <= 1'b1; end
            ct_end:        begin data <= 8'd000; addr <= 6'd25; we <= 1'b0; end
            
            pe11_load: begin data <= 8'd000; addr <= 6'd32; we <= 1'b0; end
            pe12_load: begin data <= 8'd000; addr <= 6'd33; we <= 1'b0; end
            pe21_load: begin data <= 8'd000; addr <= 6'd34; we <= 1'b0; end
            pe22_load: begin data <= 8'd000; addr <= 6'd35; we <= 1'b0; end
            sa11_load: begin data <= 8'd000; addr <= 6'd37; we <= 1'b0; end
            sa12_load: begin data <= 8'd000; addr <= 6'd38; we <= 1'b0; end
            sa21_load: begin data <= 8'd000; addr <= 6'd39; we <= 1'b0; end
            sa22_load: begin data <= 8'd000; addr <= 6'd40; we <= 1'b0; end
            ct11_load: begin data <= 8'd000; addr <= 6'd42; we <= 1'b0; end
            ct12_load: begin data <= 8'd000; addr <= 6'd43; we <= 1'b0; end
            ct21_load: begin data <= 8'd000; addr <= 6'd44; we <= 1'b0; end
            ct22_load: begin data <= 8'd000; addr <= 6'd45; we <= 1'b0; end
            
            dp_start:      begin data <= 8'd000; addr <= 6'd25; we <= 1'b0; end
            
            
       endcase
    end

    // use q    
    // decide a out : input of caculators
    // decide b out : weight of calculators
    // read data from RAM // not implemented
    always @ (state)
    begin
        case(state)
            a_1_1_load_1: begin a_1_1_out <= 8'd233; end
            a_1_2_load_1: begin a_1_2_out <= 8'd123; end
            a_1_3_load_1: begin a_1_3_out <= 8'd012; end
            a_1_4_load_1: begin a_1_4_out <= 8'd003; end
            a_2_1_load_1: begin a_2_1_out <= 8'd005; end
            a_2_2_load_1: begin a_2_2_out <= 8'd002; end
            a_2_3_load_1: begin a_2_3_out <= 8'd003; end
            a_2_4_load_1: begin a_2_4_out <= 8'd003; end
            a_3_1_load_1: begin a_3_1_out <= 8'd009; end
            a_3_2_load_1: begin a_3_2_out <= 8'd255; end
            a_3_3_load_1: begin a_3_3_out <= 8'd001; end
            a_3_4_load_1: begin a_3_4_out <= 8'd012; end
            a_4_1_load_1: begin a_4_1_out <= 8'd013; end
            a_4_2_load_1: begin a_4_2_out <= 8'd064; end
            a_4_3_load_1: begin a_4_3_out <= 8'd055; end
            a_4_4_load_1: begin a_4_4_out <= 8'd027; end
            b_1_1_load_1: begin b_1_1_out <= 8'd013; end
            b_1_2_load_1: begin b_1_2_out <= 8'd002; end
            b_1_3_load_1: begin b_1_3_out <= 8'd003; end
            b_2_1_load_1: begin b_2_1_out <= 8'd002; end
            b_2_2_load_1: begin b_2_2_out <= 8'd001; end
            b_2_3_load_1: begin b_2_3_out <= 8'd050; end
            b_3_1_load_1: begin b_3_1_out <= 8'd051; end
            b_3_2_load_1: begin b_3_2_out <= 8'd052; end
            b_3_3_load_1: begin b_3_3_out <= 8'd001; end
            
            pe11_load: begin pe11 <= 8'd193; end
            pe12_load: begin pe12 <= 8'd206; end
            pe21_load: begin pe21 <= 8'd001; end 
            pe22_load: begin pe22 <= 8'd193; end 
            sa11_load: begin sa11 <= 8'd193; end 
            sa12_load: begin sa12 <= 8'd206; end
            sa21_load: begin sa21 <= 8'd001; end
            sa22_load: begin sa22 <= 8'd193; end
            ct11_load: begin ct11 <= 8'd193; end
            ct12_load: begin ct12 <= 8'd206; end
            ct21_load: begin ct21 <= 8'd001; end
            ct22_load: begin ct22 <= 8'd193; end
            
        endcase
    end 
    
    // enable calulators
    always @ (state)
    begin
        case(state)
            default: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            
            pe_start: begin en_pe <= 1'b1; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            pe_wait: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            pe_c_1_1_load: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            pe_c_1_2_load: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            pe_c_2_1_load: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            pe_c_2_2_load: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            pe_end: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            
            sa_start: begin en_pe <= 1'b0; en_sa <= 1'b1; en_ct <= 1'b0; all_done = 1'b0; end
            sa_c_2_1_load: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            sa_c_1_1_load: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            sa_c_2_2_load: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            sa_c_1_2_load: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            sa_end: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            
            ct_start: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b1; all_done = 1'b0; end
            ct_wait: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            ct_c_1_1_load: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            ct_c_1_2_load: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            ct_c_2_1_load: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            ct_c_2_2_load: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b0; end
            ct_end: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b1; end
            
            dp_start: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b1; end
            
//            module_end: begin en_pe <= 1'b0; en_sa <= 1'b0; en_ct <= 1'b0; all_done = 1'b1; end
        endcase
    end
endmodule
