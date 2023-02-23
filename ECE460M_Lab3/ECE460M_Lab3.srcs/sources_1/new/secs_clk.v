`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2023 04:58:27 PM
// Design Name: 
// Module Name: secs_clk
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


// fpga4student.com: FPGA projects, VHDL projects, Verilog projects
// Verilog project: Verilog code for clock divider on FPGA
// Top level Verilog code for clock divider on FPGA
module secs_clk(clk100Mhz, clk1sec);
  input clk100Mhz; //fast clock
  output reg clk1sec; //slow clock

  reg[27:0] counter;

  initial begin
    counter = 0;
    clk1sec = 0;
  end

  always @ (posedge clk100Mhz)
  begin
    if(counter == 50000000) begin
      counter <= 1;
      clk1sec <= ~clk1sec;
    end
    else begin
      counter <= counter + 1;
    end
  end
    
endmodule