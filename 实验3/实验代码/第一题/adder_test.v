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
   
   reg a,b,cin; // 定义程序的输入为reg型
   wire cout,s; // 因为要对cout和s进行assign赋值，所以定义为wire型
   adder add(a, b, cin, cout, s); // 实例化adder模块
   
   initial begin  // 给输入赋初值
        a = 1;
        b = 1;
        cin = 1;
        #100  // 使赋值持续100ns
        a = 1;
        b = 0;
        cin = 1;
        #100 // 使赋值持续100ns
        a = 1;
        b = 0;
        cin = 0;
   end
   
endmodule
