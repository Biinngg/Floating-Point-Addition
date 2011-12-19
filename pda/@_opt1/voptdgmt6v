library verilog;
use verilog.vl_types.all;
entity Rounding is
    port(
        clk             : in     vl_logic;
        res             : in     vl_logic;
        shift           : in     vl_logic_vector(27 downto 0);
        incre           : in     vl_logic_vector(8 downto 0);
        exp_result      : out    vl_logic_vector(7 downto 0);
        fra_result      : out    vl_logic_vector(27 downto 0);
        result          : out    vl_logic_vector(31 downto 0);
        overflow        : out    vl_logic
    );
end Rounding;
