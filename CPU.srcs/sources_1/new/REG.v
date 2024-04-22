`include "para.v"

module REG(
           input   wire         clk,
           input   wire         rst_n,
          
           input   wire [2: 0]  rd,
           input   wire [2: 0]  rs,
           input   wire [15: 0] WB,
           input   wire         RegWe,
          
           output  wire [15: 0] RD,
           output  wire [15: 0] RS
       );

reg[15: 0] rf[7:0]; // ¼Ä´æÆ÷

assign    RD = (rd == 0) ? 0 : rf[(rd)];
assign    RS = (rs == 0) ? 0 : rf[(rs)];

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        rf[0][15: 0] <= 16'h0;
        rf[1][15: 0] <= 16'h0;
        rf[2][15: 0] <= 16'h0;
        rf[3][15: 0] <= 16'h0;
        rf[4][15: 0] <= 16'h0;
        rf[5][15: 0] <= 16'h0;
        rf[6][15: 0] <= 16'h0;
        rf[7][15: 0] <= 16'h0;
    end
    else if (RegWe == `REGWE_WRITE) begin
        rf[(rd)] <= WB;
    end
end

endmodule
