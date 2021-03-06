//跑马灯顶层
module top_module(CLK, RST_n, LED_Out);

input CLK;
input RST_n;
output [3:0]LED_Out;

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

 /**********************************/

 assign LED_Out = { LED3_Out, LED2_Out, LED1_Out, LED0_Out};

 /***********************************/
 

 endmodule