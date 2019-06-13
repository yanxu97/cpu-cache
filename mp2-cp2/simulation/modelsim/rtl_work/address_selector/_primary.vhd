library verilog;
use verilog.vl_types.all;
entity address_selector is
    port(
        mem_address     : in     vl_logic_vector(31 downto 0);
        tag_bit         : out    vl_logic_vector(23 downto 0);
        index_bit       : out    vl_logic_vector(2 downto 0);
        offset_bit      : out    vl_logic_vector(4 downto 0)
    );
end address_selector;
