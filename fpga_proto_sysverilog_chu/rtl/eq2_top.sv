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


module eq2_top(
    input logic [3:0] sw,
    output logic [0:0] led
    );
    
    eq2 eq2_1 (.a(sw[1:0]), .b(sw[3:2]), .out(led));
endmodule
