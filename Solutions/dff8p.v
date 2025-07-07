module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    always @(negedge clk)
        begin
            integer i;
            for (i=0;i<8;i=i+1)
                begin
                    if (reset==1)
                        begin
                            q<=8'h34;
                        end
                    else
                        q[i]<=d[i];
                end
        end

endmodule
