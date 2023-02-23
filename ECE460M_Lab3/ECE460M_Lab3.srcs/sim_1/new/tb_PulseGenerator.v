`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2023 11:23:22 PM
// Design Name: 
// Module Name: tb_PulseGenerator
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


module tb_PulseGenerator;

    reg [1:0] mode;
    reg reset;
    reg start;
    reg clk;
    wire pulse;
    
    PulseGenerator uut(
    .mode(mode),
    .reset(reset),
    .start(start),
    .clk(clk),
    .pulse(pulse)
    );
    
    initial begin
    mode = 0;
    reset = 0;
    start = 1;
    clk = 0;
    end
    
    initial begin 
    forever #5 clk = ~clk;
    end
    
   
endmodule
