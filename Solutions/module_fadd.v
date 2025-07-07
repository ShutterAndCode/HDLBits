module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire i1;
    add16 a1 (.a(a[15:0]),
              .b(b[15:0]),
              .cin(1'b0),
              .sum(sum[15:0]),
              .cout(i1));
    
    add16 a2(.a(a[31:16]),
             .b(b[31:16]),
             .sum(sum[31:16]),
             .cin(i1),
             .cout(1'b0));          

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

assign sum=a ^ b ^ cin;
    assign cout=a&b | a&cin | b&cin;
    

endmodule
