`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2023 12:09:00 PM
// Design Name: 
// Module Name: eq4_top
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


module eq4_top(
    input logic [7:0] sw,
    output logic [0:0] led
    );
    
    eq4 eq4_1 (.a(sw[3:0]), .b(sw[7:4]), .out(led));
endmodule
