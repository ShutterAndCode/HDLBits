module top_module (
    input clk,
    input d,
    output reg q
);
    wire temp1,temp2;
    pff p1(d,temp1,clk);
    nff n1(d,temp2,clk);
    always @(*)
        begin
            q=clk?temp1:temp2;
        end
    
endmodule
module pff(d,q,clk);
    input d,clk;
    output reg q;
    initial q=1'b0;
    always @(posedge clk)
        begin
            q<=d;
        end
endmodule
module nff(d,q,clk);
    input d,clk;
    output reg q;
    initial q=1'b0;
    always @(negedge clk)
        begin
            q<=d;
        end
endmodule