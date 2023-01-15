module disp_mux_test
    (
    input logic [7:0] sw,
    input logic [3:0] btn,
    output logic [7:0] sseg,
    output logic [3:0] an,
    input logic clk
    );
    
    // signal decleration
    logic [7:0] d0_reg, d1_reg, d2_reg, d3_reg;
    
    // instantiate 7-seg LED display time-multiplexing module
    disp_mux disp_unit
        (.clk(clk), .reset(1'b0), .in0(d0_reg), .in1(d1_reg), in2(d2_reg), .in3(d3_reg), .an(an), .sseg(sseg));
    
    // registers for 4 led patterns
    always_ff@(posedge clk)
    begin
        if(btn[0])
            d0_reg <= sw;
        if(btn[1])
            d1_reg <= sw;
        if(btn[2])
            d2_reg <= sw;
        if(btn[3])
            d3_reg <= sw;
    end
endmodule
