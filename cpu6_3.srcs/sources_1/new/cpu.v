`include "para.v"

module CPU (
    input wire           clk,
    input wire           rst_n,
    
    input wire  [7:0]    irq,
    
    output wire [15: 0]  mem_addr,
    output wire [15: 0]  mem_wd,
    input  wire [15: 0]  mem_rd,
    output wire          mem_ctrl
);

wire [15: 0]    inst;
wire [15: 0]    RD;
wire [15: 0]    RS;
wire [15: 0]    IMM;
wire [15: 0]    DRAMdata;
wire [15: 0]    WB;
wire [15: 0]    ALUout;
wire [1: 0]     CMPout;
wire [2:0]      ALUop;
wire            IMMop;
wire [15: 0]    COMPExOut;
wire            PCSel;
wire            ABSel;
wire            DRAMWE;
wire            RWSel;

assign DRAMdata = mem_rd;
assign mem_addr = ALUout;
assign mem_wd = RD;

IF If (
       .clk(clk),
       .rst_n(rst_n),
       .branch_pc(IMM),
       .PCSel(PCSel),
       .inst(inst),
       .irq(irq)
   );
   
ID Id (
       .clk(clk),
       .rst_n(rst_n),
       .inst(inst),
       .WB(WB),
       .CMPout(CMPout),
       
       .RD(RD),
       .RS(RS),
       .IMM(IMM),
       .ALUop(ALUop),
       .IMMop(IMMop),
       .RWSel(RWSel),
       .PCSel(PCSel),
       .ABSel(ABSel),
       .mem_ctrl(mem_ctrl)
   );

EX Ex (
       .RD(RD),
       .RS(RS),
       .IMM(IMM),
       .ABSel(ABSel),
       .IMMop(IMMop),
       .ALUop(ALUop),
       .CMPout(CMPout),
       .ALUout(ALUout)
   );

WB Wb (
       .ALUout(ALUout),
       .DRAMdata(DRAMdata),
       .RWSel(RWSel),
       .WB(WB)
   );
   
endmodule
