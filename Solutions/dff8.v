module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk)begin
        integer i;
        for (i=0;i<8;i=i+1)
            begin
                q[i]<=d[i];
            end
    end
endmodule
// direct q<=d will also create multiple dff