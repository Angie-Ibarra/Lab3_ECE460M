`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2023 04:23:12 PM
// Design Name: 
// Module Name: clk2sec
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


module clk2sec(clk100Mhz, clk2sec);

  input clk100Mhz; //fast clock
  output reg clk2sec; //slow clock

  reg[27:0] counter;

  initial begin
    counter = 0;
    clk2sec = 0;
  end

  always @ (posedge clk100Mhz)
  begin
    if(counter == 100000000) begin
      counter <= 1;
      clk2sec <= ~clk2sec;
    end
    else begin
      counter <= counter + 1;
    end
  end

endmodule
