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


module displaycontrol(
    input clk,
    input [15:0] distance1,
    input [3:0] distance2,
    input [19:0] over32,
    input [19:0] highAct,
    input [19:0] stepsdisp,
    output reg [19:0] bin,
    output reg distCheck);
    
    wire clk2sec;

    reg [1:0] displaymode;

    clk2sec (clk, clk2sec);

    initial begin
    displaymode = 0;
    bin = 0;
    distCheck = 0;
    end

    always@(posedge clk2sec)begin
        case(displaymode)
        2'b00:begin
        bin = stepsdisp;
        distCheck = 0;
        end
        
        2'b01:begin
        bin = distance1;
        distCheck = 1;
        end
        
        2'b10:begin
        bin = over32;
        distCheck = 0;
        end
        
        2'b11:begin
        bin = highAct;
        distCheck = 0;
        end
        
        endcase
        
        displaymode = displaymode + 1;
        if(displaymode > 3)begin
        displaymode = 0;
        end 
    
    end
    
endmodule
