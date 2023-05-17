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
    input reset,
    output wire [numBytes-1:0] char_String
    );
     
     reg ready = 1'b0;
    //reg [7:0] image [numBits-1:0];
  
    //wire [numBytes-1:0] char_String = 0; 
    reg [7:0] image [199:0];
   
   initial begin
        $readmemh("stego.hex", image);
   end
   
   always @ (posedge reset) begin
        ready = 1'b1;
   end
   
    
    genvar i;
    // creates new hardware instances 
    generate
        for(i = 0;i<numBytes-7;i = i+7) begin
        reg [63:0] in = 64'b0;
        always @(posedge ready) begin
                in = {image[i+7],image[i+6],image[i+5],image[i+4],image[i+3],image[i+2],image[i+1],image[i]};        
        end
        extract_Character extract (in,char_String[i+7:i]);
        end
    endgenerate
endmodule
