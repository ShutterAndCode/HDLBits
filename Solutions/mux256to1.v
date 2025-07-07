module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    always @(*)
        begin
            
        	if (sel<256)
            	out=in[sel];
        end
        

endmodule
