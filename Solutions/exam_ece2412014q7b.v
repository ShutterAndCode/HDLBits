module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    reg [3:0]q1,q2,q3;
    bcdcount counter0 (clk, reset, c_enable[0],q1);
    bcdcount counter1 (clk, reset, c_enable[1],q2);
    bcdcount counter2 (clk,reset,c_enable[2],q3);
    assign c_enable[0]=1;
    assign c_enable[1]=(q1==4'h9);
    assign c_enable[2]=(q1==4'h9)&&(q2==4'h9);
    always @(posedge clk)
        begin
            if ((q1==4'h8)&&(q2==4'h9)&&(q3==4'h9))
                OneHertz<=1'b1;
            else
                OneHertz<=1'b0;
        end
             

endmodule
