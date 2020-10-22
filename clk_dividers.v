//偶数分频,50%占空比
module even_divider
#(parameter divider_num = 3'd6)
(
    input wire clk,
    input wire rst_n,
    output reg clk_out
)

reg[3:0] cnt;

always@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt <= 4'b0;
    end else if(cnt == divider_num/2 - 1) begin
        cnt <= 4'b0;
    end    
    else cnt <= cnt + 1'b1;
end

always@(posedge clk or negedge rst_n)begin
    if (!rst_n) 
        clk_out <= 1'b1;
    else if (cnt == divider_num/2 - 1)
        clk_out <= ~clk_out;
end

endmodule


//奇数分频，50%占空比
module odd_divider
#(parameter divider_num = 3'd5)
(
    input wire clk,
    input wire rst_n,
    output reg clk_out
)

wire pclk_out, nclk_out;
reg[3:0] cnt;

always@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt <= 4'b0;
    end else if(cnt == divider_num - 1) begin
        cnt <= 4'b0;
    end    
    else cnt <= cnt + 1'b1;
end

always@(posedge clk or negedge rst_n)begin
    if (!rst_n) 
        pclk_out <= 1'b1;
    else if (cnt == (divider_num - 1)/2)
        pclk_out <= 1'b0;
    else if (cnt == divider_num - 1)
        pclk_out <= 1'b1;
end

always@(negedge clk or negedge rst_n)begin
    if (!rst_n) 
        nclk_out <= 1'b1;
    else if (cnt == (divider_num - 1)/2)
        nclk_out <= 1'b0;
    else if (cnt == divider_num - 1)
     nclk_out <= 1'b1;
end

assign clk_out = pclk_out & nclk_out;
endmodule

//任意分频
module random_divider
#(parameter divider_num = 3'd5)
(
    input wire clk,
    input wire rst_n,
    output reg clk_out
)

wire pclk_out, nclk_out;
reg clk_even, clk_odd;
reg[3:0] cnt;

always@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt <= 4'b0;
    end else if(cnt == divider_num - 1) begin
        cnt <= 4'b0;
    end    
    else cnt <= cnt + 1'b1;
end

always@(posedge clk or negedge rst_n)begin
    if (!rst_n) 
        pclk_out <= 1'b1;
    else if (cnt == (divider_num - 1)/2)
        pclk_out <= 1'b0;
    else if (cnt == divider_num - 1)
        pclk_out <= 1'b1;
end

always@(negedge clk or negedge rst_n)begin
    if (!rst_n) 
        nclk_out <= 1'b1;
    else if (cnt == (divider_num - 1)/2)
        nclk_out <= 1'b0;
    else if (cnt == divider_num - 1)
     nclk_out <= 1'b1;
end

assign clk_even = pclk_out;
assign clk_odd = pclk_out & nclk_out;

assign clk_out = (divider_num % 2 ==0) ? clk_even : clk_odd;

endmodule