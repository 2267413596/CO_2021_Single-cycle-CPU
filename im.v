`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:53:10 11/14/2021 
// Design Name: 
// Module Name:    im 
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
module im(
    input [31:0] IM_A,
    output [31:0] Instr
    );
	reg [31:0] memory [0:1023];
	initial
	$readmemh("code.txt",memory);
	assign Instr = memory [IM_A[11:2]];
endmodule

