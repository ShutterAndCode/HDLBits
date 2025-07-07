module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    reg [31:0]q_next;
    always @(*) //doing the shift first, then changing the bits needed (use blocking assn. here)
        begin
            q_next=q[31:1];
            q_next[31]=q[0];
            q_next[21]=q[22]^q[0]; //22 has tap, so its op is bit 21 and tap gets xored with lsb here
            q_next[1]=q[2]^q[0];
            q_next[0]=q[1]^q[0];
        end
    always @(posedge clk) // now do the flip flip thing to reset otherwise assign (nonblocking assn. the new q_next)
        begin
            if (reset)
                q<=32'h1;
            else
                q<=q_next;
        end

endmodule
