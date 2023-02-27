`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2023 09:59:51 PM
// Design Name: 
// Module Name: BCD_7seg
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


module BCD_7seg(bcd, seven);
    input [3:0] bcd;
    output[7:1] seven;

    reg [7:1] seven;

    always@(bcd) begin
        case(bcd)
            4'b0000: seven = 7'b0000001;
            4'b0001: seven = 7'b1001111;
            4'b0010: seven = 7'b0010010;
            4'b0011: seven = 7'b0000110;
            4'b0100: seven = 7'b1001100;
            4'b0101: seven = 7'b0100100;
            4'b0110: seven = 7'b0100000;
            4'b0111: seven = 7'b0001111;
            4'b1000: seven = 7'b0000000;
            4'b1001: seven = 7'b0000100;
            4'b1010 : seven = 7'b1110111 ; //bottom line for distance
            default : seven = 7'b1111111 ; 
        endcase
    end
endmodule
