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
#(parameter numBytes = 200,numBits = numBytes*8)
(
    input clk,
    input start,
    output wire [numBytes-1:0] b1
    );
     
    reg [7:0] image [numBits-1:0];
    
    //reg [numBytes-1:0] index;
    //wire [numBytes-1:0] index;
    
    initial begin
        $readmemh("image.mem",image);
    end
    
    
    genvar i;
    // creates new hardware instances 
    generate
        for(i = 0;i<numBytes;i = i+1) begin
            wire [63:0] in = {image[i+7],image[i+6],image[i+5],image[i+4],image[i+3],image[i+2],image[i+1],image[i]};
            wire [127:64] in2 = {image[i+15],image[i+14],image[i+13],image[i+12],image[i+11],image[i+10],image[i+9],image[i+8]};
            //wire [1:0] temp;
            test t (in,in2,b1[i+15:i]);
        end
    endgenerate
endmodule
