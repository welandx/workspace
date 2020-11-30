//~ `New testbench
`timescale  1ns / 1ps

module tb_mat;       

// mat Parameters
parameter PERIOD = 10;
parameter k  = 10;

// mat Inputs
reg   clk                                  = 0 ;
reg   rst                                  = 0 ;

// mat Outputs
wire  [7:0]  row                           ;
wire  [7:0]  col                           ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst_n  =  1;
end

mat #(
    .k ( k ))
 u_mat (
    .clk                     ( clk        ),
    .rst                     ( rst        ),

    .row                     ( row  [7:0] ),
    .col                     ( col  [7:0] )
);

initial
begin

    $finish;
end

endmodule