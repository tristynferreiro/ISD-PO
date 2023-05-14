module BCD_Decoder(
    input [5:0]BCD,
    output reg [6:0]SevenSegment
);
//------------------------------------------------------------------------------
// Combinational circuit to convert BCD input to seven-segment output
always @(BCD) 
begin
case(BCD)
    // gfedcba
    8'd0 : SevenSegment <= 7'b0111111;  //     a
    8'd1 : SevenSegment <= 7'b0000110;  //    ----
    8'd2 : SevenSegment <= 7'b1011011;  //   |   |
    8'd3 : SevenSegment <= 7'b1001111;  //  f| g |b
    8'd4 : SevenSegment <= 7'b1100110;  //    ----
    8'd5 : SevenSegment <= 7'b1101101;  //   |   |
    8'd6 : SevenSegment <= 7'b1111101;  //  e|   |c
    8'd7 : SevenSegment <= 7'b0000111;  //    ----
    8'd8 : SevenSegment <= 7'b1111111;  //      d
    8'd9 : SevenSegment <= 7'b1101111;
    
    8'd10 : SevenSegment <= 7'b1110111; // A
    8'd11 : SevenSegment <= 7'b1111100; // B
    8'd12 : SevenSegment <= 7'b0111001; // C
    8'd13 : SevenSegment <= 7'b1011110; // D
    8'd14 : SevenSegment <= 7'b1111001; // E
    8'd15 : SevenSegment <= 7'b1110001; // F
    8'd16 : SevenSegment <= 7'b0111101; // G
    8'd17 : SevenSegment <= 7'b1110100; // H
    8'd18 : SevenSegment <= 7'b0000110; // I
    8'd19 : SevenSegment <= 7'b0011110; // J   
    8'd20 : SevenSegment <= 7'b1110101; // K
    8'd21 : SevenSegment <= 7'b0111000; // L
    8'd22 : SevenSegment <= 7'b1010101; // M
    8'd23 : SevenSegment <= 7'b1010100; // N
    8'd24 : SevenSegment <= 7'b1011100; // O
    8'd25 : SevenSegment <= 7'b1110011; // P
    8'd26 : SevenSegment <= 7'b1100111; // Q
    8'd27 : SevenSegment <= 7'b1010000; // R
    8'd28 : SevenSegment <= 7'b1101101; // S
    8'd29 : SevenSegment <= 7'b1111000; // T
    8'd30 : SevenSegment <= 7'b0111110; // U
    8'd31 : SevenSegment <= 7'b0011100; // V
    8'd32 : SevenSegment <= 7'b1101010; // W
    8'd33 : SevenSegment <= 7'b1110110; // X
    8'd34 : SevenSegment <= 7'b1101110; // Y
    8'd35 : SevenSegment <= 7'b1011011; // Z
    
    8'd36 : SevenSegment <= 7'b0000000; //off
    8'd37 : SevenSegment <= 7'b1000000; //-
    8'd38 : SevenSegment <= 7'b1000000; //-

default: SevenSegment <= 7'b0000000;
endcase
end
//--------------------------------------------------------------
endmodule 