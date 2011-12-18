library verilog;
use verilog.vl_types.all;
entity Control is
    port(
        clk             : in     vl_logic;
        res             : in     vl_logic;
        exp_diff        : in     vl_logic_vector(8 downto 0);
        big_alu_result  : in     vl_logic_vector(27 downto 0);
        fra_result      : in     vl_logic_vector(27 downto 0);
        shift_right_bits: out    vl_logic_vector(7 downto 0);
        shift_left_bits : out    vl_logic_vector(7 downto 0);
        shift_right_en  : out    vl_logic;
        shift_left_en   : out    vl_logic;
        shift_right_bit : out    vl_logic_vector(7 downto 0);
        incre_bit       : out    vl_logic_vector(7 downto 0);
        decre_bit       : out    vl_logic_vector(7 downto 0);
        incre_en        : out    vl_logic;
        decre_en        : out    vl_logic;
        mux_1_en        : out    vl_logic;
        mux_2_en        : out    vl_logic;
        mux_3_en        : out    vl_logic;
        mux_4_en        : out    vl_logic;
        mux_5_en        : out    vl_logic
    );
end Control;
