`timescale 1ns/1ns

`define clk_period 20

module led_text_tb();

	reg clk;
	reg rst_n;
	wire [3:0]led;

	led_text   led_text_uo(
	               .clk(clk),
	               .rst_n(rst_n),			
	               .led(led)
	               );
	               
	initial clk= 1;
	always#(`clk_period/2) clk = ~clk;
	
	initial begin
		rst_n = 1'b0;
		#(`clk_period*10) 
		rst_n = 1'b1;
		#(`clk_period*1000) 
		$stop;		
	end
	
endmodule
