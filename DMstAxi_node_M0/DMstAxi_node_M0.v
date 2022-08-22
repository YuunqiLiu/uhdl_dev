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


//[UHDL]Key Start [md5:1e63669a2144b64996de398bdde72e95]
//Version Control Hash: 3accddf64b1dd03abeb9b0b3e5a7ba44
//Content Hash: 0b6c1eea3dc38a67457f1eff252ac4f2
//Parameter Hash: d41d8cd98f00b204e9800998ecf8427e
//[UHDL]Key End [md5:1e63669a2144b64996de398bdde72e95]

//[UHDL]Version Control Start [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]
//[UHDL]Version Control Version:1.0.1
//[UHDL]Version Control End [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]

//[UHDL]Tool Message Start [md5:e8189699c1717c807cd5b40154471dd2]
//Written by UHDL in 2022-08-22 22:42:03
//[UHDL]Tool Message End [md5:e8189699c1717c807cd5b40154471dd2]

//[UHDL]User Message Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]User Message End [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Content Start [md5:0b6c1eea3dc38a67457f1eff252ac4f2]
module DMstAxi_node_M0 (
	input          clk           ,
	input          rst_n         ,
	output         out_aw_vld    ,
	input          out_aw_rdy    ,
	output [31:0]  out_aw_addr   ,
	output [11:0]  out_aw_id     ,
	output [31:0]  out_aw_user   ,
	output         out_w_vld     ,
	input          out_w_rdy     ,
	output         out_w_last    ,
	output [31:0]  out_w_strb    ,
	output [255:0] out_w_data    ,
	input          out_b_vld     ,
	output         out_b_rdy     ,
	input  [11:0]  out_b_id      ,
	input  [1:0]   out_b_resp    ,
	input          in0_req_vld   ,
	output         in0_req_rdy   ,
	input          in0_req_head  ,
	input          in0_req_tail  ,
	input  [359:0] in0_req_pld   ,
	input  [3:0]   in0_req_mst_id,
	input  [3:0]   in0_req_slv_id,
	output         in0_ack_vld   ,
	input          in0_ack_rdy   ,
	output         in0_ack_head  ,
	output         in0_ack_tail  ,
	output [9:0]   in0_ack_pld   ,
	output [3:0]   in0_ack_slv_id);
	wire [7:0] internal_slave_axi_id;
	assign out_aw_vld = (in0_req_rdy && in0_req_vld && in0_req_head);
	
	assign out_aw_addr = in0_req_pld[359:328];
	
	assign out_aw_id = {in0_req_slv_id, internal_slave_axi_id};
	
	assign out_aw_user = in0_req_pld[319:288];
	
	assign out_w_vld = (in0_req_rdy && in0_req_vld);
	
	assign out_w_strb = in0_req_pld[287:256];
	
	assign out_w_data = in0_req_pld[255:0];
	
	assign out_b_rdy = in0_ack_rdy;
	
	assign in0_req_rdy = (out_aw_vld && out_aw_rdy);
	
	assign in0_ack_vld = out_b_vld;
	
	assign in0_ack_head = 1'b1;
	
	assign in0_ack_tail = 1'b1;
	
	assign in0_ack_pld = {out_b_id[7:0], out_b_resp};
	
	assign in0_ack_slv_id = out_b_id[11:8];
	
	assign internal_slave_axi_id = in0_req_pld[327:320];
	

endmodule
//[UHDL]Content End [md5:0b6c1eea3dc38a67457f1eff252ac4f2]

//[UHDL]Parameter Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Parameter End [md5:d41d8cd98f00b204e9800998ecf8427e]
