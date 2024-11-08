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


module adder_test(

   );
   
   reg a,b,cin; // ������������Ϊreg��
   wire cout,s; // ��ΪҪ��cout��s����assign��ֵ�����Զ���Ϊwire��
   adder add(a, b, cin, cout, s); // ʵ����adderģ��
   
   initial begin  // �����븳��ֵ
        a = 1;
        b = 1;
        cin = 1;
        #100  // ʹ��ֵ����100ns
        a = 1;
        b = 0;
        cin = 1;
        #100 // ʹ��ֵ����100ns
        a = 1;
        b = 0;
        cin = 0;
   end
   
endmodule
