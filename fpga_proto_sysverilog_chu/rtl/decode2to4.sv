module decode2to4 (
    input logic [1:0] a,
    input logic en,
    output logic [3:0] out
    );
    
    assign out[0] = (~a[1] & ~a[0] & en);
    assign out[1] = (~a[1] & a[0] & en);
    assign out[2] = (a[1] & ~a[0] & en);
    assign out[3] = (a[1] & a[0] & en);

endmodule