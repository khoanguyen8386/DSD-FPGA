module DSD_lab1_ex(SW,LEDG,LEDR);
	input[17:0] SW;
	output[7:0] LEDG;
	output[17:0] LEDR;
	assign LEDR=SW;
	allgate_DF DUT(SW[1], SW[2], LEDG[5],LEDG[4],LEDG[3],LEDG[2],LEDG[1],LEDG[0]);
endmodule 