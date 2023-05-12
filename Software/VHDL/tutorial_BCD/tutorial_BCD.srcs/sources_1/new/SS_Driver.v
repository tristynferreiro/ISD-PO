module SS_Driver(
    input Clk, Reset,
    input [3:0] BCD7,BCD6,BCD5,BCD4,BCD3, BCD2, BCD1, BCD0, // Binary-coded decimal input
    output reg [7:0] SegmentDrivers, // Digit drivers (active low)
    output reg [7:0] SevenSegment // Segments (active low)
);

initial begin
    SegmentDrivers = 8'hFE;
end

// Make use of a subcircuit to decode the BCD to seven-segment (SS)
wire [55:0]SS;
BCD_Decoder BCD_Decoder0 (BCD0, SS[6:0]);
BCD_Decoder BCD_Decoder1 (BCD1, SS[13:7]);
BCD_Decoder BCD_Decoder2 (BCD2, SS[20:13]);
BCD_Decoder BCD_Decoder3 (BCD3, SS[27:21]);
BCD_Decoder BCD_Decoder4 (BCD4, SS[34:28]);
BCD_Decoder BCD_Decoder5 (BCD5, SS[41:35]);
BCD_Decoder BCD_Decoder6 (BCD6, SS[48:42]);
BCD_Decoder BCD_Decoder7 (BCD7, SS[55:49]);


// Counter to reduce the 100 MHz clock to 762.939 Hz (100 MHz / 2^17)
reg [19:0]Count;

// Scroll through the digits, switching one on at a time
always @(posedge Clk) begin
 Count <= Count + 1'b1;
    if ( Reset) SegmentDrivers <= 8'hFE;
 else if(Count[19]) SegmentDrivers <= {SegmentDrivers[6:0], SegmentDrivers[7]};
end

//------------------------------------------------------------------------------
always @(*) begin // This describes a purely combinational circuit
    SevenSegment[7] <= 1'b1; // Decimal point always off
    if (Reset) begin
        SevenSegment[6:0] <= 7'h7F; // All off during Reset
    end else begin
        case(~SegmentDrivers) // Connect the correct signals,
            8'h1 : SevenSegment[6:0] <= ~SS[6:0]; // depending on which digit is on at
            8'h2 : SevenSegment[6:0] <= ~SS[13:7]; // this point
            8'h4 : SevenSegment[6:0] <= ~SS[20:14];
            8'h8 : SevenSegment[6:0] <= ~SS[27:21];
            8'h10: SevenSegment[6:0] <= ~SS[34:28];
            8'h20: SevenSegment[6:0] <= ~SS[41:35];
            8'h40: SevenSegment[6:0] <= ~SS[48:42];
            8'h80: SevenSegment[6:0] <= ~SS[55:49];
            default: SevenSegment[6:0] <= 7'h7F;
        endcase
    end
end

endmodule