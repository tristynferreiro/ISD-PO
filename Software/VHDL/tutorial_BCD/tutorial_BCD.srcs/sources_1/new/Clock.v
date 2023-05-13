`timescale 1ns / 1ps



module WallClock(
	input CLK100MHZ,//inputs - these will depend on your board's constraint files
    input [8:0]SW,
	output wire [7:0] AN,
	output wire [6:0] SEG,
	output wire DP
	
);

	//Add the reset
    wire reset = SW[8];

	//Add and debounce the buttons
	wire MButton;
	wire HButton;
	
	// Instantiate Debounce modules here
	
	// registers for storing the time
    	reg [3:0]hours1=4'd0;
	reg [3:0]hours2=4'd0;
	reg [3:0]mins1=4'd0;
	reg [3:0]mins2=4'd0;
    
	//Initialize seven segment
	wire [7:0] SevenSegment;
	wire [7:0] SegmentDrivers;
	
	// You will need to change some signals depending on you constraints
	SS_Driver SS_Driver1(
		CLK100MHZ, reset,
		SW[7],SW[6],SW[5],SW[4],SW[3], SW[2], SW[1], SW[0], // Use temporary test values before adding hours2, hours1, mins2, mins1
		SegmentDrivers, SevenSegment
	);
	
	assign SEG = SevenSegment[6:0];
	assign DP = SevenSegment[7];
	assign AN = SegmentDrivers;
	
	//The main logic
	always @(posedge CLK100MHZ) begin
	end
endmodule  
