`timescale 1ns/1ns

`define clk_period 20


module top_module_tb;

reg CLK;
reg  RST_n;
wire [3:0]LED_Out;

 /*******************************/

 wire LED0_Out;

 led0_module U1
 (
 .CLK( CLK ),
 .RST_n( RST_n ),
 .LED_Out( LED0_Out )
 );

 /*********************************/

 wire LED1_Out;

 led1_module U2
 (
 .CLK( CLK ),
 .RST_n( RST_n ),
 .LED_Out( LED1_Out )
 );

 /*********************************/

 wire LED2_Out;

 led2_module U3
 (
 .CLK( CLK ),
 .RST_n( RST_n ),
 .LED_Out( LED2_Out )
 );

 /*********************************/

 wire LED3_Out;

 led3_module U4
 (
 .CLK( CLK ),
 .RST_n( RST_n ),
 .LED_Out( LED3_Out )
 );
 ////////////////////////////////////////////////////////////////////

	
	initial CLK= 1;
	always#(`clk_period/2) CLK = ~CLK;
	
	initial begin
		RST_n = 1'b0;
		#(`clk_period*10) 
		RST_n = 1'b1;
		#(`clk_period*1000) 
		$stop;		
	end
	
endmodule



	