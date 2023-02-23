`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2023 02:01:29 PM
// Design Name: 
// Module Name: FitbitTracker
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


module FitbitTracker(
     pulse,
     clk1sec,
     reset,
     SI,
     steps,
     distance1,
     distance2,
     over32,
     highAct
    );
    
    input pulse;
    input clk1sec;
    input reset;
    output SI;
    output [15:0] steps;
    output [15:0] distance1;
    output [3:0] distance2;
    output [15:0] over32;
    output [15:0] highAct;
    
    reg SI; 
    reg ratecheck;
    reg [15:0] seconds;
    reg [15:0] steps;
    reg [15:0] distance1;
    reg [3:0] distance2;
    reg [15:0] over32;
    reg [15:0] highAct;
    
    
    initial begin 
    SI = 0;
    ratecheck = 0;
    seconds = 0;
    steps = 0; 
    distance1 = 0;
    distance2 = 0;
    over32 = 0;
    highAct = 0;
    end
    
    always@(posedge pulse) begin
        //check for reset
        if(reset)begin
           SI = 0;
           ratecheck = 0;
           seconds = 0;
           steps = 0;
           distance1 = 0;
           distance2 = 0;
           over32 = 0;
           highAct = 0;
        end
        
        //when pulse goes high update values
        //if(pulse)begin
        
           //step counter
           steps = steps + 1;
           
           //check for saturation
           if(steps >= 9999)begin
              SI = 1;
           end
           
           //calculate distance 
           distance1 <= (steps/2048)/2;
           
           if((steps/2048)%2)begin
              distance2 <= 5;
           end
           else begin
              distance2 <= 0;
           end
              
        //end
        
    end
    
    always@(negedge clk1sec)begin
        //keep count of how many seconds have passed
        seconds = seconds + 1;
        
        //check for seconds w/rate greater than 32
        if(seconds <= 9 && ((steps/seconds) >= 32))begin
            over32 <= over32 + 1;
        end
        
        //check for low activity
        if((steps/seconds) < 64)begin
            ratecheck = 0;
        end
        
        //check for high activity 
        if((steps/seconds) >= 64)begin
            ratecheck = ratecheck + 1;
            if(ratecheck == 60)begin
                highAct = highAct + 60; 
            end
            if(ratecheck > 60)begin
                highAct = highAct + 1;
            end
        end    
    end
    
    always@(posedge reset)begin
       SI = 0;
       ratecheck = 0;
       seconds = 0;
       steps = 0;
       distance1 = 0;
       distance2 = 0;
       over32 = 0;
       highAct = 0;
    end
    
endmodule
