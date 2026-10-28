`timescale 1ns/1ps

module tb_mux21();
    // Declare reg inputs
    reg i0, i1, sel;

    // Declare wire outputs for all 3 models
    wire y_df, y_bh, y_st;
    
    integer k;

    // Instantiate all 3 models under test (UUT)
    mux21_data_flow   UUT_DF (.i0(i0), .i1(i1), .sel(sel), .y(y_df));
    mux21_Behavioural UUT_BH (.i0(i0), .i1(i1), .sel(sel), .y(y_bh));
    mux21_structural  UUT_ST (.i0(i0), .i1(i1), .sel(sel), .y(y_st));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_mux21);
        // Print header and monitor outputs in console
        $display("Time | sel i1 i0 | y_df y_bh y_st");
        $monitor("%4t |  %b   %b  %b |   %b    %b    %b", 
                 $time, sel, i1, i0, y_df, y_bh, y_st);

        // Loop through all 8 binary combinations (000 to 111)
        for (k = 0; k < 8; k = k + 1) begin
            {sel, i1, i0} = k[2:0];
            #10; // Hold each state for 10ns
        end

        $stop; // End simulation at 80ns
    end
endmodule