`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2023 12:10:52 PM
// Design Name: 
// Module Name: eq4_testbench
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


module eq4_testbench;
    // signal decleration
    logic [3:0] test_in0, test_in1;
    logic test_out;
    
    //instantiate the circuit under test
    eq4 uut(.a(test_in0), .b(test_in1), .out(test_out));
    
    // test vector generator
    initial
    begin
        // test vector 1
        test_in0 = 4'b0000;
        test_in1 = 4'b0000;
        # 200
        test_in0 = 4'b0101; //out = 1
        test_in1 = 4'b0000;
        # 200
        test_in0 = 4'b0100;
        test_in1 = 4'b1100;
        # 200
        test_in0 = 4'b1000;
        test_in1 = 4'b1000;
        # 200
        test_in0 = 4'b1000; // out = 1
        test_in1 = 4'b0000;
        # 200
        test_in0 = 4'b1100;
        test_in1 = 4'b1100;
        # 200
        test_in0 = 4'b1100; // out = 1
        test_in1 = 4'b0100;
        # 200
        // stop simulation
        $stop;
    end
endmodule

