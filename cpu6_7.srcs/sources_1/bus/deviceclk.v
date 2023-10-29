/*----------------------------------------------------------------
        时钟计数器
        EXTEND 即计数次数
----------------------------------------------------------------*/

module deviceclk
       # (parameter EXTEND = 50000)
       (
           input wire clk,
           input wire rst_n,
           output wire clk_out
       );

reg [$clog2(EXTEND) : 0] cnt;
assign clk_out = ( cnt == EXTEND );         // 2ms

/***************************************************************
                        计时器
****************************************************************/

always @ ( posedge clk or negedge rst_n ) begin
    if ( ~rst_n )
        cnt <= 0;
    else if ( clk_out )
        cnt <= 0;
    else
        cnt <= cnt + 1;
end

endmodule
