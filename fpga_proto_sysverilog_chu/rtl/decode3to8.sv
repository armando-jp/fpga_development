module decode3to8 (
    input logic [2:0] a,
    input logic en,
    output logic [7:0] out
    );
    
    assign out[0] = (~a[2] & ~a[1] & ~a[0] & en);
    assign out[1] = (~a[2] & ~a[1] & a[0] & en);
    assign out[2] = (~a[2] & a[1] & ~a[0] & en);
    assign out[3] = (~a[2] & a[1] & a[0] & en);
    assign out[4] = (a[2] & ~a[1] & ~a[0] & en);
    assign out[5] = (a[2] & ~a[1] & a[0] & en);
    assign out[6] = (a[2] & a[1] & ~a[0] & en);
    assign out[7] = (a[2] & a[1] & a[0] & en);


endmodule