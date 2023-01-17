// 100 MHz CLK (cyles/sec) / (bit)
// if we want 2 Hz LED update
module multi_function_barrel_shifter
    (
    input logic [7:0] dat_in,
    input logic sel, // mode select, 0 = left shift, 1 = right shift
    input logic reset,
    output logic [7:0] dat_out,
    input logic clk    
    );
    // constants
    parameter board_freq = 100000000;
    parameter led_rate = 1; // seconds
    parameter N = $clog2(board_freq/led_rate);
    
    
    // internal signal decleration
    logic [N-1:0] r_reg;
    logic [N-1:0] r_next;
    logic en;
    logic [2:0] r_dir_reg;
    logic [2:0] r_dir_next;
    logic [7:0] l_out;
    logic [7:0] r_out;
    
    
    // NEXT STATE LOGIC
    assign r_next = r_reg + 1;
    assign r_dir_next = r_dir_reg + 1;
    
    // STATE REGISTERS
    always_ff@(posedge clk, posedge reset) // counter
        if (reset)
            r_reg <= 0;
        else
            r_reg <= r_next;

    always_ff@(posedge clk) // enable generator
    begin
        en <= 1'b0;
        if (r_reg == (2**N) - 1)
            en <= 1'b1;
    end
    
    always_ff@(posedge en, posedge reset) // shift counter
        if (reset)
            r_dir_reg <= 0;
        else
            r_dir_reg <= r_dir_next;
    
    //OUTPUT LOGIC
    // module creation
    barrel_shifter_stage_left shift_l
        (.a(dat_in),
         .amt(r_dir_reg),
         .y(l_out)
         );
         
    barrel_shifter_stage_right shift_r
        (.a(dat_in),
         .amt(r_dir_reg),
         .y(r_out)
         );
         
    always_comb
        case(sel)
            1'b0:
                dat_out = l_out;
            default:
                dat_out = r_out;
        endcase
    
endmodule