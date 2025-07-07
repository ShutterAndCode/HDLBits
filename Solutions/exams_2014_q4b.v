module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
);
    MUXDFF d3(KEY[0],SW[3],KEY[3],KEY[2],KEY[1],LEDR[3]);
    MUXDFF d2(KEY[0],SW[2],LEDR[3],KEY[2],KEY[1],LEDR[2]);
    MUXDFF d1(KEY[0],SW[1],LEDR[2],KEY[2],KEY[1],LEDR[1]);
    MUXDFF d0(KEY[0],SW[0],LEDR[1],KEY[2],KEY[1],LEDR[0]);

endmodule

module MUXDFF (clk,r,w,l,e,q);
    input r,w,l,e,clk;
    output reg q;
    wire [1:0]el;
    assign el={e,l};
    always @(posedge clk)
        begin
            case (el)
                2'b00: q<=q;
                2'b01:q<=r;
                2'b10:q<=w;
                2'b11:q<=r;
            endcase
        end

endmodule
