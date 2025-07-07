module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0]a1,b1,c1,d1;
    assign a1=(a<b&a<c&a<d)?a:7'b0;
    assign b1=(b<a&b<c&b<d)?b:7'b0;
    assign c1=(c<a&c<b&c<d)?c:7'b0;
    assign d1=(d<a&d<b&d<c)?d:7'b0;
    assign min=a1|b1|c1|d1;
  

endmodule
