module disp_mux
    (
    input logic [7:0] in0, in1,in2, in3,
    input logic clk, reset,
    output logic [7:0] sseg,
    output logic [7:0] an
    );
    
    // CONSTANT DECLERATIONS
    // refresh rate around 1600 Hz (100 MHz / 2^16)
    localparam N = 18;
    
    // SIGNAL DECLERATIONS
    logic [N-1:0] q_reg;
    logic [N-1:0] q_next;
    
    // N-bit counter
    // STATE REGISTER
    always_ff @(posedge clk, posedge reset)
        if(reset)
            q_reg <= 0;
        else
            q_reg <= q_next;
            
    // NEXT-STATE LOGIC
    assign q_next = q_reg + 1;
    
    // OUTPUT LOGIC
    // 2 MSBs of counter to control 4-to-1 multiplexing
    // and to generate active-low enable signal
    always_comb
        case (q_reg[N-1:N-2])
            2'b00:
                begin
                    an = 4'b1110;
                    sseg = in0;
                end
            2'b01:
                begin
                    an = 4'b1101;
                    sseg = in1;
                end
            2'b10:
                begin
                    an = 4'b1011;
                    sseg = in2;
                end
            2'b11:
                begin
                    an = 4'b0111;
                    sseg = in3;
                end
            default:
                begin
                    an = 4'b0111;
                    sseg = in3;
                end
        endcase
    
    // blank upper 4 digits (comment out for 4-digit display)
    assign an[7:4] = 4'b1111;
endmodule
