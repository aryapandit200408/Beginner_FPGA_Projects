`timescale 1ns/1ps
//This clock is set to hava frequency of 1Hz
module clock_divider(input clk_100MHz, output reg clock =0);
    integer count=0;
    always @(posedge clk) begin
        count <= count + 1;
        if (count==49999999) begin
            clock <= ~clock;
            count <= 0;
        end
    end
endmodule
