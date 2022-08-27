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


//[UHDL]Key Start [md5:d4cc678c420e2c65e367526ed4a6f012]
//Version Control Hash: 3accddf64b1dd03abeb9b0b3e5a7ba44
//Content Hash: 63099727613de6451fe1f00f541dafa4
//Parameter Hash: d41d8cd98f00b204e9800998ecf8427e
//[UHDL]Key End [md5:d4cc678c420e2c65e367526ed4a6f012]

//[UHDL]Version Control Start [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]
//[UHDL]Version Control Version:1.0.1
//[UHDL]Version Control End [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]

//[UHDL]Tool Message Start [md5:d03a6bee689749cf96e88bd529d1e8c4]
//Written by UHDL in 2022-08-27 10:08:58
//[UHDL]Tool Message End [md5:d03a6bee689749cf96e88bd529d1e8c4]

//[UHDL]User Message Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]User Message End [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Content Start [md5:63099727613de6451fe1f00f541dafa4]
module DSlvAxi_node_S0 (
	input              clk            ,
	input              rst_n          ,
	input              in_aw_vld      ,
	output             in_aw_rdy      ,
	input      [31:0]  in_aw_addr     ,
	input      [7:0]   in_aw_id       ,
	input      [31:0]  in_aw_user     ,
	input              in_w_vld       ,
	output             in_w_rdy       ,
	input              in_w_last      ,
	input      [31:0]  in_w_strb      ,
	input      [255:0] in_w_data      ,
	output             in_b_vld       ,
	input              in_b_rdy       ,
	output     [7:0]   in_b_id        ,
	output     [1:0]   in_b_resp      ,
	output reg         out0_req_vld   ,
	input              out0_req_rdy   ,
	output             out0_req_head  ,
	output             out0_req_tail  ,
	output     [359:0] out0_req_pld   ,
	output reg [3:0]   out0_req_mst_id,
	output     [3:0]   out0_req_slv_id,
	input              out0_ack_vld   ,
	output             out0_ack_rdy   ,
	input              out0_ack_head  ,
	input              out0_ack_tail  ,
	input      [9:0]   out0_ack_pld   ,
	input      [3:0]   out0_ack_mst_id,
	input      [3:0]   out0_ack_slv_id);
	reg [0:0] wait_aw_reg;
	assign in_aw_rdy = (out0_req_vld && out0_req_rdy && wait_aw_reg);
	
	assign in_w_rdy = (out0_req_vld && out0_req_rdy);
	
	assign in_b_vld = out0_ack_vld;
	
	assign in_b_id = out0_ack_pld[9:2];
	
	assign in_b_resp = out0_ack_pld[1:0];
	
	always @(*) begin
	    if(wait_aw_reg) out0_req_vld = (in_aw_vld && in_w_vld);
	    else out0_req_vld = in_w_vld;
	end
	
	assign out0_req_head = (in_aw_vld && S0_in_aw_rdy);
	
	assign out0_req_tail = in_w_last;
	
	assign out0_req_pld = {in_aw_addr, in_aw_id, in_aw_user, in_w_strb, in_w_data};
	
	always @(*) begin
	    if(((32'b0 >= in_aw_addr) && (in_aw_addr <= 32'b1111111111111111))) out0_req_mst_id = 4'b1;
	    else if(((32'b10000000000000000 >= in_aw_addr) && (in_aw_addr <= 32'b11111111111111111))) out0_req_mst_id = 4'b10;
	    else out0_req_mst_id = 4'b0;
	end
	
	assign out0_req_slv_id = 4'b0;
	
	assign out0_ack_rdy = in_b_rdy;
	
	always @(posedge clk or negedge rst_n) begin
	    if(~rst_n) wait_aw_reg <= 1'b0;
	    else begin
	        if((in_w_vld && in_w_rdy && in_w_last)) wait_aw_reg <= 1'b1;
	        else if((in_aw_vld && S0_in_aw_rdy)) wait_aw_reg <= 1'b0;
	    end
	end
	

endmodule
//[UHDL]Content End [md5:63099727613de6451fe1f00f541dafa4]

//[UHDL]Parameter Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Parameter End [md5:d41d8cd98f00b204e9800998ecf8427e]

