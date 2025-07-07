module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire cout[3:0];
    genvar i;
    fa f0(x[0],y[0],1'b0,cout[0],sum[0]);
    generate
        for (i=1;i<4;i=i+1)
            begin: gen_loop
                fa fa_inst(x[i],y[i],cout[i-1],cout[i],sum[i]);
            end
    endgenerate
    assign sum[4]=cout[3];

endmodule
module fa(ain,bin,cin,coutin,sumin);
    input ain,bin,cin;
    output coutin,sumin;
    assign {coutin,sumin}=ain+bin+cin;
endmodule
// or just sum=x+y, rolf -_-