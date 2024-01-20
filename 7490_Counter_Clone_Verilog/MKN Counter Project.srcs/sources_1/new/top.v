`timescale 1ns / 1ps

module top(
    input clkmod2,   
    input clkmod5,
    input rst1,
    input rst2,
    input pst1,
    input pst2,
    output reg [3:0]q=4'b0000);
    
    
    // Negetive edge triggering with asynchronous reset and preset. 
    // Also reset and preset are active high
    always @ (negedge clkmod2, posedge(rst1&rst2), posedge(pst1 & pst2))
    begin
        if (rst1 & rst2)                    // Reset                
            q[0] <= 1'b0;
        else if (pst1 & pst2)               // Preset               
            q[0] <= 1'b1;
        else if (q[0]==1'b1)                // Reset at end of Count
            q[0] <= 1'b0;
        else
            q[0]<=q[0]+1'b1;                // Count Up             
           
    end  
    
    
    // Negetive edge triggering with asynchronous reset and preset. 
    // Also reset and preset are active high
    // For mod 10 operation input clkmod5 is connected to q[0]
    // If you want mod 5 operation, connect to clk instead of q[0]
    always @ (negedge q[0] , posedge(rst1&rst2), posedge(pst1 & pst2))
    begin
        if (rst1 & rst2)                    // Reset
            q[3:1] <= 3'b000;               
        else if (pst1 & pst2)               // Preset
            q[3:1] <= 3'b100;              
        else if (q[3:1]==3'b100)            // Reset at end of Count
            q[3:1] <= 3'b000;              
        else
            q[3:1] <= q[3:1] + 1'b1;        // Count Up    
    end           
    
    
endmodule



