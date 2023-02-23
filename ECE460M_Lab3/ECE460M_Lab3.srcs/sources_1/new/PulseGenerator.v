`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2023 04:11:47 PM
// Design Name: 
// Module Name: PulseGenerator
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


module PulseGenerator(
     mode,
     reset,
     start,
     clk,
     pulse,
     clk1sec
    );
    
    input [1:0] mode;
    input reset;
    input start;
    input clk;
    output pulse;
    
    reg pulse;
    reg [7:0] counter;
    reg [31:0] counter2; 
    
    output clk1sec;
    
    secs_clk so(clk, clk1sec);
    
    initial begin
       pulse = 0;
       counter = 0;
       counter2 = 0;
    end
    
    always@(posedge clk1sec, start, reset)begin 
        if(start && !reset)begin
            case(mode)
               00: begin
               for(counter = 64; counter >0; counter = counter - 1)begin
               counter2 = 150000;
               while(counter2 > 0)begin
                counter2 = counter2 - 1;
               end
               pulse = ~pulse; 
               end
               end 
            
               01: begin
            
               end
            
               10: begin
            
               end
            
               11: begin
            
               end
           endcase
        end
        
        if(!start)begin
        
        end 
        
        if(reset)begin
        counter = 0;
        end
    end
      
    
endmodule
