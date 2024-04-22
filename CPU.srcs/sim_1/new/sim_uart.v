`timescale 1ns / 1ps

module sim_uart;

reg clk = 0;
reg rst_n;
reg uart_rxd = 1;
//parameter define
parameter  CLK_FREQ = 100_000_000;         //����ϵͳʱ��Ƶ��
parameter  UART_BPS = 115200;           //���崮�ڲ�����

//wire define
wire        recv_done;
wire [7:0]  recv_data;
wire        done_flag;

// Generate the 50.0MHz CPU/AXI clk
always #5 clk = ~clk;

initial
begin
    rst_n <= 1'b0;
    #1000;
    rst_n <= 1'b1;
    #1000;
    
    uart_rxd = 0;
    #8680
    uart_rxd = 1;
    #8680
    uart_rxd = 1;
    #8680
    uart_rxd = 0;
    #8680
    uart_rxd = 0;
    #8680
    
    uart_rxd = 1;
    #8680
    uart_rxd = 0;
    #8680
    uart_rxd = 1;
    #8680
    uart_rxd = 0;
    #8680
    uart_rxd = 1;
end

//���ڽ���ģ��     
uart_recv #(                          
    .CLK_FREQ       (CLK_FREQ),         //����ϵͳʱ��Ƶ��
    .UART_BPS       (UART_BPS))         //���ô��ڽ��ղ�����
u_uart_recv(                 
    .sys_clk        (clk), 
    .sys_rst_n      (rst_n),
    .uart_rxd       (uart_rxd),
    .done_flag      (done_flag),
    .uart_done      (recv_done),
    .uart_data      (recv_data)
);

endmodule
