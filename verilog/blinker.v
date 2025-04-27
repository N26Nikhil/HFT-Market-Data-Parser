module top (
    input wire clk,
    input wire reset_n,
    input wire [7:0] char_in,
    input wire valid_in,
    output wire led
);
    wire [31:0] shares_outstanding, nav, flow_daily;
    wire valid_out;
    data_filter filter (
        .clk(clk), .reset_n(reset_n),
        .char_in(char_in), .valid_in(valid_in),
        .shares_outstanding(shares_outstanding),
        .nav(nav), .flow_daily(flow_daily),
        .valid_out(valid_out)
    );
    led_blink #(.BLINK_PERIOD(0.5)) led_status (
        .clk(clk), .reset_n(reset_n && valid_out),
        .led(led)
    );
endmodule