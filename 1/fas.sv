// Full Adder/Subtractor template
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);

// Put your code here
// ------------------
    parameter XORlh = 6, XORhl = 6;
    parameter ORlh = 4, ORhl = 4;
    parameter NOTlh = 10, NOThl = 10;
    
    logic goutput[11:0];

    XOR2 #(
        .Tpdlh(XORlh),
        .Tpdhl(XORhl)
    ) g3 (
        .A(a),
        .B(b),
        .Z(goutput[2])
    ), g8 (
        .A(goutput[2]),
        .B(cin),
        .Z(s)
    ), g9 (
        .A(a),
        .B(a_ns),
        .Z(goutput[8])
    );
    
    NOT #(
        .Tpdlh(NOTlh),
        .Tpdhl(NOThl)
    ) g1 (
        .A(b),
        .Z(goutput[0])
    ), g2 (
        .A(cin),
        .Z(goutput[1])
    ), g6 (
        .A(goutput[3]),
        .Z(goutput[5])
    ), g7 (
        .A(goutput[4]),
        .Z(goutput[6])
    ), g11 (
        .A(goutput[9]),
        .Z(goutput[10])
    );
    
    OR2 #(
        .Tpdlh(ORlh),
        .Tpdhl(ORhl)
    ) g5 (
        .A(goutput[0]),
        .B(goutput[1]),
        .Z(goutput[4])
    ), g4 (
        .A(b),
        .B(cin),
        .Z(goutput[3])
    ), g10 (
        .A(goutput[8]),
        .B(goutput[5]),
        .Z(goutput[9])
    ), g12 (
        .A(goutput[10]),
        .B(goutput[6]),
        .Z(cout)
    );
    
    

// End of your code

endmodule
