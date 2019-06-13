module datamux
(
	input hit_left,
	input hit_right,
	input [255:0] data_in_left,
	input [255:0] data_in_right,
	output logic [255:0] datamux_out
);
always_comb
begin
	// the output will be all 0s if a miss happens
	datamux_out = 256'b0;
	if (hit_left == 1)
		datamux_out = data_in_left;
	else if (hit_right == 1)
		datamux_out = data_in_right;
end

endmodule : datamux