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
     
    //reg [7:0] image [numBits-1:0];
    
    wire ena,wea;
    wire [7:0] douta;
    wire [7:0] addra;
    reg ready = 1'b0;
    
    blk_mem_gen_0 IMAGE1 (clk,
    1'b1,
    1'b0,
    addra,
    8'b0,
    douta
  );
  
    //wire [numBytes-1:0] char_String = 0; 
    reg [7:0] image [199:0];
   
   integer k;
   
   assign addra = k;
   
   always @ (posedge reset) begin
        k = 1'b0;
        ready = 1'b0;
   end
   
  always @ (posedge clk) begin
        if ((reset == 0) & (ready == 0)) begin
            image[k] = douta;
            
            k = k+1;
            if (k == numBytes) begin
                k = 8'b0;
                ready = 1'b1;
            end
        end
    end
    //reg [numBytes-1:0] index;
    //wire [numBytes-1:0] index;
    
//    reg [63:0] in = 64'b0;
//        always @(posedge ready) begin
//                in = image_data[63:0];
//                //in = {image[i+7],image[i+6],image[i+5],image[i+4],image[i+3],image[i+2],image[i+1],image[i]};        
//        end
//        extract_Character extract (in,char_String[7:0]);
    
    genvar i;
    // creates new hardware instances 
    generate
        for(i = 1;i<numBytes-7;i = i+7) begin
        reg [63:0] in = 64'b0;
        always @(posedge ready) begin
                in = {image[i+7],image[i+6],image[i+5],image[i+4],image[i+3],image[i+2],image[i+1],image[i]};        
        end
        extract_Character extract (in,char_String[i+6:i-1]);
        end
    endgenerate
endmodule
