// =========================================================
// FILE 1: DESIGN MODULES (full_adder_design.v)
// =========================================================

// 1. Dataflow Model
module full_adder_DF (
    input a, b, cin,
    output S, Cout
);
    assign S    = a ^ b ^ cin;                      // Sum equation
    assign Cout = (a & b) | (b & cin) | (a & cin);  // Carry-out equation
endmodule

// 2a. Behavioral Model using Case Statement (Fixed {A, B, Cin} concatenation)
module full_adder_BH1 (
    input wire A, B, Cin,
    output reg S, Cout
);
    always @(A or B or Cin) 
    begin 
        case ({A, B, Cin}) 
            3'b000: begin S = 0; Cout = 0; end 
            3'b001: begin S = 1; Cout = 0; end 
            3'b010: begin S = 1; Cout = 0; end 
            3'b011: begin S = 0; Cout = 1; end 
            3'b100: begin S = 1; Cout = 0; end 
            3'b101: begin S = 0; Cout = 1; end 
            3'b110: begin S = 0; Cout = 1; end 
            3'b111: begin S = 1; Cout = 1; end 
        endcase 
    end
endmodule

// 2b. Behavioral Model using If-Else
module full_adder (
    input wire A, B, Cin,
    output reg S, Cout
);
    always @(A or B or Cin)
    begin
        if (A==0 && B==0 && Cin==0)
            begin S=0; Cout=0; end
        else if (A==0 && B==0 && Cin==1)
            begin S=1; Cout=0; end
        else if (A==0 && B==1 && Cin==0)
            begin S=1; Cout=0; end
        else if (A==0 && B==1 && Cin==1)
            begin S=0; Cout=1; end
        else if (A==1 && B==0 && Cin==0)
            begin S=1; Cout=0; end
        else if (A==1 && B==0 && Cin==1)
            begin S=0; Cout=1; end
        else if (A==1 && B==1 && Cin==0)
            begin S=0; Cout=1; end
        else if (A==1 && B==1 && Cin==1)
            begin S=1; Cout=1; end
    end
endmodule

// 2c. Behavioral Model using Boolean Expressions
module full_adder_BH (
    input a, b, c,
    output reg sum, carry
);
    always @(a, b, c) 
    begin
        sum   <= a ^ b ^ c;
        carry <= (a & b) | (b & c) | (c & a);
    end
endmodule

// 3. Gate-Level (Structural) Model (Fixed port names and OR gate wire z)
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