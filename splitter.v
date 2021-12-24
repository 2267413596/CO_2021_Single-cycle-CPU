`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:40:57 11/14/2021 
// Design Name: 
// Module Name:    splitter 
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
module splitter(
    input [31:0] Instr,
    output [5:0] OP,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
    output [25:0] im26,
    output [15:0] offset,
	 output [4:0] shamt,
	 output [5:0] func
    );
assign OP = Instr[31:26];
assign rs = Instr[25:21];
assign rt = Instr[20:16];
assign rd = Instr[15:11];
assign im26 = Instr[25:0];
assign offset = Instr[15:0];
assign shamt = Instr[10:6];
assign func = Instr[5:0];

endmodule
