// 64-bit ALU test bench template
module alu64bit_test;

// Put your code here
// ------------------
    logic [63:0] a;    // Input bit a
    logic [63:0] b;    // Input bit b
    logic cin;         // Carry in
    logic [1:0] op;    // Operation
    logic [63:0] s;    // Output S
    logic cout;        // Carry out

    alu64bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .op(op),
        .s(s),
        .cout(cout)
    );

    initial begin
        a = 64'b0111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111;
        // b = 64'b1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111;
        b = 64'h0000_0000_0000_0000;
        cin = 0;
        op = 2'b10;

        #2100
        b[0] = 1;
    end
// End of your code

endmodule
