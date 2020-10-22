module clk_sel
(
    input wire clk1,
    input wire clk2,
    input wire sel,
    output reg clk_out
)

reg sel_clk1, sel_clk2;

always @(posedge clk1)begin
    sel_clk1 <= sel & ~sel_clk2;
end

always @(posedge clk2)begin
    sel_clk2 <= ~sel & ~sel_clk1;
end

assign clk_out = sel_clk1 & clk1 | sel_clk2 & clk2;

endmodule