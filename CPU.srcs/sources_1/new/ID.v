module ID (
    input    wire          clk,
    input    wire          rst_n,
    input    wire [15: 0]  inst,
    input    wire [15: 0]  WB,
    input    wire          IMMSel,
    input    wire          RegWe,
    
    output   wire [15: 0]  RD,
    output   wire [15: 0]  RS,
    output   wire [15: 0]  IMM
);

/***************************************************************
                        wire reg
****************************************************************/
wire [2: 0]    rd;
wire [2: 0]    rs;

assign rd      = inst[7: 5];
assign rs      = inst[10: 8];
//assign IMM     = IMMSel ? {{8{1'b0}}, inst[15: 8]}:{{11{inst[15]}}, inst[15: 11]};
assign IMM     = IMMSel ? {{8{1'b0}}, inst[15: 8]}:{{11{1'b0}}, inst[15: 11]};   // 立即数设定为无符号数，扩展不考虑负数情况
 
REG Reg (
            .clk(clk),
            .rst_n(rst_n),
            .rd(rd),
            .rs(rs),
            .WB(WB),
            .RegWe(RegWe),
            .RD(RD),
            .RS(RS)
        );
        
//crtl ctrl (
//         .rst_n(rst_n),
//         .opecode(opecode),
//         .CMPout(CMPout),
//         .PCSel(PCSel),
//         .IMMop(IMMop),
//         .ALUop(ALUop),
//         .RegWe(RegWe),
//         .mem_ctrl(mem_ctrl),
//         .RWSel(RWSel),
//         .ABSel(ABSel),
//         .IMMSel(IMMSel)
//     );
     
endmodule
