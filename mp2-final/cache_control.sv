import rv32i_types::*; /* Import types defined in rv32i_types.sv */

module cache_control
(
	input clk,
	
	// output to datapath
	input hit_left_out,
	input hit_right_out,
	input lru_out,
	input dirty_bit_array_left_out,
	input dirty_bit_array_right_out,
	
	// output to the cache datapath
	output logic tag_left_write,
	output logic tag_right_write,
	output logic data_left_write,
	output logic data_right_write,
	output logic valid_left_write,
	output logic valid_right_write,
	output logic dirty_left_write,
	output logic dirty_right_write,
	output logic lru_write,
	output logic writebackmux_sel,	
	output logic [1:0] address_to_pmem_sel, 
	
	// communication with the main memory
	input pmem_resp,	
	output logic pmem_write,
	output logic pmem_read,
	
	// communication with the CPU
	input mem_read,
	input mem_write,
	output logic mem_resp
);
	
enum int unsigned {
	ready,
	write_to,
	read_from
} state, next_state;	

always_comb
begin
	tag_left_write = 1'b0;
	tag_right_write = 1'b0;
	data_left_write = 1'b0;
	data_right_write = 1'b0;
	valid_left_write = 1'b0;
	valid_right_write = 1'b0;
	dirty_left_write = 1'b0;
	dirty_right_write = 1'b0;
	lru_write = 1'b0;
	writebackmux_sel = 1'b0;	
	address_to_pmem_sel = 2'b00;
	
	pmem_write = 1'b0;
	pmem_read = 1'b0;
	
	mem_resp = 1'b0;
	
	case(state)
		ready: begin
			// read
			if(mem_read == 1 && (hit_left_out == 1 || hit_right_out == 1))
			begin
				mem_resp = 1;
				lru_write = 1;
			end
			// write
			else if(mem_write == 1 && (hit_left_out == 1 || hit_right_out == 1))
			begin
				mem_resp = 1;
				lru_write = 1;
				writebackmux_sel = 1;  // 0 - from Pmem, 1 - from CPU
				if (hit_left_out == 1)
				begin
					tag_left_write = 1;
					data_left_write = 1;
					valid_left_write = 1;
					dirty_left_write = 1;
				end
				// hit_right_out == 1
				else
				begin
					tag_right_write = 1;
					data_right_write = 1;
					valid_right_write = 1;
					dirty_right_write = 1;
				end
			end
		end
		
		write_to: begin
			pmem_write = 1;
			if (lru_out == 0)
				address_to_pmem_sel = 1;	// left 
			else if (lru_out == 1)
				address_to_pmem_sel = 2;	// right
		end
		
		read_from: begin
			pmem_read = 1;
			writebackmux_sel = 0;
			if (pmem_resp == 1)
			begin
				if (lru_out == 0)
				begin
					tag_left_write = 1;
					data_left_write = 1;
					valid_left_write = 1;
					dirty_left_write = 1;
				end
				else if (lru_out == 1)
				begin
					tag_right_write = 1;
					data_right_write = 1;
					valid_right_write = 1;
					dirty_right_write = 1;
				end
			end
		end
		
		default: $display("state wrong in cache 1");
	endcase
end

always_comb
begin : next_state_logic
	next_state = state;
	case(state)
		ready: begin
			if (hit_left_out == 1 || hit_right_out == 1)
				next_state = ready;
			// when misses happen
			else
			begin // check the dirty bit
				if (lru_out == 0 && dirty_bit_array_left_out == 1)
					next_state = write_to;
				else if (lru_out == 1 && dirty_bit_array_right_out == 1)
					next_state = write_to;
				// dirty bit is 0 and no need to write data from cache back to Pmem
				else
					next_state = read_from;
			end
		end
		
		write_to: begin
			if (pmem_resp == 1)
				next_state = read_from;
			else
				next_state = write_to;
		end
		
		read_from: begin
			if (pmem_resp == 1)
				next_state = ready;
			else
				next_state = read_from;
		end
		
		default: $display("state wrong in cache 2");
			
	endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	state <= next_state;
end

endmodule : cache_control


