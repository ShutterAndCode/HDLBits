module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire [99:0]coutwire;
    genvar i;
    generate
        bcd_fadd b0 (a[3:0],b[3:0],cin,coutwire[0],sum[3:0]);
        for (i=1;i<100;i=i+1)
            begin: gen_bcd
                bcd_fadd (a[4*i+3:4*i],b[4*i+3:4*i],coutwire[(i-1)],coutwire[i],sum[4*i+3:4*i]);
            end
    endgenerate
    assign cout=coutwire[99];
    

endmodule
