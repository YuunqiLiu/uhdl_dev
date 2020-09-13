module Top (
	output  out ,
	input   sel1,
	input   sel2,
	input   in0 ,
	input   in1 ,
	input   in2 );

	//Wire define for this module.
	reg [0:0] r;

	//Wire define for sub module.

	//Wire sub module connect to this module and inter module connect.
	always @(posedge in0 or negedge in1) begin
	    if(~in1) r <= 1'b0;
	    else begin
	        if(sel2) r <= in0;
	        else r <= in1;
	    end
	end
	

	//Wire this module connect to sub module.

	//module inst.

endmodule