`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:14:15 11/14/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [3:0] OP,
    input [31:0] A,
    input [31:0] B,
	 input [4:0] shamt,
    output [31:0] result,
	 output Zero 
    );
reg [31:0]	z;
initial begin
	z = 0;
end
assign zero = (result == 32'b0)	?	1:	0;
assign result = 	(OP == 0)	?	A | B	:
						(OP == 1)	?	A & B	:
						(OP == 2)	?	A + B :
						(OP == 3)	?	A - B	:
						(OP == 4)	? 	{A[7:0],A[31:8]}	:
						(OP == 5)	?	B << shamt	:
						(OP == 6)	?	B	:
						0;

endmodule
