// =========================================================
// FILE 2: TOP-LEVEL MODULE FOR DE2-115 (lab1_ex5.v)
// =========================================================

module DSD_lab1_ex5 (
    input  [17:0] SW,
    output [7:0]  LEDG,
    output [17:0] LEDR
);
    // Display switch states on the corresponding Red LEDs
    assign LEDR = SW;

    // Pin Mapping on DE2-115:
    // Inputs : SW[0] = i0  (Data input 0)
    //          SW[1] = i1  (Data input 1)
    //          SW[2] = sel (Select control signal)
    // Outputs: LEDG[0] = y (Multiplexer output)

    // --- METHOD 1: Instantiate Dataflow Model ---
    mux21_data_flow DUT (
        .i0(SW[0]),
        .i1(SW[1]),
        .sel(SW[2]),
        .y(LEDG[0])
    );

    /* --- METHOD 2: Uncomment below to test Behavioral Model ---
    mux21_Behavioural DUT (
        .i0(SW[0]),
        .i1(SW[1]),
        .sel(SW[2]),
        .y(LEDG[0])
    );
    */

    /* --- METHOD 3: Uncomment below to test Structural Model ---
    mux21_structural DUT (
        .i0(SW[0]),
        .i1(SW[1]),
        .sel(SW[2]),
        .y(LEDG[0])
    );
    */

    // Turn off unused Green LEDs (LEDG[7:1])
    assign LEDG[7:1] = 7'b0000000;
endmodule