module top_module( 
    input [99:0] in,
    output [99:0] out
);
    integer i;
    always @(*)
        begin
            for (i=99;i>=0;i=i-1)
            begin
                out[i]=in[99-i];
            end
        end
endmodule
