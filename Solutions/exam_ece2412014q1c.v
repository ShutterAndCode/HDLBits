module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    
    assign s=a+b;
    assign overflow = (a[7] == b[7]) && (s[7] != a[7]);
 
//or signed numbers, overflow happens when:

//You add two positive numbers, and the result is negative

//OR you add two negative numbers, and the result is positive
endmodule
