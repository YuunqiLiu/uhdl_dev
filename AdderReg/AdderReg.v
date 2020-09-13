module AdderReg (
	input        clk  ,
	input        rst_n,
	input        in1  ,
	input        in2  ,
	output [1:0] out  );

	//Wire define for this module.
	reg [1:0] out_reg;

	//Wire define for sub module.

	//Wire sub module connect to this module and inter module connect.
	assign out = out_reg;
	
	always @(posedge clk or negedge rst_n) begin
	    if(~rst_n) out_reg <= 2'b0;
	    else out_reg <= (in1 + in2);
	end
	

	//Wire this module connect to sub module.

	//module inst.

endmodule