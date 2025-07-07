module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
genvar i;
    generate
        fa fa0(a[0],b[0],cin,sum[0],cout[0]);
        for (i=1;i<100;i=i+1)
            begin: gen_fa_loop
                fa fa_inst(a[i],b[i],cout[i-1],sum[i],cout[i]);
            end
    endgenerate
endmodule
module fa(a,b,c,sum,carry);
        input a,b,c;
        output sum,carry;
    assign {sum,carry}={a^b^c,((a^b)&c)|(a&b)};
endmodule
