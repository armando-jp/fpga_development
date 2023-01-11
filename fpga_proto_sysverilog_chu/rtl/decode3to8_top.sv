`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2023 10:22:57 AM
// Design Name: 
// Module Name: eq2_top
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


module decode3to8_top(
    input logic [3:0] sw,
    output logic [7:0] led
    );
    
    decode3to8 d3t8 (.a(sw[3:1]), .en(sw[0]), .out(led[7:0]));
endmodule
