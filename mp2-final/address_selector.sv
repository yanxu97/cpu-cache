module address_selector
(
	input [31:0] mem_address,
	output [23:0] tag_bit,
	output [2:0] index_bit,
	output [4:0] offset_bit
);

assign tag_bit = mem_address[31:8];
assign index_bit = mem_address[7:5];
assign offset_bit = mem_address[4:0];

endmodule: address_selector