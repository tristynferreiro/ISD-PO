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


module test(input readImage read (.clk(clk),.start(start),.b1(b1));//,b2[0],b3[0],b4[0],b5[0],b6[0],b7[0],b8[0]);[7:0] pixel,output yay);
    assign yay = pixel[0];
endmodule
