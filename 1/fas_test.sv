// Full Adder/Subtractor test bench template
module fas_test;
    logic a;           // Input bit a
    logic b;           // Input bit b
    logic cin;         // Carry i
    logic a_ns;        // A_nS (add/not subtract) control
    logic s;          // Output S
    logic cout;        // Carry out
// Put your code here
// ------------------
    fas uut (
        .a(a),
        .b(b),
        .cin(cin),
        .a_ns(a_ns),
        .s(s),
        .cout(cout)
    );

    initial begin
        a=1;
        b=0;
        cin=1;
        a_ns=0;

        #50
        a_ns=1;

    end

// End of your code

endmodule
