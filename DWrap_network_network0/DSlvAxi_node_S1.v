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


//[UHDL]Key Start [md5:187b45316121330791d0040e949a87df]
//Version Control Hash: 3accddf64b1dd03abeb9b0b3e5a7ba44
//Content Hash: c687c0fd904dbbb2b936c12de57f1e4e
//Parameter Hash: d41d8cd98f00b204e9800998ecf8427e
//[UHDL]Key End [md5:187b45316121330791d0040e949a87df]

//[UHDL]Version Control Start [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]
//[UHDL]Version Control Version:1.0.1
//[UHDL]Version Control End [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]

//[UHDL]Tool Message Start [md5:d73a53d24da237f44d6220c7f3b2dbbf]
//Written by UHDL in 2022-09-24 02:35:50
//[UHDL]Tool Message End [md5:d73a53d24da237f44d6220c7f3b2dbbf]

//[UHDL]User Message Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]User Message End [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Content Start [md5:c687c0fd904dbbb2b936c12de57f1e4e]
module DSlvAxi_node_S1 (
	input             clk              ,
	input             rst_n            ,
	output            out0_r_req_vld   ,
	input             out0_r_req_rdy   ,
	output            out0_r_req_head  ,
	output            out0_r_req_tail  ,
	output     [63:0] out0_r_req_pld   ,
	output     [3:0]  out0_r_req_src_id,
	output reg [3:0]  out0_r_req_tgt_id,
	output     [7:0]  out0_r_req_txn_id,
	output reg        out0_w_req_vld   ,
	input             out0_w_req_rdy   ,
	output            out0_w_req_head  ,
	output            out0_w_req_tail  ,
	output     [99:0] out0_w_req_pld   ,
	output     [3:0]  out0_w_req_src_id,
	output reg [3:0]  out0_w_req_tgt_id,
	output     [7:0]  out0_w_req_txn_id,
	input             out0_r_ack_vld   ,
	output            out0_r_ack_rdy   ,
	input             out0_r_ack_head  ,
	input             out0_r_ack_tail  ,
	input      [34:0] out0_r_ack_pld   ,
	input      [3:0]  out0_r_ack_src_id,
	input      [3:0]  out0_r_ack_tgt_id,
	input      [7:0]  out0_r_ack_txn_id,
	input             out0_w_ack_vld   ,
	output            out0_w_ack_rdy   ,
	input             out0_w_ack_head  ,
	input             out0_w_ack_tail  ,
	input      [1:0]  out0_w_ack_pld   ,
	input      [3:0]  out0_w_ack_src_id,
	input      [3:0]  out0_w_ack_tgt_id,
	input      [7:0]  out0_w_ack_txn_id,
	input             in0_aw_vld       ,
	output            in0_aw_rdy       ,
	input      [31:0] in0_aw_addr      ,
	input      [7:0]  in0_aw_id        ,
	input      [31:0] in0_aw_user      ,
	input             in0_w_vld        ,
	output            in0_w_rdy        ,
	input             in0_w_last       ,
	input      [31:0] in0_w_data       ,
	input      [3:0]  in0_w_strb       ,
	output            in0_b_vld        ,
	input             in0_b_rdy        ,
	output     [7:0]  in0_b_id         ,
	output     [1:0]  in0_b_resp       ,
	input             in0_ar_vld       ,
	output            in0_ar_rdy       ,
	input      [31:0] in0_ar_addr      ,
	input      [7:0]  in0_ar_id        ,
	input      [31:0] in0_ar_user      ,
	output            in0_r_vld        ,
	input             in0_r_rdy        ,
	output     [7:0]  in0_r_id         ,
	output     [31:0] in0_r_data       ,
	output     [1:0]  in0_r_resp       ,
	output            in0_r_last       );
	reg [0:0] wait_aw_reg;
	assign out0_r_req_vld = in0_ar_vld;
	
	assign out0_r_req_head = 1'b1;
	
	assign out0_r_req_tail = 1'b1;
	
	assign out0_r_req_pld = {in0_ar_addr, in0_ar_user};
	
	assign out0_r_req_src_id = 4'b1;
	
	always @(*) begin
	    if(((32'b0 >= in0_ar_addr) && (in0_ar_addr <= 32'b1111111111111111))) out0_r_req_tgt_id = 4'b1;
	    else if(((32'b10000000000000000 >= in0_ar_addr) && (in0_ar_addr <= 32'b11111111111111111))) out0_r_req_tgt_id = 4'b10;
	    else out0_r_req_tgt_id = 4'b0;
	end
	
	assign out0_r_req_txn_id = in0_ar_id;
	
	always @(*) begin
	    if(wait_aw_reg) out0_w_req_vld = (in0_aw_vld && in0_w_vld);
	    else out0_w_req_vld = in0_w_vld;
	end
	
	assign out0_w_req_head = (in0_aw_vld && in0_aw_rdy);
	
	assign out0_w_req_tail = in0_w_last;
	
	assign out0_w_req_pld = {in0_aw_addr, in0_aw_user, in0_w_strb, in0_w_data};
	
	assign out0_w_req_src_id = 4'b1;
	
	always @(*) begin
	    if(((32'b0 >= in0_aw_addr) && (in0_aw_addr <= 32'b1111111111111111))) out0_w_req_tgt_id = 4'b1;
	    else if(((32'b10000000000000000 >= in0_aw_addr) && (in0_aw_addr <= 32'b11111111111111111))) out0_w_req_tgt_id = 4'b10;
	    else out0_w_req_tgt_id = 4'b0;
	end
	
	assign out0_w_req_txn_id = in0_aw_id;
	
	assign out0_r_ack_rdy = in0_r_rdy;
	
	assign out0_w_ack_rdy = in0_b_rdy;
	
	assign in0_aw_rdy = (out0_w_req_vld && out0_w_req_rdy && wait_aw_reg);
	
	assign in0_w_rdy = (out0_w_req_vld && out0_w_req_rdy);
	
	assign in0_b_vld = out0_w_ack_vld;
	
	assign in0_b_id = out0_w_ack_txn_id;
	
	assign in0_b_resp = out0_w_ack_pld[1:0];
	
	assign in0_ar_rdy = out0_r_req_rdy;
	
	assign in0_r_vld = out0_r_ack_vld;
	
	assign in0_r_id = out0_r_ack_txn_id;
	
	assign in0_r_data = out0_r_ack_pld[32:1];
	
	assign in0_r_resp = out0_r_ack_pld[34:33];
	
	assign in0_r_last = out0_r_ack_pld[0:0];
	
	always @(posedge clk or negedge rst_n) begin
	    if(~rst_n) wait_aw_reg <= 1'b0;
	    else begin
	        if((in0_w_vld && in0_w_rdy && in0_w_last)) wait_aw_reg <= 1'b1;
	        else if((in0_aw_vld && in0_aw_rdy)) wait_aw_reg <= 1'b0;
	    end
	end
	

endmodule
//[UHDL]Content End [md5:c687c0fd904dbbb2b936c12de57f1e4e]

//[UHDL]Parameter Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Parameter End [md5:d41d8cd98f00b204e9800998ecf8427e]

