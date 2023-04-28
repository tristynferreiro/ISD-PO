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

module readImage
(
    input clk,
    input start,
    output wire [15:0] b1
//    output wire [7:0] b2 [1:0],
//    output wire [7:0] b3 [1:0],
//    output wire [7:0] b4 [1:0],
//    output wire [7:0] b5 [1:0],
//    output wire [7:0] b6 [1:0],
//    output wire [7:0] b7 [1:0],
//    output wire [7:0] b8 [1:0]
    );
        
    reg [7:0] image [15:0];
    
    initial begin
        $readmemh("image.mem",image);
    end
    
    
    genvar i;
    // creates new hardware instances 
    generate
        for(i = 0;i<16;i = i+1) begin
            wire [7:0] in = image[i];
            test t (in,b1[i]);
        end
    endgenerate
endmodule
