`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:22 11/14/2021 
// Design Name: 
// Module Name:    Datapath 
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
module Datapath(
	input clk,
	input reset,
	input [1:0] Reg_dst,
   input [3:0] ALUOP,
   input [1:0] MtoR,
   input [1:0] s_type,
   input ALU_src,
   input Branch,
   input [2:0] Shift_ctrl,
   input RWE,
   input MWE,
	input [1:0] PC_src,
	output [5:0] OP,
	output [5:0] func,
	output [31:0] result_o
    );

wire [31:0] branch;
wire [31:0] branch_o;
wire [31:0] pc_plus4_I;
PC_Branch PC_B (
    .branch(branch), 
    .branch_o(branch_o), 
    .pc_plus4(pc_plus4_I)
    );

wire [31:0] pc_PI;
wire [31:0] pc_plus4;
Plus4 Plus4 (
    .pc(pc_PI), 
    .pc_plus4(pc_plus4)
    );
	 
wire [1:0] RegDst;
wire [4:0] rt_MUX;
wire [4:0] rd_MUX;
wire [4:0] WRA;
Reg_MUX Reg_MUX (
    .RegDst(RegDst), 
    .rt(rt_MUX), 
    .rd(rd_MUX), 
    .WRA(WRA)
    );

wire [15:0] imm_16;
wire [2:0] sign;
wire [31:0] imm_Ext;
Ext Ext (
    .imm_16(imm_16), 
    .sign(sign), 
    .imm_Ext(imm_Ext)
    );


wire [4:0] shamt;
wire [3:0] OP_ALU;
wire [31:0] A;
wire [31:0] B;
wire [31:0] result;
wire Zero;
ALU ALU (
    .OP(OP_ALU), 
    .A(A), 
    .B(B), 
    .result(result), 
	 .shamt(shamt),
    .Zero(Zero)
    );


wire clk_PCR;
wire [31:0] PC_next;
wire reset_PCR;
wire [31:0] PC;	 
PC_Reg PC_Reg (
    .PC_next(PC_next), 
    .clk(clk_PCR), 
    .reset(reset_PCR), 
    .PC(PC)
    );

wire [31:0] IM_A;
wire [31:0] Instr_o;
im IM (
    .IM_A(IM_A), 
    .Instr(Instr_o)
    );

wire [31:0] Instr;
wire [5:0] OP_o;
wire [4:0] rs_o;
wire [4:0] rt_o;
wire [4:0]rd_o;
wire [25:0] im26_o;
wire [15:0] offset_o;
wire [4:0] shamt_o;
wire [5:0] func_o;
splitter Splitter (
    .Instr(Instr), 
    .OP(OP_o), 
    .rs(rs_o), 
    .rt(rt_o), 
    .rd(rd_o), 
    .im26(im26_o), 
    .offset(offset_o), 
    .shamt(shamt_o), 
    .func(func_o)
    );

wire [4:0] RA_1;
wire [4:0] RA_2;
wire [4:0] WA_R;
wire [31:0] WD_R;
wire [31:0] RD_1;
wire [31:0] RD_2;
wire [31:0] WPC_R;
grf GRF (
    .clk(clk_GRF), 
    .reset(reset_GRF), 
    .RA_1(RA_1), 
    .RA_2(RA_2), 
    .WA(WA_R), 
    .WD(WD_R), 
    .RD_1(RD_1), 
    .RD_2(RD_2), 
    .WE(WE),
	 .WPC(WPC_R)
    );
	 

wire [1:0] s_type_I;
wire [1:0] l_type;
wire [31:0] WA;
wire [31:0] WD;
wire [31:0] MD;
wire [31:0] WPC;	 
dm DM (
    .reset(reset_DM), 
    .clk(clk_DM), 
    .MW(MW), 
    .s_type(s_type_I), 
    .l_type(l_type), 
    .WD(WD), 
    .WA(WA), 
    .MD(MD),
	 .WPC(WPC)
    );
	 

wire [1:0] pc_src_I;
wire [31:0] pc_4;
wire [31:0] pc_b;
wire [31:0] pc_j;
wire [31:0] pc_jr;
wire [31:0] pc_o;
PC_MUX PC_MUX (
    .pc_4(pc_4), 
    .pc_b(pc_b), 
    .pc_j(pc_j), 
    .pc_jr(pc_jr), 
    .pc_src(pc_src_I), 
    .pc(pc_o)
    );


wire [1:0] ALU_src_I;
wire [31:0] im;
wire [31:0] rt_ALU;
wire [31:0] ALU_B;
ALU_MUX ALU_MUX (
    .ALU_src(ALU_src_I), 
    .im(im), 
    .rt(rt_ALU), 
    .ALU_B(ALU_B)
    );


wire [1:0] MtoR_I;
wire [31:0] ALU_r;
wire [31:0] Mem_d;
wire [31:0] PC_n;
wire [31:0] load;
Memtoreg MemtoReg (
    .MtoR(MtoR_I), 
    .ALU_r(ALU_r), 
    .Mem_d(Mem_d), 
    .PC_n(PC_n), 
    .load(load)
    );


assign func = func_o;
assign OP = OP_o;
assign result_o = result;

//PC_MUX
assign pc_src_I = PC_src;
assign pc_b = branch_o;
assign pc_j = {{4'b0000},{im26_o[25:0]},{2'b00}};
assign pc_jr = result;
assign pc_4 = pc_plus4;

//Splitter
assign Instr = Instr_o;

//PC_Reg
assign clk_PCR = clk;
assign reset_PCR = reset;
assign PC_next = pc_o;

//IM
assign IM_A = PC;

//Reg_MUX
assign RegDst = Reg_dst;
assign rt_MUX = rt_o;
assign rd_MUX = rd_o;


//ALU_MUX
assign rt_ALU = RD_2;
assign ALU_src_I = ALU_src;
assign im = imm_Ext;


//ALU
assign B = ALU_B;
assign A = RD_1;
assign OP_ALU = ALUOP;
assign shamt = shamt_o;

//dm
assign WA = result;
assign WD = RD_2;
assign s_type_I = s_type;
assign clk_DM = clk;
assign reset_DM = reset;
assign MW = MWE;
assign WPC = PC;

//MemtoReg
assign MtoR_I = MtoR;
assign ALU_r = result;
assign Mem_d = MD;
assign PC_n = pc_plus4;

//GRF
assign clk_GRF = clk;
assign reset_GRF = reset;
assign RA_1 = rs_o;
assign RA_2 = rt_o;
assign WE = RWE;
assign WA_R = WRA;
assign WD_R = load;
assign WPC_R = PC;

//Ext
assign sign = Shift_ctrl;
assign imm_16 = offset_o;

//PC_B
assign branch = imm_Ext;
assign pc_plus4_I = pc_plus4;

//PC_Plus4
assign pc_PI = PC; 

//PC_Reg
assign clk_PCR = clk;
assign PC_next = pc_o;
assign reset_PCR = reset;

endmodule
