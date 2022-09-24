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


//[UHDL]Key Start [md5:60c7c66b382318a0a3e998ab9c4f43bb]
//Version Control Hash: 3accddf64b1dd03abeb9b0b3e5a7ba44
//Content Hash: d4eddd997820e0c7a39c666e3a20ef11
//Parameter Hash: d41d8cd98f00b204e9800998ecf8427e
//[UHDL]Key End [md5:60c7c66b382318a0a3e998ab9c4f43bb]

//[UHDL]Version Control Start [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]
//[UHDL]Version Control Version:1.0.1
//[UHDL]Version Control End [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]

//[UHDL]Tool Message Start [md5:d73a53d24da237f44d6220c7f3b2dbbf]
//Written by UHDL in 2022-09-24 02:35:50
//[UHDL]Tool Message End [md5:d73a53d24da237f44d6220c7f3b2dbbf]

//[UHDL]User Message Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]User Message End [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Content Start [md5:d4eddd997820e0c7a39c666e3a20ef11]
module DMstAxi_node_M1 (
	input         clk             ,
	input         rst_n           ,
	input         in0_r_req_vld   ,
	output        in0_r_req_rdy   ,
	input         in0_r_req_head  ,
	input         in0_r_req_tail  ,
	input  [63:0] in0_r_req_pld   ,
	input  [3:0]  in0_r_req_src_id,
	input  [3:0]  in0_r_req_tgt_id,
	input  [7:0]  in0_r_req_txn_id,
	input         in0_w_req_vld   ,
	output        in0_w_req_rdy   ,
	input         in0_w_req_head  ,
	input         in0_w_req_tail  ,
	input  [99:0] in0_w_req_pld   ,
	input  [3:0]  in0_w_req_src_id,
	input  [3:0]  in0_w_req_tgt_id,
	input  [7:0]  in0_w_req_txn_id,
	output        in0_r_ack_vld   ,
	input         in0_r_ack_rdy   ,
	output        in0_r_ack_head  ,
	output        in0_r_ack_tail  ,
	output [34:0] in0_r_ack_pld   ,
	output [3:0]  in0_r_ack_src_id,
	output [3:0]  in0_r_ack_tgt_id,
	output [7:0]  in0_r_ack_txn_id,
	output        in0_w_ack_vld   ,
	input         in0_w_ack_rdy   ,
	output        in0_w_ack_head  ,
	output        in0_w_ack_tail  ,
	output [1:0]  in0_w_ack_pld   ,
	output [3:0]  in0_w_ack_src_id,
	output [3:0]  in0_w_ack_tgt_id,
	output [7:0]  in0_w_ack_txn_id,
	output        out0_aw_vld     ,
	input         out0_aw_rdy     ,
	output [31:0] out0_aw_addr    ,
	output [11:0] out0_aw_id      ,
	output [31:0] out0_aw_user    ,
	output        out0_w_vld      ,
	input         out0_w_rdy      ,
	output        out0_w_last     ,
	output [31:0] out0_w_data     ,
	output [3:0]  out0_w_strb     ,
	input         out0_b_vld      ,
	output        out0_b_rdy      ,
	input  [11:0] out0_b_id       ,
	input  [1:0]  out0_b_resp     ,
	output        out0_ar_vld     ,
	input         out0_ar_rdy     ,
	output [31:0] out0_ar_addr    ,
	output [11:0] out0_ar_id      ,
	output [31:0] out0_ar_user    ,
	input         out0_r_vld      ,
	output        out0_r_rdy      ,
	input  [11:0] out0_r_id       ,
	input  [31:0] out0_r_data     ,
	input  [1:0]  out0_r_resp     ,
	input         out0_r_last     );
	assign in0_r_req_rdy = out0_ar_rdy;
	
	assign in0_w_req_rdy = (out0_aw_vld && out0_aw_rdy);
	
	assign in0_r_ack_vld = out0_r_vld;
	
	assign in0_r_ack_head = 1'b1;
	
	assign in0_r_ack_tail = 1'b1;
	
	assign in0_r_ack_pld = {out0_r_resp, out0_r_data, out0_r_last};
	
	assign in0_r_ack_src_id = out0_r_id[11:8];
	
	assign in0_r_ack_tgt_id = 4'b1;
	
	assign in0_r_ack_txn_id = out0_r_id[7:0];
	
	assign in0_w_ack_vld = out0_b_vld;
	
	assign in0_w_ack_head = 1'b1;
	
	assign in0_w_ack_tail = 1'b1;
	
	assign in0_w_ack_pld = out0_b_resp;
	
	assign in0_w_ack_src_id = out0_b_id[11:8];
	
	assign in0_w_ack_tgt_id = 4'b1;
	
	assign in0_w_ack_txn_id = out0_b_id[7:0];
	
	assign out0_aw_vld = (in0_w_req_rdy && in0_w_req_vld && in0_w_req_head);
	
	assign out0_aw_addr = in0_w_req_pld[99:68];
	
	assign out0_aw_id = {in0_w_req_src_id, in0_w_req_txn_id};
	
	assign out0_aw_user = in0_w_req_pld[67:36];
	
	assign out0_w_vld = (in0_w_req_rdy && in0_w_req_vld);
	
	assign out0_w_last = in0_w_req_tail;
	
	assign out0_w_data = in0_w_req_pld[31:0];
	
	assign out0_w_strb = in0_w_req_pld[35:32];
	
	assign out0_b_rdy = in0_w_ack_rdy;
	
	assign out0_ar_vld = in0_r_req_vld;
	
	assign out0_ar_addr = in0_r_req_pld[31:0];
	
	assign out0_ar_id = {in0_r_req_src_id, in0_r_req_txn_id};
	
	assign out0_ar_user = in0_r_req_pld[63:32];
	
	assign out0_r_rdy = in0_r_ack_rdy;
	

endmodule
//[UHDL]Content End [md5:d4eddd997820e0c7a39c666e3a20ef11]

//[UHDL]Parameter Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Parameter End [md5:d41d8cd98f00b204e9800998ecf8427e]

