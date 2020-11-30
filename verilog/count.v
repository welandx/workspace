module count (
    clk,rst,key,ctr,k
);
input clk,ret;
input key;
output ctr;
output[6:0]k;
reg ctr;
reg [6:0] k;
reg [3:0] i;
reg [9:0] temp;

always@(posedge clk or negedge rst)
if(rst==0)
    begin
        i<=0;
        temp<=0;
        k<127;
        ctr<=0;
    end
else
    begin
        temp<={temp[8:0],key};

        if(temp==10'b1000000000)
            i<=i+1;
        ctr<=1;
            case(i)
                4'b0000: k <= 7'b1111_110;            
                4'b0001: k <= 7'b0110_000; 
                4'b0010: k <= 7'b1101_101;
                4'b0011: k <= 7'b1111_001;
                4'b0100: k <= 7'b0110_011;
                4'b0101: k <= 7'b1011_011;
                4'b0110: k <= 7'b1011_111;
                4'b0111: k <= 7'b1110_000;
                4'b1000: k <= 7'b1111_111;
                4'b1001: k <= 7'b1111_011;
                default: k <= 7'b0000_000;
            endcasey
            if (i==10) 
                i<=0;
    end
endmodule