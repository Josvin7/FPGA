transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/FPGA_code/Test_led/rtl {F:/FPGA_code/Test_led/rtl/led_text.v}

vlog -vlog01compat -work work +incdir+F:/FPGA_code/Test_led/prj/../testbench {F:/FPGA_code/Test_led/prj/../testbench/led_text_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  led_text_tb

add wave *
view structure
view signals
run -all
