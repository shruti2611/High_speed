//------------------------------------------------

// Parrallel Counter ( 7:3 )
 
//------------------------------------------------
module pCntr_7_3(
    input[6:0] A,
    output[2:0] S
);

	wire[2:0] carry_prop;
	wire[1:0] sum_prop;
	full_adder fa0( .A(A[1]), .B(A[2]), .Cin(A[3]), .S(sum_prop[0]), .Cout(carry_prop[0]) );
	full_adder fa1( .A(A[4]), .B(A[5]), .Cin(A[6]), .S(sum_prop[1]), .Cout(carry_prop[1]) );
	full_adder fa2( .A(A[0]), .B(sum_prop[0]), .Cin(sum_prop[1]), .S(S[0]), .Cout(carry_prop[2]) );
	full_adder fa3( .A(carry_prop[0]), .B(carry_prop[1]), .Cin(carry_prop[2]), .S(S[1]), .Cout(S[2]) );

endmodule

//------------------------------------------------

// Parrallel Counter ( 6:3 )
 
//------------------------------------------------
module pCntr_6_3(
    input[5:0] A,
    output[2:0] S
);

	wire[2:0] carry_prop;
	wire[1:0] sum_prop;
	full_adder fa0( .A(A[1]), .B(A[2]), .Cin(A[3]), .S(sum_prop[0]), .Cout(carry_prop[0]) );
	half_adder ha0( .A(A[4]), .B(A[5]), .S(sum_prop[1]), .C(carry_prop[1]) );
	full_adder fa1( .A(A[0]), .B(sum_prop[0]), .Cin(sum_prop[1]), .S(S[0]), .Cout(carry_prop[2]) );
	full_adder fa2( .A(carry_prop[0]), .B(carry_prop[1]), .Cin(carry_prop[2]), .S(S[1]), .Cout(S[2]) );

endmodule

//------------------------------------------------

// Parrallel Counter ( 5:3 )
 
//------------------------------------------------
module pCntr_5_3(
    input[4:0] A,
    output[2:0] S
);

	wire[1:0] carry_prop;
	wire sum_prop;
	full_adder fa0( .A(A[2]), .B(A[3]), .Cin(A[4]), .S(sum_prop), .Cout(carry_prop[0]) );
	full_adder fa1( .A(A[0]), .B(A[1]), .Cin(sum_prop), .S(S[0]), .C(carry_prop[1]) );
	half_adder ha1( .A(carry_prop[0]), .B(carry_prop[1]), .S(S[1]), .C(S[2]) );

endmodule

//------------------------------------------------

// Parrallel Counter ( 4:3 )
 
//------------------------------------------------
module pCntr_4_3(
    input[3:0] A,
    output[2:0] S
);

	wire[1:0] carry_prop;
	wire sum_prop;
	full_adder fa0( .A(A[1]), .B(A[2]), .Cin(A[3]), .S(sum_prop), .Cout(carry_prop[0]) );
	half_adder ha0( .A(A[0]), .B(sum_prop), .S(S[0]), .C(carry_prop[1]) );
	half_adder ha1( .A(carry_prop[0]), .B(carry_prop[1]), .S(S[1]), .C(S[2]) );

endmodule

//------------------------------------------------

// Approximate Parrallel Counter ( 4:2 )
 
//------------------------------------------------
module approx_pCntr_4_2(
    input[3:0] A,
    output[1:0] S
);
	wire g0,g1,g2,g3;
	
	xnor2$ xnor_0 ( .out(g0), .in0(A[0]), .in1(A[1]) );
	xnor2$ xnor_1 ( .out(g1), .in0(A[2]), .in1(A[3]) );
	or2$ or_0 ( .out(S[0]), .in0(g0), .in1(g1) );
	
	nor2$ nor_0 ( .out(g2), .in0(A[0]), .in1(A[1]) );
	nor2$ nor_1 ( .out(g3), .in0(A[2]), .in1(A[3]) );
	nor2$ nor_2 ( .out(S[1]), .in0(g2), .in1(g3) );

endmodule