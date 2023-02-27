`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2023 09:58:57 PM
// Design Name: 
// Module Name: Binary2BCD
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


module Binary2BCD(
    input [19:0] bin,
    input distCheck,
    input [3:0] distance2,
    output reg [15:0] bcd );
    
    integer i;
    
    always@(bin) begin
        bcd = 0;
        
        for(i = 0; i<20;i=i+1)begin 
            if(bcd[3:0] >= 5)begin 
            bcd[3:0] = bcd[3:0] + 3;
            end
            if(bcd[7:4] >= 5)begin
            bcd[7:4] = bcd[7:4] + 3;
            end
            if(bcd[11:8] >= 5)begin
            bcd[11:8] = bcd[11:8] + 3;
            end
            if(bcd[15:12] >= 5)begin
            bcd[15:12] = bcd[15:12] + 3;
            end
            bcd = {bcd[14:0],bin[19-i]};
        end
        
        if(distCheck)begin
        bcd = {bcd, 4'b1010, distance2};
        end
        
    end
endmodule
