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
	input  ingroup_clk,
	input  ingroup_rst,
	output  outgroup_clk,
	output  outgroup_rst);

	//Wire define for this module.
	wire [31:0] tmp;

	//Wire define for sub module.
	wire  sub1_clk;
	wire  sub1_rst;
	wire  sub1_intr;

	//Wire sub module connect to this module and inter module connect.
	assign intr = sub1_intr;
	assign res1 = (tmp + op2);
	assign res2 = (op2 + op3);
	assign cut = op1[9:0];
	assign comb = {op1, op2};
	assign const = 64'b1000000;
	assign tmp = op1;

	//Wire this module connect to sub module.
	assign sub1_clk = clk;

	//module inst.
	sub1 sub1 (
		.clk(sub1_clk),
		.rst(sub1_rst),
		.intr(sub1_intr));

endmodule