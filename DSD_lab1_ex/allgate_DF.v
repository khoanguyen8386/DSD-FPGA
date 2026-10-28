module allgate_DF ( a, b, yand,yor,ynot,ynand,ynor,yxor,yxnor );
input a,b;
output yand, yor, ynot, ynand, ynor, yxor, yxnor;

assign yand = a & b;		// AND Operation
assign yor = a | b;		// OR Operation
assign ynot = ~a ;		// NOT Operation
assign ynand = ~(a & b);	// NAND Operation
assign ynor = ~(a | b);		//NOR Operation
assign yxor = a ^ b;		//XOR Operation
assign yxnor =~(a^b);		//XNOR Operation
endmodule				// END of the module
