module led_test(
     input clk,
	  input rst_n,
     output reg [3:0] led
     );
   reg [3:0] counters;
   reg [3:0] state;
	
	   parameter//localparam
		CHECK_led0	= 4'b0001,
		CHECK_led1 	= 4'b0010,
		CHECK_led2	= 4'b0100,
		CHECK_led3	= 4'b1000;
	
	
 always@(posedge clk or negedge rst_n)
 begin
     if(!rst_n)  begin
     counters<=4'd0;
     led<=4'b0000;
     state<=CHECK_led0;
     end

     else  begin
       case(state)
           CHECK_led0:begin                        //第一个灯亮
                led<=4'b0001;
                if(counters==4'd15)begin        //20ns  
					     state<=CHECK_led1;
                    counters<=0;
                end    
                else 
                counters<=counters+1;
                
           end
           CHECK_led1:begin                       //第二个灯亮
                led<=4'b0010;
                 if(counters==4'd15)begin          
					     state<=CHECK_led2;
                    counters<=0;
                end    
                else 
                counters<=counters+1;
           end
           CHECK_led2:begin                    //第三个灯亮
                led<=4'b0100;
                 if(counters==4'd15)begin          
					     state<=CHECK_led3;
                    counters<=0;
                end    
                else 
                counters<=counters+1;
           end
           CHECK_led3:begin                    //第四个灯亮
                led<=4'b1000;
                 if(counters==4'd15)begin          
					     state<=CHECK_led0;
                    counters<=0;
                end    
                else 
                counters<=counters+1;
           end
           default: state<=CHECK_led0;
       endcase
	  end
 end
endmodule
