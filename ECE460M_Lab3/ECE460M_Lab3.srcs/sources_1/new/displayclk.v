`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2023 05:21:53 AM
// Design Name: 
// Module Name: displayclk
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


module displayclk(
    input clk,
    output displayclk
    );

reg[18:0] COUNT = 0;

assign displayclk = COUNT[18];

always @(posedge clk) begin
    COUNT = COUNT + 1;
end
    
endmodule
