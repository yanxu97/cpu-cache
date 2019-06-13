library verilog;
use verilog.vl_types.all;
entity read_byte_enable is
    port(
        offset_bit      : in     vl_logic_vector(4 downto 0);
        data_in         : in     vl_logic_vector(31 downto 0);
        read_byte_enable_out: out    vl_logic_vector(31 downto 0)
    );
end read_byte_enable;
