`include "para.v"

module ALU (
    input    wire [15: 0]    A,
    input    wire [15: 0]    B,
    input    wire [2: 0]     ALUop,
    output   wire [15: 0]    ALUout,
    output   wire            overflow
);

wire [15: 0] Ain;
wire [15: 0] Bin;
wire         suben;

wire [15: 0] addOut;
wire [15: 0] subOut;
wire [15: 0] andOut;
wire [15: 0] orOut;
wire [15: 0] xorOut;
wire [15: 0] sllOut;
wire [15: 0] srlOut;
wire [15: 0] sraOut;

reg [15: 0] out_reg;
 
/***************************************************************
                            wire
****************************************************************/

assign suben = (ALUop == `SUB_op);
assign Ain   =  A;
assign Bin   = (suben) ? (~B + 1'b1) : B;

assign overflow = ((ALUop == `ADD_op) | (ALUop == `SUB_op)) && (Ain[15] == Bin[15]) && (Ain[15] != addOut[15]);
assign addOut = Ain + Bin;
assign andOut = A & B;
assign orOut  = A | B;
assign xorOut = A ^ B;

assign sllOut = A << B; 
assign srlOut = A >> B;

/***************************************************************
                           main
****************************************************************/

assign ALUout = out_reg;

always @(*) begin
    case (ALUop)
        `AND_op: begin
            out_reg = andOut;
        end
        `OR_op: begin
            out_reg = orOut;
        end
        `XOR_op: begin
            out_reg = xorOut;
        end
        `SLL_op: begin
            out_reg = sllOut;
        end
        `SRL_op: begin
            out_reg = sraOut;
        end
        default: begin  // ADD or SUB
            out_reg = addOut;
        end
    endcase
end

endmodule
