module data_filter (
    input wire clk,
    input wire reset_n,
    input wire [7:0] char_in,
    input wire valid_in,
    output reg [31:0] shares_outstanding,
    output reg [31:0] nav,
    output reg [31:0] flow_daily,
    output reg valid_out
);
    reg [31:0] temp_num;
    reg [2:0] field;
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            shares_outstanding <= 0; nav <= 0; flow_daily <= 0;
            valid_out <= 0; field <= 0; temp_num <= 0;
        end else if (valid_in) begin
            if (char_in == 44) begin 
                case (field)
                    2: shares_outstanding <= temp_num;
                    3: nav <= temp_num;
                    4: flow_daily <= temp_num;
                endcase
                field <= field + 1;
                temp_num <= 0;
            end else if (char_in >= 48 && char_in <= 57) begin
                temp_num <= temp_num * 10 + (char_in - 48);
            end
            if (field == 5) valid_out <= 1;
        end
    end
endmodule