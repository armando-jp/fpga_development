`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2023 11:37:49 AM
// Design Name: 
// Module Name: eq4
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


module eq4(
    input logic [3:0] a, b,
    output logic out
    );
    
    assign out = (a[3]&~b[3])
    | ((a[3]&b[3] | ~a[3]&~b[3]) & (a[2]&~b[2])) 
    | ((a[3]&b[3] | ~a[3]&~b[3]) & (a[2]&b[2] | ~a[2]&~b[2]) & (a[1]&~b[1]))
    | ((a[3]&b[3] | ~a[3]&~b[3]) & (a[2]&b[2] | ~a[2]&~b[2]) & (a[1]&b[1] | ~a[1]&~b[1]) & (a[0] & ~b[0]));
endmodule
