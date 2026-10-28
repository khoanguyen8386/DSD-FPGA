// =========================================================
// FILE 2: TOP-LEVEL MODULE FOR DE2-115 (lab1_ex6.v)
// =========================================================

module DSD_lab1_ex6 (
    input  [17:0] SW,
    output [7:0]  LEDG,
    output [17:0] LEDR
);
    assign LEDR = SW;

    // Pin Mapping:
    // SW[3:0] = Data inputs i3, i2, i1, i0
    // SW[5:4] = Select lines s1, s0
    // LEDG[0] = MUX Output (y)

    // --- METHOD 1: Instantiate Structural Model ---
    mux41_structural DUT (
        .i0(SW[0]),
        .i1(SW[1]),
        .i2(SW[2]),
        .i3(SW[3]),
        .s0(SW[4]),
        .s1(SW[5]),
        .y(LEDG[0])
    );

    /* --- METHOD 2: Uncomment to test Dataflow Model ---
    mux41_df DUT (
        .i0(SW[0]), .i1(SW[1]), .i2(SW[2]), .i3(SW[3]),
        .s0(SW[4]), .s1(SW[5]),
        .y(LEDG[0])
    );
    */

    /* --- METHOD 3: Uncomment to test Behavioral v2 Model ---
    mux41beh_v2 DUT (
        .in(SW[3:0]),
        .s(SW[5:4]),
        .y(LEDG[0])
    );
    */

    assign LEDG[7:1] = 7'b0000000;
endmodule