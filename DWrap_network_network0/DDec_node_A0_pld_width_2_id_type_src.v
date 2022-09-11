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


//[UHDL]Key Start [md5:131f8f8c2c057ceca14216793c010b8a]
//Version Control Hash: 3accddf64b1dd03abeb9b0b3e5a7ba44
//Content Hash: 4861690ae5ab8773ed011bf46d045990
//Parameter Hash: d41d8cd98f00b204e9800998ecf8427e
//[UHDL]Key End [md5:131f8f8c2c057ceca14216793c010b8a]

//[UHDL]Version Control Start [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]
//[UHDL]Version Control Version:1.0.1
//[UHDL]Version Control End [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]

//[UHDL]Tool Message Start [md5:bae600ef297a3423865d474e391c5285]
//Written by UHDL in 2022-09-11 22:34:00
//[UHDL]Tool Message End [md5:bae600ef297a3423865d474e391c5285]

//[UHDL]User Message Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]User Message End [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Content Start [md5:4861690ae5ab8773ed011bf46d045990]
module DDec_node_A0_pld_width_2_id_type_src (
	input        din_vld    ,
	output       din_rdy    ,
	input        din_head   ,
	input        din_tail   ,
	input  [1:0] din_pld    ,
	input  [3:0] din_src_id ,
	input  [3:0] din_tgt_id ,
	input  [7:0] din_txn_id ,
	output       out0_vld   ,
	input        out0_rdy   ,
	output       out0_head  ,
	output       out0_tail  ,
	output [1:0] out0_pld   ,
	output [3:0] out0_src_id,
	output [3:0] out0_tgt_id,
	output [7:0] out0_txn_id,
	output       out1_vld   ,
	input        out1_rdy   ,
	output       out1_head  ,
	output       out1_tail  ,
	output [1:0] out1_pld   ,
	output [3:0] out1_src_id,
	output [3:0] out1_tgt_id,
	output [7:0] out1_txn_id);
	wire [0:0] id_hit_p0_id1;
	wire [0:0] id_hit_p0_id2;
	wire [0:0] sel_bit0     ;
	wire [0:0] id_hit_p1_id1;
	wire [0:0] id_hit_p1_id2;
	wire [0:0] sel_bit1     ;
	assign din_rdy = ((sel_bit0 && out0_rdy) || (sel_bit1 && out1_rdy));
	
	assign out0_vld = (sel_bit0 && din_vld);
	
	assign out0_head = din_head;
	
	assign out0_tail = din_tail;
	
	assign out0_pld = din_pld;
	
	assign out0_src_id = din_src_id;
	
	assign out0_tgt_id = din_tgt_id;
	
	assign out0_txn_id = din_txn_id;
	
	assign out1_vld = (sel_bit1 && din_vld);
	
	assign out1_head = din_head;
	
	assign out1_tail = din_tail;
	
	assign out1_pld = din_pld;
	
	assign out1_src_id = din_src_id;
	
	assign out1_tgt_id = din_tgt_id;
	
	assign out1_txn_id = din_txn_id;
	
	assign id_hit_p0_id1 = (din_src_id == 4'b1);
	
	assign id_hit_p0_id2 = (din_src_id == 4'b10);
	
	assign sel_bit0 = (id_hit_p0_id1 | id_hit_p0_id2);
	
	assign id_hit_p1_id1 = (din_src_id == 4'b1);
	
	assign id_hit_p1_id2 = (din_src_id == 4'b10);
	
	assign sel_bit1 = (id_hit_p1_id1 | id_hit_p1_id2);
	

endmodule
//[UHDL]Content End [md5:4861690ae5ab8773ed011bf46d045990]

//[UHDL]Parameter Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Parameter End [md5:d41d8cd98f00b204e9800998ecf8427e]

