// 4->1 multiplexer template
module mux4 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic d2,          // Data input 2
    input logic d3,          // Data input 3
    input logic [1:0] sel,   // Select input
    output logic z           // Output
);

// Put your code here
// ------------------
parameter NOTlh = 10, NOThl = 9, ORlh = 1, ORhl = 4;
logic m0_out, m1_out;

mux2 #(
    .NOTlh(NOTlh),
    .NOThl(NOThl),
    .ORlh(ORlh),
    .ORhl(ORhl)
) m0 (
    .d0(d2),
    .d1(d3),
    .sel(sel[0]),
    .z(m0_out)
);

mux2 #(
    .NOTlh(NOTlh),
    .NOThl(NOThl),
    .ORlh(ORlh),
    .ORhl(ORhl)
) m1 (
    .d0(d0),
    .d1(d1),
    .sel(sel[0]),
    .z(m1_out)
);

mux2 #(
    .NOTlh(NOTlh),
    .NOThl(NOThl),
    .ORlh(ORlh),
    .ORhl(ORhl)
) m2 (
    .d0(m1_out),
    .d1(m0_out),
    .sel(sel[1]),
    .z(z)
);
// End of your code

endmodule
