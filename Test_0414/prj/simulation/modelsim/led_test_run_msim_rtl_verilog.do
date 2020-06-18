transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/FPGA_code/Test_0414/rtl {F:/FPGA_code/Test_0414/rtl/led_test.v}

vlog -vlog01compat -work work +incdir+F:/FPGA_code/Test_0414/prj/../testbench {F:/FPGA_code/Test_0414/prj/../testbench/led_test_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  led_test_tb

add wave *
view structure
view signals
run -all
