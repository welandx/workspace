module yujinxiang(clk,row,col_R,col_G,set,seg_led,seg_data,sw_0,rst,sw_1
);//adjust,
input clk;//开发板时钟
//input set;//启动和停止按键，控制srart(BNT1)
input sw_1;//控制正常计数还是现实沙粒的运动 
input sw_0;//开关sw_0，模拟重量传感器
input rst;//BNT0计时开始和停止按键
reg[4:0] cnt;//计数
reg[5:0] cnt1;//计数
reg[5:0]min_cnt;//六十秒计数器
reg start;
wire clk1;
wire clk2h;//t=1s
wire clk3h;//t=0.5
wire clk4h;//25MHz
wire set_pulse;//开始暂停判断
wire rst_pulse;//重置判断
reg [3:0] judge=3'b000;//点阵刷新行刷新的判断
reg [13:0] count;// 计数器分频计数
reg flag=0;//数码管个位和十位切换判断
reg judge1;
reg[7:0] seg [9:0];

output reg [7:0]row; //点阵的行
output reg [7:0]col_R;//点阵的列，显示红色
output reg [7:0]col_G;//点阵的列，显示黄色
//output reg [7:0]seg_data;//七段数码管的0~9显示
//output reg [7:0]seg_led;

initial
begin
	cnt=0;
	cnt1=0;
	start=0;
	judge1=0;
end

always @(posedge clk )//刷新模块
begin
if(count>=14'd16_000)  //if(count>=14'd9_000_000)
begin
count<=14'b0;
//flag=flag+1'b1;
judge = judge+3'b001;
end
else
	count<=count+1'b1;
end


always @(posedge clk)
if(sw_1==1)
begin
if(cnt==5'b00000)
		case(judge%8)
	3'b000: begin
		row = 8'b01111111;		//row为0触发 col为1触发 从右往左读
		col_R = 8'b00101010;
		col_G = 8'b00001000;
		end
	3'b001: begin
		row = 8'b10111111;
		col_R = 8'b00111110;
		col_G = 8'b00001000;
		end
	3'b010: begin
		row = 8'b11011111;
		col_R = 8'b00111110;
		col_G = 8'b00000000;
		end
	3'b011: begin
		row =	8'b11101111;
		col_R = 8'b00011100;
		col_G = 8'b00000000;
		end
	3'b100: begin
		row =	8'b11110111;
		col_R = 8'b00000000;
		col_G = 8'b01001001;
		end
	3'b101: begin
		row = 8'b11111011;
		col_R = 8'b00000000;
		col_G = 8'b11101011;
		end
	3'b110: begin
		row = 8'b11111101;
		col_R = 8'b00000000;
		col_G = 8'b00111110;
		end
	3'b111: begin
		row = 8'b11111110;
		col_R = 8'b00000000;
		col_G = 8'b00011100;
		end
	endcase
	end
endmodule





