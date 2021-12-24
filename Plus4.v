`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:54:53 11/15/2021 
// Design Name: 
// Module Name:    Plus4 
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
module Plus4(
    input [31:0] pc,
    output [31:0] pc_plus4
    );
assign pc_plus4 = pc + 32'b00000000000000000000000000000100;

endmodule
