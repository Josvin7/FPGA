`timescale 1ns/1ns

`define clk_period 20  //常量

module led_test_tb;

	reg clk;
	reg rst_n;
	wire [3:0]led;

	led_test  led_test_uo(
					.clk(clk),
					.rst_n(rst_n),			
					.led(led)
					);
	//初始化
	initial clk= 1;
	//每半个时钟翻转一次     一个时钟周期20ns                             
	always#(`clk_period/2) clk = ~clk;
	
	initial begin
		rst_n = 1'b0;
		#(`clk_period*10) 
		rst_n = 1'b1;
		#(`clk_period*1000) 
		$stop;		
	end
	
endmodule



	