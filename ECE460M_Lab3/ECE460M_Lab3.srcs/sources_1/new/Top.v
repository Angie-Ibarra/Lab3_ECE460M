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


module Top(fastclk, mode, start, reset, SI, sel, an);
input start;
input [1:0] mode;
input reset;
input fastclk;
input [1:0]sel;

output SI;
output reg [3:0] an;
wire [15:0]steps;
wire [15:0]distance1;
wire [3:0]distance2;
wire [15:0]over32;
wire [15:0]highAct;
wire clk1sec;
wire [7:1] seven1, seven2, seven3, seven4;
wire pulse;
wire [15:0] out;
wire [15:0] bcd;
wire clk2sec;
wire [19:0] stepsdisp;
wire [19:0] out;
reg [1:0] displaymode;
reg [3:0] underscore;


initial begin
displaymode = 0;
an = 4'b0000;
end

secs_clk s0(fastclk, clk1sec);

displaycontrol d1(clk, start, reset, out);
Binary2BCD c0(out,bcd);
BCD_7seg b0(bcd[15:12], seven1);
BCD_7seg b1(bcd[11:8], seven2);
BCD_7seg b2(bcd[7:4], seven3);
BCD_7seg b3(bcd[3:0], seven4);

//PulseGenerator(mode, reset, start, clk1sec, pulse);
//FitbitTracker(pulse, clk1sec, reset, SI, steps, distance1, distance2, over32, highAct, stepsdisp);
//mux(steps, distance, over32, highAct, clk1sec, out);
   
    //Binary2BCD (stepsdisp, bcd);



/*always@(posedge clk2sec)begin
    
    case(displaymode)
    0:begin
    an = 4'b0000;
    Binary2BCD (stepsdisp, bcd);
    BCD_7seg (bcd[3:0], seven1);
    BCD_7seg (bcd[7:4], seven2);
    BCD_7seg (bcd[11:8], seven3);
    BCD_7seg (bcd[15:12], seven4);
    end
    
    1:begin
    an = 4'b0000;
    BCD_7seg (distance2, seven1);
    underscore = 10;
    BCD_7seg (underscore, seven2);
    Binary2BCD (distance1, bcd);
    BCD_7seg (bcd[3:0], seven3);
    BCD_7seg (bcd[7:4], seven4);
    end
    
    2:begin
    
    end
    
    3:begin
    
    end
    
    endcase
    
    displaymode = displaymode + 1;
    if(displaymode > 3)begin
    displaymode = 0;
    end
    
end*/

endmodule
