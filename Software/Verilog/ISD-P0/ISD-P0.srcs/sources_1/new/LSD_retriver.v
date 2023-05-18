`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Cape Town
// Engineer: Shameera Cassim, Tristyn Ferreiro, Sarah Tallack, Heather Wimberley
// 
// Create Date: 27.04.2023 08:07:21
// Design Name: ISD_PO
// Module Name: LSD_retrieve
//////////////////////////////////////////////////////////////////////////////////

module LSD_retriever(input [63:0] encoded,output [7:0] retrived);
    //retrive the LSB of each byte inputted and output it
    assign retrived[0] = encoded[8*0];
    assign retrived[1] = encoded[8*1];
    assign retrived[2] = encoded[8*2];
    assign retrived[3] = encoded[8*3];
    assign retrived[4] = encoded[8*4];
    assign retrived[5] = encoded[8*5];
    assign retrived[6] = encoded[8*6];
    assign retrived[7] = encoded[8*7];
endmodule
