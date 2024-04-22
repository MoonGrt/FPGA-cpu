`timescale 1ns / 1ps

module sim;

reg             clk = 0;
reg             rst_n = 0;
reg [7: 0]  switch = 8'h01;
wire [7: 0]  led;
wire [7: 0]  tube_en;
wire [7:0]   seg_led1;
wire [7:0]   seg_led2;
reg  uart_rx = 1;          //UART接收端口
wire uart_tx;          //UART发送端口
reg  bt_rx = 1;            //UART接收端口
wire bt_tx;            //UART发送端口

always #5 clk = ~clk;

initial
begin
    rst_n <= 1'b0;
    #1000;
    rst_n <= 1'b1;
    #1000;
    
    //one
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 1;
    #104116
    bt_rx = 1;
    #200000
    
    //twe
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 1;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 1;
    #200000
     
    //three
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    
    bt_rx = 0;
    #104116
    bt_rx = 1;
    #104116
    bt_rx = 1;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 1;
    #200000
     
    //four
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    
    bt_rx = 0;
    #104116
    bt_rx = 1;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 0;
    #104116
    bt_rx = 1;
    #200000;
end




top top(
    .clk            (clk     ),
    .rst_n          (rst_n   ),
    .switch         (switch  ),
    .led            (led     ),
    .tube_en         (tube_en  ),
    .seg_led1       (seg_led1),
    .seg_led2       (seg_led2),
    .uart_rx       (uart_rx),           //UART接收端口
    .uart_tx       (uart_tx),           //UART发送端口
    .bt_rx       (bt_rx),           //UART接收端口
    .bt_tx       (bt_tx)           //UART发送端口
);

endmodule
