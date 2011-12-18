library verilog;
use verilog.vl_types.all;
entity Shift_Right is
    port(
        clk             : in     vl_logic;
        res             : in     vl_logic;
        shift           : in     vl_logic_vector(7 downto 0);
        mux             : in     vl_logic_vector(31 downto 0);
        outp            : out    vl_logic_vector(26 downto 0)
    );
end Shift_Right;
