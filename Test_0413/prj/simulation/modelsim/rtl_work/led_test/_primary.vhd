library verilog;
use verilog.vl_types.all;
entity led_test is
    generic(
        CHECK_led0      : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        CHECK_led1      : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        CHECK_led2      : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        CHECK_led3      : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        led             : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CHECK_led0 : constant is 1;
    attribute mti_svvh_generic_type of CHECK_led1 : constant is 1;
    attribute mti_svvh_generic_type of CHECK_led2 : constant is 1;
    attribute mti_svvh_generic_type of CHECK_led3 : constant is 1;
end led_test;
