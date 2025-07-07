module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);
    wire cndn1,cndn2,cndn3,cndn4,cndn5,cndn6,pm_cndn;
    wire hh_en;  // Enable for hour counter
    wire hh_is_12 = (hh == 8'h12);

    assign cndn1=1'b1;
    assign cndn2=(ss[3:0]==4'h9);
    assign cndn3=((ss[7:4]==4'h5)&&(ss[3:0]==4'h9));
    assign cndn4=((ss[7:4]==4'h5)&&(ss[3:0]==4'h9)&&(mm[3:0]==4'h9));
    assign hh_en = (ss == 8'h59) && (mm == 8'h59);

    bcd s1(clk,ena,cndn1,reset,4'h9,ss[3:0]);
    bcd s2(clk,ena,cndn2,reset,4'h5,ss[7:4]);
    bcd m1(clk,ena,cndn3,reset,4'h9,mm[3:0]);
    bcd m2(clk,ena,cndn4,reset,4'h5,mm[7:4]);
        always @(posedge clk) begin
        if (reset)
            hh <= 8'h12;
        else if (ena && hh_en) begin
            if (hh_is_12)
                hh <= 8'h01;
            else if (hh == 8'h09)
                hh <= 8'h10;
            else
                hh <= hh + 1;
        end
    end
    
    always @(posedge clk)
        begin
			if (reset)
    			pm <= 1'b0;
			else if (ena && hh_en && hh == 8'h11)
    			pm <= ~pm;
        end
    
    
    
    
endmodule
module bcd (clk,enable,condition,reset,off,out);
    input clk,enable,reset,condition;
    input [3:0]off;
    output reg [3:0]out;
    always @(posedge clk)
        begin
            if ((reset==1'b1))
                out<=4'h0;
            else if  ((out==off)&&(enable)&&(condition))
                out<=4'b0;
            else if ((enable)&&(condition))
                out<=out+4'b0001;
        end
endmodule
                
