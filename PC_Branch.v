`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:52:22 11/15/2021 
// Design Name: 
// Module Name:    PC_Branch 
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
module PC_Branch(
    input signed [31:0] branch,
    output signed [31:0] branch_o,
    input signed [31:0] pc_plus4
    );
assign branch_o = pc_plus4 + branch;

endmodule
