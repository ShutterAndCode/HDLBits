module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [0:7] q;
    wire [2:0]abc;
    assign abc={A,B,C};
    always @(posedge clk)
        begin
            if (enable)
                q<={S,q[0:6]};
            else
                q<=q;
        end
    always @(*)
        begin
            case (abc)
                3'b000:Z=q[0];
                3'b001:Z=q[1];
                3'b010:Z=q[2];
                3'b011:Z=q[3];
                3'b100:Z=q[4];
                3'b101:Z=q[5];
                3'b110:Z=q[6];
                3'b111:Z=q[7];
            endcase
        end
                
endmodule
