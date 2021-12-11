// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

// Put your code here
// ------------------
    parameter NOTlh = 10;
    parameter NOThl = 9;
    parameter ORlh = 1;
    parameter ORhl = 4;

    logic d0not, d1not, selnot, or1, or1not, or2, or2not, out;
    NOT #(
        .Tpdlh(NOTlh),
        .Tpdhl(NOThl)
    ) g0 (
        .A(d0),
        .Z(d0not)
    );

    OR2 #(
        .Tpdlh(ORlh),
        .Tpdhl(ORhl)
    ) g3 (
        .A(d0not),
        .B(sel),
        .Z(or1)
    );
    //or1 = not[d0]+sel 
    NOT #(
        .Tpdlh(NOTlh),
        .Tpdhl(NOThl)
    ) g5 (
        .A(or1),
        .Z(or1not)
    );
    //or1not = not[or1]
    NOT #(
        .Tpdlh(NOTlh),
        .Tpdhl(NOThl)
    ) g1 (
        .A(d1),
        .Z(d1not)
    );

    NOT #(
        .Tpdlh(NOTlh),
        .Tpdhl(NOThl)
    ) g2 (
        .A(sel),
        .Z(selnot)
    );

    OR2 #(
        .Tpdlh(ORlh),
        .Tpdhl(ORhl)
    ) g4 (
        .A(d1not),
        .B(selnot),
        .Z(or2)
    );
    //or2 = not[d1] + not[sel]
    NOT #(
        .Tpdlh(NOTlh),
        .Tpdhl(NOThl)
    ) g6 (
        .A(or2),
        .Z(or2not)
    );
    //or2not = not[or2]
    OR2 #(
        .Tpdlh(ORlh),
        .Tpdhl(ORhl)
    ) g7 (
        .A(or1not),
        .B(or2not),
        .Z(z)
    );
    //z = or1not + or2not
// End of your code

endmodule
