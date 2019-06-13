module mux1_4 #(parameter width = 32)
(
	input sel,
	input [width-1:0] a,
	output logic [width-1:0] f
);

always_comb
begin	
	if (sel == 0)
		f = a;
	else
		f = {a[31:1], 1'b0};
end

endmodule : mux1_4