`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2025 10:38:41 AM
// Design Name: 
// Module Name: sqr_wav_gen_top
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


module sqr_wav_gen_top(
    input logic clk,
    input logic [3:0] sw0,
    input logic [3:0] sw1,
    output logic ja_top
    );
    
    sqr_wav_gen sqr1(.clk(clk), .low_n(sw0), .high_m(sw1), .sqr_state(ja_top));
endmodule
