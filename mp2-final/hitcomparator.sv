module hitcomparator
(
	input [23:0] tag_addr,
	input [23:0] tag_in_left,
	input [23:0] tag_in_right,
	input valid_in_left,
	input valid_in_right,
	output logic hit_left_out,
	output logic hit_right_out
);

always_comb
begin
	hit_left_out = 1'b0;
	hit_right_out = 1'b0;
	if (tag_addr == tag_in_left && valid_in_left == 1'b1)
		hit_left_out = 1'b1;
	else if (tag_addr == tag_in_right && valid_in_right == 1'b1)
		hit_right_out = 1'b1;
end

endmodule : hitcomparator														
