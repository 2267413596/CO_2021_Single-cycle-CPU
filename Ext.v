`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:16:21 11/15/2021 
// Design Name: 
// Module Name:    Shifter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Ext(
    input [15:0] imm_16,
    input [2:0] sign,
	 input [25:0] imm_26,
    output [31:0] imm_Ext
    );
assign imm_Ext = 	(sign == 0)	?	{{16'b0000000000000000},imm_16}						:
						(sign == 1)	?	{{16{imm_16[15]}},imm_16}			:
						(sign == 2)	?	{{14'b00000000000000},imm_16,{2'b00}}				:
						(sign == 3)	?	{{14{imm_16[15]}},imm_16,{2'b00}}	:
						(sign == 4) ?	{imm_16,{16'b0000000000000000}}						:
						0;
						

endmodule
