`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 08:24:48 PM
// Design Name: 
// Module Name: 2-bit_greater-than_sim
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


module eq2_testbench;
    // signal decleration
    logic [1:0] test_in0, test_in1;
    logic test_out;
    
    //instantiate the circuit under test
    eq2 uut(.a(test_in0), .b(test_in1), .out(test_out));
    
    // test vector generator
    initial
    begin
        // test vector 1
        test_in0 = 2'b00;
        test_in1 = 2'b00;
        # 200
        test_in0 = 2'b01;
        test_in1 = 2'b00;
        # 200
        test_in0 = 2'b01;
        test_in1 = 2'b11;
        # 200
        test_in0 = 2'b10;
        test_in1 = 2'b10;
        # 200
        test_in0 = 2'b10;
        test_in1 = 2'b00;
        # 200
        test_in0 = 2'b11;
        test_in1 = 2'b11;
        # 200
        test_in0 = 2'b11;
        test_in1 = 2'b01;
        # 200
        // stop simulation
        $stop;
    end
endmodule
