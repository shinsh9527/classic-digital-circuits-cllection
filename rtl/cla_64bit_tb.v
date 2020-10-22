// =============================================================================
// Filename: cla_64bit_tb.v
// -----------------------------------------------------------------------------
// This file exports the testbench for cla_64bit.
// =============================================================================

`timescale 1 ns / 1 ps

module cla_64bit_tb;

// ----------------------------------
// Interface of the module
// ----------------------------------
reg		[63:0]	a, b;
reg 			cin;
wire 	[63:0]	sum;
wire			cout;

// ----------------------------------
// Instantiate the module
// ----------------------------------
cla_64bit uut (
	.a(a),
	.b(b), 
	.cin(cin), 
	.sum(sum),
	.cout(cout)
);

// ----------------------------------
// Input stimulus
// ----------------------------------
initial begin
	// Input stimulus 1: 20+55+0
	a    = 64'd20;
	b    = 64'd55;
	cin  = 1'b0;
	#10;
	$display("%0d + %0d + %0d: sum = %0d, cout = %0d", a, b, cin, sum, cout);

	// Input stimulus 2: 24+133+1
	a    = 64'd24;
	b    = 64'd133;
	cin  = 1'b1;
	#10;
	$display("%0d + %0d + %0d: sum = %0d, cout = %0d", a, b, cin, sum, cout);

	// Input stimulus 3: 3748+9786+0
	a    = 64'd3748;
	b    = 64'd9786;
	cin  = 1'b0;
	#10;
	$display("%0d + %0d + %0d: sum = %0d, cout = %0d", a, b, cin, sum, cout);

	// Input stimulus 4: 655675+7374670+1
	a    = 64'd655675;
	b    = 64'd7374670;
	cin  = 1'b1;
	#10;
	$display("%0d + %0d + %0d: sum = %0d, cout = %0d", a, b, cin, sum, cout);

	// Input stimulus 5: 4223372036854775808‬+28701384792384+1
	a    = 64'd4223372036854775808;
	b    = 64'd28701384792384;
	cin  = 1'b1;
	#10;
	$display("%0d + %0d + %0d: sum = %0d, cout = %0d", a, b, cin, sum, cout);

	$finish;
end

endmodule
