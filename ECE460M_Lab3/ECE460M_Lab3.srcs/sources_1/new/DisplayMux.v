`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2023 04:38:44 AM
// Design Name: 
// Module Name: DisplayMux
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


module DisplayMux(
    input clk,
    input [27:0] seven,
    output reg [3:0] an,
    output reg [6:0] sseg);
    
    reg [1:0] state;
    reg [1:0] nextstate;
    
    wire displayclk;
    
    displayclk d1(.clk(clk), .displayclk(displayclk));
    
        always @ (*) begin
        case (state)
            2'b00: begin
                an = 4'b0111;
                sseg = seven[27:21];
                nextstate = 2'b01;
            end
            2'b01: begin
                an = 4'b1011;
                sseg = seven[20:14];
                nextstate = 2'b10;
            end
            2'b10: begin
                an = 4'b1101; 
                sseg = seven[13:7];
                nextstate = 2'b11;
            end
            2'b11: begin
                an = 4'b1110; 
                sseg = seven[6:0];
                nextstate = 2'b00;
            end
        endcase
    end

    always @(posedge displayclk) begin
        state <= nextstate;
    end
    
endmodule
