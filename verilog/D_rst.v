module D_rst (
	input data, clk, reset,
	output q
);
    
parameter UDLY = 1;
reg q;
always @ (posedge clk) begin
	if ( !reset ) begin
		q <= #UDLY 1'b0;
	end else begin
		q <= #UDLY data;
	end
end
endmodule
