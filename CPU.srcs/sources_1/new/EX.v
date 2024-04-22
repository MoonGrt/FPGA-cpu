`include "para.v"

module EX (
           input   wire [15: 0]    RD,
           input   wire [15: 0]    RS,
           input   wire [15: 0]    IMM,
           
           input   wire            ABSel,
           input   wire            IMMop,
           input   wire [2: 0]     ALUop,
           
           output  wire [1: 0]     CMPout,
           output  wire [15: 0]    ALUout
       );

/***************************************************************
                        wire reg
****************************************************************/

wire [15: 0] ALU_Ain, ALU_Bin, CMP_Ain, CMP_Bin;

assign ALU_Ain = ABSel ? RS : RD;
assign ALU_Bin = IMMop ? IMM : RS;
assign CMP_Ain = RD;
assign CMP_Bin = IMMop ? IMM : RS;

/***************************************************************
                        main
****************************************************************/

ALU alu (
        .A(ALU_Ain),
        .B(ALU_Bin),
        .ALUop(ALUop),
        .ALUout(ALUout),
        .overflow()
    );

CMP cmp (
         .A(CMP_Ain),
         .B(CMP_Bin),
         .CMPout(CMPout)
     );

endmodule
