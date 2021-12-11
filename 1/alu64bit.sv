// 64-bit ALU template
module alu64bit (
    input logic [63:0] a,    // Input bit a
    input logic [63:0] b,    // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic [63:0] s,   // Output S
    output logic cout        // Carry out
);

// Put your code here
// ------------------
    logic cout_arr[63:0];
    alu1bit alu1 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .op(op),
        .s(s[0]),
        .cout(cout_arr[0])
    );

        genvar i;
        generate
            for(i=1; i<64; i++)
            begin
                alu1bit alu_inst(
                    .a(a[i]),
                    .b(b[i]),
                    .cin(cout_arr[i-1]),
                    .op(op),
                    .s(s[i]),
                    .cout(cout_arr[i])
                );
            end
        endgenerate
        assign cout = cout_arr[63];

// End of your code

endmodule
