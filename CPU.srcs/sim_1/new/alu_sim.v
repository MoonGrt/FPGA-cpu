`timescale 1ns / 1ps

`define ADD_op 3'b000
`define SUB_op 3'b001
`define AND_op 3'b010
`define OR_op  3'b011
`define XOR_op 3'b100
`define SLL_op 3'b101
`define SRL_op 3'b110
`define SRA_op 3'b111

module alu_sim;

reg [15: 0]  A;
reg [15: 0]  B;
reg [2: 0]   opecode;
wire [15: 0] out;
wire overflow;

wire [15: 0] addA;
wire [15: 0] addB;
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

assign suben = (opecode == `SUB_op);
assign addA   = A;
assign addB   = (suben) ? (~B + 1'b1) : B;

assign overflow = ((opecode == `ADD_op) | (opecode == `SUB_op)) && (addA[15] == addB[15]) && (addA[15] != addOut[15]);
assign addOut[15: 0] = addA + addB;
assign andOut[15: 0] = A[15: 0] & B[15: 0];
assign orOut[15: 0]  = A[15: 0] | B[15: 0];
assign xorOut[15: 0] = A[15: 0] ^ B[15: 0];

assign sllOut[15: 0] = A[15: 0] << B[4: 0]; 
assign srlOut[15: 0] = A[15: 0] >> B[4: 0];
//assign sraOut[15: 0] = $signed(A[15: 0]) >>> $unsigned(B[4: 0]); 

/***************************************************************
                           main
****************************************************************/

assign out = out_reg;

initial
begin
    A = 1;
    B = 2;
    opecode = 3'b000;
    #10;
    A = -1;
    B = -2;
    opecode = 3'b000;
    #10;
    A = 1;
    B = -2;
    opecode = 3'b000;
    #10;
    A = 32767;
    B = 5;   
    opecode = 3'b000;
    #10;
    A = -32767;
    B = -5;   
    opecode = 3'b000;
    
    #10;
    A = 4;
    B = 3;   
    opecode = 3'b001;
    #10;
    A = 3;
    B = 4;   
    opecode = 3'b001;
    #10;
    A = 3;
    B = -4;   
    opecode = 3'b001;
    #10;
    A = -3;
    B = -4;   
    opecode = 3'b001;
    
    
    #10;
    A = 8;
    B = 2;   
    opecode = 3'b101;
    
//    #10;
//    A = 8;
//    B = 2;   
//    opecode = 3'b101;
//    #10;
//    A = 8;
//    B = 2;   
//    opecode = 3'b101;
//    #10;
//    A = 8;
//    B = 2;   
//    opecode = 3'b101;
//    #10;
//    A = 8;
//    B = 2;   
//    opecode = 3'b101;
end

always @(*) begin
    case (opecode)
        `AND_op: begin
            out_reg[15: 0] = andOut[15: 0];
        end
        `OR_op: begin
            out_reg[15: 0] = orOut[15: 0];
        end
        `XOR_op: begin
            out_reg[15: 0] = xorOut[15: 0];
        end
        `SLL_op: begin
            out_reg[15: 0] = sllOut[15: 0];
        end
        `SRL_op: begin
            out_reg[15: 0] = sraOut[15: 0];
        end
        default: begin  // ADD or SUB
            out_reg[15: 0] = addOut[15: 0];
        end
    endcase
end

endmodule
