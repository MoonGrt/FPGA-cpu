`timescale 1ns / 1ps
`define IO_CTRL_READ       1'b0    // 不写
`define IO_CTRL_WRITE      1'b1    // 写
module top_sim;

reg             clk = 0;
reg             rst_n = 0;

reg  [7: 0]        switch = 8'h01;
wire [7: 0]           led;
wire [7: 0]     led_en;
wire [7:0]          seg_led1;
wire [7:0]          seg_led2;
reg          uart_rx = 1;           //UART接收端口
wire          uart_tx;            //UART发送端口
reg          bt_rx = 1;           //UART接收端口
wire          bt_tx;            //UART发送端口

// Generate the 100.0MHz CPU/AXI clk
always #5 clk = ~clk;

initial
begin
    rst_n <= 1'b0;
    #100;
    rst_n <= 1'b1;
    #100;
     
//     uart_rx = 0;
//     #8680
//     uart_rx = 1;
//     #8680
//     uart_rx = 1;
//     #8680
//     uart_rx = 0;
//     #8680
//     uart_rx = 0;
//     #8680
//     uart_rx = 1;
//     #8680
//     uart_rx = 0;
//     #8680
//     uart_rx = 1;
//     #8680
//     uart_rx = 0;
//     #8680
//     uart_rx = 1;
     
//     #8680
     
//     uart_rx = 0;
//     #8680
//     uart_rx = 1;
//     #8680
//     uart_rx = 1;
//     #8680
//     uart_rx = 0;
//     #8680
//     uart_rx = 0;
//     #8680
//     uart_rx = 1;
//     #8680
//     uart_rx = 0;
//     #8680
//     uart_rx = 1;
//     #8680
//     uart_rx = 1;
//     #8680
//     uart_rx = 1;

     bt_rx = 0;
     #104160
     bt_rx = 1;
     #104160
     bt_rx = 1;
     #104160
     bt_rx = 0;
     #104160
     bt_rx = 0;
     #104160
     bt_rx = 1;
     #104160
     bt_rx = 0;
     #104160
     bt_rx = 1;
     #104160
     bt_rx = 0;
     #104160
     bt_rx = 1;
     
     #104160
     
     bt_rx = 0;
     #104160
     bt_rx = 1;
     #104160
     bt_rx = 1;
     #104160
     bt_rx = 0;
     #104160
     bt_rx = 0;
     #104160
     bt_rx = 1;
     #104160
     bt_rx = 0;
     #104160
     bt_rx = 1;
     #104160
     bt_rx = 1;
     #104160
     bt_rx = 1;
     
end



/***************************************************************
                        设备连接
****************************************************************/

wire [15: 0]    mem_wd;
wire [15: 0]    mem_rd;
wire [15: 0]    mem_addr;
wire            mem_ctrl;
wire            mem_we;
wire [15: 0]    mem_data;
wire [7:0]      irq;
wire            irq_uart;
wire            irq_bt;
wire            irq_timer;

assign mem_rd  = mem_data;
assign mem_data = (mem_ctrl) ? mem_wd : 32'hzzzzzzzz; // 写入时才接入输入
assign irq = {{5{1'b0}},irq_bt,irq_uart,irq_timer};

//CPU cpu (
//    .clk(clk),
//    .rst_n(rst_n),
//    .mem_addr(mem_addr),
//    .mem_ctrl(mem_ctrl),
//    .mem_wd(mem_wd),
//    .mem_rd(mem_rd),
//    .irq(irq)
//);

wire [15: 0]    inst;
wire [15: 0]    RD;
wire [15: 0]    RS;
wire [15: 0]    IMM;
wire [15: 0]    DRAMdata;
wire [15: 0]    WB;
wire [15: 0]    ALUout;
wire [1: 0]     CMPout;
wire [2:0]      ALUop;
wire            IMMop;
wire [15: 0]    COMPExOut;
wire            PCSel;
wire            ABSel;
wire            DRAMWE;
wire [1: 0]     RWSel;

assign DRAMdata = mem_rd;
assign mem_addr = ALUout;
assign mem_wd = RD;

//IF If (
//       .clk(clk),
//       .rst_n(rst_n),
//       .branch_pc(IMM),
//       .PCSel(PCSel),
//       .inst(inst),
//       .irq(irq)
//   );
   reg [15: 0] pc,npc;
wire [15: 0] pc4;

assign pc4 = (inst || (pc == 16'hffff)) ? (pc + 1) : pc;

/***************************************************************
                        main
****************************************************************/

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) 
        pc <= -1;
    else
        pc <= npc;
end

always @(*) begin
    case (irq)
        8'b0000_0001: // timer
            npc = 8'd0;
        8'b0000_0010: // uart
            npc = 8'd5;
        8'b0000_0100: // bt
            npc = 8'd5;
        default:
            npc = (PCSel) ? IMM : pc4;
    endcase
end

inst_mem irom(
       .a(pc[9: 0]),
       .spo(inst)
   );
//ID Id (
//       .clk(clk),
//       .rst_n(rst_n),
//       .inst(inst),
//       .WB(WB),
//       .CMPout(CMPout),
       
//       .RD(RD),
//       .RS(RS),
//       .IMM(IMM),
//       .ALUop(ALUop),
//       .IMMop(IMMop),
//       .RWSel(RWSel),
//       .PCSel(PCSel),
//       .ABSel(ABSel),
//       .mem_ctrl(mem_ctrl)
//   );

/***************************************************************
                        wire reg
****************************************************************/

wire [2: 0]    rd;
wire [2: 0]    rs;
wire [4: 0]    opecode;
wire           RegWe;
wire           IMMSel;

assign opecode = inst[4: 0];
assign rd      = inst[7: 5];
assign rs      = inst[10: 8];
//assign IMM     = IMMSel ? {{8{1'b0}}, inst[15: 8]}:{{11{inst[15]}}, inst[15: 11]};
assign IMM     = IMMSel ? {{8{1'b0}}, inst[15: 8]}:{{11{1'b0}}, inst[15: 11]};   // 立即数设定为无符号数，扩展不考虑负数情况
 
//REG Reg (
//            .clk(clk),
//            .rst_n(rst_n),
//            .rd(rd),
//            .rs(rs),
//            .WB(WB),
//            .RegWe(RegWe),
//            .RD(RD),
//            .RS(RS)
//        );
        reg[15: 0] rf[7:0]; // 寄存器

assign    RD = (rd == 0) ? 0 : rf[(rd)];
assign    RS = (rs == 0) ? 0 : rf[(rs)];

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        rf[0][15: 0] <= 16'h0;
        rf[1][15: 0] <= 16'h0;
        rf[2][15: 0] <= 16'h0;
        rf[3][15: 0] <= 16'h0;
        rf[4][15: 0] <= 16'h0;
        rf[5][15: 0] <= 16'h0;
        rf[6][15: 0] <= 16'h0;
        rf[7][15: 0] <= 16'h0;
    end
    else if (RegWe == `REGWE_WRITE) begin
        rf[(rd)] <= WB;
    end
end
crtl ctrl (
         .rst_n(rst_n),
         .opecode(opecode),
         .CMPout(CMPout),
         .PCSel(PCSel),
         .IMMop(IMMop),
         .ALUop(ALUop),
         .RegWe(RegWe),
         .mem_ctrl(mem_ctrl),
         .RWSel(RWSel),
         .ABSel(ABSel),
         .IMMSel(IMMSel)
     );
     
EX Ex (
       .RD(RD),
       .RS(RS),
       .IMM(IMM),
       .ABSel(ABSel),
       .IMMop(IMMop),
       .ALUop(ALUop),
       .CMPout(CMPout),
       .ALUout(ALUout)
   );

WB Wb (
       .ALUout(ALUout),
       .DRAMdata(DRAMdata),
       .RWSel(RWSel),
       .WB(WB)
   );



BUS bus (
    .clk(clk),
    .rst_n(rst_n),
    // 设备线连接
    .switch(switch),
    .led(led),
    .led_en(led_en),
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
    .data(mem_data)
);

//reg [7: 0]  BG;    // 总线同意

///***************************************************************
//                        外设时钟
//****************************************************************/

//wire deviceClk;

//// 分频不能太少，不然设备运行不稳定
//deviceclk  #(.EXTEND(100000))  // 25000
//deviceCLK (
//    .clk(clk),
//    .rst_n(rst_n),
//    .clk_out(deviceClk)
//);

///***************************************************************
//                        设备控制
//****************************************************************/

//// 总线同意信号
//always @(*) begin
//    if (mem_addr[15: 8] == 8'hFF) begin // 外设
//        case (mem_addr[7: 4])
//            4'h0: BG = 16'b0000_0010; // LED
//            4'h1: BG = 16'b0000_0100; // 拨码开关
//            4'h2: BG = 16'b0000_1000; // 数码管
//            4'h3: BG = 16'b0001_0000; // UART
//            4'h4: BG = 16'b0010_0000; // BT
//            4'h5: BG = 16'b0100_0000; // Timer
//            default: BG = 16'b0000_0000;
//        endcase
//    end
//    else 
//        BG = 8'b0000_0001; // 主存
//end

///***************************************************************
//                        设备连接
//****************************************************************/

//RAM ram (
//    .clk(clk),
//    .rst_n(rst_n),
//    .BG(BG[0]),
//    .addr(mem_addr),
//    .ctrl(mem_ctrl),
//    .data(mem_data)
//);

//LED Led (
//    .clk(clk),
//    .deviceClk(deviceClk),
//    .rst_n(rst_n),
//    .BG(BG[1]),
//    .addr(mem_addr),
//    .ctrl(mem_ctrl),
//    .data(mem_data),
//    .led(led)
//);

//Switch Switch (
//    .clk(clk),
//    .deviceClk(deviceClk),
//    .rst_n(rst_n),
//    .BG(BG[2]),
//    .addr(mem_addr),
//    .ctrl(mem_ctrl),
//    .data(mem_data),
//    .switch(switch)
//);

//Tube tube (
//    .clk(clk),
//    .deviceClk(deviceClk),
//    .rst_n(rst_n),
//    .BG(BG[3]),
//    .addr(mem_addr),
//    .ctrl(mem_ctrl),
//    .data(mem_data),
//    .led_en(led_en),
//    .seg_led1(seg_led1),
//    .seg_led2(seg_led2)
//);
                          
//UART #(                          
//    .CLK_FREQ       (1_0000_0000),         //设置系统时钟频率
//    .UART_BPS       (115200))         //设置串口接收波特率
//uart(
//    .clk         (clk      ),
//    .deviceClk   (deviceClk),
//    .rst_n       (rst_n    ),
//    .BG          (BG[4]    ), // 总线同意信号
//    .addr        (mem_addr     ),
//    .ctrl        (mem_ctrl),
//    .data        (mem_data     ), // 与总线连接
//    .uart_rxd    (uart_rx  ),           //UART接收端口
//    .uart_txd    (uart_tx  ),           //UART发送端口
//    .irq_uart    (irq_uart)
//);

//UART #(                          
//    .CLK_FREQ       (1_0000_0000),         //设置系统时钟频率
//    .UART_BPS       (9600))         //设置串口接收波特率
//uart_bt(
//    .clk         (clk      ),
//    .deviceClk   (deviceClk),
//    .rst_n       (rst_n    ),
//    .BG          (BG[5]    ), // 总线同意信号
//    .addr        (mem_addr     ),
//    .ctrl        (mem_ctrl),
//    .data        (mem_data     ), // 与总线连接
//    .uart_rxd    (bt_rx    ), 
//    .uart_txd    (bt_tx    ),
//    .irq_uart    (irq_bt)
//);

//Timer timer(
//    .clk        (clk      ),
//    .deviceClk  (deviceClk),
//    .rst_n      (rst_n    ),
//    .BG         (BG[6]    ),
//    .addr       (mem_addr     ),
//    .data       (mem_data     ),
//    .ctrl       (mem_ctrl     ),
//    .irq_timer  (irq_timer)
//);



////parameter define
//parameter  CLK_FREQ = 1_0000_0000;         //定义系统时钟频率
//parameter  UART_BPS = 115200;           //定义串口波特率
    
////wire define   
//wire [7:0] uart_recv_data;              //UART接收数据
//wire [7:0] uart_send_data;              //UART发送数据
//wire       uart_tx_busy;                //UART发送忙状态标志

//// 输入线
//wire [15: 0] data_input; // 数据 -> 缓冲
//wire [15: 0] input_data; // 缓冲 -> 数据
//// 输出线
//wire [15: 0] data_output; // 数据 -> 缓冲
//wire [15: 0] output_data; // 缓冲 -> 数据

///***************************************************************
//                        控制逻辑
//****************************************************************/

//// 输入输出控制
//wire input_call;    // 输入
//wire output_call;   // 输出

//// 读写控制
//assign input_call  = ((BG[4] == 1'b1) && (mem_ctrl == `IO_CTRL_WRITE)) ? 1'b1 : 1'b0;
//assign output_call = ((BG[4] == 1'b1) && (mem_ctrl == `IO_CTRL_READ)) ? 1'b1 : 1'b0;

///***************************************************************
//                        数据交叉开关
//****************************************************************/
//// 地址译码和控制逻辑内部耦合，无需数据交叉开关控制
//// data输出控制
//assign mem_data =  (output_call) ? data_output :            // 总线同意，数据输出
//       16'dz;                   // 未定义状况
//// data输入控制
//assign data_input = mem_data;

///***************************************************************
//                        输入到 外设
//****************************************************************/
//wire clk_input;
//assign clk_input = clk; // 时钟上升沿读取输入

//// 输入缓冲
//Buffer #(.WIDTH(16))
//input_buf (
//    .clk(clk_input),
//    .rst_n(rst_n),
//    .din(data_input),
//    .we(input_call),
//    .dout(input_data)
//);
       
////串口发送模块    
//uart_send #(                          
//    .CLK_FREQ       (CLK_FREQ),         //设置系统时钟频率
//    .UART_BPS       (UART_BPS))         //设置串口发送波特率
//u_uart_send(                 
//    .sys_clk        (clk),
//    .sys_rst_n      (rst_n),
     
//    .uart_en        (input_call),
//    .uart_din       (input_data[7:0]),
//    .uart_tx_busy   (uart_tx_busy),
//    .uart_txd       (uart_tx)
//);

///***************************************************************
//                        输出到 CPU
//****************************************************************/
//wire clk_output;
//assign clk_output = clk;
//assign output_data = {24'b0, uart_recv_data};

//Buffer  #(.WIDTH(16))
//output_buf (
//    .clk(clk_output),
//    .rst_n(rst_n),
//    .we(1'b1),
//    .din(output_data),
//    .dout(data_output)
//);

////串口接收模块     
//uart_recv #(                          
//    .CLK_FREQ       (CLK_FREQ),         //设置系统时钟频率
//    .UART_BPS       (UART_BPS))         //设置串口接收波特率
//u_uart_recv(                 
//    .sys_clk        (clk), 
//    .sys_rst_n      (rst_n),
    
//    .uart_rxd       (uart_rx),
//    .uart_done      (),
//    .done_flag      (irq_uart),
//    .uart_data      (uart_recv_data)
//    );
    
    
endmodule
