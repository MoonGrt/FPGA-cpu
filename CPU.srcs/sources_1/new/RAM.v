`include "para.v"
module RAM (
    input  wire         clk,
    input  wire         rst_n,
    input  wire         EN,
    input  wire [15: 0] addr,
    inout  wire [15: 0] data,
    input  wire         ctrl
);

// 输入线
wire [15: 0] data_input; // 数据 -> 缓冲
wire [15: 0] input_data; // 缓冲 -> 数据
// 输出线
wire [15: 0] data_output; // 数据 -> 缓冲
wire [15: 0] output_data; // 缓冲 -> 数据

/***************************************************************
                        控制逻辑
****************************************************************/

// 输入输出控制
wire input_call;    // 输入
wire output_call;   // 输出

// 读写控制
assign input_call  = ((EN == 1'b1) && (ctrl == `IO_CTRL_WRITE)) ? 1'b1 : 1'b0;
assign output_call = ((EN == 1'b1) && (ctrl == `IO_CTRL_READ)) ? 1'b1 : 1'b0;

/***************************************************************
                        数据交叉开关
****************************************************************/
// 地址译码和控制逻辑内部耦合，无需数据交叉开关控制
// data输出控制
assign data = (output_call) ? output_data :  // 总线同意，数据输出
       16'dz;                // 未定义状况
// data输入控制
assign data_input = data;

/***************************************************************
                        输入输出无缓冲
****************************************************************/

// 连接主存
data_mem DataMem (
    .clk(clk),
    .we(input_call),
    .a(addr),
    .d(data_input),
    .spo(output_data)
);
        
endmodule
