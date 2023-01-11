`timescale 1ns / 1ps

module decode2to4_tb;
    // signal decleration
    logic [1:0] test_in0;
    logic test_en;
    logic [3:0]test_out;
    
    //instantiate the circuit under test
    decode2to4 uut(.a(test_in0), .en(test_en), .out(test_out));
    
    // test vector generator
    initial
    begin
        // test vector 1
        test_in0 = 2'b00;
        test_en = 1'b0;
        # 200
        test_in0 = 2'b00;
        test_en = 1'b1;
        # 200
        test_in0 = 2'b01;
        test_en = 1'b1;
        # 200
        test_in0 = 2'b10;
        test_en = 1'b1;
        # 200
        test_in0 = 2'b11;
        test_en = 1'b1;
        # 200
        // stop simulation
        $stop;
    end
endmodule
