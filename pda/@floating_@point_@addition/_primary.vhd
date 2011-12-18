library verilog;
use verilog.vl_types.all;
entity Floating_Point_Addition is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        x               : in     vl_logic_vector(31 downto 0);
        y               : in     vl_logic_vector(31 downto 0)
    );
end Floating_Point_Addition;
