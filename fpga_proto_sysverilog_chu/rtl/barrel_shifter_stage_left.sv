module barrel_shifter_stage_left
   (
    input  logic [7:0] a, // data in
    input  logic [2:0] amt, // amount to shift
    output logic [7:0] y // data out
   );

   // signal declaration
   logic [7:0] s0, s1;

   // body
   // stage 0, shift 0 or 1 bit
   assign s0 = amt[0] ? {a[6:0], a[7]} : a;
   // stage 1, shift 0 or 2 bits
   assign s1 = amt[1] ? {s0[5:0], s0[7:6]} : s0;
   // stage 2, shift 0 or 4 bits
   assign y = amt[2] ? {s1[4:0], s1[7:5]} : s1;
endmodule