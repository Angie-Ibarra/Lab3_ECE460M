`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2023 04:18:35 PM
// Design Name: 
// Module Name: Top
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


module Top(fastclk, mode, start, reset, SI, sel);
input start;
input [1:0] mode;
input reset;
input fastclk;
input [1:0]sel;

output SI;
wire [15:0]steps;
wire [15:0]distance1;
wire [3:0]distance2;
wire [15:0]over32;
wire [15:0]highAct;
wire clk1sec;
wire pulse;
wire [15:0] out;
wire [15:0] bcd;

secs_clk(fastclk, clk1sec);
PulseGenerator(mode, reset, start, clk1sec, pulse);
FitbitTracker(pulse, clk1sec, reset, SI, steps, distance1, distance2, over32, highAct);
mux(steps, distance, over32, highAct, clk1sec, out);
Binary2BCD b0(out[15:12], bcd);
Binary2BCD b1(out[11:8], bcd);
Binary2BCD b2(out[7:4], bcd);
Binary2BCD b3(out[3:0], bcd);



endmodule
