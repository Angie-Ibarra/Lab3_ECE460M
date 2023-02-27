`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2023 01:35:41 AM
// Design Name: 
// Module Name: tb_FitbitTracker
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


module tb_FitbitTracker;

    reg start; 
    reg clk;
    reg mode;
    reg reset;
    wire SI;
    wire [15:0] distance1;
    wire [3:0] distance2;
    wire [19:0] over32;
    wire [19:0] highAct;
    wire [19:0] stepsdisp;
    
    TopTest uut(
        .start(start),
        .clk(clk),
        .mode(mode),
        .reset(reset),
        .SI(SI),
        .distance1(distance1),
        .distance2(distance2),
        .over32(over32),
        .highAct(highAct),
        .stepsdisp(stepsdisp));

    initial begin
    start = 1;
    mode = 1;
    reset = 0;
    clk = 0;
    end
    
    initial begin
    forever #5 clk = ~clk;
    end
    
endmodule
