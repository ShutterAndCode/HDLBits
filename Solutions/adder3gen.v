module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    genvar i;
    generate
        fadd f0(.ain(a[0]),.bin(b[0]),.cin(cin),.sumin(sum[0]),.coutin(cout[0]));
        for (i=1;i<3;i=i+1)
            begin: gen_loop
                fadd fai(.ain(a[i]),.bin(b[i]),.cin(cout[i-1]),.sumin(sum[i]),.coutin(cout[i]));
            end
    endgenerate

endmodule
                
module fadd(ain,bin,cin,coutin,sumin);
    input ain,bin,cin;
    output coutin,sumin;
    assign {coutin,sumin}=ain+bin+cin;
endmodule
