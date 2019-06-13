library verilog;
use verilog.vl_types.all;
entity cache_control is
    port(
        clk             : in     vl_logic;
        hit_left_out    : in     vl_logic;
        hit_right_out   : in     vl_logic;
        lru_out         : in     vl_logic;
        dirty_bit_array_left_out: in     vl_logic;
        dirty_bit_array_right_out: in     vl_logic;
        tag_left_write  : out    vl_logic;
        tag_right_write : out    vl_logic;
        data_left_write : out    vl_logic;
        data_right_write: out    vl_logic;
        valid_left_write: out    vl_logic;
        valid_right_write: out    vl_logic;
        dirty_left_write: out    vl_logic;
        dirty_right_write: out    vl_logic;
        lru_write       : out    vl_logic;
        writebackmux_sel: out    vl_logic;
        address_to_pmem_sel: out    vl_logic_vector(1 downto 0);
        pmem_resp       : in     vl_logic;
        pmem_write      : out    vl_logic;
        pmem_read       : out    vl_logic;
        mem_read        : in     vl_logic;
        mem_write       : in     vl_logic;
        mem_resp        : out    vl_logic
    );
end cache_control;
