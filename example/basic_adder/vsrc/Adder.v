module Adder (
	input [30:0] op1,
	input [30:0] op2,
	output [31:0] res);

	//Wire define for this module.

	//Wire define for sub module.

	//Wire sub module connect to this module and inter module connect.
	assign res = (op1 + op2);

	//Wire this module connect to sub module.

	//module inst.

endmodule