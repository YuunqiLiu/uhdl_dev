module test (
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
	wire [31:0] tmp;
	wire  sub1_clk;
	wire  sub1_rst;
	assign res1 = (tmp + op2);
	assign res2 = (op2 + op3);
	assign cut = op1[9:0];
	assign comb = {op1, op2};
	assign const = 32;
	assign outgroup_rst = ingroup_rst;
	assign tmp = op1;
	sub1 sub1 (
		.clk(sub1_clk),
		.rst(sub1_rst));
endmodule
