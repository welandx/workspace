`timescale 1 s/1 s
module piano(key,ctrl,led_r,led_g,row,buzz,clk);
input clk;
input [6:0]key;
input [2:0]ctrl;
output [7:0]led_r;
output [7:0]led_g;
output [7:0]row;
output buzz; 

endmodule
