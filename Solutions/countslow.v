module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always @(posedge clk)
        begin
            if (reset==1'b1|(q==4'h9& slowena==1'b1))
                q=4'h0;
            else
                q<=slowena?q+1'b1:q;
        end

endmodule
