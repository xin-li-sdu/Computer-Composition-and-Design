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
    input ia,  // 1位二进制加数
    input ib, // 1位二进制加数
    input cin, // 低位来的进位信号
    output cout, // 向高位的进位信号
    output sum // 1位和数
);
    
    assign cout = (ia&ib) | (ia&cin) | (ib&cin);  // 当三个输入其中两个为1时，产生进位
    assign sum = ia^ib^cin; // 和数等于三个输入异或的值
    
endmodule
