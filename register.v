`timescale 1ns / 1ps
// This is the code for a 4 bit buffer register with load input
module register(
    input [3:0]q, 
    input clk, 
    input T,
    input st,
    input rst,
    output [3:0]out
    );
    wire W0, W1, W2, W3;
    wire [3:0]outbar;

    mux m1(q[0], out[0], T, W0);
    mux m2(q[1], out[1], T, W1);
    mux m3(q[2], out[2], T, W2);
    mux m4(q[3], out[3], T, W3);
        
    ms_d_ff df0(W0, clk, st, rst, out[0], outbar[0]);
    ms_d_ff df1(W1, clk, st, rst, out[1], outbar[1]);
    ms_d_ff df2(W2, clk, st, rst, out[2], outbar[2]);
    ms_d_ff df3(W3, clk, st, rst, out[3], outbar[3]);
    
endmodule

// Module for 2:1 MUX
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

// Module for edge triggered d flip flop
module ms_d_ff(
input d, input clk,input st, input rst, output q, output qbar
    );
    wire MS1, MS2;
    d_ff mdff(d , clk, st, rst, MS1, MS2);
    d_ff sdff(MS1, ~clk, st, rst, q, qbar);
endmodule

// Module for level triggered ms Flip Flop
module d_ff(input d, input clk, input st, input rst, output  q, output qbar);
    wire W1, W2;
    and N1(W1, d, clk);
    and N2(W2, ~d, clk);
    nand N3(q, qbar, ~W1, st); //We Choose Active Low for set
    nand N4(qbar, q, ~W2, rst); //We Choose Active Low for rst
endmodule
