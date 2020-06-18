module led_test (clk,rst,next_led);
 //input ports
 input clk;//频率50MHZ，周期20ns
 input rst;
 //input [24:0]cnt; 
 
 //output ports
 output [1:0]next_led;
 
 reg[24:0]cnt;
 reg[1:0]rn_led;
 always @(posedge clk or negedge rst)//复位低电平有效
 begin 
 if (rst == 1'b0)begin
  cnt <= 25'b0;
  rn_led <= 2'b00;//rn_led = 00控制led_1亮
  end
 else if(cnt == 12_500_000)begin
  cnt <= 0;
  rn_led <= rn_led + 1;
  end
 else if(cnt < 12_500_000)
  cnt <= cnt + 1;
 else 
  rn_led <= 2'b0;
 end
 
 parameter [1:0]led_1 = 2'b00,
      led_2 = 2'b01,
      led_3 = 2'b10,
      led_4 = 2'b11;
      
 reg[1:0] current_led,next_led;
 
 always @(posedge clk or negedge rst)//复位低电平有效,同一个信号要放在同一个always里赋值
 begin 
 case (current_led)
  led_1:begin 
   if (rn_led == 2'b00)
   next_led <= 2'b00;
   else 
   next_led <= 2'b01;
   end
  led_2:begin
   if (rn_led == 2'b01)
   next_led <= 2'b01;
   else
   next_led <= 2'b10;
   end
  led_3:begin
   if (rn_led == 2'b10)
   next_led <= 2'b10;
   else
   next_led <= 2'b11;
   end
  led_4:begin 
   if (rn_led == 2'b11)
   next_led <= 2'b11;
   else
   next_led <= 2'b00;
   end
  endcase
  end
endmodule