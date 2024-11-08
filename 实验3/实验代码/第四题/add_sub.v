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


module add_sub(
    input [3:0] a, //四位有符号数补码
    input [3:0] b, //四位有符号数补码
    input cin, //低位来的进位信号
    input operator, //决定加法还是减法。 0表示加法，1表示减法
    output [3:0] result, //运算结果补码形式 
    output overflow //溢出标志
); 

    
endmodule
