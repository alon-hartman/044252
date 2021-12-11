// 1-bit ALU template
module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);

// Put your code here
// ------------------
    logic op0_not, or_out, xor_out, d[2:0];
    NOT #(
        .Tpdlh(10),
        .Tpdhl(10)
    ) not_inst1 (
        .A(op[0]),
        .Z(op0_not)
    ), not_inst2 (
        .A(or_out),
        .Z(d[0])
    );
    XOR2 #(
        .Tpdlh(6),
        .Tpdhl(6)
    ) xor_inst (
        .A(a),
        .B(b),
        .Z(d[1])
    );

    OR2 #(
        .Tpdlh(4),
        .Tpdhl(4)
    ) OR_inst (
        .A(a),
        .B(b),
        .Z(or_out)
    );
    
    fas fas_inst (
        .a(a),
        .b(b),
        .cin(cin),
        .a_ns(op0_not),
        .s(d[2]),
        .cout(cout)
    );

    mux4 #(
        .NOTlh(10),
        .NOThl(10),
        .ORlh(4),
        .ORhl(4)
        ) mux4_inst (
        .d0(d[0]),
        .d1(d[1]),
        .d2(d[2]),
        .d3(d[2]),
        .sel(op),
        .z(s)
    );
// End of your code

endmodule
