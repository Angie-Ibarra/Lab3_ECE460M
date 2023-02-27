`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2023 04:11:47 PM
// Design Name: 
// Module Name: PulseGenerator
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



module PulseGenerator(
    input start,
    input clk,
    input reset,
    input [1:0] mode,
    output pulse
);

    wire clk_32hz;
    wire clk_64hz;
    wire clk_128hz;
    wire clk_hybrid;

    _32_pulse m1(.clk(clk), .slowclk(clk_32hz));
    _64_pulse m2(.clk(clk), .slowclk(clk_64hz));
    _128_pulse m3(.clk(clk), .slowclk(clk_128hz));
    hybrid_mode m4(.clk(clk), .slowclk(clk_hybrid), .start(start), .reset(reset));
    
    assign pulse = start && ~reset && (((mode == 2'b00)&& clk_32hz) || ((mode == 2'b01)&& clk_64hz) || ((mode == 2'b10)&& clk_128hz) || ((mode == 2'b11)&&clk_hybrid));
    
endmodule


module _32_pulse(clk, slowclk);
  input clk; //fast clock
  output slowclk; //slow clock
  
  reg slowclk = 0;
  reg[27:0] counter = 0;

  initial begin
    counter = 0;
    slowclk = 0;
  end

  always @ (posedge clk)
  begin
    if(counter == 1562500) begin
      counter <= 1;
      slowclk <= ~slowclk;
    end
    else begin
      counter <= counter + 1;
    end
  end

endmodule

module _64_pulse(clk, slowclk);
  input clk; //fast clock
  output slowclk; //slow clock
  
  reg slowclk = 0;
  reg[27:0] counter = 0;

  initial begin
    counter = 0;
    slowclk = 0;
  end

  always @ (posedge clk)
  begin
    if(counter == 781250) begin
      counter <= 1;
      slowclk <= ~slowclk;
    end
    else begin
      counter <= counter + 1;
    end
  end

endmodule

module _128_pulse(clk, slowclk);
  input clk; //fast clock
  output slowclk; //slow clock
  
  reg slowclk = 0;
  reg[27:0] counter = 0;

  initial begin
    counter = 0;
    slowclk = 0;
  end

  always @ (posedge clk)
  begin
    if(counter == 390625) begin
      counter <= 1;
      slowclk <= ~slowclk;
    end
    else begin
      counter <= counter + 1;
    end
  end
endmodule


module hybrid_mode(clk, slowclk, start, reset);
  input clk, start, reset; //fast clock
  output slowclk; //slow clock
  
  reg slowclk = 0;
  reg[27:0] counter = 0;
  reg[7:0] seconds = 1;
  reg[27:0] counter_seconds = 0;

  initial begin
    counter = 0;
    slowclk = 0;
  end

  always @ (posedge clk, posedge reset)
  begin
    if (reset)
    begin
        counter = 0;
        seconds = 1;
        counter_seconds = 0;
    end
    else
    begin
        if (start)
        begin
            case (seconds)
                1: begin
                    if (counter < 20*2)
                    begin
                        slowclk <= ~slowclk;
                    end
                end
                2: begin
                    if (counter < 33*2)
                    begin
                        slowclk <= ~slowclk;
                    end
                end
                3: begin
                    if (counter < 66*2)
                    begin
                        slowclk <= ~slowclk;
                    end
                end
                4: begin
                    if (counter < 27*2)
                    begin
                        slowclk <= ~slowclk;
                    end
                end
                5: begin
                    if (counter < 70*2)
                    begin
                        slowclk <= ~slowclk;
                    end
                end
                6: begin
                    if (counter < 30*2)
                    begin
                        slowclk <= ~slowclk;
                    end
                end
                7: begin
                    if (counter < 19*2)
                    begin
                        slowclk <= ~slowclk;
                    end
                end
                8: begin
                    if (counter < 30*2)
                    begin
                        slowclk <= ~slowclk;
                    end
                end
                9: begin
                    if (counter < 33*2)
                    begin
                        slowclk <= ~slowclk;
                    end
                end
                default: begin
                    if (seconds <= 73)
                    begin
                        if (counter < 69*2)
                        begin
                            slowclk <= ~slowclk;
                        end
                    end
                    else if (seconds <= 79)
                    begin
                        if (counter < 34*2)
                        begin
                            slowclk <= ~slowclk;
                        end
                    end
                    else if (seconds <= 144)
                    begin
                        slowclk = 0;
                    end
                end
            endcase
            if (counter_seconds == 10000000)
            begin
                if (seconds < 145)
                begin
                    seconds <= seconds + 1;
                end
                counter_seconds <= 0;
            end
            else
            begin
                counter_seconds <= counter_seconds + 1;
            end
            
           if (counter_seconds == 10000000)
            begin
                counter <= 0;
            end
            else
            begin
                counter <= counter + 1;
            end
        end
        
        else
        begin
            counter_seconds <= 0;
            seconds <= 1;
            counter <= 0;
        end
    end
  end
endmodule