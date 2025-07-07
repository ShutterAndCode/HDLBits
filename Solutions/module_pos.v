module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
   // mod_a test_name (.out(out1),
     //           .out(out2),
             //   .in(a),
       //         .in(b),
         //       .in(c),
           //     .in(d))
    mod_a test_pos(out1,out2,a,b,c,d);

endmodule
