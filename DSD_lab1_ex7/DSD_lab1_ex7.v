// =========================================================
// FILE 2: TOP-LEVEL MODULE FOR DE2-115 (lab1_ex7.v)
// =========================================================

module DSD_lab1_ex7 (
    input  [17:0] SW,
    input  [3:0]  KEY,  // Pushbuttons for the missing select bits
    output [7:0]  LEDG,
    output [17:0] LEDR
);
    // Display the 16 data switch states on Red LEDs
    assign LEDR = SW;

    // Combine SW and KEY to form the 4-bit Select signal (S)
    wire [3:0] S_sel;
    assign S_sel[1:0] = SW[17:16]; // Lower bits S1, S0 on SW[17], SW[16]
    assign S_sel[3:2] = ~KEY[1:0]; // Upper bits S3, S2 on KEY[1], KEY[0] (inverted since KEYs are active-low)

    // --- Instantiate Structural Model ---
    mux16to1_structural DUT (
        .D(SW[15:0]),
        .S(S_sel),
        .Y(LEDG[0])
    );

    // Display the current 4-bit Select value on Green LEDs for easy hardware debugging
    assign LEDG[7:4] = S_sel; 
    assign LEDG[3:1] = 3'b000;
endmodule