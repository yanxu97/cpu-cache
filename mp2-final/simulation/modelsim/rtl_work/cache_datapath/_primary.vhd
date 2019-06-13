library verilog;
use verilog.vl_types.all;
entity cache_datapath is
    port(
        clk             : in     vl_logic;
        mem_address     : in     vl_logic_vector(31 downto 0);
        mem_wdata       : in     vl_logic_vector(31 downto 0);
        mem_write       : in     vl_logic;
        mem_byte_enable : in     vl_logic_vector(3 downto 0);
        mem_rdata       : out    vl_logic_vector(31 downto 0);
        pmem_rdata      : in     vl_logic_vector(255 downto 0);
        pmem_address    : out    vl_logic_vector(31 downto 0);
        pmem_wdata      : out    vl_logic_vector(255 downto 0);
        tag_left_write  : in     vl_logic;
        tag_right_write : in     vl_logic;
        data_left_write : in     vl_logic;
        data_right_write: in     vl_logic;
        valid_left_write: in     vl_logic;
        valid_right_write: in     vl_logic;
        dirty_left_write: in     vl_logic;
        dirty_right_write: in     vl_logic;
        lru_write       : in     vl_logic;
        writebackmux_sel: in     vl_logic;
        address_to_pmem_sel: in     vl_logic_vector(1 downto 0);
        hit_left_out    : out    vl_logic;
        hit_right_out   : out    vl_logic;
        dirty_bit_array_left_out: out    vl_logic;
        dirty_bit_array_right_out: out    vl_logic;
        lru_out         : out    vl_logic
    );
end cache_datapath;
