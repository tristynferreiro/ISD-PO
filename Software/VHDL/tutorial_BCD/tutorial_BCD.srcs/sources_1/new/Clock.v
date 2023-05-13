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
	

	reg [65:0] msg = {6'd17, 6'd14, 6'd21, 6'd21, 6'd24, 6'd36, 6'd28, 6'd25, 6'd24, 6'd23, 6'd36};
    
	//Initialize seven segment
	wire [7:0] SevenSegment;
	wire [7:0] SegmentDrivers;
	
	// You will need to change some signals depending on you constraints
	SS_Driver SS_Driver1(
		CLK100MHZ, reset,
		msg[65:65-6*8+1], // Use temporary test values before adding hours2, hours1, mins2, mins1
		SegmentDrivers, SevenSegment
	);
	
	assign SEG = SevenSegment[6:0];
	assign DP = SevenSegment[7];
	assign AN = SegmentDrivers;
	
	reg [26:0] Count2;
	
	//The main logic
	always @(posedge CLK100MHZ) begin
	Count2 <= Count2 + 1'b1;
	if(&Count2) msg <= {msg[59:0], msg[65:60]};
	end
endmodule  
