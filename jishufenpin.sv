module jishufenpin(
    input clk,
    input Rst_n,
    input Cin,
    output reg [6:0] count,
    output x,
    output reg cnt
);

always @(posedge clk or negedge Rst_n) begin
    if (!Rst_n)
        count <= 0;
    else if (count[3:0] == 4'b1001) begin
        count[3:0] <= 4'b0000;
        if (count[6:4] == 3'b111)
            count[6:4] <= 3'b000;
        else
            count[6:4] <= count[6:4] + 1;
    end
    else
        count[3:0] <= count[3:0] + 1;
end

always @(posedge clk or negedge Rst_n) begin
    if (!Rst_n)
        cnt <= 0;
    else if (Cin == 1 && count == 7'h79)
        cnt <= 1;
    else
        cnt <= 0;
end

assign x = cnt;

endmodule