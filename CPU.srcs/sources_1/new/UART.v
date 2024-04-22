`include "para.v"
module UART (
    input    wire         clk,
    input    wire         deviceClk,
    input    wire         rst_n,
    input    wire         EN, // ����ͬ���ź�
    input    wire [15: 0] addr,
    inout    wire [15: 0] data,
    input    wire         ctrl,

    input           uart_rxd,           //UART���ն˿�
    output          uart_txd,           //UART���Ͷ˿�
    output          irq_uart            //UART�������
);

//parameter define
parameter  CLK_FREQ = 5000_0000;         //����ϵͳʱ��Ƶ��
parameter  UART_BPS = 115200;           //���崮�ڲ�����
    
//wire define   
wire [7:0] uart_recv_data;              //UART��������
wire [7:0] uart_send_data;              //UART��������
wire       uart_tx_busy;                //UART����æ״̬��־

// ������
wire [15: 0] data_input; // ���� -> ����
wire [15: 0] input_data; // ���� -> ����
// �����
wire [15: 0] data_output; // ���� -> ����
wire [15: 0] output_data; // ���� -> ����

/***************************************************************
                        �����߼�
****************************************************************/

// �����������
wire input_call;    // ����
wire output_call;   // ���

// ��д����
assign input_call  = ((EN == 1'b1) && (ctrl == `IO_CTRL_WRITE)) ? 1'b1 : 1'b0;
assign output_call = ((EN == 1'b1) && (ctrl == `IO_CTRL_READ)) ? 1'b1 : 1'b0;

/***************************************************************
                        ���ݽ��濪��
****************************************************************/
// ��ַ����Ϳ����߼��ڲ���ϣ��������ݽ��濪�ؿ���
// data�������
assign data =  (output_call) ? data_output :            // ����ͬ�⣬�������
       16'dz;                   // δ����״��
// data�������
assign data_input = data;

/***************************************************************
                        ���뵽 ����
****************************************************************/
wire clk_input;
assign clk_input = clk; // ʱ�������ض�ȡ����

// ���뻺��
Buffer #(.WIDTH(16))
input_buf (
    .clk(clk_input),
    .rst_n(rst_n),
    .din(data_input),
    .we(input_call),
    .dout(input_data)
);
       
//���ڷ���ģ��    
uart_send #(                          
    .CLK_FREQ       (CLK_FREQ),         //����ϵͳʱ��Ƶ��
    .UART_BPS       (UART_BPS))         //���ô��ڷ��Ͳ�����
u_uart_send(                 
    .sys_clk        (clk),
    .sys_rst_n      (rst_n),
     
    .uart_en        (input_call),
    .uart_din       (input_data[7:0]),
    .uart_tx_busy   (uart_tx_busy),
    .uart_txd       (uart_txd)
);

/***************************************************************
                        ����� CPU
****************************************************************/
wire clk_output;
assign clk_output = clk;
assign output_data = {24'b0, uart_recv_data};

Buffer  #(.WIDTH(16))
output_buf (
    .clk(clk_output),
    .rst_n(rst_n),
    .we(1'b1),
    .din(output_data),
    .dout(data_output)
);

//���ڽ���ģ��     
uart_recv #(                          
    .CLK_FREQ       (CLK_FREQ),         //����ϵͳʱ��Ƶ��
    .UART_BPS       (UART_BPS))         //���ô��ڽ��ղ�����
u_uart_recv(                 
    .sys_clk        (clk), 
    .sys_rst_n      (rst_n),
    
    .uart_rxd       (uart_rxd),
    .uart_done      (),
    .done_flag      (irq_uart),
    .uart_data      (uart_recv_data)
    );

endmodule
