// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

// Put your code here
// ------------------
    
    logic d0not, d1not, selnot, or1, or1not, or2, or2not, out;
    NOT #(
        .Tpdlh(10),
        .Tpdhl(9)
    ) g0 (
        .A(d0),
        .Z(d0not)
    );

    OR2 #(
        .Tpdlh(1),
        .Tpdhl(4)
    ) g3 (
        .A(d0not),
        .B(sel),
        .Z(or1)
    );
    //or1 = not[d0]+sel 
    NOT #(
        .Tpdlh(10),
        .Tpdhl(9)
    ) g5 (
        .A(or1),
        .Z(or1not)
    );
    //or1not = not[or1]
    NOT #(
        .Tpdlh(10),
        .Tpdhl(9)
    ) g1 (
        .A(d1),
        .Z(d1not)
    );

    NOT #(
        .Tpdlh(10),
        .Tpdhl(9)
    ) g2 (
        .A(sel),
        .Z(selnot)
    );

    OR2 #(
        .Tpdlh(1),
        .Tpdhl(4)
    ) g4 (
        .A(d1not),
        .B(selnot),
        .Z(or2)
    );
    //or2 = not[d1] + not[sel]
    NOT #(
        .Tpdlh(10),
        .Tpdhl(9)
    ) g6 (
        .A(or2),
        .Z(or2not)
    );
    //or2not = not[or2]
    OR2 #(
        .Tpdlh(1),
        .Tpdhl(4)
    ) g7 (
        .A(or1not),
        .B(or2not),
        .Z(z)
    );
    //z = or1not + or2not
// End of your code

endmodule
