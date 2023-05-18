`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Cape Town
// Engineer: Shameera Cassim, Tristyn Ferreiro, Sarah Tallack, Heather Wimberley
// 
// Create Date: 27.04.2023 08:07:21
// Design Name: ISD_PO
// Module Name: ISD_Testbench
//////////////////////////////////////////////////////////////////////////////////


module ISD_Testbench;
    
    //initialise pixel number
    parameter numBytes = 128;
    
    //create lines used as input and output to and from the top module
    reg clk;
    reg reset;
    wire [numBytes-1:0] msg;
    wire done;
    
    //variables used to write to text file
    integer i,f,j;
    
    //create an instance of the top module
    top #(.numBytes(numBytes))top1 (.clk(clk),.reset(reset),.msg(msg),.done(done));
    
    //set input lines to zero and invert the reset line at least once to get the device to start
    initial begin
        clk = 1'b0;
        reset = 1'b0;
        #1 reset = ~reset;
        #1 reset = ~reset;  
    end
        
    always begin
        //wait 10 to get clock cycle of 100MHz
        #10 clk= ~clk; 
        
        //read the msg output from the top module to a text file grouping bytes together
        f = $fopen("output.txt","w");
        
        for (i = 1; i<numBytes; i=i+8) begin
            for (j = 0; j<8; j= j+1) begin
                $fwrite(f,"%b",msg[i+j]); 
            end
            $fwrite(f," ");
        end
        
        $fclose(f);
    end  
    
endmodule