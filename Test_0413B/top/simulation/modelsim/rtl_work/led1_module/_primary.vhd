library verilog;
use verilog.vl_types.all;
entity led1_module is
    generic(
        T100MS          : vl_logic_vector(0 to 20) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        CLK             : in     vl_logic;
        RST_n           : in     vl_logic;
        LED_Out         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of T100MS : constant is 1;
end led1_module;
