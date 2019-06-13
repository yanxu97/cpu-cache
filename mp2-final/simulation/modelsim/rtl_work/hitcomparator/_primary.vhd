library verilog;
use verilog.vl_types.all;
entity hitcomparator is
    port(
        tag_addr        : in     vl_logic_vector(23 downto 0);
        tag_in_left     : in     vl_logic_vector(23 downto 0);
        tag_in_right    : in     vl_logic_vector(23 downto 0);
        valid_in_left   : in     vl_logic;
        valid_in_right  : in     vl_logic;
        hit_left_out    : out    vl_logic;
        hit_right_out   : out    vl_logic
    );
end hitcomparator;
