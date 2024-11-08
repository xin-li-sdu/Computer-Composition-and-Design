`timescale 1ns / 1ps

module bin2dec (
    input wire clk,      //ʱ�ӣ�Ƶ?100MHz
    input wire [7:0] n,       //����
    output reg [7:0] led_id,    
    output reg [6:0] out_led
    );

wire [7:0] abs;                     //�洢 ����n�ľ���??    
wire [7:0] flag={8{n[7]}};           //r_flag���ڼ��㲹��     
assign abs   = (n^flag)+flag[0];    //���� ����n�ľ���ֵ??

//2���ƶ�Ӧʮ������? 
wire [7:0] num [0:3];               //����λ����λ��ʮλ����λ
assign num[0] = 4'ha+flag[0];       //�������λ��0xa����??,0xb:����
assign num[1] = abs / 100 % 10;     //�����λ
assign num[2] = abs / 10 % 10;      //����ʮλ      
assign num[3] = abs % 10;           //�����λ

reg [1:0] id=2'b00;                //�������ĸ�����?����
parameter CNT_MAX = 99999;///�趨ʱ�Ӽ�������?
reg [31:0] cnt_1ms;//����
//100MHzʱ��? 99999������Ϊ1ms
always @ (posedge clk)//ʱ������
    if (cnt_1ms == CNT_MAX)
        cnt_1ms <= 1'b0;
    else
        cnt_1ms <= cnt_1ms+1'b1;  

//1ms�л�1��id
always@(posedge clk )
    if(cnt_1ms == CNT_MAX - 1'b1)
        id <= id+1'b1;

//ѡ�����ĸ���
always @ (id)
    case(id)
        4'b0000: led_id = 8'b1111_0111;   //0
        4'b0001: led_id = 8'b1111_1011;   //1
        4'b0010: led_id = 8'b1111_1101;   //2
        4'b0011: led_id = 8'b1111_1110;   //3
        default: led_id = 8'b0000_0000;  //default to 0, should not happen
    endcase                
    
 //��ʾ����
 always @ (id)
    case(num[id])
        4'b0000: out_led = 7'b0000001;    //0
        4'b0001: out_led = 7'b1001111;    //1
        4'b0010: out_led = 7'b0010010;    //2
        4'b0011: out_led = 7'b0000110;    //3
        4'b0100: out_led = 7'b1001100;    //4
        4'b0101: out_led = 7'b0100100;    //5
        4'b0110: out_led = 7'b0100000;    //6
        4'b0111: out_led = 7'b0001111;    //7
        4'b1000: out_led = 7'b0000000;    //8
        4'b1001: out_led = 7'b0000100;    //9
        4'b1010: out_led = 7'b1111111;    //a->����
        4'b1011: out_led = 7'b1111110;    //b->��ʾ
        default: out_led = 7'b1111111;    //default to 7'b1111111, should not happen
    endcase

endmodule