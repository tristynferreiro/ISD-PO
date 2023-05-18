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
    wire [7:0] b1,b2,b3,b4,b5,b6,b7,b8;
    
    readImage read(clk,start,b1,b2,b3,b4,b5,b6,b7,b8);
    
    initial begin
        clk = 1'b0;
    end
    
    parameter freq = 100000000; //100 MHz
    parameter SIZE = 1024; 
    parameter clockRate = 0.2;
    
    always #clockRate clk= ~clk;   
    
endmodule