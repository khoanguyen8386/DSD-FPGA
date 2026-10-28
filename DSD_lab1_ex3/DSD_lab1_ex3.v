// =========================================================
// FILE 2: TOP-LEVEL MODULE FOR DE2-115 (lab1_ex3.v)
// =========================================================

module DSD_lab1_ex3 (
    input  [17:0] SW,
    output [7:0]  LEDG,
    output [17:0] LEDR
);
    // Mirror switch states onto Red LEDs
    assign LEDR = SW;

    // Pin Mapping on DE2-115:
    // Inputs : SW[0] = Cin, SW[1] = B, SW[2] = A
    //          (Ordered so {SW[2], SW[1], SW[0]} matches Truth Table columns {A, B, Cin})
    // Outputs: LEDG[0] = Sum (S), LEDG[1] = Carry-out (Cout)

    // --- METHOD 1: Instantiate Dataflow Model ---
    full_adder_DF DUT (
        .a(SW[2]),
        .b(SW[1]),
        .cin(SW[0]),
        .S(LEDG[0]),
        .Cout(LEDG[1])
    );

    /* --- METHOD 2: Uncomment below to test Behavioral (Case) Model ---
    full_adder_BH1 DUT (
        .A(SW[2]),
        .B(SW[1]),
        .Cin(SW[0]),
        .S(LEDG[0]),
        .Cout(LEDG[1])
    );
    */

    /* --- METHOD 3: Uncomment below to test Gate-Level (Structural) Model ---
    full_adder_STRU DUT (
        .A(SW[2]),
        .B(SW[1]),
        .Cin(SW[0]),
        .Sum(LEDG[0]),
        .Carry(LEDG[1])
    );
    */

    // Turn off unused Green LEDs
    assign LEDG[7:2] = 6'b000000;
endmodule