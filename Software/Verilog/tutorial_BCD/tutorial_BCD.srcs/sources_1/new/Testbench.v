`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2023 19:37:28
// Design Name: 
// Module Name: Testbench
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


module Testbench;

reg CLK100MHZ;
reg [8:0] SW;
wire [7:0] AN;
wire [6:0] SEG;
wire DP;

WallClock clock(CLK100MHZ,SW,AN,SEG,DP);

initial begin
    CLK100MHZ = 1'b0;
    SW = 9'b1;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    #5; CLK100MHZ = 1'b1;
    #5; CLK100MHZ = 1'b0;
    
end

endmodule
