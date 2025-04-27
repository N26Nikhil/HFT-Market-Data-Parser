module arbitrage (
    input wire clk,
    input wire reset_n,
    input wire [31:0] nav,
    input wire [31:0] market_price,
    input wire [31:0] flow_daily,
    output reg trade_signal
);
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) trade_signal <= 0;
        else if (market_price > nav + 5 && flow_daily > 10000000)
            trade_signal <= 1;
        else trade_signal <= 0;
    end
endmodule