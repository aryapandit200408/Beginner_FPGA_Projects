`timescale 1ns / 1ps


module testbench(
);

reg clkmod2;
reg clkmod5;
reg rst1;
reg rst2;
reg pst1;
reg pst2;
wire [3:0]q;
    
top UUT(
.clkmod2(clkmod2),
//.clkmod5(clkmod5),
.rst1(rst1),
.rst2(rst2),
.pst1(pst1),
.pst2(pst2),
.q(q)
);
    
    initial begin 
    clkmod2 = 2'b0;
    forever #10 clkmod2 = ~clkmod2;
    end
    
    
    initial begin 
    //clkmod5 = 2'b0;               // Uncomment for mod 5 count
    clkmod5 = q[0];                 //uncomment for mod 10 count. Basically output of LSB DFF to the clock input of mod5 counter
    forever #10 clkmod5 = ~clkmod5;
    end

    
    initial begin
    
    // Reset Testing
    rst1 = 1'b1;
    rst2 = 1'b1;
    pst1 = 1'b0;
    pst2 = 1'b0;
    #40
    
    //and then trying different combinations of rst1 and rst2
    rst1 = 1'b0;
    rst2 = 1'b0;
    #40
    rst1 = 1'b0;
    rst2 = 1'b1;
    #40
    rst1 = 1'b1;
    rst2 = 1'b0;
    #40
    rst1 = 1'b1;
    rst2 = 1'b1;
    
    // Now Preset Testing  
    #40
    pst1= 1'b0;
    pst2= 1'b0;
    rst1 = 1'b0;
    rst2 = 1'b0;
    
    // Testing different combinations of Preset pst1 and pst2
    #40
    pst1= 1'b0;
    pst2= 1'b0;
    #40
    pst1= 1'b0;
    pst2= 1'b1;
    #40
    pst1= 1'b1;
    pst2= 1'b0;
    #40
    pst1= 1'b1;
    pst2= 1'b1;

    // Reseting to 0 for final counting test
    #40
    pst1= 1'b0;
    pst2= 1'b0;
    rst1 = 1'b1;
    rst2 = 1'b1;
    
    
    // Counting Test Commence
    // Also demonstration of mod 10 feature 
    #40
    pst1= 1'b0;
    pst2= 1'b0;
    rst1 = 1'b0;
    rst2 = 1'b0;
    #100;  
    end
endmodule
