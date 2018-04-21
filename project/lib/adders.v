//------------------------------------------------

// Half Adder
 
//------------------------------------------------
module half_adder (
  input A,
  input B,  
  output S,
  output C
  );
 
  xor2$ xor_0 (.out(S), .in0(A), .in1(B));
  and2$ and_0 (.out(C), .in0(A), .in1(B));
 
endmodule


//------------------------------------------------

// Full Adder
 
//------------------------------------------------
module full_adder (
    input A,
    input B,
    input Cin,
    output S,
    output Cout
    );
 wire s1,c1,c2;

 half_adder ha_0(.S(s1),.C(c1),.A(A),.B(B));
 half_adder ha_1(.S(S),.C(c2),.A(s1),.B(Cin));
 or2$ or_0 (.out(Cout), .in0(c1), .in1(c2));

endmodule

module ripple_carry_10bit(
    input[9:0] A,
    input[9:0] B,
    input Cin,
    output[9:0] S,
    output Cout
);

	wire[9:0] carry_prop;
	full_adder fa0(A[0],B[0],Cin,S[0],carry_prop[0]);
	full_adder fa1(A[1],B[1],carry_prop[0],S[1],carry_prop[1]);
	full_adder fa2(A[2],B[2],carry_prop[1],S[2],carry_prop[2]);
	full_adder fa3(A[3],B[3],carry_prop[2],S[3],carry_prop[3]);
	full_adder fa4(A[4],B[4],carry_prop[3],S[4],carry_prop[4]);
	full_adder fa5(A[5],B[5],carry_prop[4],S[5],carry_prop[5]);
	full_adder fa6(A[6],B[6],carry_prop[5],S[6],carry_prop[6]);
	full_adder fa7(A[7],B[7],carry_prop[6],S[7],carry_prop[7]);
	full_adder fa8(A[8],B[8],carry_prop[7],S[8],carry_prop[8]);
	full_adder fa9(A[9],B[9],carry_prop[8],S[9],carry_prop[9]);

	assign Cout = carry_prop[9];

endmodule


