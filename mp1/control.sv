import rv32i_types::*; /* Import types defined in rv32i_types.sv */

module control
(
	input clk,
    /* Input and output port declarations */
	//from datapath
	input rv32i_opcode opcode,
	input [2:0] funct3,
	input [6:0] funct7,
	input br_en,
	
	//from memory
	input mem_resp,
	
	//to datapath
	output logic load_pc,
	output logic load_ir,
	output logic load_regfile,
	output logic load_mar,
	output logic load_mdr,
	output logic load_data_out,
    output logic pcmux_sel,
	output branch_funct3_t cmpop,
	output logic alumux1_sel,
	output logic [1:0] alumux2_sel,
	output logic [1:0] alumux3_sel,
	output logic [2:0] regfilemux_sel,
	output logic marmux_sel,
	output logic cmpmux_sel,
	output alu_ops aluop,
	
	//to memory
	output logic mem_read,
	output logic mem_write,
	output logic [3:0] mem_byte_enable
);

enum int unsigned {
    /* List of states */
	fetch1,
	fetch2,
	fetch3,
	decode,
	imm,
	lui,
	calc_addr,
	s_auipc,
	br,
	jal,//not used
	jalr,//not used
	rg,//not used
	csr,//not used
	ld1,
	st1,
	ld2,
	st2	
} state, next_state;

always_comb
begin : state_actions
    /* Default output assignments */
	load_pc = 1'b0;
	load_ir = 1'b0;
	load_regfile = 1'b0;
	load_mar = 1'b0;
	load_mdr = 1'b0;
	load_data_out = 1'b0;
	pcmux_sel = 1'b0;
	cmpop = branch_funct3_t'(funct3);
	alumux1_sel = 1'b0;
	alumux2_sel = 2'b0;
	alumux3_sel = 2'b0;
	regfilemux_sel = 3'b000;
	marmux_sel = 1'b0;
	cmpmux_sel = 1'b0;
	aluop = alu_ops'(funct3);
	mem_read = 1'b0;
	mem_write = 1'b0;
	mem_byte_enable = 4'b1111;
    /* Actions for each state */
	case(state)
		fetch1: begin
			load_mar = 1;
		end
		
		fetch2: begin
			mem_read = 1;
			load_mdr = 1;
		end
		
		fetch3: begin
			load_ir = 1;
		end
		
		decode: begin
		
		end
		
		jal: begin
			load_regfile = 1;
			regfilemux_sel = 3'b100;
			alumux1_sel = 1;
			alumux3_sel = 2;
			aluop = alu_add;
			load_pc = 1;
			pcmux_sel = 1;
		end
		
		jalr: begin
			load_regfile = 1;
			regfilemux_sel = 3'b100;
			alumux1_sel = 0;
			alumux2_sel = 0; // i-type
			alumux3_sel = 0;
			aluop = alu_add;
			load_pc = 1;
			pcmux_sel = 1;
		end
		
		// need some changes
		rg: begin
			load_regfile = 1;
			alumux1_sel = 0;
			alumux3_sel = 1;
			aluop = alu_ops'(funct3);
			load_pc = 1;
		end
		
		imm: begin
			// SLTI
			if (funct3 == 3'b010)
			begin
				load_regfile = 1;
				load_pc = 1;
				cmpop = blt;
				regfilemux_sel = 1;
				cmpmux_sel = 1;
			end
			// SLTIU
			else if (funct3 == 3'b011)
			begin
				load_regfile = 1;
				load_pc = 1;
				cmpop = bltu;
				regfilemux_sel = 1;
				cmpmux_sel = 1;
			end
			// SRAI
			else if (funct3 == 3'b101 && funct7 == 7'b0100000)
			begin
				load_regfile = 1;
				load_pc = 1;
				aluop = alu_sra;
			end
			else
			begin
				load_regfile = 1;
				load_pc = 1;
				aluop = alu_ops'(funct3);
			end
		end
		
		lui: begin
			load_regfile = 1;
			load_pc = 1;
			regfilemux_sel = 2;
		end
		
		calc_addr: begin
			aluop = alu_add;
			load_mar = 1;
			marmux_sel = 1;
			if (opcode == op_store)
			begin
				alumux2_sel = 3;
				alumux3_sel = 0;
				load_data_out = 1;
			end
		end
		
		s_auipc: begin
			load_regfile = 1;
			alumux1_sel = 1;
			alumux2_sel = 1;
			alumux3_sel = 0;
			aluop = alu_add;
			load_pc = 1;
		end
		
		br: begin
			pcmux_sel = br_en;
			load_pc = 1;
			alumux1_sel = 1;
			alumux2_sel = 2;
			alumux3_sel = 0;
			aluop = alu_add;
		end
		
		ld1: begin
			load_mdr = 1;
			mem_read = 1;
		end
		st1: begin
			mem_write = 1;
		end
		ld2: begin
			regfilemux_sel = 3;
			load_regfile = 1;
			load_pc = 1;
		end
		st2: begin
			load_pc = 1;
		end
		
		default:
			$display("state wrong 1");
		
	endcase
end

always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
	next_state = state;
	case(state)
		fetch1: 
			next_state = fetch2;
		fetch2: 
			if (mem_resp) 
				next_state = fetch3;
			else
				next_state = fetch2;
		fetch3:
			next_state = decode;
		decode:
			case(opcode)
				op_lui:
					next_state = lui;
				op_auipc:
					next_state = s_auipc;
				op_jal:
					next_state = jal;
				op_jalr:
					next_state = jalr;
				op_br:
					next_state = br;
				op_load:
					next_state = calc_addr;
				op_store:
					next_state = calc_addr;
				op_imm:
					next_state = imm;
				op_reg:
					next_state = rg;
				op_csr:
					next_state = csr;
				default:
					$display("opcode wrong");
			endcase
		jal:
			next_state = fetch1;
		jalr:
			next_state = fetch1;
		rg:
			next_state = fetch1;
		imm:
			next_state = fetch1;
		lui:
			next_state = fetch1;
		calc_addr:
			if (opcode == op_load)
				next_state = ld1;
			else if (opcode == op_store)
				next_state = st1;
			else
				$display("calc_addr wrong");
		s_auipc:
			next_state = fetch1;
		br:
			next_state = fetch1;
		ld1:
			if (mem_resp) 
				next_state = ld2;
			else
				next_state = ld1;
		st1:
			if (mem_resp) 
				next_state = st2;
			else
				next_state = st1;
		ld2:
			next_state = fetch1;
		st2:
			next_state = fetch1;
		default: $display("state wrong 2");
	endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	state <= next_state;
end

endmodule : control
