module DynamicMux (
	input      [31:0] in0,
	input      [31:0] in1,
	input      [31:0] in2,
	input      [31:0] in3,
	input      [1:0]  sel,
	output reg [31:0] out);

	//Wire define for this module.

	//Wire define for sub module.

	//Wire sub module connect to this module and inter module connect.
	always @(*) begin
	    if((sel == 2'b0)) out = in0;
	    else if((sel == 2'b1)) out = in1;
	    else if((sel == 2'b10)) out = in2;
	    else if((sel == 2'b11)) out = in3;
	    else out = 32'b0;
	end
	

	//Wire this module connect to sub module.

	//module inst.

endmodule