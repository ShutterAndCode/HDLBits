module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    always @(*)
        begin
            
    		if (sel<256)
                out[3:0]=in[(sel*4)+:4];
        end

endmodule
