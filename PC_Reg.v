`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:00:53 11/15/2021 
// Design Name: 
// Module Name:    PC_Reg 
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
module PC_Reg(
    input [31:0] PC_next,
	 input clk,
	 input reset,
    output [31:0] PC
    );
reg [31:0] Reg;
assign PC = Reg;
initial begin
	Reg = 32'h00003000;
end
always@(posedge clk) begin
	if(reset) 
		Reg <= 32'h00003000;
	else
		Reg <= PC_next;
end
endmodule
