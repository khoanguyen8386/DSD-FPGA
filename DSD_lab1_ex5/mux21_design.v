// =========================================================
// FILE 1: DESIGN MODULES (mux21_design.v)
// =========================================================

// 1. Dataflow Model
module mux21_data_flow (
    input i0, i1, sel,
    output y
);
    // Select i0 when sel=0, or i1 when sel=1
    assign y = (i0 & (~sel)) | (i1 & sel);
endmodule

// 2. Behavioral Model
module mux21_Behavioural (
    input i0, i1, sel,
    output reg y
);
    always @(*)
    begin
        if (sel == 1'b0) 
            y = i0;     // Pass i0 to output when sel is 0
        else 
            y = i1;     // Pass i1 to output when sel is 1
    end
endmodule

// 3. Gate-Level (Structural) Model
module mux21_structural (
    input i0, i1, sel,
    output y
);
    wire net1, net2, net3;
    
    not g1(net1, sel);          // net1 = ~sel
    and g2(net2, i1, sel);      // net2 = i1 & sel
    and g3(net3, i0, net1);     // net3 = i0 & (~sel)
    or  g4(y, net3, net2);      // y = net3 | net2
endmodule