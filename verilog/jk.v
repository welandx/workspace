module jk_ff(clk,
             rst_n,
             set_n,
             j,
             k,
             q);
    input clk;
    input rst_n;
    input set_n;
    input j;
    input k;
    
    output q;
    
    reg q;
    
    always@(posedge clk or negedge rst_n or negedge set_n)
        if (!rst_n)            //异步清零
        begin
            q <= 1'b0;
        end
        else if (!set_n)    //异步置位
        begin
            q <= 1'b1;
        end
        else
        begin
            case({j,k})
                2'b00 : q   <= q;
                2'b01 : q   <= 0;
                2'b10 : q   <= 1;
                default : q <= ~q;
            endcase
        end
    
endmodule
