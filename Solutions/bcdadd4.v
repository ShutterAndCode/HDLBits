module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [3:0] tempcout;
    bcd_fadd f0(a[3:0],b[3:0],cin,tempcout[0],sum[3:0]);
    bcd_fadd f1(a[7:4],b[7:4],tempcout[0],tempcout[1],sum[7:4]);
    bcd_fadd f2(a[11:8],b[11:8],tempcout[1],tempcout[2],sum[11:8]);
    bcd_fadd f3(a[15:12],b[15:12],tempcout[2],tempcout[3],sum[15:12]);
    assign cout=tempcout[3];

endmodule
