module interface_change_tb ;
    reg clka ;
    reg wra_n;
    reg da ;
	reg clkb ;
	wire [7:0] db ;
	wire wrb ;


initial begin
	clka  = 0 ;
	#3 ;
	clkb  = 0 ; 
end
initial begin
	wra_n = 1 ;
	@(posedge clka) wra_n = 0 ;
	da = $random%2 ;

	@(posedge clka) wra_n = 0 ;
	da = $random%2 ;

	@(posedge clka) wra_n = 0 ;
	da = $random%2 ;

	@(posedge clka) wra_n = 0 ;
	da = $random%2 ;

	@(posedge clka) wra_n = 0 ;
	da = $random%2 ;

	@(posedge clka) wra_n = 0 ;
	da = $random%2 ;

	@(posedge clka) wra_n = 0 ;
	da = $random%2 ;

	@(posedge clka) wra_n = 0 ;
	da = $random%2 ;




	@(posedge clka) wra_n = 1;

end
always #5 clka = ~clka ; 
always #10 clkb = ~clkb ; 


interface_change interface_change (
    .clka(clka) ,
    .wra_n(wra_n),
    .da(da) , 
	.clkb(clkb) ,
	.db(db) , 
	.wrb(wrb) 
);


endmodule