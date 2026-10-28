// =========================================================
// FILE 1: DESIGN MODULES (mux16to1_design.v)
// =========================================================

// --- Sub-module: 4:1 MUX (Required for Structural 16:1 MUX) ---
module mux41_structural (
    input i0, i1, i2, i3, s0, s1,
    output y
);
    wire n_s0, n_s1, a0, a1, a2, a3;
    not g0(n_s0, s0);
    not g1(n_s1, s1);
    and g2(a0, i0, n_s1, n_s0);
    and g3(a1, i1, n_s1, s0);
    and g4(a2, i2, s1,   n_s0);
    and g5(a3, i3, s1,   s0);
    or  g6(y, a0, a1, a2, a3);
endmodule

// =========================================================
// 1. STRUCTURAL MODEL (Using Five 4:1 MUXes)
// =========================================================
module mux16to1_structural (
    input  [15:0] D, // 16 Data inputs
    input  [3:0]  S, // 4 Select inputs
    output Y
);
    wire [3:0] w; // Intermediate wires connecting Stage 1 to Stage 2

    // Stage 1: Four 4:1 MUXes controlled by lower select bits S[0] and S[1]
    mux41_structural M0 (.i0(D[0]),  .i1(D[1]),  .i2(D[2]),  .i3(D[3]),  .s0(S[0]), .s1(S[1]), .y(w[0]));
    mux41_structural M1 (.i0(D[4]),  .i1(D[5]),  .i2(D[6]),  .i3(D[7]),  .s0(S[0]), .s1(S[1]), .y(w[1]));
    mux41_structural M2 (.i0(D[8]),  .i1(D[9]),  .i2(D[10]), .i3(D[11]), .s0(S[0]), .s1(S[1]), .y(w[2]));
    mux41_structural M3 (.i0(D[12]), .i1(D[13]), .i2(D[14]), .i3(D[15]), .s0(S[0]), .s1(S[1]), .y(w[3]));

    // Stage 2: Final 4:1 MUX controlled by upper select bits S[2] and S[3]
    mux41_structural M4 (.i0(w[0]),  .i1(w[1]),  .i2(w[2]),  .i3(w[3]),  .s0(S[2]), .s1(S[3]), .y(Y));
endmodule

// =========================================================
// 2. DATAFLOW MODEL
// =========================================================
module mux16to1_df (
    input  [15:0] D,
    input  [3:0]  S,
    output Y
);
    assign Y = D[S]; // Directly selects the index matching S
endmodule

// =========================================================
// 3. BEHAVIORAL MODEL
// =========================================================
module mux16to1_bh (
    input  [15:0] D,
    input  [3:0]  S,
    output reg Y
);
    always @(*) begin
        case (S)
            4'd0:  Y = D[0];  4'd1:  Y = D[1];  4'd2:  Y = D[2];  4'd3:  Y = D[3];
            4'd4:  Y = D[4];  4'd5:  Y = D[5];  4'd6:  Y = D[6];  4'd7:  Y = D[7];
            4'd8:  Y = D[8];  4'd9:  Y = D[9];  4'd10: Y = D[10]; 4'd11: Y = D[11];
            4'd12: Y = D[12]; 4'd13: Y = D[13]; 4'd14: Y = D[14]; 4'd15: Y = D[15];
        endcase
    end
endmodule