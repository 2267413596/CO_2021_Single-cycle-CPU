`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:11:17 11/15/2021 
// Design Name: 
// Module Name:    MUX 
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
module MUX(
    );


endmodule


module PC_MUX(
	input [31:0] pc_4,
	input [31:0] pc_b,
	input [31:0] pc_j,
	input [31:0] pc_jr,
	input [1:0] pc_src,
	output [31:0] pc
	);
assign pc = (pc_src == 0)	?	pc_4	:
				(pc_src == 1)	?	pc_b	:
				(pc_src == 2)	?	pc_j	:
				pc_jr;

endmodule


module ALU_MUX(
	input [1:0] ALU_src,
	input [31:0] im,
	input [31:0] rt,
	output [31:0] ALU_B
	);
assign ALU_B = 	(ALU_src == 0)	?	rt	:	im;
endmodule

module Memtoreg(
	input [1:0] MtoR,
	input [31:0] ALU_r,
	input [31:0] Mem_d,
	input [31:0] PC_n,
	output [31:0] load
	);
assign load = 	(MtoR == 0)	?	ALU_r	:	
					(MtoR == 1)	?	Mem_d	:
					PC_n;
endmodule

module Reg_MUX(
	input [1:0] RegDst,
	input [4:0] rt,
	input	[4:0] rd,
	output [4:0] WRA
	);
assign WRA = 	(RegDst == 2'b00)	?	rt	:	
					(RegDst == 2'b01)	?	rd	:
					(RegDst == 2'b10)	?	5'b11111	:
					5'b00000;

endmodule



