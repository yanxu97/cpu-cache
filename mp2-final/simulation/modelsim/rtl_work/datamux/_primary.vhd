library verilog;
use verilog.vl_types.all;
entity datamux is
    port(
        hit_left        : in     vl_logic;
        hit_right       : in     vl_logic;
        data_in_left    : in     vl_logic_vector(255 downto 0);
        data_in_right   : in     vl_logic_vector(255 downto 0);
        datamux_out     : out    vl_logic_vector(255 downto 0)
    );
end datamux;
