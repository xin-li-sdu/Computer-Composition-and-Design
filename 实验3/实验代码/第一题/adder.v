`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/17 19:35:00
// Design Name: 
// Module Name: adder
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


module adder(
    input ia,  // 1λ�����Ƽ���
    input ib, // 1λ�����Ƽ���
    input cin, // ��λ���Ľ�λ�ź�
    output cout, // ���λ�Ľ�λ�ź�
    output sum // 1λ����
);
    
    assign cout = (ia&ib) | (ia&cin) | (ib&cin);  // ������������������Ϊ1ʱ��������λ
    assign sum = ia^ib^cin; // ��������������������ֵ
    
endmodule
