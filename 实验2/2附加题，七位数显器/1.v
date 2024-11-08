`timescale 1ns / 1ps

module bin2dec (
    input wire clk,      //时钟，频?100MHz
    input wire [7:0] n,       //输入
    output reg [7:0] led_id,    
    output reg [6:0] out_led
    );

wire [7:0] abs;                     //存储 输入n的绝对??    
wire [7:0] flag={8{n[7]}};           //r_flag用于计算补码     
assign abs   = (n^flag)+flag[0];    //计算 输入n的绝对值??

//2进制对应十进制至? 
wire [7:0] num [0:3];               //符号位，百位，十位，个位
assign num[0] = 4'ha+flag[0];       //计算符号位，0xa：正??,0xb:负数
assign num[1] = abs / 100 % 10;     //计算百位
assign num[2] = abs / 10 % 10;      //计算十位      
assign num[3] = abs % 10;           //计算个位

reg [1:0] id=2'b00;                //从左到右四个数码?计数
parameter CNT_MAX = 99999;///设定时钟计数上限?
reg [31:0] cnt_1ms;//计数
//100MHz时钟? 99999计数即为1ms
always @ (posedge clk)//时钟上升
    if (cnt_1ms == CNT_MAX)
        cnt_1ms <= 1'b0;
    else
        cnt_1ms <= cnt_1ms+1'b1;  

//1ms切换1次id
always@(posedge clk )
    if(cnt_1ms == CNT_MAX - 1'b1)
        id <= id+1'b1;

//选择亮哪个灯
always @ (id)
    case(id)
        4'b0000: led_id = 8'b1111_0111;   //0
        4'b0001: led_id = 8'b1111_1011;   //1
        4'b0010: led_id = 8'b1111_1101;   //2
        4'b0011: led_id = 8'b1111_1110;   //3
        default: led_id = 8'b0000_0000;  //default to 0, should not happen
    endcase                
    
 //显示数字
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
        4'b1010: out_led = 7'b1111111;    //a->不显
        4'b1011: out_led = 7'b1111110;    //b->显示
        default: out_led = 7'b1111111;    //default to 7'b1111111, should not happen
    endcase

endmodule