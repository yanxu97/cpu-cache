library verilog;
use verilog.vl_types.all;
library work;
entity load_byte_mask is
    generic(
        width           : integer := 32
    );
    port(
        ldop            : in     work.rv32i_types.load_funct3_t;
        \in\            : in     vl_logic_vector;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end load_byte_mask;
