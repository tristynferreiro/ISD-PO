`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2023 08:07:21
// Design Name: 
// Module Name: read_Testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module read_Testbench;
    reg clk;
    reg start;
    wire [15:0] b1;
    
    readImage read (.clk(clk),.start(start),.b1(b1));//,b2[0],b3[0],b4[0],b5[0],b6[0],b7[0],b8[0]);
    initial begin
        $monitor("%d %d",$realtime);
        clk = 1'b0;
    end
    
    parameter freq = 100000000; //100 MHz
    parameter SIZE = 1024; 
    parameter clockRate = 0.2;
        
    always #clockRate clk= ~clk;   
    
endmodule
