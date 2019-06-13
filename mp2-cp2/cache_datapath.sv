import rv32i_types::*; /* Import types defined in rv32i_types.sv */

module cache_datapath
(
	input clk,
	
	input [31:0] mem_address,
	input [31:0] mem_wdata,
	input mem_write,
	input [3:0] mem_byte_enable,
	output logic [31:0] mem_rdata,
	
	//communication with Pmemory
	input [255:0] pmem_rdata,
	output logic [31:0] pmem_address,
	output logic [255:0] pmem_wdata,
	
	// input from control
	input tag_left_write,
	input tag_right_write,
	input data_left_write,
	input data_right_write,
	input valid_left_write,
	input valid_right_write,
	input dirty_left_write,
	input dirty_right_write,
	input lru_write,
	input writebackmux_sel,
	input [1:0] address_to_pmem_sel,
	
	// output to  control
	output logic hit_left_out,
	output logic hit_right_out,
	output logic dirty_bit_array_left_out,
	output logic dirty_bit_array_right_out,
	output logic lru_out
	
);


// internal logics
logic [23:0] tag_bit;
logic [2:0] index_bit;
logic [4:0] offset_bit;
logic [23:0] tag_out_left, tag_out_right;
logic valid_bit_array_left_out, valid_bit_array_right_out;
logic [255:0] data_array_left_out, data_array_right_out, datamux_out, writebackmux_out, data_modifier_out; 
logic [31:0] read_data_out;

address_selector address_selector     // do not need a clock
(
	.mem_address(mem_address),
	.tag_bit(tag_bit),
	.index_bit(index_bit),
	.offset_bit(offset_bit)
);

// tag store arrays
array #(.width(24)) tag_array0
(
	.clk,
    .write(tag_left_write),
    .index(index_bit),
    .datain(tag_bit),
    .dataout(tag_out_left)
);

array #(.width(24)) tag_array1
(
	.clk,
    .write(tag_right_write),
    .index(index_bit),
    .datain(tag_bit),
    .dataout(tag_out_right)
);

// data store arrays
array #(.width(256)) data_array0
(
	.clk,
    .write(data_left_write),
    .index(index_bit),
    .datain(writebackmux_out),
    .dataout(data_array_left_out)
);

array #(.width(256)) data_array1
(
	.clk,
    .write(data_right_write),
    .index(index_bit),
    .datain(writebackmux_out),
    .dataout(data_array_right_out)
);

// valid bit arrays
array #(.width(1)) valid_bit_array_left
(
	.clk,
    .write(valid_left_write),
    .index(index_bit),
    .datain(1'b1),
    .dataout(valid_bit_array_left_out)
);

array #(.width(1)) valid_bit_array_right
(
	.clk,
    .write(valid_right_write),
    .index(index_bit),
    .datain(1'b1),
    .dataout(valid_bit_array_right_out)
);

// dirty bit arrays
array #(.width(1)) dirty_bit_array_left
(
	.clk,
    .write(dirty_left_write),
    .index(index_bit),
    .datain(mem_write),
    .dataout(dirty_bit_array_left_out)
);

array #(.width(1)) dirty_bit_array_right
(
	.clk,
    .write(dirty_right_write),
    .index(index_bit),
    .datain(mem_write),
    .dataout(dirty_bit_array_right_out)
);

// check if the tag hits 
hitcomparator hitcomparator
(
	.tag_addr(tag_bit),
	.tag_in_left(tag_out_left),
	.tag_in_right(tag_out_right),
	.valid_in_left(valid_bit_array_left_out),
	.valid_in_right(valid_bit_array_right_out),
	.hit_left_out(hit_left_out),
	.hit_right_out(hit_right_out)
);

datamux datamux
(
	.hit_left(hit_left_out),
	.hit_right(hit_right_out),
	.data_in_left(data_array_left_out),
	.data_in_right(data_array_right_out),
	.datamux_out(datamux_out)
);

// read data to CPU
mux8 read_data
(
	.sel(offset_bit[4:2]),
	.a(datamux_out[31:0]),
	.b(datamux_out[63:32]),
	.c(datamux_out[95:64]),
	.d(datamux_out[127:96]),
	.e(datamux_out[159:128]),
	.f(datamux_out[191:160]),
	.g(datamux_out[223:192]),
	.h(datamux_out[255:224]),
	.out(read_data_out)
);

read_byte_enable read_byte_enable
(
	.offset_bit(offset_bit),
	.data_in(read_data_out),
	.read_byte_enable_out(mem_rdata)
);


// LRU bit array 
array #(.width(1)) lru
(
	.clk,
    .write(lru_write),
    .index(index_bit),
    .datain(hit_left_out), 					// 0-left, 1-right   
    .dataout(lru_out)
);


// modify data into the data array
modifier data_modifier
(
	.sel(offset_bit[4:2]),
	.align(offset_bit[1:0]),
	.mem_byte_enable(mem_byte_enable),
	.from_cache(datamux_out),
	.data_in(mem_wdata),
	.data_modifier_out(data_modifier_out)
);

mux2 #(.width(256)) writebackmux
(
	.sel(writebackmux_sel),
	.a(pmem_rdata),
	.b(data_modifier_out),
	.f(writebackmux_out)
);

//perform the pmem_wdata and pmem_address
mux2 #(.width(256)) data_to_pmem
(
	.sel(lru_out),
	.a(data_array_left_out),
	.b(data_array_right_out),
	.f(pmem_wdata)
);

mux4 #(.width(32)) address_to_pmem
(
	.sel(address_to_pmem_sel),
	.a(mem_address),
	.b({tag_out_left, index_bit, 5'b0}),
	.c({tag_out_right, index_bit, 5'b0}),
	.d(32'b0),
	.f(pmem_address)
);

	
endmodule : cache_datapath