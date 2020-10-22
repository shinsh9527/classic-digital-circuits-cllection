module glitch_filter    //毛刺滤除电路
(
    input wire clk,
    input wire rst_n,
    input wire data_in,
    output reg data_out
)

reg pedge, nedge;
reg last_data_in;
reg [1:0] cnt;

always@(posedge clk or negedge rst_n)begin
    if(rst_n)
    last_data_in <= 1'b0;
    else last_data_in <= data_in;
end

assign {pedge, nedge} = {(data_in & ~last_data_in), (~data_in & last_data_in)};  //分别产生正边沿和负边沿的脉冲

always@(posedge clk or negedge rst_n)begin
    if(rst_n)
    cnt <= 2'd0;
    else if(pedge || nedge)
    cnt <= 2'd0;
    else cnt <= cnt + 1'b1;
end

always@(posedge clk or negedge rst_n)begin
    if(rst_n)
    data_out <= 1'b0;
    else if(cnt == 2'd3)
    data_out <= last_data_in;
end
