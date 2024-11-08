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
   reg cin; // 定义程序的输入为reg型
   wire cf;
   wire [3:0] s; // 因为要对cf和s进行assign赋值，所以定义为wire型
   adder_4 adder4(a, b, cin, s, cf); // 实例化adder模块
   
   initial begin  // 给输入赋初值
        a = 4'b0001;
        b = 4'b0011;
        cin = 1;
        #100  // 使赋值持续100ns
        a = 4'b1000;
        b = 4'b1010;
        cin = 0;
        #100 // 使赋值持续100ns
        a = 4'b0011;
        b = 4'b0110;
        cin = 0;
        #100
        a = 4'b0111;
        b = 4'b0000;
        cin = 1;
   end
   
endmodule
