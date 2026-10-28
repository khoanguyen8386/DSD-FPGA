`timescale 1ns/1ps

module tb_mux16to1();
    reg [15:0] D;
    reg [3:0]  S;

    wire Y_st, Y_df, Y_bh;
    integer i;

    // Instantiate all 3 models
    mux16to1_structural UUT_ST (.D(D), .S(S), .Y(Y_st));
    mux16to1_df         UUT_DF (.D(D), .S(S), .Y(Y_df));
    mux16to1_bh         UUT_BH (.D(D), .S(S), .Y(Y_bh));

    initial begin
        // Output waveform file for VS Code + GTKWave
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_mux16to1);

        $display("Time |  S (Dec) |        D         | ST DF BH");
        $monitor("%4t | %b (%2d) | %b |  %b  %b  %b", 
                 $time, S, S, D, Y_st, Y_df, Y_bh);

        // Walk a '1' across all 16 inputs while selecting that exact channel
        for (i = 0; i < 16; i = i + 1) begin
            S = i[3:0];
            D = (16'b1 << i); // Set only the selected bit to 1, all others 0
            #10;
            
            D = 16'b0;        // Toggle the selected bit back to 0
            #10;
        end

        $stop;
    end
endmodule