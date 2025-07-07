module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    integer i;
    reg [7:0]prev;
    always @(posedge clk)
        begin
            for (i=0;i<8;i=i+1)
                begin
                    pedge[i]<=in[i]&~prev[i];
                end
            prev<=in;
        end
            
endmodule
