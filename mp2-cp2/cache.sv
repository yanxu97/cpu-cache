import rv32i_types::*;

module cache
(
    input clk,
	
	//signals between cache and CPU
	input mem_read,
	input mem_write, 
	input [31:0] mem_address,
	input [31:0] mem_wdata,
	input [3:0] mem_byte_enable,
	output mem_resp,
	output [31:0] mem_rdata,
	
	//signals between cache and main memory
    input pmem_resp,
	input [255:0] pmem_rdata,
	output logic [31:0] pmem_address,
	output logic [255:0] pmem_wdata,
	output logic pmem_read,
	output logic pmem_write
);


logic hit_left_out;
logic hit_right_out;
logic dirty_bit_array_left_out;
logic dirty_bit_array_right_out;
logic lru_out;
logic tag_left_write;
logic tag_right_write;
logic data_left_write;
logic data_right_write;
logic valid_left_write;
logic valid_right_write;
logic dirty_left_write;
logic dirty_right_write;
logic lru_write;
logic writebackmux_sel;
logic [1:0] address_to_pmem_sel;
	

cache_control control
(
    .*
);

cache_datapath datapath
(
    .*
);


endmodule : cache