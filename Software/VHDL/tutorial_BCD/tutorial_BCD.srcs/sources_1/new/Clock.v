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

	// currently the length is hard coded, but if we maybe pass it in as a variable (so number of characters*8 - 1, then we could use it throughout)
	reg length = 4'd17 * 4'd8 - 1'b1; \\ no. characters * 8 bits/characters - 1
	reg [length:0] msg = {8'd17, 8'd14, 8'd21, 8'd21, 8'd24, 8'd36, 8'd28, 8'd25, 8'd24, 8'd23, 8'd36, 8'd28, 8'd26, 8'd30, 8'd10, 8'd13, 8'd36};
    
	//Initialize seven segment
	wire [7:0] SevenSegment;
	wire [7:0] SegmentDrivers;
	
	// You will need to change some signals depending on you constraints
	SS_Driver SS_Driver1(
		CLK100MHZ, reset,
		msg[length:length - 4'd8 * 4'd8 + 1'b1], // Use temporary test values before adding hours2, hours1, mins2, mins1
		SegmentDrivers, SevenSegment
	);
	
	assign SEG = SevenSegment[6:0];
	assign DP = SevenSegment[7];
	assign AN = SegmentDrivers;
	
	// Counter to reduce the 100 MHz clock to 0.745 Hz (100 MHz / 2^27)
	reg [26:0] Count;
	
	//The main logic
	always @(posedge CLK100MHZ) begin
		Count2 <= Count + 1'b1;
		// Every second, move the left most digit to the end of the message array
		if(&Count) msg <= {msg[length - 4'd8:0], msg[length:length - 4'd7]};
	end
endmodule  
