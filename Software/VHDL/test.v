`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 11:14:18
// Design Name: 
// Module Name: test
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


module test(input [63:0] pixel,output [7:0] yay,output delimiter);
    assign yay[0] = pixel[8*0];
    assign yay[1] = pixel[8*1];
    assign yay[2] = pixel[8*2];
    assign yay[3] = pixel[8*3];
    assign yay[4] = pixel[8*4];
    assign yay[5] = pixel[8*5];
    assign yay[6] = pixel[8*6];
    assign yay[7] = pixel[8*7];
endmodule
