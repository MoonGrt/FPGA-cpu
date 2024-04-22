`timescale 1ns / 1ps

// 比较结果
`define COMP_EQ 2'b00
`define COMP_LE 2'b01
`define COMP_GE 2'b10

module cmp_sim;

reg [15: 0]    A;
reg [15: 0]    B;
wire [1: 0]     CMPout;
           
initial
begin
    A = 1;
    B = 2;
    #10;
    A = 3;
    B = 4;   
    #10;
    A = 32767;
    B = 5;   
    #10;
    A = 8;
    B = 2;   
    #10;
    A = -32767;
    B = -5;   
    #10;
    A = 1;
    B = -1;   
end

wire equal;
wire less;
reg [1: 0] out_reg;

/***************************************************************
                        运算
****************************************************************/

// 比较运算
assign equal = ($signed(A) == $signed(B)) ? 1'b1 : 1'b0;
assign less  = ($signed(A) <  $signed(B)) ? 1'b1 : 1'b0;

/***************************************************************
                        输出选择
****************************************************************/

assign CMPout = out_reg;

always @(*) begin
    if (equal) begin
        out_reg = `COMP_EQ;
    end
    else if (less) begin
        out_reg = `COMP_LE;
    end
    else begin
        out_reg = `COMP_GE;
    end
end

endmodule
