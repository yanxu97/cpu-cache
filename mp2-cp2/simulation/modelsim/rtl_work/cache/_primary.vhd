library verilog;
use verilog.vl_types.all;
entity cache is
    port(
        clk             : in     vl_logic;
        mem_read        : in     vl_logic;
        mem_write       : in     vl_logic;
        mem_address     : in     vl_logic_vector(31 downto 0);
        mem_wdata       : in     vl_logic_vector(31 downto 0);
        mem_byte_enable : in     vl_logic_vector(3 downto 0);
        mem_resp        : out    vl_logic;
        mem_rdata       : out    vl_logic_vector(31 downto 0);
        pmem_resp       : in     vl_logic;
        pmem_rdata      : in     vl_logic_vector(255 downto 0);
        pmem_address    : out    vl_logic_vector(31 downto 0);
        pmem_wdata      : out    vl_logic_vector(255 downto 0);
        pmem_read       : out    vl_logic;
        pmem_write      : out    vl_logic
    );
end cache;
