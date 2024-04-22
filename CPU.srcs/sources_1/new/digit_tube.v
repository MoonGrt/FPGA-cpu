`include "para.v"
module Tube (
    input  wire         clk,
    input  wire         deviceClk,
    input  wire         rst_n,
    input  wire         EN,
    input  wire [15: 0] addr,
    inout  wire [15: 0] data,
    input  wire         ctrl,

    // ����豸--LED�����
    output wire [7: 0]  tube_en,
    output wire [7: 0]  seg_led1,
    output wire [7 :0]  seg_led2
);

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
wire [15: 0] data_input; 
wire [15: 0] data_output; 
// ��ַ����Ϳ����߼��ڲ���ϣ��������ݽ��濪�ؿ���
// data�������
assign data =  (output_call) ? data_output :            // ����ͬ�⣬�������
       16'dz;                   // δ����״��
// data�������
assign data_input = data;

// ����ת��
InCtrl_tube inctrl_tube (
    .clk(clk),
    .deviceClk(deviceClk),
    .rst_n(rst_n),
    .we(input_call), 
    .num_in(data_input),
    .tube_en(tube_en),
    .seg_led1(seg_led1),
    .seg_led2(seg_led2)
);

endmodule
