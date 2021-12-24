`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:43:05 11/14/2021 
// Design Name: 
// Module Name:    dm 
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
module dm(
    input reset,
    input clk,
    input MW,
    input [1:0] s_type,
	 input [1:0] l_type,
    input [31:0] WD,
    input [31:0] WA,
    output [31:0] MD,
	 input [31:0] WPC
    );
	wire [31:0] WAX;
	assign WAX = {{20'b0},{WA[11:0]}};
	wire [1:0] WAC;
	assign WAC = {WA[1:0]};
	reg [31:0] memory [0:1023];
	integer i;
	initial begin
		for(i = 0; i < 1024; i = i + 1) begin
			memory[i] = 0;
		end
	end
	assign MD = memory[WA[11:2]];
	always@(posedge clk) begin
		if(reset) begin
			for(i = 0; i < 1024; i = i + 1) begin
				memory[i] <= 0;
			end
		end
		else if(MW) begin
			$display("@%h: *%h <= %h", WPC, WAX, WD);
			if(s_type == 0)
				memory[WA[11:2]] <= WD;
			/*else if(s_type == 1) begin
				if(WAC == 2'b00)
					memory[WA[11:2]] <= {{MD[31:8]},{WD[7:0]}};
				else if(WAC == 2'b01)
					memory[WA[11:2]] <= {{MD[31:16]},{WD[7:0]},{MD[7:0]}};
				else if(WAC == 2'b10)
					memory[WA[11:2]] <= {{MD[31:24]},{WD[7:0]},{MD[15:0]}};
				else if(WAC == 2'b11)
					memory[WA[11:2]] <= {{WD[7:0]},{MD[23:0]}};
			end
			else if(s_type == 2) begin
				if(WA[1] == 0)
					memory[WA] <= {{MD[31:16]},{WD[15:0]}};
				else if(WA[1] == 1)
					memory[WA] <= {{WD[15:0]},{MD[31:16]}};
			end*/
		end
	end
endmodule
