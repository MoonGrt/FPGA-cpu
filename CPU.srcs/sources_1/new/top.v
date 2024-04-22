`include "para.v"

module top(
    input  wire         clk,
    input  wire         rst_n,
    // 设备线====================================================
    // 输入设备--拨码开关
    input  wire [7:0]   switch,
    // 输出设备--LED灯
    output wire [7:0]   led,
    // 输出设备--8位数码管
    output wire [7:0]   tube_en,
    output wire [7:0]   seg_led1,
    output wire [7:0]   seg_led2,
    input  wire         uart_rx,              //UART接收端口
    output wire         uart_tx,              //UART发送端口
    input  wire         bt_rx,  
    output wire         bt_tx   
);

/***************************************************************
                        时钟信号
****************************************************************/
// 系统时钟分频，但好像不用，能直接跑100mhz
wire clk_25;
cpuclk cpuClk (
    .clk_in1(clk),
    .clk_out1(clk_25)
);

/***************************************************************
                        设备连接
****************************************************************/

wire [15: 0]    mem_wd;
wire [15: 0]    mem_rd;
wire [15: 0]    mem_addr, inst_addr;
wire            mem_ctrl;
wire            mem_we;
wire [15: 0]    mem_data, inst_data;
wire [7:0]      irq;
wire            irq_uart;
wire            irq_bt;
wire            irq_timer;

assign mem_rd  = mem_data;
assign mem_data = (mem_ctrl) ? mem_wd : 32'hzzzzzzzz; // 写入时才接入输入
assign irq = {{5{1'b0}},irq_bt,irq_uart,irq_timer};

CPU cpu (
    .clk(clk_25),
    .rst_n(rst_n),
    .inst_data(inst_data),
    .inst_addr(inst_addr),
    .mem_addr(mem_addr),
    .mem_ctrl(mem_ctrl),
    .mem_wd(mem_wd),
    .mem_rd(mem_rd),
    .irq(irq)
);

BUS bus (
    .clk(clk_25),
    .rst_n(rst_n),
    // 设备线连接
    .switch(switch),
    .led(led),
    .tube_en(tube_en),
    .seg_led1(seg_led1),
    .seg_led2(seg_led2),
    
    .uart_rx(uart_rx),
    .uart_tx(uart_tx),
    .irq_uart(irq_uart),
    .bt_tx(bt_tx),
    .bt_rx(bt_rx),
    .irq_bt(irq_bt),
    
    .irq_timer(irq_timer),
    
    .addr(mem_addr),
    .ctrl(mem_ctrl),
    .data(mem_data),
    
    .inst_data(inst_data),
    .inst_addr(inst_addr)
);

endmodule
