`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2023 01:26:11 AM
// Design Name: 
// Module Name: TopTest
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


module TopTest(
    input start, 
    input clk, 
    input [1:0] mode, 
    input reset,
    output SI,
    output [3:0] an,
    output [6:0] sseg);
    
    wire pulse;
    wire distCheck;
    wire [15:0] distance1;
    wire [3:0] distance2;
    wire [19:0] over32;
    wire [19:0] highAct;
    wire [19:0] stepsdisp;
    wire [19:0] bin;
    wire [15:0] bcd;
    wire [27:0] seven;
    
    PulseGenerator p0(.start(start), .clk(clk), .reset(reset), .mode(mode), .pulse(pulse));
    FitbitTracker f0(.pulse(pulse), .clk(clk), .reset(reset), .SI(SI), .distance1(distance1), .distance2(distance2), .over32(over32), .highAct(highAct), .stepsdisp(stepsdisp));
    displaycontrol d0(.clk(clk), .stepsdisp(stepsdisp), .distance1(distance1), .distance2(distance2), .over32(over32), .highAct(highAct), .bin(bin), .distCheck(distCheck));
    Binary2BCD b0(.bin(bin), .distCheck(distCheck), .distance2(distance2), .bcd(bcd));
    BCD_7seg bcd0(.bcd(bcd[15:12]), .seven(seven[27:21]));
    BCD_7seg bcd1(.bcd(bcd[11:8]), .seven(seven[20:14]));
    BCD_7seg bcd2(.bcd(bcd[7:4]), .seven(seven[13:7]));
    BCD_7seg bcd3(.bcd(bcd[3:0]), .seven(seven[6:0]));
    DisplayMux dm0(.clk(clk), .seven(seven), .an(an), .sseg(sseg));
    
endmodule
