module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);
    reg [31:0]prev;
    reg [31:0]trans;
    assign trans=~in&prev;
    always @(posedge clk)
        begin
            prev<=in;
            if (reset==1'b1)
                out<=32'b0;
            else
                out<=trans|out;
        end

endmodule
