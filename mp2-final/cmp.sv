import rv32i_types::*;

module cmp #(parameter width = 32)
(
	input branch_funct3_t cmpop,
	input [width-1:0] a, b,
	output logic br_en
);
//    beq  = 3'b000,
//    bne  = 3'b001,
//    blt  = 3'b100,
//    bge  = 3'b101,
//    bltu = 3'b110,
//    bgeu = 3'b111
always_comb
begin
	if (cmpop == beq)
		br_en = (cmpop == beq && a == b) ? 1'b1 : 1'b0;
	else if (cmpop == bne)
		br_en = (cmpop == bne && a != b) ? 1'b1 : 1'b0;
	else if (cmpop == blt)
		br_en = (cmpop == blt && ($signed(a) < $signed(b))) ? 1'b1 : 1'b0;
	else if (cmpop == bge)
		br_en = (cmpop == bge && ($signed(a) >= $signed(b))) ? 1'b1 : 1'b0;
	else if (cmpop == bltu)
		br_en = (cmpop == bltu && a < b) ? 1'b1 : 1'b0;
	else if (cmpop == bgeu)
		br_en = (cmpop == bgeu && a >= b) ? 1'b1 : 1'b0;
	else
	begin
		br_en = 0;
		$display("cmpop wrong");
	end
end 
endmodule : cmp

