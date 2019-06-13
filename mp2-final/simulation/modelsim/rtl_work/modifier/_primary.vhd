library verilog;
use verilog.vl_types.all;
entity modifier is
    port(
        sel             : in     vl_logic_vector(2 downto 0);
        align           : in     vl_logic_vector(1 downto 0);
        offset_bit      : in     vl_logic_vector(4 downto 0);
        mem_byte_enable : in     vl_logic_vector(3 downto 0);
        from_cache      : in     vl_logic_vector(255 downto 0);
        data_in         : in     vl_logic_vector(31 downto 0);
        data_modifier_out: out    vl_logic_vector(255 downto 0)
    );
end modifier;
