`timescale 1ns/1ps

module tb_mux41();
    reg [3:0] in;
    reg [1:0] s;

    wire y_st, y_df, y_bh1, y_bh2;

    // Instantiate all 4 models
    mux41_structural UUT_ST  (.i0(in[0]), .i1(in[1]), .i2(in[2]), .i3(in[3]), .s0(s[0]), .s1(s[1]), .y(y_st));
    mux41_df         UUT_DF  (.i0(in[0]), .i1(in[1]), .i2(in[2]), .i3(in[3]), .s0(s[0]), .s1(s[1]), .y(y_df));
    mux41beh_v1      UUT_BH1 (.in(in), .s(s), .y(y_bh1));
    mux41beh_v2      UUT_BH2 (.in(in), .s(s), .y(y_bh2));

    initial begin
        // Output waveform file for VS Code + GTKWave
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_mux41);

        $display("Time | s1 s0 | in[3:0] | ST DF BH1 BH2");
        $monitor("%4t |  %b  %b |  %b   |  %b  %b   %b   %b", 
                 $time, s[1], s[0], in, y_st, y_df, y_bh1, y_bh2);

        // Test s = 00 (Passes in[0])
        s = 2'b00; in = 4'b0001; #10; // y = 1
                   in = 4'b1110; #10; // y = 0
        
        // Test s = 01 (Passes in[1])
        s = 2'b01; in = 4'b0010; #10; // y = 1
                   in = 4'b1101; #10; // y = 0
        
        // Test s = 10 (Passes in[2])
        s = 2'b10; in = 4'b0100; #10; // y = 1
                   in = 4'b1011; #10; // y = 0
        
        // Test s = 11 (Passes in[3])
        s = 2'b11; in = 4'b1000; #10; // y = 1
                   in = 4'b0111; #10; // y = 0

        $stop;
    end
endmodule