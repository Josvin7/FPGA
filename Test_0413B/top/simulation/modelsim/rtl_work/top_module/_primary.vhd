library verilog;
use verilog.vl_types.all;
entity top_module is
    port(
        CLK             : in     vl_logic;
        RST_n           : in     vl_logic;
        LED_Out         : out    vl_logic_vector(3 downto 0)
    );
end top_module;
