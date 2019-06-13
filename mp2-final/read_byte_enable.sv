module read_byte_enable
(
	input [4:0] offset_bit,
	input [31:0] data_in,
	output logic [31:0] read_byte_enable_out
);

always_comb
begin
	read_byte_enable_out = data_in;
	if (offset_bit[1:0] == 1)
		read_byte_enable_out = data_in>>8;
	else if (offset_bit[1:0] == 2)
		read_byte_enable_out = data_in>>16;
	else if (offset_bit[1:0] == 3)
		read_byte_enable_out = data_in>>24;
end

endmodule : read_byte_enable