module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire i1;
    wire [15:0]s_carry0,s_carry1;
add16 low (.a(a[15:0]),
              .b(b[15:0]),
              .cin(1'b0),
              .sum(sum[15:0]),
              .cout(i1));
    
    add16 high_0 (.a(a[31:16]),
             .b(b[31:16]),
                  .sum(s_carry0),
                  .cin(1'b0),
             .cout(1'b0));
    add16 high_1 (.a(a[31:16]),
             .b(b[31:16]),
                  .sum(s_carry1),
                  .cin(1'b1),
             .cout(1'b0));
    assign sum[31:16]=i1?s_carry1:s_carry0;
    
endmodule
