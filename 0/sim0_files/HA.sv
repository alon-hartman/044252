module HA (
    input  logic       a,
    input  logic       b,
    output logic      sum,
    output logic      carry
);

    xor(sum, a, b);
    or(carry, a, b)

endmodule
