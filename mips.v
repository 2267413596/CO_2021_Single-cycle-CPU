`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:33:13 11/14/2021 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );
	 
wire [1:0] Reg_dst_I;
wire [3:0] ALUOP_I;
wire [1:0] MtoR_I;
wire [1:0] s_type_I;
wire [2:0] Shift_ctrl_I;
wire [5:0] OP;
wire [5:0] func;
wire [1:0] PC_src_I;
wire [31:0] result_o;
Datapath Datapath (
    .clk(clk_I), 
    .reset(reset_I), 
    .Reg_dst(Reg_dst_I), 
    .ALUOP(ALUOP_I), 
    .MtoR(MtoR_I), 
    .s_type(s_type_I), 
    .ALU_src(ALU_src_I), 
    .Branch(Branch_I), 
    .Shift_ctrl(Shift_ctrl_I), 
    .RWE(RWE_I), 
    .MWE(MWE_I), 
    .PC_src(PC_src_I),
	 .OP(OP),
	 .func(func),
	 .result_o(result_o)
    );
	 



wire [31:0] result;
wire [1:0] Reg_dst;
wire [3:0] ALUOP;
wire [1:0] MtoR;
wire [1:0] s_type;
wire [2:0] Shift_ctrl;
wire [5:0] op_I;
wire [5:0] func_I;
wire [1:0]  PC_src;	 
Control_Unit CU (
    .op(op_I), 
    .func(func_I), 
    .Reg_dst(Reg_dst), 
    .ALUOP(ALUOP), 
    .MtoR(MtoR), 
    .s_type(s_type), 
    .ALU_src(ALU_src), 
    .Branch(Branch), 
    .Shift_ctrl(Shift_ctrl), 
    .RWE(RWE), 
    .MWE(MWE), 
    .PC_src(PC_src),
	 .result(result)
    );



assign clk_I = clk;
assign reset_I = reset;
assign Reg_dst_I = Reg_dst;
assign ALUOP_I= ALUOP;
assign MtoR_I = MtoR;
assign s_type_I = s_type;
assign ALU_src_I = ALU_src;
assign Branch_I = Branch;
assign Shift_ctrl_I = Shift_ctrl;
assign RWE_I = RWE;
assign MWE_I = MWE;
assign PC_src_I = PC_src;
assign op_I = OP;
assign func_I = func;
assign result = result_o;

endmodule
