module HC595 (input SER,
              input SRCLK,
              input RCLK,
              input _SRCLR,
              input _OE,
              output[7:0]Qp,
              output Qs);
    reg[7:0]sft = 8'b0;//Shift register
    reg[7:0]stg = 8'b0;//Storage register
    always@(posedge SRCLK or negedge _SRCLR)
        if (!_SRCLR)
            sft <= 8'b0;
        else
            sft <= {sft[6:0],SER};
            always@(posedge RCLK)
                stg <= sft;
                assign Qs = sft[7];
                assign Qp = (_OE == 1)?8'bzzzzzzzz:stg;
endmodule
