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


//[UHDL]Key Start [md5:b0ef52f1c02eecabfa1ed7fbc74a0d6d]
//Version Control Hash: 3accddf64b1dd03abeb9b0b3e5a7ba44
//Content Hash: 878d0c3f87e529c3ac3895a391708f1d
//Parameter Hash: d41d8cd98f00b204e9800998ecf8427e
//[UHDL]Key End [md5:b0ef52f1c02eecabfa1ed7fbc74a0d6d]

//[UHDL]Version Control Start [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]
//[UHDL]Version Control Version:1.0.1
//[UHDL]Version Control End [md5:3accddf64b1dd03abeb9b0b3e5a7ba44]

//[UHDL]Tool Message Start [md5:160f514fdc25265ab9d40c47fcf3b5ce]
//Written by UHDL in 2022-09-16 20:32:05
//[UHDL]Tool Message End [md5:160f514fdc25265ab9d40c47fcf3b5ce]

//[UHDL]User Message Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]User Message End [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Content Start [md5:878d0c3f87e529c3ac3895a391708f1d]
module CmnAgeMtx_width_2 (
	input        clk           ,
	input        rst_n         ,
	input  [1:0] update_en     ,
	output [1:0] age_bits_row_0,
	output [1:0] age_bits_row_1);
	wire [0:0] age_bit_0_0;
	reg  [0:0] age_bit_0_1;
	wire [0:0] age_bit_1_1;
	wire [0:0] age_bit_1_0;
	assign age_bits_row_0 = {age_bit_0_0, age_bit_0_1};
	
	assign age_bits_row_1 = {age_bit_1_0, age_bit_1_1};
	
	assign age_bit_0_0 = 1'b0;
	
	always @(posedge clk or negedge rst_n) begin
	    if(~rst_n) age_bit_0_1 <= 1'b0;
	    else age_bit_0_1 <= update_en[1:1];
	end
	
	assign age_bit_1_1 = 1'b0;
	
	assign age_bit_1_0 = (!age_bit_0_1);
	

endmodule
//[UHDL]Content End [md5:878d0c3f87e529c3ac3895a391708f1d]

//[UHDL]Parameter Start [md5:d41d8cd98f00b204e9800998ecf8427e]

//[UHDL]Parameter End [md5:d41d8cd98f00b204e9800998ecf8427e]

