`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2023 01:39:21 PM
// Design Name: 
// Module Name: displaycontrol
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


module displaycontrol(clk, start, reset, out);
output reg [19:0] out;
input clk;
input start;
input reset;

wire clk2sec;
wire [15:0]steps;
wire [15:0]distance1;
wire [3:0]distance2;
wire [15:0]over32;
wire [15:0]highAct;
wire [19:0] stepsdisp;

reg [1:0] displaymode;

clk2sec (clk, clk2sec);
FitbitTracker (pulse, clk1sec, reset, SI, steps, distance1, distance2, over32, highAct, stepsdisp);

always@(posedge clk2sec)begin
    case(displaymode)
    0:begin
    out = stepsdisp;
    end
    
    1:begin
    
    end
    
    2:begin
    out = over32;
    end
    
    3:begin
    out = highAct;
    end
    
    endcase
    
    displaymode = displaymode + 1;
    if(displaymode > 3)begin
    displaymode = 0;
    end 

end

endmodule
