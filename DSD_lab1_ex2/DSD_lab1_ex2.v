// =========================================================
// FILE 2: TOP-LEVEL MODULE FOR DE2-115 (lab1_ex2.v)
// =========================================================

module DSD_lab1_ex2(
    input  [17:0] SW,
    output [7:0]  LEDG,
    output [17:0] LEDR
);
    // Display switch states on the corresponding Red LEDs
    assign LEDR = SW;

    // Pin Mapping:
    // Inputs : SW[0] = a, SW[1] = b
    // Outputs: LEDG[0] = Sum (s), LEDG[1] = Carry (Cout)

    // --- Instantiate Dataflow Model from half_adder_design.v ---
    half_adder_dataflow DUT (
        .a(SW[0]),
        .b(SW[1]),
        .s(LEDG[0]),
        .Cout(LEDG[1])
    );

    /* --- Uncomment below to test Behavioral Model ---
    half_adder_behavior DUT (
        .sum(LEDG[0]),
        .carry(LEDG[1]),
        .a(SW[0]),
        .b(SW[1])
    );
    */

    /* --- Uncomment below to test Structural Model ---
    half_adder_structural DUT (
        .a(SW[0]),
        .b(SW[1]),
        .s(LEDG[0]),
        .Cout(LEDG[1])
    );
    */

    // Turn off unused Green LEDs
    assign LEDG[7:2] = 6'b000000;
endmodule