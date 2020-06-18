module led2_module(CLK, RST_n, LED_Out);

input CLK;
input RST_n;
output LED_Out;

 /*************************************/
//100ms 计数器的常量声明
 parameter T100MS = 21'd2_000_000;

 /*************************************/
//计数器，计数器计数范围为 100ms
 reg [20:0]Count1;

 always @ ( posedge CLK or negedge RST_n )
 if( !RST_n )
 Count1 <= 21'd0;
 else if( Count1 == T100MS )
 Count1 <= 21'd0;
 else
 Count1 <= Count1 + 1'b1;

 /*************************************/
//在时间的第三个 1/4 拉高输出
 reg rLED_Out;

 always @ ( posedge CLK or negedge RST_n )
 if( !RST_n )
 rLED_Out <= 1'b0;
 else if( Count1 >= 21'd1_000_000 && Count1 < 21'd1_500_000 )

 rLED_Out <= 1'b1;
 else
 rLED_Out <= 1'b0;

 /***************************************/

 assign LED_Out = rLED_Out;

 /***************************************/


 endmodule