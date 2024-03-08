`timescale 1ns / 1ps
// JK Flip Flop implementation using behavioral modelling
module jk_ff(input j, input k, input prst, input rst, input clk, output reg q, output reg qb);
    integer count=0;
    reg clock=0;
    always @(posedge clk) begin
        count <= count + 1;
        if (count==49999999) begin
            clock <= ~clock;
            count <= 0;
        end
    end            
    always @(negedge clock) begin
        if (prst&rst) begin
            if (j&k)
                {q,qb} <= {~q,q};
            else if ((~j)&k)
                {q,qb} <= {1'b0,1'b1};
            else if (j&(~k))
                {q,qb} <= {1'b1,1'b0};
        end
        else if (prst&(~rst))
            {q,qb} <= {1'b1,1'b0};
        else 
            {q,qb} <= {1'b0,1'b1};
    end              
endmodule
