module mat_display(
input [127:0] Mat,
input clk_1KHz,
output [7:0] red_led,
output [7:0] green_led,
output [7:0] GND
);
reg [2:0] row;
reg [7:0] data [7:0];
initial begin//低电平有效 38 译码器
row = 3'b000;
data[0]=8'b01111111;
data[1]=8'b10111111;
data[2]=8'b11011111;
data[3]=8'b11101111;
data[4]=8'b11110111;
data[5]=8'b11111011;
data[6]=8'b11111101;
data[7]=8'b11111110;
end
always @(posedge clk_1KHz) begin
if (row==3'b111)
row <= 3'b0;
else
row <= row+3'b1;//计数器
end
assign GND = data[row];
assign red_led =
{Mat[8*row+7],Mat[8*row+6],Mat[8*row+5],Mat[8*row+4],Mat[8*row+3],Mat[8
*row+2],Mat[8*row+1],Mat[8*row]};//八路数据选择器
assign green_led =
{Mat[8*row+71],Mat[8*row+70],Mat[8*row+69],Mat[8*row+68],Mat[8*row+67],
Mat[8*row+66],Mat[8*row+65],Mat[8*row+64]};
endmodule
