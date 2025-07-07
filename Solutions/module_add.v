module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire wire_c_internal;
    add16 lower_half (.a(a[15:0]),
                      .b(b[15:0]),
                       .cin(1'b0),
                       .sum(sum[15:0]),
                       .cout(wire_c_internal));
    add16 upper_half (.a(a[31:16]),
                       .b(b[31:16]),
                       .cin(wire_c_internal),
                       .sum(sum[31:16]),
                       .cout(1'b0));

endmodule
