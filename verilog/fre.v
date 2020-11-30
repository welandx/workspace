module fre(
input clk_10MHz,
output reg clk_,
input [24:0] rate
);
reg [24:0] cnt;
initial
begin
cnt = 25'b0;
clk_ = 1'b0;
end
always @(posedge clk_10MHz)
begin
if (clk_ == 1'b1) begin//清零
clk_ = 1'b0;
cnt = 25'b0;
end
else begin
if (cnt < rate - 1'b1)
cnt = cnt + 1;//计数
else
clk_ = 1'b1;
end
end
endmodule
