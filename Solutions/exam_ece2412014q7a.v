module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
    assign c_load=reset|(Q==4'hc && enable);
    assign c_d=4'b0001;
	assign c_enable=enable;
    count4 the_counter (clk, c_enable, c_load, c_d ,Q);

endmodule

