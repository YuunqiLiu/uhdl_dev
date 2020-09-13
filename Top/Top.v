module Top (
	output reg       out   ,
	input      [1:0] sel   ,
	input            if_sel,
	input            if_in0,
	input            if_in1,
	input            in0   ,
	input            in1   ,
	input            in2   ,
	input            in3   );

	//Wire define for this module.

	//Wire define for sub module.

	//Wire sub module connect to this module and inter module connect.
	always @(*) begin
	    case(sel)
	    2'b0 : begin
	            if(if_sel) out = if_in0;
	            else out = if_in1;
	        end
	    2'b1 : out = in1;
	    2'b10 : out = in2;
	    default : out = in3;
	    endcase
	end
	

	//Wire this module connect to sub module.

	//module inst.

endmodule