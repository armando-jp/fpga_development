`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2025 09:58:02 AM
// Design Name: 
// Module Name: sqr_wav_gen
// Project Name: Square Wave Generator
// Target Devices: XC7A100T-1CSG324C
// Tool Versions: 
// Description: Programmable square wave generator, capable of a square wave with a minimum period of 200ns (5MHz). 
//              Controlled by 2 sets of 4-bit inputs, m and n respectively. 
//              High = m*100ns, Low = n*100ns. Assumes system clock period of 10ns
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sqr_wav_gen
    #(parameter SQR_STATE_NS=100, // 100ns sqr high/low time
                CLK_NS=10 // system clk period
     ) 
    (
    input logic clk,
    input [3:0] low_n,
    input [3:0] high_m,
    output sqr_state
    );
    
    // decleration
    logic [7:0] ns_reg;
    logic [7:0] ns_next;
    logic sqr_reg;
    logic sqr_next;
    
    // register
    always_ff @(posedge clk)
    begin
        ns_reg <= ns_next;
        sqr_reg <= sqr_next;
    end
    
    // next-state logic
    // if the square state is changing, start the counter over. otherwise, keep incrementing the counter.
    assign ns_next = (sqr_reg != sqr_next) ? 8'b0 : ns_reg + 1;
    
    always_comb
        if (!high_m) // if high time is 0ns, keep output low.
            sqr_next = 0;
        else if (!low_n) // if low time is 0ns, keep output high.
            sqr_next = 1;
        else if (!sqr_reg) // if output is low, check if the counter has surpassed the set low time and toggle, otherwise, keep current state. 
            if (ns_reg*CLK_NS >= (low_n*SQR_STATE_NS - CLK_NS))
                sqr_next = 1;
            else
                sqr_next = 0;
        else
            if (ns_reg*CLK_NS >= (high_m*SQR_STATE_NS - CLK_NS))
                sqr_next = 0;
            else
                sqr_next = 1;             

   // output logic
   assign sqr_state = sqr_reg;
   
                          
                
    
    
    
endmodule
