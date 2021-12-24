`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:29:35 11/14/2021 
// Design Name: 
// Module Name:    grf 
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
module grf(
    input clk,
    input reset,
    input [4:0] RA_1,
    input [4:0] RA_2,
    input [4:0] WA,
    input [31:0] WD,
	 input [31:0] WPC,
    output [31:0] RD_1,
    output [31:0] RD_2,
    input WE
    );
	reg [31:0] GRF[31:0];
	integer i;
	initial begin
		for(i = 0; i < 32; i = i + 1) begin
			GRF[i] = 0;
		end
	end
	assign RD_1 = GRF[RA_1];
	assign RD_2 = GRF[RA_2];
	always@(posedge clk) begin
		if(reset) begin
			for(i = 0; i < 32; i = i + 1) begin
				GRF[i] <= 0;
			end
		end
		else if(WE) begin
			$display("@%h: $%d <= %h", WPC, WA, WD);
			if(WA == 0)
			GRF[0] <= 0;
			else
			GRF[WA] <= WD;
		end
	end
endmodule
