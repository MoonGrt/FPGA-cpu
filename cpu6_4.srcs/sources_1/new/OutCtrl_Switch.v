module OutCtrl_Switch (
    input  wire [7: 0]  switch,
    output wire [16: 0] data
);

assign data[7: 0] = switch;
assign data[15: 8] = 0;

endmodule