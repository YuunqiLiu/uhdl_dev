//==========================================================================================================================
//Key is used to ensure the consistency of file version and content, and cannot be modified.
//Version Control is the version number written when the file is generated and cannot be modified.
//ToolMessage is used to record related information of any tool that has processed the file and cannot be manually modified.
//UserMessage is used by the user to write any information, which can be modified in any way.
//Content is the actual payload of the file.
//Parameter is the additional parameter information carried by the file and cannot be modified in any way.

//Key is generated by the hash of Version Control, Content and Parameter to ensure the consistency of the file.
//These three parts do not allow any individual modification
//==========================================================================================================================


//[UHDL]Key Start [md5:184e0f1890ca726bfdd39c0bbf45320a]
//Version Control Hash: 3accddf64b1dd03abeb9b0b3e5a7ba44
//Content Hash: 26b3b6f012b20c2b6811ce7c0e8d9065
//Parameter Hash: d41d8cd98f00b204e9800998ecf8427e
//[UHDL]Key End [md5:184e0f1890ca726bfdd39c0bbf45320a]

//[UHDL]Version Control Start [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]
//[UHDL]Version Control Version:1.0.1
//[UHDL]Version Control End [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]

//[UHDL]Tool Message Start [md5:bae600ef297a3423865d474e391c5285]
//Written by UHDL in 2022-09-11 22:34:00
//[UHDL]Tool Message End [md5:bae600ef297a3423865d474e391c5285]

//[UHDL]User Message Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]User Message End [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Content Start [md5:26b3b6f012b20c2b6811ce7c0e8d9065]
module DArb_node_D0_pld_width_2_id_type_tgt (
	input        clk       ,
	input        rst_n     ,
	output       out_vld   ,
	input        out_rdy   ,
	output       out_head  ,
	output       out_tail  ,
	output [1:0] out_pld   ,
	output [3:0] out_src_id,
	output [3:0] out_tgt_id,
	output [7:0] out_txn_id,
	input        in0_vld   ,
	output       in0_rdy   ,
	input        in0_head  ,
	input        in0_ail   ,
	input  [1:0] in0_pld   ,
	input  [3:0] in0_src_id,
	input  [3:0] in0_gt_id ,
	input  [7:0] in0_xn_id ,
	input        in1_vld   ,
	output       in1_rdy   ,
	input        in1_head  ,
	input        in1_ail   ,
	input  [1:0] in1_pld   ,
	input  [3:0] in1_src_id,
	input  [3:0] in1_gt_id ,
	input  [7:0] in1_xn_id );
	wire [1:0] msg_update_en   ;
	wire [0:0] arb_unlock      ;
	wire [0:0] arb_lock        ;
	reg  [0:0] arb_lock_reg    ;
	wire [0:0] bit_sel_0       ;
	wire [0:0] bit_sel_1       ;
	reg  [0:0] bit_set_reg_0   ;
	reg  [0:0] bit_set_reg_1   ;
	reg  [0:0] bit_set_locked_0;
	reg  [0:0] bit_set_locked_1;
	wire       arb_msg_clk           ;
	wire       arb_msg_rst_n         ;
	wire [1:0] arb_msg_update_en     ;
	wire [1:0] arb_msg_age_bits_row_0;
	wire [1:0] arb_msg_age_bits_row_1;
	assign out_vld = ((in0_vld & (1{bit_set_locked_0})) | (in1_vld & (1{bit_set_locked_1})));
	
	assign out_head = ((in0_head & (1{bit_set_locked_0})) | (in1_head & (1{bit_set_locked_1})));
	
	assign out_tail = ((in0_ail & (1{bit_set_locked_0})) | (in1_ail & (1{bit_set_locked_1})));
	
	assign out_pld = ((in0_pld & (2{bit_set_locked_0})) | (in1_pld & (2{bit_set_locked_1})));
	
	assign out_src_id = ((in0_src_id & (4{bit_set_locked_0})) | (in1_src_id & (4{bit_set_locked_1})));
	
	assign out_tgt_id = ((in0_gt_id & (4{bit_set_locked_0})) | (in1_gt_id & (4{bit_set_locked_1})));
	
	assign out_txn_id = ((in0_xn_id & (8{bit_set_locked_0})) | (in1_xn_id & (8{bit_set_locked_1})));
	
	assign in0_rdy = (bit_set_locked_0 && out_rdy);
	
	assign in1_rdy = (bit_set_locked_1 && out_rdy);
	
	assign msg_update_en = {(in0_vld && in0_rdy && in0_head), (in1_vld && in1_rdy && in1_head)};
	
	assign arb_unlock = (out_vld && out_rdy && out_tail);
	
	assign arb_lock = (out_vld && out_rdy && out_head);
	
	always @(posedge clk or negedge rst_n) begin
	    if(~rst_n) arb_lock_reg <= 1'b0;
	    else begin
	        if(arb_lock) arb_lock_reg <= 1'b1;
	        else if(arb_unlock) arb_lock_reg <= 1'b0;
	    end
	end
	
	assign bit_sel_0 = ((age_bits_row_0[0:0] && in0_vld) || (age_bits_row_0[1:1] && in1_vld));
	
	assign bit_sel_1 = ((age_bits_row_1[0:0] && in0_vld) || (age_bits_row_1[1:1] && in1_vld));
	
	always @(posedge clk or negedge rst_n) begin
	    if(~rst_n) bit_set_reg_0 <= 1'b0;
	    else begin
	        if(arb_lock) bit_set_reg_0 <= bit_sel_0;
	    end
	end
	
	always @(posedge clk or negedge rst_n) begin
	    if(~rst_n) bit_set_reg_1 <= 1'b0;
	    else begin
	        if(arb_lock) bit_set_reg_1 <= bit_sel_1;
	    end
	end
	
	always @(*) begin
	    if(arb_lock_reg) bit_set_locked_0 = bit_set_reg_0;
	    else bit_set_locked_0 = bit_sel_0;
	end
	
	always @(*) begin
	    if(arb_lock_reg) bit_set_locked_1 = bit_set_reg_1;
	    else bit_set_locked_1 = bit_sel_1;
	end
	
	assign arb_msg_update_en = msg_update_en;
	
	CmnAgeMtx_width_2 arb_msg (
		.clk(arb_msg_clk),
		.rst_n(arb_msg_rst_n),
		.update_en(arb_msg_update_en),
		.age_bits_row_0(arb_msg_age_bits_row_0),
		.age_bits_row_1(arb_msg_age_bits_row_1));

endmodule
//[UHDL]Content End [md5:26b3b6f012b20c2b6811ce7c0e8d9065]

//[UHDL]Parameter Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Parameter End [md5:d41d8cd98f00b204e9800998ecf8427e]

