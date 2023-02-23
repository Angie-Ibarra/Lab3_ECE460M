`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2023 01:19:12 AM
// Design Name: 
// Module Name: mux
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


module mux(steps, distance, over32, highAct, clk1sec, out);
input [15:0]steps;
input [15:0]distance;
input [15:0]over32;
input [15:0]highAct;
input[15:0] clk1sec;
output reg out;

reg [1:0] sel;
wire bcd;

always@(sel)begin 
case(sel)
2'b00: out = steps;

2'b01: out = distance;

2'b10: out = over32;

2'b11: out = highAct;

endcase
end

always@(negedge clk1sec)begin
sel = sel +1;
if(sel == 3)begin
sel = 0;
end
end


endmodule
