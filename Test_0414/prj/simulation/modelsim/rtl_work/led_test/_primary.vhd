library verilog;
use verilog.vl_types.all;
entity led_test is
    generic(
        led_1           : vl_logic_vector(1 downto 0) := (Hi0, Hi0);
        led_2           : vl_logic_vector(1 downto 0) := (Hi0, Hi1);
        led_3           : vl_logic_vector(1 downto 0) := (Hi1, Hi0);
        led_4           : vl_logic_vector(1 downto 0) := (Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        next_led        : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of led_1 : constant is 2;
    attribute mti_svvh_generic_type of led_2 : constant is 2;
    attribute mti_svvh_generic_type of led_3 : constant is 2;
    attribute mti_svvh_generic_type of led_4 : constant is 2;
end led_test;
