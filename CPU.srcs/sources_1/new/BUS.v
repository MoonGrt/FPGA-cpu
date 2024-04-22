module BUS (
    input  wire         clk,
    input  wire         rst_n,
    input  wire [15: 0] addr,
    inout  wire [15: 0] data,
    input  wire         ctrl,

    input  wire  [15: 0] inst_addr,
    output  wire [15: 0] inst_data,
    
    // 设备线====================================================
    // 输入设备--拨码开关
    input  wire [7:0]   switch,
    // 输出设备--LED灯
    output wire [7:0]   led,
    // 输出设备--数码管
    output wire [7:0]   tube_en,
    output wire [7:0]   seg_led1,
    output wire [7:0]   seg_led2,
    // 输出设备--UART
    input  wire         uart_rx,              //UART接收端口
    output wire         uart_tx,              //UART发送端口
    output               irq_uart,            //UART接收完成
    // 蓝牙
    input  wire         bt_rx,  
    output wire         bt_tx,
    output               irq_bt,
    
    output               irq_timer
);

reg [7: 0]  MS;    // 总线同意

/***************************************************************
                        外设时钟
****************************************************************/

inst_mem irom(
       .a(inst_addr[9: 0]),
       .spo(inst_data)
   );

/***************************************************************
                        外设时钟
****************************************************************/

wire deviceClk;

// 分频不能太少，不然设备运行不稳定
deviceclk  #(.EXTEND(10_000))
deviceCLK (
    .clk(clk),
    .rst_n(rst_n),
    .clk_out(deviceClk)
);

/***************************************************************
                        设备控制
****************************************************************/

// 总线同意信号
always @(*) begin
    if (addr[15: 8] == 8'hFF) begin // 外设
        case (addr[7: 4])
            4'h0: MS = 16'b0000_0010; // LED
            4'h1: MS = 16'b0000_0100; // 拨码开关
            4'h2: MS = 16'b0000_1000; // 数码管
            4'h3: MS = 16'b0001_0000; // UART
            4'h4: MS = 16'b0010_0000; // BT
            4'h5: MS = 16'b0100_0000; // Timer
            default: MS = 16'b0000_0000;
        endcase
    end
    else 
        MS = 8'b0000_0001; // 主存
end

/***************************************************************
                        设备连接
****************************************************************/

RAM ram (
    .clk        (clk),
    .rst_n      (rst_n),
    .EN         (MS[0]),
    .addr       (addr),
    .ctrl       (ctrl),
    .data       (data)
);

LED Led (
    .clk        (clk),
    .deviceClk  (deviceClk),
    .rst_n      (rst_n),
    .EN         (MS[1]),
    .addr       (addr),
    .ctrl       (ctrl),
    .data       (data),
    .led        (led)
);

Switch Switch (
    .clk        (clk),
    .deviceClk  (deviceClk),
    .rst_n      (rst_n),
    .EN         (MS[2]),
    .addr       (addr),
    .ctrl       (ctrl),
    .data       (data),
    .switch     (switch)
);

Tube Tube (
    .clk        (clk),
    .deviceClk  (deviceClk),
    .rst_n      (rst_n),
    .EN         (MS[3]),
    .addr       (addr),
    .ctrl       (ctrl),
    .data       (data),
    .tube_en    (tube_en),
    .seg_led1   (seg_led1),
    .seg_led2   (seg_led2)
);
                          
UART #(                          
    .CLK_FREQ       (2500_0000),    //设置系统时钟频率
    .UART_BPS       (115200))         //设置串口接收波特率
UART(
    .clk         (clk      ),
    .deviceClk   (deviceClk),
    .rst_n       (rst_n    ),
    .EN          (MS[4]    ),          // 总线同意信号
    .addr        (addr     ),
    .ctrl        (ctrl     ),
    .data        (data     ),          // 与总线连接
    .uart_rxd    (uart_rx  ),          //UART接收端口
    .uart_txd    (uart_tx  ),          //UART发送端口
    .irq_uart    (irq_uart )
);

UART #(                          
    .CLK_FREQ       (2500_0000),      //设置系统时钟频率
    .UART_BPS       (9600))             //设置串口接收波特率
UART_bt(
    .clk         (clk      ),
    .deviceClk   (deviceClk),
    .rst_n       (rst_n    ),
    .EN          (MS[5]    ), // 总线同意信号
    .addr        (addr     ),
    .ctrl        (ctrl     ),
    .data        (data     ), // 与总线连接
    .uart_rxd    (bt_rx    ), 
    .uart_txd    (bt_tx    ),
    .irq_uart    (irq_bt   )
);

Timer Timer(
    .clk        (clk      ),
    .deviceClk  (deviceClk),
    .rst_n      (rst_n    ),
    .EN         (MS[6]    ),
    .addr       (addr     ),
    .data       (data     ),
    .ctrl       (ctrl     ),
    .irq_timer  (irq_timer)
);

endmodule
