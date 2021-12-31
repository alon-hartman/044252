// 32X32 Multiplier test template
module mult32x32_fast_test;

    logic clk;            // Clock
    logic reset;          // Reset
    logic start;          // Start signal
    logic [31:0] a;       // Input a
    logic [31:0] b;       // Input b
    logic busy;           // Multiplier busy indication
    logic [63:0] product; // Miltiplication product

// Put your code here
// ------------------
mult32x32_fast uut(
    .clk(clk),
    .reset(reset),
    .start(start),
    .a(a),
    .b(b),
    .busy(busy),
    .product(product)
);

initial begin
    clk = 1'b1;
    reset = 1'b1;
    start = 1'b0;
    a = 32'h0;
    b = 32'h0;
    
    #8
    reset = 1'b0;

    #2
    a = 32'd207923566;
    b = 32'd209146471;
    start = 1'b1;

    #2
    start = 1'b0;

    #10
    a = 32'd207923566 & 32'hffff;
    b = 32'd209146471 & 32'hffff;
    start = 1'b1;

    #2
    start = 1'b0;    

end

always begin
    #1
    clk = ~clk;
end
// End of your code

endmodule
