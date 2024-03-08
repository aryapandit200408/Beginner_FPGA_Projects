`timescale 1ns / 1ps
// This is the Verilog Code for a 2 input MUX
module mux( 
    input input1,
    input input2,
    input load,
    output out
    );
    wire W1, W2;
    and AND1(W1, input1, load);
    and AND2(W2, input2, ~load);
    or OR1(out, W1, W2);
endmodule
