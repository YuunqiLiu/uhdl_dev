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


//[UHDL]Key Start [md5:b662206f08b80e4b5504f3da5e1e6124]
//Version Control Hash: 3accddf64b1dd03abeb9b0b3e5a7ba44
//Content Hash: b3e6cb55f94fa4f4182ef5b36c8f8adf
//Parameter Hash: d41d8cd98f00b204e9800998ecf8427e
//[UHDL]Key End [md5:b662206f08b80e4b5504f3da5e1e6124]

//[UHDL]Version Control Start [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]
//[UHDL]Version Control Version:1.0.1
//[UHDL]Version Control End [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]

//[UHDL]Tool Message Start [md5:028cd5184e09038c5c1e01ffbaa8703a]
//Written by UHDL in 2022-08-14 16:30:39
//[UHDL]Tool Message End [md5:028cd5184e09038c5c1e01ffbaa8703a]

//[UHDL]User Message Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]User Message End [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Content Start [md5:b3e6cb55f94fa4f4182ef5b36c8f8adf]
module DSlv_node_S0 (
	input         in0_vld  ,
	output        in0_rdy  ,
	input         in0_head ,
	input         in0_tail ,
	input  [31:0] in0_pld  ,
	input  [7:0]  in0_id   ,
	output        out0_vld ,
	input         out0_rdy ,
	output        out0_head,
	output        out0_tail,
	output [31:0] out0_pld ,
	output [7:0]  out0_id  );
	assign in0_rdy = out0_rdy;
	
	assign out0_vld = in0_vld;
	
	assign out0_pld = in0_pld;
	
	assign out0_id = in0_id;
	

endmodule
//[UHDL]Content End [md5:b3e6cb55f94fa4f4182ef5b36c8f8adf]

//[UHDL]Parameter Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Parameter End [md5:d41d8cd98f00b204e9800998ecf8427e]
