module Mux (
	input  [30:0] op1 ,
	input  [30:0] op2 ,
	input         aclk,
	input         arst,
	output [30:0] res );

	//Wire define for this module.
	wire [0:0]  sel         ;
	reg  [30:0] internal_reg;

	//Wire define for sub module.

	//Wire sub module connect to this module and inter module connect.
	assign res = internal_reg;
	assign sel = (op1 == op2);
	always @(posedge aclk or negedge arst) begin
	    if(sel) begin
	        if(sel) internal_reg <= op1;
	        else internal_reg <= op2;
	    else if(sel) internal_reg <= op1;
	end

	//Wire this module connect to sub module.

	//module inst.

endmodule