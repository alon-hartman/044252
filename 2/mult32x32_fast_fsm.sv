// 32X32 Multiplier FSM
module mult32x32_fast_fsm (
    input logic clk,              // Clock
    input logic reset,            // Reset
    input logic start,            // Start signal
    input logic a_msw_is_0,       // Indicates MSW of operand A is 0
    input logic b_msw_is_0,       // Indicates MSW of operand B is 0
    output logic busy,            // Multiplier busy indication
    output logic a_sel,           // Select one 2-byte word from A
    output logic b_sel,           // Select one 2-byte word from B
    output logic [1:0] shift_sel, // Select output from shifters
    output logic upd_prod,        // Update the product register
    output logic clr_prod         // Clear the product register
);

// Put your code here
// ------------------
    typedef enum {
        idle_st,
        bd_st,
        ad_st,
        bc_st,
        ac_st
    } sm_type;
    sm_type current_state;
    sm_type next_state;
    
    always_ff @(posedge clk, posedge reset) begin
        if (reset == 1'b1) begin
            current_state <= idle_st;
        end
        else begin
            current_state <= next_state;
        end
    end

    always_comb begin 
        busy = 1'b1;
        upd_prod = 1'b1;
        clr_prod = 1'b0;
        a_sel = 1'b0;
        b_sel = 1'b0;
        shift_sel = 2'b01;
        next_state = current_state;
        if(reset == 1'b1) begin
            busy = 1'b0;
            upd_prod = 1'b0;
            clr_prod = 1'b1;
        end
        case(current_state)
            idle_st : begin
                busy = 1'b0;
                upd_prod = 1'b0;
                if(start == 1'b1 && reset == 1'b0) begin
                    clr_prod = 1'b1;
                    next_state = bd_st;
                end 
            end
            bd_st : begin
               a_sel = 1'b1;
               b_sel = 1'b1;
               shift_sel = 2'b00;
               next_state = ad_st;
               if(a_msw_is_0)begin
                   if(b_msw_is_0)begin 
                       next_state = idle_st;
                   end 
                   else begin
                       next_state = bc_st;
                   end
               end
            end
            ad_st : begin
                b_sel = 1'b1;
                next_state = bc_st;
                if(a_msw_is_0 == 1'b0 && b_msw_is_0)begin
                    next_state = idle_st;
                end
            end
            bc_st : begin
                a_sel = 1'b1;
                next_state = ac_st;
                if(a_msw_is_0  && b_msw_is_0 == 1'b0)begin
                    next_state = idle_st;
               end
            end
            ac_st : begin
                shift_sel = 2'b10;
                next_state =idle_st;
            end
        endcase
    end
// End of your code

endmodule
