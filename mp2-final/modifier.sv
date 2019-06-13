import rv32i_types::*; /* Import types defined in rv32i_types.sv */

module modifier
(
	input [2:0] sel,
	input [1:0] align,
	input [3:0] mem_byte_enable,
	input [255:0] from_cache,
	input [31:0] data_in,
	output logic [255:0] data_modifier_out
);

logic [31:0] temp;
always_comb
begin
	// if no write performs, we keep the same value
	data_modifier_out = from_cache;
	temp = 32'b0;	
	if (mem_byte_enable == 4'b0000)
		temp = 32'b0;
	else if (mem_byte_enable == 4'b0001)	
		temp = {24'b0, data_in[7:0]};
	else if (mem_byte_enable == 4'b0010)	
		temp = {16'b0, data_in[15:8], 8'b0};
	else if (mem_byte_enable == 4'b0100)
		temp = {8'b0, data_in[23:16], 16'b0};
	else if (mem_byte_enable == 4'b1000)	
		temp = {data_in[31:24], 24'b0};
	else if (mem_byte_enable == 4'b0011)	
		temp = {16'b0, data_in[15:0]};
	else if (mem_byte_enable == 4'b1100)
		temp = {data_in[31:16], 16'b0};
	else if (mem_byte_enable == 4'b1111)	
		temp = data_in;
	else
		$display("mem_byte_enable wrong");

//	// deal with alignment	
//	if (align == 1)
//		temp = {temp[23:0], from_cache[offset_bit-1:offset_bit-7]};
//	else if (align == 2)
//		temp = {temp[15:0], from_cache[offset_bit-1:offset_bit-15]};
//	else if (align == 3)
//		temp = {temp[7:0], from_cache[offset_bit-1:offset_bit-23]};
//		
	// sel is set for select the correct word
	case (sel)
		3'b000: begin
			data_modifier_out = {from_cache[255:32], temp};
			if (align == 1)
				data_modifier_out = {from_cache[255:32], temp[23:0], from_cache[7:0]};
			else if (align == 2)
				data_modifier_out = {from_cache[255:32], temp[15:0], from_cache[15:0]};
			else if (align == 3)
				data_modifier_out = {from_cache[255:32], temp[7:0], from_cache[23:0]};
		end
		3'b001: begin
			data_modifier_out = {from_cache[255:64], temp, from_cache[31:0]};
			if (align == 1)
				data_modifier_out = {from_cache[255:64], temp[23:0], from_cache[39:0]};
			else if (align == 2)
				data_modifier_out = {from_cache[255:64], temp[15:0], from_cache[47:0]};
			else if (align == 3)
				data_modifier_out = {from_cache[255:64], temp[7:0], from_cache[55:0]};
		end
		3'b010: begin
			data_modifier_out = {from_cache[255:96], temp, from_cache[63:0]};
			if (align == 1)
				data_modifier_out = {from_cache[255:96], temp[23:0], from_cache[71:0]};
			else if (align == 2)
				data_modifier_out = {from_cache[255:96], temp[15:0], from_cache[79:0]};
			else if (align == 3)
				data_modifier_out = {from_cache[255:96], temp[7:0], from_cache[87:0]};
		end
		3'b011: begin
			data_modifier_out = {from_cache[255:128], temp, from_cache[95:0]};
			if (align == 1)
				data_modifier_out = {from_cache[255:128], temp[23:0], from_cache[103:0]};
			else if (align == 2)
				data_modifier_out = {from_cache[255:128], temp[15:0], from_cache[111:0]};
			else if (align == 3)
				data_modifier_out = {from_cache[255:128], temp[7:0], from_cache[119:0]};
		end
		3'b100: begin
			data_modifier_out = {from_cache[255:160], temp, from_cache[127:0]};
			if (align == 1)
				data_modifier_out = {from_cache[255:160], temp[23:0], from_cache[135:0]};
			else if (align == 2)
				data_modifier_out = {from_cache[255:160], temp[15:0], from_cache[143:0]};
			else if (align == 3)
				data_modifier_out = {from_cache[255:160], temp[7:0], from_cache[151:0]};
		end
		3'b101: begin
			data_modifier_out = {from_cache[255:192], temp, from_cache[159:0]};
			if (align == 1)
				data_modifier_out = {from_cache[255:192], temp[23:0], from_cache[167:0]};
			else if (align == 2)
				data_modifier_out = {from_cache[255:192], temp[15:0], from_cache[175:0]};
			else if (align == 3)
				data_modifier_out = {from_cache[255:192], temp[7:0], from_cache[183:0]};
		end
		3'b110: begin
			data_modifier_out = {from_cache[255:224], temp, from_cache[191:0]};
			if (align == 1)
				data_modifier_out = {from_cache[255:224], temp[23:0], from_cache[199:0]};
			else if (align == 2)
				data_modifier_out = {from_cache[255:224], temp[15:0], from_cache[207:0]};
			else if (align == 3)
				data_modifier_out = {from_cache[255:224], temp[7:0], from_cache[215:0]};
		end
		3'b111: begin
			data_modifier_out = {temp, from_cache[223:0]};
			if (align == 1)
				data_modifier_out = {temp[23:0], from_cache[231:0]};
			else if (align == 2)
				data_modifier_out = {temp[15:0], from_cache[239:0]};
			else if (align == 3)
				data_modifier_out = {temp[7:0], from_cache[247:0]};
		end
	endcase
end

endmodule : modifier