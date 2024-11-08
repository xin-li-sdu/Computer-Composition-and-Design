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


module add_sub_test(

   );
   
   reg [3:0] a;
   reg [3:0] b;
   reg cin; // ������������Ϊreg��
   reg op;
   wire overflow;
   wire [3:0] s; // ��ΪҪ��overflow��s����assign��ֵ�����Զ���Ϊwire��
   add_sub add_sub1(a, b, cin, op, s, overflow); // ʵ����adderģ��
   
   initial begin  // �����븳��ֵ
        a = 4'b0001;
        b = 4'b0011;
        op = 0;
        cin = 1;
        #100  // ʹ��ֵ����100ns
        a = 4'b1000;
        b = 4'b1010;
        op = 0;
        cin = 0;
        #100 // ʹ��ֵ����100ns
        a = 4'b0111;
        b = 4'b1000;
        op = 0;
        cin = 1;
        #100
        a = 4'b0001;
        b = 4'b0011;
        op = 1;
        cin = 0;
        #100  // ʹ��ֵ����100ns
        a = 4'b1000;
        b = 4'b1010;
        op = 1;
        cin = 0;
        #100 // ʹ��ֵ����100ns
        a = 4'b0111;
        b = 4'b1000;
        op = 1;
        cin = 0;
   end
   
endmodule
