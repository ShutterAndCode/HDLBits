module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] wire_sub;
    wire internal;
    assign wire_sub=b^{32{sub}};
    add16 add_lower(.a(a[15:0]),
                    .b(wire_sub[15:0]),
                    .cin(sub),
                    .cout(internal),
                    .sum(sum[15:0]));
    add16 add_upper (.a(a[31:16]),
                     .b(wire_sub[31:16]),
                        .cin(internal),
                        .cout(1'b0),
                        .sum(sum[31:16]));
                     

endmodule
