`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2023 08:07:21
// Design Name: 
// Module Name: read_Testbench
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


module read_Testbench;
    parameter numBytes = 200;
    reg clk;
    reg start;
    reg reset;
    wire [numBytes-1:0] char_String;
    
    readImage #(.numBytes(numBytes))read (.clk(clk),.start(start),.reset(reset),.char_String(char_String));//,b2[0],b3[0],b4[0],b5[0],b6[0],b7[0],b8[0]);
//    initial begin
//    $monitor("%d %d",$realtime);
//    end
    initial begin
        start = 1'b0;
        clk = 1'b0;
        reset = 1'b0;
        #1 reset = ~reset;
        #1 reset = ~reset;
    end
     
    parameter clockRate = 1;
        
    always #0.1 clk= ~clk;   
    
endmodule
