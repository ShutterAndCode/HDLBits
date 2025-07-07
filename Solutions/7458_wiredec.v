module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

wire w1_2_in_upperL,w2_2_in_lowerL,w3_3_in_upperR,w4_3_in_lowerR;
    assign w1_2_in_upperL=p2b&p2a;
    assign w2_2_in_lowerL=p2c&p2d;
    assign w3_3_in_upperR=p1a&p1b&p1c;
    assign w4_3_in_lowerR=p1d&p1e&p1f;
    assign p1y=w3_3_in_upperR|w4_3_in_lowerR;
    assign p2y= w1_2_in_upperL|w2_2_in_lowerL;
endmodule
