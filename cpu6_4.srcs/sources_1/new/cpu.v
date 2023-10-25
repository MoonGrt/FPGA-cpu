`include "para.v"

module CPU (
    input wire           clk,
    input wire           rst_n,
    
    input wire  [7:0]    irq,
    
    output  wire [15: 0] inst_addr,
    input   wire [15: 0] inst_data,
    
    output wire [15: 0]  mem_addr,
    output wire [15: 0]  mem_wd,
    input  wire [15: 0]  mem_rd,
    output wire          mem_ctrl
);

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
wire            RegWe;
wire            IMMSel;

assign DRAMdata = mem_rd;
assign mem_addr = ALUout;
assign mem_wd = RD;

crtl ctrl (
         .rst_n(rst_n),
         .inst(inst_data),
         .CMPout(CMPout),
         .PCSel(PCSel),
         .IMMop(IMMop),
         .ALUop(ALUop),
         .RegWe(RegWe),
         .mem_ctrl(mem_ctrl),
         .RWSel(RWSel),
         .ABSel(ABSel),
         .IMMSel(IMMSel)
     );
     
IF If (
       .clk(clk),
       .rst_n(rst_n),
       .inst_data(inst_data),
       .inst_addr(inst_addr),
       .branch_pc(IMM),
       .PCSel(PCSel),
       .irq(irq)
   );
   
ID Id (
       .clk(clk),
       .rst_n(rst_n),
       .inst(inst_data),
       .WB(WB),
       .IMMSel(IMMSel),
       .RegWe(RegWe),
       
       .RD(RD),
       .RS(RS),
       .IMM(IMM)
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
