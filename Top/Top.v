module Top (
	output reg  out ,
	input       sel1,
	input       sel2,
	input       in0 ,
	input       in1 ,
	input       in2 );

	//Wire define for this module.

	//Wire define for sub module.

	//Wire sub module connect to this module and inter module connect.
	always @(*) begin
	    if(sel1) begin
	        if(sel2) out = in0;
	        else out = in1;
	    end
	    else out = in2;
	end
	

	//Wire this module connect to sub module.

	//module inst.

endmodule