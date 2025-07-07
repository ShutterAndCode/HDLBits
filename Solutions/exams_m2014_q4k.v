module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
wire o1,o2,o3;
    dffm d1(in,clk,resetn,o1);
    dffm d2(o1,clk,resetn,o2);
    dffm d3(o2,clk,resetn,o3);
    dffm d4(o3,clk,resetn,out);
endmodule
module dffm(inp,clk,reset,out);
    input inp,clk,reset;
    output reg out;
    always @(posedge clk)
        begin
            if (~reset)
                out<=1'b0;
            else
                out<=inp;
        end
endmodule