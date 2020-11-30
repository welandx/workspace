module mat(
    clk,rst,row,col
);
input clk,rst;
output[7:0]row,col;
reg [7:0]row,col;

parameter k = 10;
reg [4:0]cnt;
reg clk_fre;
//分频
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        cnt <= 4'b0;
    end
    else if(cnt<k/2-1) begin
        cnt <= cnt+1'b1;
    end
    else begin
        cnt <= 4'b0;
        clk_fre <= ~ clk_fre;
    end
end

//扫描
reg [2:0] i;
initial begin
    i=3'b0;
end
always @(posedge clk_fre) begin
   if (i<3'b111) begin
       i=i+3'b001;
   end else begin
       i=3'b0;
   end
   case (i)
       3'b000: begin
           col=8'b0000_0001;
           row=8'b0000_0001;
       end 
       3'b001: begin
           col=8'b0000_0011;
           row=8'b1000_1000;
       end 
       3'b010: begin
           col=8'b0000_0111;
           row=8'b1000_1000;
       end 
       3'b011: begin
           col=8'b0000_1111;
           row=8'b1000_1000;
       end 
       3'b100: begin
           col=8'b0001_1111;
           row=8'b1000_1000;
       end
       3'b101: begin
           col=8'b0011_1111;
           row=8'b1000_1000;
       end 
       3'b110: begin
           col=8'b0111_1111;
           row=8'b1000_1000;
       end 
       3'b111: begin
           col=8'b1111_1111;
           row=8'b1000_1000;
       end 
   endcase 
end
endmodule