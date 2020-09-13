module Mux (
	input       in1,
	input       in2,
	input       sel,
	output reg  out);

	//Wire define for this module.

	//Wire define for sub module.

	//Wire sub module connect to this module and inter module connect.
	always @(*) begin
	    if((sel == 1'b0)) out = in1;
	    else out = in2;
	end
	

	//Wire this module connect to sub module.

	//module inst.

endmodule