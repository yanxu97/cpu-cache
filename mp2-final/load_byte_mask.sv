import rv32i_types::*;

module load_byte_mask #(parameter width = 32)
(
	input load_funct3_t ldop, // load operator
	input [width-1:0] in,
	output logic [width-1:0] out
);
//    lb  = 3'b000,     singed byte
//    lh  = 3'b001,		signed two-byte
//    lw  = 3'b010,		four byte
//    lbu = 3'b100,		unsigned byte
//    lhu = 3'b101,		unsigned two byte
always_comb
begin
	if (ldop == lb)
		out = {{24{in[7]}}, in[7:0]};
	else if (ldop == lh)
		out = {{16{in[15]}}, in[15:0]};
	else if (ldop == lbu)
		out = {24'b0, in[7:0]};
	else if (ldop == lhu)
		out = {16'b0, in[15:0]};
	else
	begin
		out = in;
		$display("ldop wrong");
	end
end 
endmodule : load_byte_mask

