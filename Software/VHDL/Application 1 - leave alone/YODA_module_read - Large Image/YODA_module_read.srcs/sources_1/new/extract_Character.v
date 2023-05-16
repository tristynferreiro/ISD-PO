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

module extract_Character(input [63:0] eight_Bytes,output [7:0] character);
//module extract_Character(input [63:0] eight_Bytes, eight_Bytes2,output [15:0] character);//output wire delimiter);
    assign character[0] = eight_Bytes[8*0];
    assign character[1] = eight_Bytes[8*1];
    assign character[2] = eight_Bytes[8*2];
    assign character[3] = eight_Bytes[8*3];
    assign character[4] = eight_Bytes[8*4];
    assign character[5] = eight_Bytes[8*5];
    assign character[6] = eight_Bytes[8*6];
    assign character[7] = eight_Bytes[8*7];
    
//    assign character[8] = eight_Bytes2[8*0];
//    assign character[9] = eight_Bytes2[8*1];
//    assign character[10] = eight_Bytes2[8*2];
//    assign character[11] = eight_Bytes2[8*3];
//    assign character[12] = eight_Bytes2[8*4];
//    assign character[13] = eight_Bytes2[8*5];
//    assign character[14] = eight_Bytes2[8*6];
//    assign character[15] = eight_Bytes2[8*7];
    
    //assign delimiter = (character == 8'd36) ? 1'b1 : 1'b0;
endmodule
