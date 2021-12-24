`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:31:02 11/14/2021 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
    input [5:0] op,
    input [5:0] func,
    output reg [1:0] Reg_dst,
    output reg [3:0] ALUOP,
    output reg [1:0] MtoR,
    output reg [1:0] s_type,
    output reg ALU_src,
    output reg Branch,
    output reg [2:0] Shift_ctrl,
    output reg RWE,
    output reg MWE,
	 output reg [1:0] PC_src,
	 input [31:0] result
    );
always@(*) begin
	case(op)
		0:	begin
			if(func == 0) begin				// nop or sll
				Reg_dst = 1;
				ALUOP = 5;						// sll
				MtoR = 0;
				s_type = 0;
				ALU_src = 0;
				Branch = 0;
				Shift_ctrl = 0;
				RWE = 1;
				MWE = 0;
				PC_src = 0;
			end
			else if(func == 8)	begin			//jr
				Reg_dst = 0;
				ALUOP = 0;					
				MtoR = 0;
				s_type = 0;
				ALU_src = 0;
				Branch = 0;
				Shift_ctrl = 0;
				RWE = 0;
				MWE = 0;
				PC_src = 3;
			end
			else if(func == 33) begin		//addu
				Reg_dst = 1;
				ALUOP = 2;
				MtoR = 0;
				s_type = 0;
				ALU_src = 0;
				Branch = 0;
				Shift_ctrl = 0;
				RWE = 1;
				MWE = 0;
				PC_src = 0;
			end
			else if(func == 35) begin		//subu
				Reg_dst = 1;
				ALUOP = 3;
				MtoR = 0;
				s_type = 0;
				ALU_src = 0;
				Branch = 0;
				Shift_ctrl = 0;
				RWE = 1;
				MWE = 0;
				PC_src = 0;
			end
		end
		13: begin								//ori
			Reg_dst = 0;
			ALUOP = 0;
			MtoR = 0;
			s_type = 0;
			ALU_src = 1;
			Branch = 0;
			Shift_ctrl = 0;
			RWE = 1;
			MWE = 0;
			PC_src = 0;
		end
		35: begin								//lw
			Reg_dst = 0;
			ALUOP = 2;
			MtoR = 1;
			s_type = 0;
			ALU_src = 1;
			Branch = 0;
			Shift_ctrl = 0;
			RWE = 1;
			MWE = 0;
			PC_src = 0;
		end
		6'b101011: begin								//sw
			Reg_dst = 0;
			ALUOP = 2;
			MtoR = 0;
			s_type = 0;
			ALU_src = 1;
			Branch = 0;
			Shift_ctrl = 0;
			RWE = 0;
			MWE = 1;
			PC_src = 0;
		end
		6'b001111: begin								//lui
			Reg_dst = 0;
			ALUOP = 2;
			MtoR = 0;
			s_type = 0;
			ALU_src = 1;
			Branch = 1;
			Shift_ctrl = 4;
			RWE = 1;
			MWE = 0;
			PC_src = 0;
		end
		6'b000011: begin								//jal
			Reg_dst = 2;
			ALUOP = 2;
			MtoR = 2;
			s_type = 0;
			ALU_src = 1;
			Branch = 1;
			Shift_ctrl = 2;
			RWE = 1;
			MWE = 0;
			PC_src = 2;
		end
		6'b000100: begin								//beq
			Reg_dst = 2;
			ALUOP = 3;
			MtoR = 2;
			s_type = 0;
			ALU_src = 0;
			Branch = 1;
			Shift_ctrl = 3;
			RWE = 0;
			MWE = 0;
			if(result == 0)
				PC_src = 1;
			else
				PC_src = 0;
		end
		6'b000010: begin								//j
			Reg_dst = 0;
			ALUOP = 2;
			MtoR = 0;
			s_type = 0;
			ALU_src = 1;
			Branch = 0;
			Shift_ctrl = 2;
			RWE = 0;
			MWE = 0;
			PC_src = 2;
		end
	endcase
end
endmodule
