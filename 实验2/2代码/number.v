

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/11 20:31:43
// Design Name: 
// Module Name: number
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module number(
    input a,
    input b,
    input c,
    input d,
    output [7:0] led_id,
    output reg [7:0] out_led 
    );
    
    wire [3:0] i;
    assign i = {a,b,c,d}; // ��a b c d ��ϳ�һ���ı��ص�wire
    
    assign led_id = 8'b1111_1110; // �˸����طֱ���ư˸�led�ƣ�0��ʾ�õƿ���
    
    //�߶������
    always @(*) begin
         case(i)  // �˸����ؿ���led�Ƶİ˸��ƹܣ�����С���㣩��0��ʾ�õƹܿ���
                4'b0000: out_led = 8'b0000_0011;    //0
                4'b0001: out_led = 8'b1001_1111;    //1
                4'b0010: out_led = 8'b0010_0101;    //2
                4'b0011: out_led = 8'b0000_1101;    //3
                4'b0100: out_led = 8'b1001_1001;    //4
                4'b0101: out_led = 8'b0100_1001;    //5
                4'b0110: out_led = 8'b0100_0001;    //6
                4'b0111: out_led = 8'b0001_1111;    //7
                4'b1000: out_led = 8'b0000_0001;    //8
                4'b1001: out_led = 8'b0000_1001;    //9
                4'b1010: out_led = 8'b0001_0001;    //A
                4'b1011: out_led = 8'b1100_0001;    //b
                4'b1100: out_led = 8'b0110_0011;    //C
                4'b1101: out_led = 8'b1000_0101;    //d
                4'b1110: out_led = 8'b0110_0001;    //E
                4'b1111: out_led = 8'b0111_0001;    //F             
                default:
                   out_led = 8'b1111_1111;
           endcase
       end
endmodule
