module TestModule (
	input  clk,
	output  intr,
	input [31:0] op1,
	input [31:0] op2,
	input [31:0] op3,
	output [32:0] res1,
	output [32:0] res2,
	output [9:0] cut,
	output [63:0] comb,
	output [63:0] const,
	input  input,
	output  output,
	output  compare,
	input  ingroup_clk,
	input  ingroup_rst,
	output  outgroup_clk,
	output  outgroup_rst);

	//Wire define for this module.
	reg [31:0] dff;
	wire [31:0] tmp;

	//Wire define for sub module.
	wire  sub1_clk;
	wire  sub1_rst;
	wire  sub1_intr;

	//Wire sub module connect to this module and inter module connect.
	always @(*) begin
		intr = sub1_intr;
	end
	always @(*) begin
		res1 = (tmp + op2);
	end
	always @(*) begin
		res2 = (op2 + op3);
	end
	always @(*) begin
		cut = op1[9:0];
	end
	always @(*) begin
		comb = {op1, op2};
	end
	always @(*) begin
		const = 64'b1000000;
	end
	always @(*) begin
		output = input;
	end
	always @(*) begin
		compare = (op1 == op2);
	end
	always @(posedge clk or negedge intr) begin
		dff <= op1;
	end
	always @(*) begin
		tmp = op1;
	end

	//Wire this module connect to sub module.
	always @(*) begin
		sub1_clk = clk;
	end

	//module inst.
	sub1 sub1 (
		.clk(sub1_clk),
		.rst(sub1_rst),
		.intr(sub1_intr));

endmodule