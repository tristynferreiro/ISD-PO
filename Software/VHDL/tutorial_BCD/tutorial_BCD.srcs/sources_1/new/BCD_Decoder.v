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
    6'd0 : SevenSegment <= 7'b0111111;  //     a
    6'd1 : SevenSegment <= 7'b0000110;  //    ----
    6'd2 : SevenSegment <= 7'b1011011;  //   |   |
    6'd3 : SevenSegment <= 7'b1001111;  //  f| g |b
    6'd4 : SevenSegment <= 7'b1100110;  //    ----
    6'd5 : SevenSegment <= 7'b1101101;  //   |   |
    6'd6 : SevenSegment <= 7'b1111101;  //  e|   |c
    6'd7 : SevenSegment <= 7'b0000111;  //    ----
    6'd8 : SevenSegment <= 7'b1111111;  //      d
    6'd9 : SevenSegment <= 7'b1101111;
    
    6'd10 : SevenSegment <= 7'b1110111; // A
    6'd11 : SevenSegment <= 7'b1111100; // B
    6'd12 : SevenSegment <= 7'b0111001; // C
    6'd13 : SevenSegment <= 7'b1011110; // D
    6'd14 : SevenSegment <= 7'b1111001; // E
    6'd15 : SevenSegment <= 7'b1110001; // F
    6'd16 : SevenSegment <= 7'b0111101; // G
    6'd17 : SevenSegment <= 7'b1110100; // H
    6'd18 : SevenSegment <= 7'b0000110; // I
    6'd19 : SevenSegment <= 7'b0011110; // J   
    6'd20 : SevenSegment <= 7'b1110101; // K
    6'd21 : SevenSegment <= 7'b0111000; // L
    6'd22 : SevenSegment <= 7'b1010101; // M
    6'd23 : SevenSegment <= 7'b1010100; // N
    6'd24 : SevenSegment <= 7'b1011100; // O
    6'd25 : SevenSegment <= 7'b1110011; // P
    6'd26 : SevenSegment <= 7'b1100111; // Q
    6'd27 : SevenSegment <= 7'b1010000; // R
    6'd28 : SevenSegment <= 7'b1101101; // S
    6'd29 : SevenSegment <= 7'b1111000; // T
    6'd30 : SevenSegment <= 7'b0111110; // U
    6'd31 : SevenSegment <= 7'b0011100; // V
    6'd32 : SevenSegment <= 7'b1101010; // W
    6'd33 : SevenSegment <= 7'b1110110; // X
    6'd34 : SevenSegment <= 7'b1101110; // Y
    6'd35 : SevenSegment <= 7'b1011011; // Z
    
    6'd36 : SevenSegment <= 7'b0000000; //off
    6'd37 : SevenSegment <= 7'b1000000; //-
    6'd38 : SevenSegment <= 7'b1000000; //-

default: SevenSegment <= 7'b0000000;
endcase
end
//--------------------------------------------------------------
endmodule 