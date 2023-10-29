`include "../para.v"

module ROM (
    input  wire         clk,
    input  wire         rst_n,
    input  wire         EN,
    input  wire [15: 0] addr,
    inout  wire [15: 0] data,
    input  wire [15: 0] uart_data,
    input  wire         ctrl,
    input  wire         uart_recv
);

// 输出线
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

/***************************************************************
                        输入逻辑
****************************************************************/
wire [15:0] rom_addr;
reg  [7:0]  data_r = 0;
reg  [15:0] rom_data = 0;
reg         uart_recv_reg = 0;
reg [10:0]  addr_ireg = 0;
assign rom_addr = input_call ? addr_ireg[10:1]-1 : addr;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) begin
        addr_ireg <= 0;
        uart_recv_reg <= 0;
	end
	else if(uart_recv_reg) begin
	    uart_recv_reg <= 0;
        addr_ireg <= addr_ireg + 1;
		if(addr_ireg % 2) begin
			rom_data <= {data_r, uart_data[7:0]};	//MSB -> LSB
	    end
		else begin
			rom_data <= rom_data;
			data_r <= uart_data[7:0];
	    end
	end
	else begin
        addr_ireg <= addr_ireg;
        uart_recv_reg <= uart_recv;
	end
end

/***************************************************************
                        输入输出无缓冲
****************************************************************/

// 连接ROM
inst_mem InstMem (
    .clk(clk),
    .we(input_call),
    .a(rom_addr),
    .d(rom_data),
    .spo(output_data)
);

endmodule
