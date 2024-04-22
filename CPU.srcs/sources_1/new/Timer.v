`include "para.v"
module Timer (
    input  wire          clk,
    input  wire          deviceClk,
    input  wire          rst_n,
    input  wire          EN, // ����ͬ���ź�
    input  wire [15: 0]  addr,
    inout  wire [15: 0]  data,
    input  wire          ctrl,
    
    output wire          irq_timer
);

reg en = 0;

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
// ��������
counter counter (
    .en(en),
    .clk(clk),
    .cnt(input_data),
    .irq(irq_timer)
);

/***************************************************************
                        ����� CPU
****************************************************************/
//wire clk_output;
//assign clk_output = clk;

//Buffer  #(.WIDTH(32))
//output_buf (
//    .clk(clk_output),
//    .rst_n(rst_n),
//    .we(1'b1),
//    .din(output_data),
//    .dout(data_output)
//);

endmodule
