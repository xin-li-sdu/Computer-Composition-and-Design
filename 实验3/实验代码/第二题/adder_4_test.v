`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/17 19:40:57
// Design Name: 
// Module Name: test
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


module adder_4_test(

   );
   
   reg [3:0] a;
   reg [3:0] b;
   reg cin; // ������������Ϊreg��
   wire cf;
   wire [3:0] s; // ��ΪҪ��cf��s����assign��ֵ�����Զ���Ϊwire��
   adder_4 adder4(a, b, cin, s, cf); // ʵ����adderģ��
   
   initial begin  // �����븳��ֵ
        a = 4'b0001;
        b = 4'b0011;
        cin = 1;
        #100  // ʹ��ֵ����100ns
        a = 4'b1000;
        b = 4'b1010;
        cin = 0;
        #100 // ʹ��ֵ����100ns
        a = 4'b0011;
        b = 4'b0110;
        cin = 0;
        #100
        a = 4'b0111;
        b = 4'b0000;
        cin = 1;
   end
   
endmodule
