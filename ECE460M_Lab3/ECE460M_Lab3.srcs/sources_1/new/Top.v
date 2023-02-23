`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2023 03:27:06 PM
// Design Name: 
// Module Name: TOP
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


module TOP(
    input clk,
    input reset
    );
    
    
    Binary2BCD b1(bin, bcd);
    BCDto7segment s1(bcd, seg); //order: input, output
    MUX m1(clk, reset, s0, s1, mode1, mode2, mode3, mode4, out);
    
endmodule    

module Binary2BCD(
    input [7:0] bin,
    output reg [11:0] bcd
    );
    reg [3:0] i;
    always @(bin)
        begin
            bcd = 0; //initialize bcd to zero.
            for (i = 0; i < 8; i = i+1) //run for 8 iterations
            begin
                bcd = {bcd[10:0],bin[7-i]}; //concatenation
                   
                //if a hex digit of 'bcd' is more than 4, add 3 to it.  
                if(i < 7 && bcd[3:0] > 4) 
                    bcd[3:0] = bcd[3:0] + 3;
                if(i < 7 && bcd[7:4] > 4)
                    bcd[7:4] = bcd[7:4] + 3;
                if(i < 7 && bcd[11:8] > 4)
                    bcd[11:8] = bcd[11:8] + 3;  
            end
        end     

endmodule



module BCDto7segment(
    input [3:0] bcd,
    output reg [6:0] seg
    );
    
    always @(bcd)
    begin
        case (bcd)
            4'b0000 : seg = 7'b0000001; ////The segments are active low i.e, if a segment is required to be turned on, it should be assigned the value 0.
            4'b0001 : seg = 7'b1001111;
            4'b0010 : seg = 7'b0010010;
            4'b0011 : seg = 7'b0000110;
            4'b0100 : seg = 7'b1001100;
            4'b0101 : seg = 7'b0100100;
            4'b0110 : seg = 7'b0100000;
            4'b0111 : seg = 7'b0001111;
            4'b1000 : seg = 7'b0000000;
            4'b1001 : seg = 7'b0000100; //For BCD, the highest number that can be displayed is 9.

            default: seg = 7'b1111111; // switch off 7 segment character when the bcd digit is not a decimal number
       endcase     
     end   
endmodule




module MUX(
    input clk,
    input reset,
    input s0,
    input s1,
    input [15:0] mode1,
    input [15:0] mode2,
    input [15:0] mode3,
    input [15:0] mode4,
    output reg [15:0] out
    );

    
     always @ (*) 
     begin
        case(s0 | s1)     //multiplexer
            2'b00: out = mode1;
            2'b01: out = mode2;
            2'b10: out = mode3;
            2'b11: out = mode4;
        endcase
        
     end
endmodule


