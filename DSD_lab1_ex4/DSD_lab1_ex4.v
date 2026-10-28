// =========================================================
// FILE 2: TOP-LEVEL MODULE FOR DE2-115 (lab1_ex4.v)
// =========================================================

module DSD_lab1_ex4 (
    input  [17:0] SW,
    output [7:0]  LEDG,
    output [17:0] LEDR
);
    // Display switch states on the corresponding Red LEDs
    assign LEDR = SW;

    // Pin Mapping on DE2-115:
    // Inputs : SW[3:0] = A[3:0] (4-bit operand A)
    //          SW[7:4] = B[3:0] (4-bit operand B)
    //          SW[8]   = Cin    (Carry-in)
    // Outputs: LEDG[3:0] = Sum[3:0] (4-bit Sum output)
    //          LEDG[4]   = Cout     (Carry-out bit)

    // --- METHOD 1: Instantiate Structural Model ---
    four_bit_adder_STRU DUT (
        .cin(SW[8]),
        .a(SW[3:0]),
        .b(SW[7:4]),
        .s(LEDG[3:0]),
        .cout(LEDG[4])
    );

    /* --- METHOD 2: Uncomment below to test Dataflow Model ---
    Four_bit_Adder_DF DUT (
        .A(SW[3:0]),
        .B(SW[7:4]),
        .Cin(SW[8]),
        .Sum(LEDG[3:0]),
        .Cout(LEDG[4])
    );
    */

    /* --- METHOD 3: Uncomment below to test Behavioral Model ---
    Four_bit_Adder_BH DUT (
        .A(SW[3:0]),
        .B(SW[7:4]),
        .Cin(SW[8]),
        .Sum(LEDG[3:0]),
        .Cout(LEDG[4])
    );
    */

    // Turn off unused Green LEDs (LEDG[7:5])
    assign LEDG[7:5] = 3'b000;
endmodule