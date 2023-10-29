`timescale 1ns / 1ps

module sim;

reg             clk = 0;
reg             rst_n = 0;
reg  [7: 0]     switch = 8'h01;
wire [7: 0]     led;
wire [7: 0]     tube_en;
wire [7:0]      seg_led1;
wire [7:0]      seg_led2;
reg             uart_rx = 1;      //UART接收端口
wire            uart_tx;          //UART发送端口
reg             bt_rx = 1;       
wire            bt_tx;           
reg             uart_debug = 1;

always #5 clk = ~clk;

integer i = 0;
reg [10:0] data1 = {1'b1,8'd1,1'b0};
reg [10:0] data2 = {1'b1,8'd2,1'b0};

reg [10:0] inst_data1 = {1'b1,8'h01,1'b0};
reg [10:0] inst_data2 = {1'b1,8'h19,1'b0};
reg [10:0] inst_data3 = {1'b1,8'h02,1'b0};
reg [10:0] inst_data4 = {1'b1,8'h39,1'b0};
reg [10:0] inst_data5 = {1'b1,8'h01,1'b0};
reg [10:0] inst_data6 = {1'b1,8'h00,1'b0};

initial
begin
    #100;
    rst_n = 1'b1;
    #100;
    
//    for(i = 0; i < 10 ;i = i + 1)
//        #104116 bt_rx = data1[i];

    for(i = 0; i < 10 ;i = i + 1)
        #8680 uart_rx = inst_data1[i];
    for(i = 0; i < 10 ;i = i + 1)
        #8680 uart_rx = inst_data2[i];
    for(i = 0; i < 10 ;i = i + 1)
        #8680 uart_rx = inst_data3[i];
    for(i = 0; i < 10 ;i = i + 1)
        #8680 uart_rx = inst_data4[i];
    for(i = 0; i < 10 ;i = i + 1)
        #8680 uart_rx = inst_data5[i];
    for(i = 0; i < 10 ;i = i + 1)
        #8680 uart_rx = inst_data6[i];
        
    #8680 uart_debug = 0;
end


top top(
    .clk            (clk     ),
    .rst_n          (rst_n   ),
    .switch         (switch  ),
    .led            (led     ),
    .tube_en        (tube_en  ),
    .seg_led1       (seg_led1),
    .seg_led2       (seg_led2),
    .uart_rx        (uart_rx),           //UART接收端口
    .uart_tx        (uart_tx),           //UART发送端口
    .bt_rx          (bt_rx),            
    .bt_tx          (bt_tx),
    .uart_debug     (uart_debug)
);

endmodule
