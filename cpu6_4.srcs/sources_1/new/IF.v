module IF (
           input   wire         clk,
           input   wire         rst_n,
           output  wire [15: 0] inst_addr,
           input   wire [15: 0] inst_data,
           input   wire [15: 0] branch_pc,
           input   wire         PCSel,
           input   wire [7:0]   irq
       );

reg [15: 0] pc,npc;
wire [15: 0] pc4;

assign pc4 = (inst_data || (pc == 16'hffff)) ? (pc + 1) : pc;
assign inst_addr = pc;

/***************************************************************
                        main
****************************************************************/

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) 
        pc <= -1;
    else
        pc <= npc;
end

always @(*) begin
    case (irq)
        8'b0000_0001: // timer
            npc = 8'd0;
        8'b0000_0010: // uart
            npc = 8'd5;
        8'b0000_0100: // bt
            npc = 8'd5;
        default:
            npc = (PCSel) ? branch_pc : pc4;
    endcase
end

//inst_mem irom(
//       .a(pc[9: 0]),
//       .spo(inst)
//   );

endmodule
