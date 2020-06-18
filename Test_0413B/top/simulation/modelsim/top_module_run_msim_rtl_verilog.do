transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/FPGA_code/Test_0413B/rtl {F:/FPGA_code/Test_0413B/rtl/led3_module.v}
vlog -vlog01compat -work work +incdir+F:/FPGA_code/Test_0413B/rtl {F:/FPGA_code/Test_0413B/rtl/led2_module.v}
vlog -vlog01compat -work work +incdir+F:/FPGA_code/Test_0413B/rtl {F:/FPGA_code/Test_0413B/rtl/led1_module.v}
vlog -vlog01compat -work work +incdir+F:/FPGA_code/Test_0413B/rtl {F:/FPGA_code/Test_0413B/rtl/led0_module.v}
vlog -vlog01compat -work work +incdir+F:/FPGA_code/Test_0413B/rtl {F:/FPGA_code/Test_0413B/rtl/top_module.v}

vlog -vlog01compat -work work +incdir+F:/FPGA_code/Test_0413B/top/../testbench {F:/FPGA_code/Test_0413B/top/../testbench/top_module_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  top_module_tb

add wave *
view structure
view signals
run -all
