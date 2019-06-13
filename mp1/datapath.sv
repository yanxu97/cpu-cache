import rv32i_types::*;

module datapath
(
    input clk,

    /* control signals */
    input load_pc,
	input load_ir,
	input load_regfile,
	input load_mar,
	input load_mdr,
	input load_data_out,
    input pcmux_sel,
	input alumux1_sel,
	input [1:0] alumux2_sel,
	input [1:0] alumux3_sel,
	input [2:0] regfilemux_sel,
	input marmux_sel,
	input cmpmux_sel,
	input alu_ops aluop,
	input rv32i_word mem_rdata,
	input branch_funct3_t cmpop,
	// to memory
	output rv32i_word mem_address,
	output rv32i_word mem_wdata,
	// to control
	output rv32i_opcode opcode,
	output [2:0] funct3,
	output [6:0] funct7,
	output br_en
);

/* declare internal signals */
rv32i_reg rs1, rs2, rd;
rv32i_word rs1_out,rs2_out, i_imm, u_imm, b_imm, s_imm, j_imm, // j is not used
		   pcmux_out, alumux1_out, alumux2_out, alumux3_out, regfilemux_out,
		   marmux_out, cmpmux_out, alu_out, pc_out, pc_plus4_out,
		   mdrreg_out;



/*
 * PC
 */
pc_plus4 pc_plus4_obj
(
	.in(pc_out),
	.out(pc_plus4_out)
); 
 
mux2 pcmux
(
    .sel(pcmux_sel),
    .a(pc_plus4_out),
    .b({alu_out[31:1],1'b0}),
    .f(pcmux_out)
);

pc_register PC
(
    .clk,
    .load(load_pc),
    .in(pcmux_out),
    .out(pc_out)
);

/*
 * CMP
 */
mux2 cmpmux
(
	.sel(cmpmux_sel),
	.a(rs2_out),
	.b(i_imm),
	.f(cmpmux_out)
);

cmp CMP                //////////////////////////>?????????????????????????????????
(
	.cmpop(cmpop),
	.a(rs1_out), 
	.b(cmpmux_out),
	.br_en(br_en)
);
 
/*
 * IR
 */
ir IR
(
	.clk,
	.load(load_ir),
	.in(mdrreg_out),
	.funct3(funct3),
    .funct7(funct7),
    .opcode(opcode),
    .i_imm(i_imm),
    .s_imm(s_imm),
    .b_imm(b_imm),
    .u_imm(u_imm),
    .j_imm(j_imm),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd)
); 

/*
 * 	REGFILE
 */
mux8 regfilemux
(
	.sel(regfilemux_sel),
	.a(alu_out),				// 3'b000
	.b({31'b0,br_en}),			// 3'b001
	.c(u_imm),					// 3'b010
	.d(mdrreg_out),				// 3'b011
	.e(pc_plus4_out),			// 3'b100
	.f(pc_plus4_out),			// 3'b101
	.g(pc_plus4_out),			// 3'b110
	.h(pc_plus4_out),			// 3'b111
	.out(regfilemux_out)
);

regfile regfile
(
    .clk,
    .load(load_regfile),
    .in(regfilemux_out),
    .src_a(rs1), 
	.src_b(rs2), 
	.dest(rd),
    .reg_a(rs1_out), 
	.reg_b(rs2_out)
);

/*
 * MAR
 */
mux2 marmux
(
	.sel(marmux_sel),
	.a(pc_out),
	.b(alu_out),
	.f(marmux_out)
);

register MAR
(
	.clk,
	.load(load_mar),
	.in(marmux_out),
	.out(mem_address)
); 
 
/*
 * MDR
 */
register MDR
(
	.clk,
	.load(load_mdr),
	.in(mem_rdata),
	.out(mdrreg_out)
);
/*
 * MEM_DATA_OUT
 */
register MEM_DATA_OUT
(
	.clk,
	.load(load_data_out),
	.in(rs2_out),
	.out(mem_wdata)
); 
 
/*
 * ALU
 */
mux2 alumux1
(
	.sel(alumux1_sel),
	.a(rs1_out),
	.b(pc_out),
	.f(alumux1_out)
);

mux4 alumux2
(
	.sel(alumux2_sel),
	.a(i_imm),
	.b(u_imm),
	.c(b_imm),
	.d(s_imm),
	.f(alumux2_out)
);

//chosing between j-type and reg
mux4 alumux3
(
	.sel(alumux3_sel),
	.a(alumux2_out),//i u b s
	.b(rs2_out),// reg
	.c(j_imm),
	.d(j_imm),
	.f(alumux3_out)
);

alu ALU
(
	.aluop(aluop),
	.a(alumux1_out),
	.b(alumux3_out),
	.f(alu_out)
);

 
endmodule : datapath
