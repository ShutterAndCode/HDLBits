module top_module (
    input a, b, c, d, e,
    output [24:0] out );//
    wire [24:0]v_up;
    wire [24:0]v_down;
    assign v_up[24:0]={{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}};
    assign v_down[24:0]={5{a,b,c,d,e}};
    assign out=~(v_up^v_down);
    
    
    

endmodule
