// =========================================================
// FILE 1: DESIGN MODULES (half_adder_design.v)
// =========================================================

// 1. Dataflow Model
module half_adder_dataflow(
    input a, b, 
    output s, Cout
);
    assign s    = a ^ b;    // XOR operation for Sum
    assign Cout = a & b;    // AND operation for Carry-out
endmodule

// 2. Behavioral Model
module half_adder_behavior(sum, carry, a, b);
    output sum, carry;
    input a, b;
    reg sum, carry;
    
    always @(a, b) 
    begin
        sum   <= a ^ b;     // Sum output
        carry <= a & b;     // Carry-out output
    end
endmodule

// 3. Gate-Level (Structural) Model
module half_adder_structural(
    input a, b, 
    output s, Cout
);
    xor G1(s, a, b);        // Instantiate XOR gate primitive
    and G2(Cout, a, b);     // Instantiate AND gate primitive
endmodule