module alu_mux #(parameter width = 32)
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
		f = {a[31:1], 1'b0};;
end

endmodule : alu_mux