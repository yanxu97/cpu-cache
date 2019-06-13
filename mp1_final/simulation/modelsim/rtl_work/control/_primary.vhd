library verilog;
use verilog.vl_types.all;
library work;
entity control is
    port(
        clk             : in     vl_logic;
        opcode          : in     work.rv32i_types.rv32i_opcode;
        funct3          : in     vl_logic_vector(2 downto 0);
        funct7          : in     vl_logic_vector(6 downto 0);
        br_en           : in     vl_logic;
        mem_resp        : in     vl_logic;
        load_pc         : out    vl_logic;
        load_ir         : out    vl_logic;
        load_regfile    : out    vl_logic;
        load_mar        : out    vl_logic;
        load_mdr        : out    vl_logic;
        load_data_out   : out    vl_logic;
        pcmux_sel       : out    vl_logic;
        cmpop           : out    work.rv32i_types.branch_funct3_t;
        alumux1_sel     : out    vl_logic;
        alumux2_sel     : out    vl_logic_vector(1 downto 0);
        alumux3_sel     : out    vl_logic_vector(1 downto 0);
        regfilemux_sel  : out    vl_logic_vector(2 downto 0);
        marmux_sel      : out    vl_logic;
        ldop            : out    work.rv32i_types.load_funct3_t;
        cmpmux_sel      : out    vl_logic;
        aluop           : out    work.rv32i_types.alu_ops;
        stop            : out    work.rv32i_types.store_funct3_t;
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        mem_byte_enable : out    vl_logic_vector(3 downto 0)
    );
end control;
