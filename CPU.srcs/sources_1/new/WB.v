`include "para.v"

module WB (
           input   wire [15: 0]    ALUout,
           input   wire [15: 0]    DRAMdata,
           input   wire            RWSel,
           output  wire [15: 0]    WB
       );

reg [15: 0] reg_RegWd;

assign WB = RWSel ? DRAMdata : ALUout;

endmodule
