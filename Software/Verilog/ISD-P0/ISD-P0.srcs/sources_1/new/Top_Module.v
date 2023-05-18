`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Cape Town
// Engineer: Shameera Cassim, Tristyn Ferreiro, Sarah Tallack, Heather Wimberley
// 
// Create Date: 27.04.2023 08:07:21
// Design Name: ISD_PO
// Module Name: Top_Module
//////////////////////////////////////////////////////////////////////////////////

module top
#(parameter numBytes = 200)//parameter from testbench with the default of 200
(
    input clk,
    input reset,
    output wire [numBytes-1:0] msg,
    output reg done
    );
    
    //initialise the register that will store the image
    reg [7:0] image [numBytes-1:0];
   
    //initialise the value to step through BRAM and indicate that the step though is done
    integer k;
    reg ready = 1'b0;
   
    //create the variable for the generate block
    genvar i;
    
    //initialise the wires for BRAM
    wire ena = 1'b1;
    wire wea = 1'b0;
    wire [7:0] douta;
    wire [15:0] addra;
    wire [7:0] dina = 8'b0;
    
    //assign the address to the k counter
    assign addra = k;
    
    //create a BRAM instance
    blk_mem_gen_0 IMAGE1 (clk,
        ena,
        wea,
        addra,
        dina,
        douta
    );
  
    //the code below should be uncommented to read directly from the .hex file
//    initial begin
//        $readmemh ("stego.hex",image ); // read in bytes from file
//    end
    
    //set up reset functionality
    always @ (posedge reset) begin
        k = 1'b0;
        ready = 1'b0;
    end
   
   //create the logic to step through the BRAM and store it in image
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
    
    // creates the parallel implementation
    // every 8 bytes are read into a seperate module where 8 decoded bits are returned 
    generate
        for(i = 1;i<numBytes-7;i = i+7) begin
            reg [63:0] encoded = 64'b0;
            always @(posedge ready) begin
                    encoded = {image[i+7],image[i+6],image[i+5],image[i+4],image[i+3],image[i+2],image[i+1],image[i]};        
            end
            LSD_retriever recieve (encoded,msg[i+6:i-1]);
        end
    endgenerate
    
    //flag the decoding as done if the delimiter is detected
    //currently the delimiter position needs to be hard coded
    always @ (clk) begin
        if (msg[112:105] == 8'b00100100) begin
            done = 1'b1;
        end
        else begin
            done = 1'b0;
        end
    end
endmodule