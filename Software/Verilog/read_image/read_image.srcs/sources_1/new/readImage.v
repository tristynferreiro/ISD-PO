`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2023 08:07:21
// Design Name: 
// Module Name: readImage
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

`include "parameter.v"

module readImage(
    input clk,
    input start,
    output wire [7:0] b1,
    output wire [7:0] b2,
    output wire [7:0] b3,
    output wire [7:0] b4,
    output wire [7:0] b5,
    output wire [7:0] b6,
    output wire [7:0] b7,
    output wire [7:0] b8
    );
    
    reg [7:0] image [7:0];
    
    initial begin
        $readmemh(INPUTFILENAME,image);
    end
    
    assign b1 = image[0];
    assign b2 = image[1];
    assign b3 = image[2];
    assign b4 = image[3];
    assign b5 = image[4];
    assign b6 = image[5];
    assign b7 = image[6];
    assign b8 = image[7];
endmodule
