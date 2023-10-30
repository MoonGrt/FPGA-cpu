`timescale 1ns / 1ps

module sim;

reg             clk = 0;
reg             rst_n = 0;
reg  [7: 0]     switch = 8'b1000_0110;
wire [7: 0]     led;
wire [7: 0]     tube_en;
wire [7:0]      seg_led1;
wire [7:0]      seg_led2;
reg             uart_rx = 1;      //UART接收端口
wire            uart_tx;          //UART发送端口
reg             bt_rx = 1;       
wire            bt_tx;           
//reg             uart_debug = 1;

always #5 clk = ~clk;

integer i = 0, j = 1;
reg [15:0] inst_data [9:1];
//initial
//begin
//    inst_data[1] = 16'hff39;
//    inst_data[2] = 16'h4035;
//    inst_data[3] = 16'h1039;
//    inst_data[4] = 16'h015a;
//    inst_data[5] = 16'h8035;
//    inst_data[6] = 16'hff39;
//    inst_data[7] = 16'h4035;
//    inst_data[8] = 16'h015b;
//    inst_data[9] = 16'h0000;    
//end
initial
begin
    inst_data[1] = 16'h0f59;
    inst_data[2] = 16'hff39;
    inst_data[3] = 16'h4035;
    inst_data[4] = 16'h015b;
    inst_data[5] = 16'h0000;    
end

initial
begin
    #100;
    rst_n = 1'b1;
    #100;
    
//  115200 延时 8680
//    9600 延时 104116

    for(j = 1; j <= 5; j = j + 1)begin
        for(i = 0; i < 10; i = i + 1)
                #8680
                case (i)
                    4'h0 : uart_rx = 0;
                    4'h1 : uart_rx = inst_data[j][i+7];
                    4'h2 : uart_rx = inst_data[j][i+7];
                    4'h3 : uart_rx = inst_data[j][i+7];
                    4'h4 : uart_rx = inst_data[j][i+7];
                    4'h5 : uart_rx = inst_data[j][i+7];
                    4'h6 : uart_rx = inst_data[j][i+7];
                    4'h7 : uart_rx = inst_data[j][i+7];
                    4'h8 : uart_rx = inst_data[j][i+7];
                    4'h9 : uart_rx = 1;
                endcase
        for(i = 0; i < 10; i = i + 1)
                    #8680
                    case (i)
                        4'h0 : uart_rx = 0;
                        4'h1 : uart_rx = inst_data[j][i-1];
                        4'h2 : uart_rx = inst_data[j][i-1];
                        4'h3 : uart_rx = inst_data[j][i-1];
                        4'h4 : uart_rx = inst_data[j][i-1];
                        4'h5 : uart_rx = inst_data[j][i-1];
                        4'h6 : uart_rx = inst_data[j][i-1];
                        4'h7 : uart_rx = inst_data[j][i-1];
                        4'h8 : uart_rx = inst_data[j][i-1];
                        4'h9 : uart_rx = 1;
                    endcase
    end
    
//    for(i = 0; i < 10 ;i = i + 1)
//        #8680 uart_rx = inst_data1[i];

    #8680 switch[7] = 0;
//    #100 switch = 8'b1000_0000;
//    #100 switch = 8'b0000_0000;
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
    .bt_tx          (bt_tx)
//    .uart_debug     (uart_debug)
);

endmodule
