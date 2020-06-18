library verilog;
use verilog.vl_types.all;
entity led_text is
    generic(
        TIME_250MS      : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        led             : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of TIME_250MS : constant is 1;
end led_text;
