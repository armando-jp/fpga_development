module multi_function_barrel_shifter_top
    (
    input logic [8:0] sw,
    input logic [4:0] btn,
    output logic [7:0]led,
    input logic clk
    );
    
    multi_function_barrel_shifter dut1
        (
        .dat_in(sw[7:0]),
        .sel(sw[8]),
        .reset(btn[4]),
        .dat_out(led[7:0]),
        .clk(clk)
        );
    
endmodule