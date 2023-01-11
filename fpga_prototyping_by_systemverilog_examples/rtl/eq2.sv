`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 08:06:58 PM
// Design Name: 
// Module Name: 2-bit_greater-than
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


module eq2(
    input logic [1:0] a,
    input logic [1:0] b,
    output logic out
    );
    
    // body
    assign out = (a[0] & ~b[0] & ~b[1]) | (a[1] & a[0] & ~b[0]) | (a[1] & ~b[1]);
    
endmodule
