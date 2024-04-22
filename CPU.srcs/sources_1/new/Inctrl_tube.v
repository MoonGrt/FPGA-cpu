module InCtrl_tube (
    input  wire          clk,
    input  wire          deviceClk,
    input  wire          rst_n,
    input  wire          we,
    input  wire [15: 0]  num_in,
    output wire [7: 0]   tube_en,
    output wire [7: 0]   seg_led1,
    output wire [7: 0]   seg_led2
);

// ��ʾ������
reg [3 : 0] num;
// ״̬: �߰�λ��Ϊ�����ʹ���ź�
reg [7: 0]  statu;
assign tube_en = statu;

reg	[31:0]	data;
reg	[15:0]	data_r;
reg			byte_flag;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) begin
		data_r <= 0;
		byte_flag <= 0;
		data <= 0;
	end
	else if(we) begin
		byte_flag <= ~byte_flag;
		data_r <= num_in;
		if(byte_flag == 1'b1) 
			data <= {data_r, num_in};	//MSB -> LSB
		else
			data <= data;
	end
	else begin
		data_r <= data_r;
		byte_flag <= byte_flag;
		data <= data;
	end
end

/***************************************************************
                        ��ʾ�߼�
****************************************************************/

reg [6: 0] led;
assign seg_led1[6:0] = led[6: 0];
assign seg_led2[6:0] = led[6: 0];
assign seg_led1[7] = 1'b0;
assign seg_led2[7] = 1'b0;

always @(*) begin
    case (num)
	    4'h0 : led[6: 0] = 7'b0111111; //��ʾ"0"
        4'h1 : led[6: 0] = 7'b0000110; //��ʾ"1"
        4'h2 : led[6: 0] = 7'b1011011; //��ʾ"2"
        4'h3 : led[6: 0] = 7'b1001111; //��ʾ"3"
        4'h4 : led[6: 0] = 7'b1100110; //��ʾ"4"
        4'h5 : led[6: 0] = 7'b1101101; //��ʾ"5"
        4'h6 : led[6: 0] = 7'b1111101; //��ʾ"6"
        4'h7 : led[6: 0] = 7'b0000111; //��ʾ"7"
        4'h8 : led[6: 0] = 7'b1111111; //��ʾ"8"
        4'h9 : led[6: 0] = 7'b1101111; //��ʾ"9"
        4'ha : led[6: 0] = 7'b1110111; //��ʾ"a"
        4'hb : led[6: 0] = 7'b1111100; //��ʾ"b"
        4'hc : led[6: 0] = 7'b0111001; //��ʾ"c"
        4'hd : led[6: 0] = 7'b1011110; //��ʾ"d"
        4'he : led[6: 0] = 7'b1111001; //��ʾ"e"
        4'hf : led[6: 0] = 7'b1110001; //��ʾ"f"
    endcase
end

/***************************************************************
                        �����߼�
****************************************************************/

always @(*) begin
    case ( tube_en )
    8'b00000001: num = data[3 : 0];
    8'b00000010: num = data[7 : 4];
    8'b00000100: num = data[11 : 8];
    8'b00001000: num = data[15 : 12];
    8'b00010000: num = data[19 : 16];
    8'b00100000: num = data[23 : 20];
    8'b01000000: num = data[27 : 24];
    8'b10000000: num = data[31 : 28];
    default:     num = 4'd0;
    endcase
end

/***************************************************************
                        ״̬�߼�
****************************************************************/

always @( posedge deviceClk or negedge rst_n ) begin
    if ( ~rst_n ) 
        statu[7: 0] <= 8'b00000000;
    else begin
        if (statu[7: 0] == 8'b00000000) 
            statu[7 : 0] <= 8'b00000001;
        else 
            statu[7 : 0] <= {statu[6: 0], statu[7]};
    end
end

endmodule
