module ClockDivider (
	input  clk_src,
	output  clk_out1,
	output  clk_out2,
	output  clk_out3,
	output  clk_out4,
	output  clk_out5,
	output  clk_out6,
	output  clk_out7,
	output  clk_out8);

	//Wire define for this module.

	//Wire define for sub module.
	wire  clk_divider_clk_src_to_clk_out1_clk_in;
	wire  clk_divider_clk_src_to_clk_out1_clk_out;
	wire  clk_divider_clk_src_to_clk_out2_clk_in;
	wire  clk_divider_clk_src_to_clk_out2_clk_out;
	wire  clk_divider_clk_src_to_clk_out3_clk_in;
	wire  clk_divider_clk_src_to_clk_out3_clk_out;
	wire  clk_divider_clk_src_to_clk_out4_clk_in;
	wire  clk_divider_clk_src_to_clk_out4_clk_out;
	wire  clk_divider_clk_src_to_clk_out5_clk_in;
	wire  clk_divider_clk_src_to_clk_out5_clk_out;
	wire  clk_divider_clk_src_to_clk_out6_clk_in;
	wire  clk_divider_clk_src_to_clk_out6_clk_out;
	wire  clk_divider_clk_src_to_clk_out7_clk_in;
	wire  clk_divider_clk_src_to_clk_out7_clk_out;
	wire  clk_divider_clk_src_to_clk_out8_clk_in;
	wire  clk_divider_clk_src_to_clk_out8_clk_out;

	//Wire sub module connect to this module and inter module connect.
	assign clk_out1 = clk_divider_clk_src_to_clk_out1_clk_out;
	assign clk_out2 = clk_divider_clk_src_to_clk_out2_clk_out;
	assign clk_out3 = clk_divider_clk_src_to_clk_out3_clk_out;
	assign clk_out4 = clk_divider_clk_src_to_clk_out4_clk_out;
	assign clk_out5 = clk_divider_clk_src_to_clk_out5_clk_out;
	assign clk_out6 = clk_divider_clk_src_to_clk_out6_clk_out;
	assign clk_out7 = clk_divider_clk_src_to_clk_out7_clk_out;
	assign clk_out8 = clk_divider_clk_src_to_clk_out8_clk_out;

	//Wire this module connect to sub module.
	assign clk_divider_clk_src_to_clk_out1_clk_in = clk_src;
	assign clk_divider_clk_src_to_clk_out2_clk_in = clk_src;
	assign clk_divider_clk_src_to_clk_out3_clk_in = clk_src;
	assign clk_divider_clk_src_to_clk_out4_clk_in = clk_src;
	assign clk_divider_clk_src_to_clk_out5_clk_in = clk_src;
	assign clk_divider_clk_src_to_clk_out6_clk_in = clk_src;
	assign clk_divider_clk_src_to_clk_out7_clk_in = clk_src;
	assign clk_divider_clk_src_to_clk_out8_clk_in = clk_src;

	//module inst.
	clk_divider_1600_to_800 clk_divider_clk_src_to_clk_out1 (
		.clk_in(clk_divider_clk_src_to_clk_out1_clk_in),
		.clk_out(clk_divider_clk_src_to_clk_out1_clk_out));
	clk_divider_1600_to_800 clk_divider_clk_src_to_clk_out2 (
		.clk_in(clk_divider_clk_src_to_clk_out2_clk_in),
		.clk_out(clk_divider_clk_src_to_clk_out2_clk_out));
	clk_divider_1600_to_400 clk_divider_clk_src_to_clk_out3 (
		.clk_in(clk_divider_clk_src_to_clk_out3_clk_in),
		.clk_out(clk_divider_clk_src_to_clk_out3_clk_out));
	clk_divider_1600_to_200 clk_divider_clk_src_to_clk_out4 (
		.clk_in(clk_divider_clk_src_to_clk_out4_clk_in),
		.clk_out(clk_divider_clk_src_to_clk_out4_clk_out));
	clk_divider_1600_to_100 clk_divider_clk_src_to_clk_out5 (
		.clk_in(clk_divider_clk_src_to_clk_out5_clk_in),
		.clk_out(clk_divider_clk_src_to_clk_out5_clk_out));
	clk_divider_1600_to_150 clk_divider_clk_src_to_clk_out6 (
		.clk_in(clk_divider_clk_src_to_clk_out6_clk_in),
		.clk_out(clk_divider_clk_src_to_clk_out6_clk_out));
	clk_divider_1600_to_20 clk_divider_clk_src_to_clk_out7 (
		.clk_in(clk_divider_clk_src_to_clk_out7_clk_in),
		.clk_out(clk_divider_clk_src_to_clk_out7_clk_out));
	clk_divider_1600_to_50 clk_divider_clk_src_to_clk_out8 (
		.clk_in(clk_divider_clk_src_to_clk_out8_clk_in),
		.clk_out(clk_divider_clk_src_to_clk_out8_clk_out));

endmodule