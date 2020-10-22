/*作者：wonder
链接：https://zhuanlan.zhihu.com/p/69967979
来源：知乎
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

interface_change.v */
module interface_change(
    input clka ,
    input wra_n,
    input da , 
	input clkb ,
	output  [7:0] db , 
	output wrb 
);



reg [7:0] data = 0 ;
always@(posedge clka) begin
	if(!wra_n) begin
		data <= {data[6:0],da} ; 
	end
end

reg wra_n_last;
always@(posedge clkb ) begin
	wra_n_last <= wra_n ;
	wrb <= wra_n & ~wra_n_last;
end
 
assign db = (wrb == 1'b1) ? data : 0 ;

endmodule