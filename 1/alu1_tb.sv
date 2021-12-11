// 4->1 multiplexer test bench template
module alu1_tb;

// Put your code here
// ------------------
    logic a;           // Input bit a
    logic b;           // Input bit b
    logic cin;         // Carry in
    logic [1:0] op;    // Operation
    logic s;          // Output S
    logic cout;        // Carry out

    alu1bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .op(op),
        .s(s),
        .cout(cout)
    );

    initial begin
        op = 2'b11;
        a=0;
        b=1;
        cin=0;

        #80
        op[0] = 0;
    end
// End of your code

endmodule
