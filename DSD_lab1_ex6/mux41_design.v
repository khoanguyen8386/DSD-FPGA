// =========================================================
// FILE 1: DESIGN MODULES (mux41_design.v)
// =========================================================

// 1. Gate-Level (Structural) Model
module mux41_structural (
    input i0, i1, i2, i3, s0, s1,
    output y
);
    wire n_s0, n_s1, a0, a1, a2, a3;
    
    not g0(n_s0, s0);
    not g1(n_s1, s1);
    and g2(a0, i0, n_s1, n_s0); // Select i0 when s1=0, s0=0
    and g3(a1, i1, n_s1, s0);   // Select i1 when s1=0, s0=1
    and g4(a2, i2, s1,   n_s0); // Select i2 when s1=1, s0=0
    and g5(a3, i3, s1,   s0);   // Select i3 when s1=1, s0=1
    or  g6(y, a0, a1, a2, a3);
endmodule

// 2. Dataflow Model
module mux41_df (
    input i0, i1, i2, i3, s0, s1,
    output y
);
    assign y = (i0 & ~s1 & ~s0) | 
               (i1 & ~s1 &  s0) | 
               (i2 &  s1 & ~s0) | 
               (i3 &  s1 &  s0);
endmodule

// 3a. Behavioral Model v1 (If-Else - Logic fixed)
module mux41beh_v1 (
    input [3:0] in,
    input [1:0] s,
    output reg y 
);
    always @(in, s)
    begin
        if      (s[1]==0 && s[0]==0) y <= in[0];
        else if (s[1]==0 && s[0]==1) y <= in[1];
        else if (s[1]==1 && s[0]==0) y <= in[2];
        else                         y <= in[3];
    end
endmodule

// 3b. Behavioral Model v2 (Case Statement)
module mux41beh_v2 (
    input [3:0] in,
    input [1:0] s,
    output reg y 
);
    always @(in, s)
    begin
        case ({s[1], s[0]})
            2'b00: y <= in[0];
            2'b01: y <= in[1];
            2'b10: y <= in[2];
            2'b11: y <= in[3];
        endcase 
    end
endmodule