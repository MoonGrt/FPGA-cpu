`include "para.v"
module RAM (
    input  wire         clk,
    input  wire         rst_n,
    input  wire         EN,
    input  wire [15: 0] addr,
    inout  wire [15: 0] data,
    input  wire         ctrl
);

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
assign data = (output_call) ? output_data :  // ����ͬ�⣬�������
       16'dz;                // δ����״��
// data�������
assign data_input = data;

/***************************************************************
                        ��������޻���
****************************************************************/

// ��������
data_mem DataMem (
    .clk(clk),
    .we(input_call),
    .a(addr),
    .d(data_input),
    .spo(output_data)
);
        
endmodule
