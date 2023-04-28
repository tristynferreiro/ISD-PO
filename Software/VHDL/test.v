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


module test(input [63:0] pixel, pixel2,output [15:0] yay);//output wire delimiter);
    assign yay[0] = pixel[8*0];
    assign yay[1] = pixel[8*1];
    assign yay[2] = pixel[8*2];
    assign yay[3] = pixel[8*3];
    assign yay[4] = pixel[8*4];
    assign yay[5] = pixel[8*5];
    assign yay[6] = pixel[8*6];
    assign yay[7] = pixel[8*7];
    
    assign yay[8] = pixel2[8*0];
    assign yay[9] = pixel2[8*1];
    assign yay[10] = pixel2[8*2];
    assign yay[11] = pixel2[8*3];
    assign yay[12] = pixel2[8*4];
    assign yay[13] = pixel2[8*5];
    assign yay[14] = pixel2[8*6];
    assign yay[15] = pixel2[8*7];
    
    //assign delimiter = (yay == 8'd36) ? 1'b1 : 1'b0;
endmodule
