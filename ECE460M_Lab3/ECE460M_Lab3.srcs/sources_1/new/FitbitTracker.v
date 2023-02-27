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
    input pulse,
    input clk,
    input reset,
    output reg SI,
    output reg [15:0] distance1,
    output reg [3:0] distance2,
    output reg [19:0] over32,
    output reg [19:0] highAct,
    output reg [19:0] stepsdisp
    );
    
    reg [15:0] ratecheck;
    reg [31:0] steps;
    reg [31:0] seconds;
    reg [31:0] lastpulse;
    reg [31:0] currentpulse;
    reg [15:0] rate;
    reg [15:0] time1 = 0;
    reg [15:0] time2 = 0;
    
    wire clk1sec;
    
    secs_clk s0(clk, clk1sec);
    
    initial begin 
    SI = 0;
    ratecheck = 0;
    seconds = 0;
    steps = 0; 
    distance1 = 0;
    distance2 = 0;
    over32 = 0;
    highAct = 0;
    lastpulse = 0;
    currentpulse = 0;
    rate = 0;
    stepsdisp = 0;
    end
    
    
    always@(posedge pulse, posedge reset) begin
        //check for reset
        if(reset)begin
            SI = 0;
            steps = 0; 
            distance1 = 0;
            distance2 = 0;
            stepsdisp = 0;
        end else begin
        
        //when pulse goes high update values
        //if(pulse)begin
        
           //step counter
           steps = steps + 1;
           
           //check for saturation
           if(steps > 9998)begin
              stepsdisp = 9999;
              SI = 1;
           end else begin
           stepsdisp = steps;
           end
           
           //calculate distance 
           distance1 <= (steps/2048)/2;
           
           if((steps/2048)%2)begin
              distance2 <= 5;
           end
           else begin
              distance2 <= 0;
           
          end  
        end
        
    end
    
    always@(posedge pulse, posedge reset) begin
    if(reset)begin
    rate = 0;
    end else begin
    if(time1 != time2) begin
        time2 = time1;
        rate = 0;
        end else
        rate = rate +1;
    end
    end
    
    always@(negedge clk1sec, posedge reset)begin
        if(reset)begin
        highAct = 0;
        over32 = 0;
        ratecheck = 0;
        seconds = 0;
        end else begin
        //keep count of how many seconds have passed
        seconds = seconds + 1;    
        time1 = seconds;  
        
        //find rate subtract current steps - last steps
//        if(seconds < 1 || seconds == 1)begin
//            rate = steps;
//            lastpulse = steps;
//        end else if(seconds > 1) begin
//            rate = steps - lastpulse;
//            lastpulse = steps;
//        end   
        
         //check for seconds w/rate greater than 32
        if((seconds < 9) && (rate > 31))begin
            over32 = over32 + 1;
        end
        
        //check for low activity
        if(rate < 64)begin
            ratecheck = 0;
        end
        
        //check for high activity 
        if(rate > 63)begin
            ratecheck = ratecheck + 1;
            if(ratecheck == 60)begin
                highAct = highAct + 60; 
            end else
            if(ratecheck > 60)begin
                highAct = highAct + 1;
            end
        end      
    end  
  end
    
endmodule
