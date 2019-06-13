import rv32i_types::*;

module mp2
(
    input clk,
    input pmem_resp,
	input [255:0] pmem_rdata,
	output pmem_read,
	output pmem_write,
	output [31:0] pmem_address,
	output [255:0] pmem_wdata
);
// signals between cpu datapath and cache
logic [31:0] mem_address;
logic [31:0] mem_rdata;
logic [31:0] mem_wdata;
logic mem_read;
logic mem_write;
logic [3:0] mem_byte_enable;
logic mem_resp;

/* Instantiate MP 2 top level blocks here */
cpu cpu
(
    .*
);

cache cache
(
    .*
);

endmodule : mp2
