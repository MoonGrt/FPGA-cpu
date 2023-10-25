module counter (
    input  wire           en,
    input  wire           clk,
    input  wire  [15: 0]  cnt,
    output wire          irq
);

reg [25:0] counter = 0;
assign irq = ((counter==cnt) && en)? 1:0;

always @ ( posedge clk) begin
    if (counter == cnt)
        counter <= 0;
    else
        counter <= counter + 1;
end

endmodule
