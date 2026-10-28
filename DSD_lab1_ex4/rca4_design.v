// =========================================================
// FILE 1: DESIGN MODULES (rca4_design.v)
// =========================================================

// --- Sub-module: 1-Bit Full Adder (Required for Structural RCA) ---
module full_adder_STRU (
    input A, B, Cin,
    output Sum, Carry
);
    wire x, y, z;
    
    xor g1(x, A, B);        // x = A ^ B
    xor g2(Sum, x, Cin);    // Sum = x ^ Cin
    and g3(y, x, Cin);      // y = x & Cin
    and g4(z, A, B);        // z = A & B
    or  g5(Carry, y, z);    // Carry = y | z (Fixed from manual's x, y)
endmodule

// =========================================================
// 1. STRUCTURAL (GATE-LEVEL HIERARCHICAL) MODEL
// =========================================================
module four_bit_adder_STRU (
    input cin,
    input [3:0] a, b,
    output [3:0] s,
    output cout
);
    // Internal carry wires connecting stage to stage (C1 -> C2 -> C3 -> C4)
    wire [2:0] w_carry;

    // Instantiate four 1-bit Full Adders
    full_adder_STRU C1 (.A(a[0]), .B(b[0]), .Cin(cin),        .Sum(s[0]), .Carry(w_carry[0]));
    full_adder_STRU C2 (.A(a[1]), .B(b[1]), .Cin(w_carry[0]), .Sum(s[1]), .Carry(w_carry[1]));
    full_adder_STRU C3 (.A(a[2]), .B(b[2]), .Cin(w_carry[1]), .Sum(s[2]), .Carry(w_carry[2]));
    full_adder_STRU C4 (.A(a[3]), .B(b[3]), .Cin(w_carry[2]), .Sum(s[3]), .Carry(cout));
endmodule

// =========================================================
// 2. DATAFLOW MODEL
// =========================================================
module Four_bit_Adder_DF (
    input [3:0] A, B,
    input Cin,
    output wire [3:0] Sum,
    output wire Cout
);
    wire [4:0] temp;
    
    assign temp = A + B + Cin;  // 5-bit addition result
    assign Sum  = temp[3:0];    // Lower 4 bits are Sum
    assign Cout = temp[4];      // 5th bit (MSB) is Carry-out
endmodule

// =========================================================
// 3. BEHAVIORAL MODEL
// =========================================================
module Four_bit_Adder_BH (
    input [3:0] A, B,
    input Cin,
    output reg [3:0] Sum,
    output reg Cout
);
    always @(*) 
    begin
        // Concatenation {Cout, Sum} forms a 5-bit register target
        {Cout, Sum} = A + B + Cin;
    end
endmodule