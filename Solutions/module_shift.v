module top_module ( input clk, input d, output q );
    wire wire_1,wire_2;
    my_dff dff_1 (.clk(clk),
                  .d(d),
                  .q(wire_1));
    my_dff dff_2 (.clk(clk),
                  .d(wire_1),
                  .q(wire_2));
    my_dff dff_3 (.clk(clk),
                  .d(wire_2),
                  .q(q));
                  
endmodule
