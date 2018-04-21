module top;

	reg	[9:0]	a, b;
	reg		cin;
	reg 	clk;
	
	wire	[9:0]	sum;
	wire	cout;

	initial
		begin
			a = 10'b0;
			b= 10'b1;
			cin = 1'b0;	
		end

	// Run for 100ns
	initial #300 $finish;
		
	always #50 clk = ~clk; //clock cycle is 100ns

	// Dump ALL waveforms	
	initial
		begin
		$vcdplusfile("top.dump.vpd");
		$vcdpluson(0, top);
		end

	// Instantiate modules 

	ripple_carry_10bit rc_10(
	.A(a),
	.B(b),
	.Cin(cin),
	.S(sum),
	.Cout(cout));
endmodule
