`timescale 1ns / 1ps

module decode3to8_tb;
    // signal decleration
    logic [2:0] test_in0;
    logic test_en;
    logic [7:0]test_out;
    
    //instantiate the circuit under test
    decode3to8 uut(.a(test_in0), .en(test_en), .out(test_out));
    
    // test vector generator
    initial
    begin
        // test vector 1
        test_in0 = 3'b000;
        test_en = 1'b0;
        # 200
        test_in0 = 3'b000;
        test_en = 1'b1;
        # 200
        test_in0 = 3'b001;
        test_en = 1'b1;
        # 200
        test_in0 = 3'b010;
        test_en = 1'b1;
        # 200
        test_in0 = 3'b011;
        test_en = 1'b1;
        # 200
        test_in0 = 3'b100;
        test_en = 1'b1;
        # 200
        test_in0 = 3'b101;
        test_en = 1'b1;
        # 200
        test_in0 = 3'b110;
        test_en = 1'b1;
        # 200
        test_in0 = 3'b111;
        test_en = 1'b1;
        # 200
        
        // stop simulation
        $stop;
    end
endmodule
