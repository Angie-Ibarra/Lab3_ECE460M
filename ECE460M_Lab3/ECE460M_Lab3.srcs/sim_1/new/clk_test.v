`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2023 06:27:10 PM
// Design Name: 
// Module Name: clk_test
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


`timescale 1ns / 1ps
// fpga4student.com FPGA projects, VHDL projects, Verilog projects
// Verilog project: Verilog code for clock divider on FPGA
// Testbench Verilog code for clock divider on FPGA
module clk_test;
reg clk100Mhz;
 // Outputs
 wire clk1sec;
 // Instantiate the Unit Under Test (UUT)
 // Test the clock divider in Verilog
 secs_clk uut (
  .clk100Mhz(clk100Mhz), 
  .clk1sec(clk1sec)
 );
 initial begin
  // Initialize Inputs
  clk100Mhz = 0;
  // create input clock 50MHz
        forever #5 clk100Mhz = ~clk100Mhz;
 end
      
endmodule
