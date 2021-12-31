// 32X32 Multiplier arithmetic unit template
module mult32x32_arith (
    input logic clk,             // Clock
    input logic reset,           // Reset
    input logic [31:0] a,        // Input a
    input logic [31:0] b,        // Input b
    input logic a_sel,           // Select one 2-byte word from A
    input logic b_sel,           // Select one 2-byte word from B
    input logic [1:0] shift_sel, // Select output from shifters
    input logic upd_prod,        // Update the product register
    input logic clr_prod,        // Clear the product register
    output logic [63:0] product  // Miltiplication product
);

// Put your code here
// ------------------
    logic [15:0] a_hw;
    logic [15:0] b_hw;
    logic [31:0] multres;
    logic [63:0] shiftres;
    logic [63:0] sum;
    always_comb begin
        case(a_sel)
            1'b0: a_hw = a[31:16];
            1'b1: a_hw = a[15:0];
        endcase
        case(b_sel)
            1'b0: b_hw = b[31:16];
            1'b1: b_hw = b[15:0];
        endcase
        multres = a_hw * b_hw;
        case(shift_sel)
            2'b01: shiftres = multres << 16;
            2'b10: shiftres = multres << 32;
            default: shiftres = multres << 0;
        endcase
        sum = product + shiftres;
    end

    always_ff @(posedge clk, posedge reset) begin
        if(reset == 1'b1 || clr_prod == 1'b1) begin
            product <= 64'h0;
        end
        if(upd_prod == 1'b1) begin
            product <= sum;
        end
    end

// End of your code

endmodule
