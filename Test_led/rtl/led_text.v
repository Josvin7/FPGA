module led_text
(
	input           clk,           // 50M时钟
	input           rst_n,         // 复位
	output reg[3:0] led            // 输出LED，低电平点亮
);

reg [3:0]      cnt_250ms;
parameter TIME_250MS = 4'd15;//50MHz的晶振，周期为20ns，计数时间为250ms，
                                    //则参数定义计算TIME_250MS = 250*1000000/20 = 12500000
always@(posedge clk or negedge rst_n)begin//250ms计数器，每隔250ms点亮一个灯
	if (rst_n == 1'b0)
		cnt_250ms <= 4'd0;
		
	else if (cnt_250ms == TIME_250MS - 1)  //计数满了清0    
		cnt_250ms <= 4'd0;                     
	else
		cnt_250ms <= cnt_250ms + 4'd1;             
end

always@(posedge clk or negedge rst_n)begin
	if (rst_n == 1'b0)
		led <= 4'b0001;                   
	else if (cnt_250ms == TIME_250MS - 1)      
		led <= {led[2:0],led[3]};	//循环左移 每次把最高位移动到最低位，依次循环，
	else	                            //D4 D3 D2 D1  1110 -> 1101 -> 1011 -> 0111 -> 1110
		led <= led;
end

endmodule
