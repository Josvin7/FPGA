/*******************************************************************/
/*
	2019.8.29
	Clover Chen
	Fir filter design..
	Simple clock is 10M.
	Cutoff frequency is 100kHz.
	Quartus II 13.0
*/
/*******************************************************************/

module Test_fir(
	rst_n,
	clk,
	Signal_in,
	Signal_out
);
	input rst_n;
	input clk;								//采样时钟
	input [11:0]Signal_in;				//采样数据输入
	output [28:0]Signal_out;			//滤波输出
		
	wire signed [11:0]Signed_in;		//输入数据转换成有符号数
	assign Signed_in = Signal_in;

//截止频率100k，采样50M
//	parameter coe0 = 12'h000,
//				 coe1 = 12'h023,
//				 coe2 = 12'h0a1,
//				 coe3 = 12'h1a2,
//				 coe4 = 12'h335,
//				 coe5 = 12'h521,
//				 coe6 = 12'h6ea,
//				 coe7 = 12'h7ff;

//截止频率1k，采样时钟20k
	parameter coe0 = 12'h000,
				 coe1 = 12'h00f,
				 coe2 = 12'h05c,
				 coe3 = 12'h126,
				 coe4 = 12'h29c,
				 coe5 = 12'h4a3,
				 coe6 = 12'h6b0,
				 coe7 = 12'h7ff;
	
/*----------------移位寄存器，用来存储采样数据----------------*/	
	reg signed [11:0]In_reg[15:0];
	reg [3:0]i,j;
	always@(posedge clk or negedge rst_n)
	if(!rst_n)begin
		for(i=4'd0;i<15;i=i+1'b1)
			In_reg[i] = 12'd0;
	end
	else begin
		for(j=4'd0;j<15;j=j+1'b1)
			In_reg[j+1] <= In_reg[j];
		In_reg[0] <= Signed_in;
	end

/*----------------将对称系数的输入数据相加----------------*/
	reg signed [12:0]Add_reg[7:0];	//为避免溢出，将两数相加的和扩展一位
//	reg [3:0]k,l;
	always@(posedge clk or negedge rst_n)
	if(!rst_n)begin
		for(i=4'd0;i<8;i=i+1'b1)
			Add_reg[i] = 13'd0;
	end
	else begin
		for(i=4'd0;i<8;i=i+1'b1)
			Add_reg[i] = {In_reg[i][11],In_reg[i]} + {In_reg[15-i][11],In_reg[15-i]};
												//要扩展一位符号位，使三个数长度相同，但其值不变
	end
/*----------------例化有符号数乘法器----------------*/
	wire signed [24:0]Mout[7:0];  
	mult mult0 (
		.clock (clk),
		.dataa (coe0),
		.datab (Add_reg[0]),
		.result (Mout[0])
	);
	
	mult mult1 (
		.clock (clk),
		.dataa (coe1),
		.datab (Add_reg[1]),
		.result (Mout[1])
	);
	
	mult mult2 (
		.clock (clk),
		.dataa (coe2),
		.datab (Add_reg[2]),
		.result (Mout[2])
	);
	
	mult mult3 (
		.clock (clk),
		.dataa (coe3),
		.datab (Add_reg[3]),
		.result (Mout[3])
	);
	
	mult mult4 (
		.clock (clk),
		.dataa (coe4),
		.datab (Add_reg[4]),
		.result (Mout[4])
	);
	
	mult mult5 (
		.clock (clk),
		.dataa (coe5),
		.datab (Add_reg[5]),
		.result (Mout[5])
	);
	
	mult mult6 (
		.clock (clk),
		.dataa (coe6),
		.datab (Add_reg[6]),
		.result (Mout[6])
	);

	mult mult7 (
		.clock (clk),
		.dataa (coe7),
		.datab (Add_reg[7]),
		.result (Mout[7])
	);
	
/*----------------将乘法结果累加----------------*/
	reg signed [28:0]sum;
	reg signed [28:0]yout;
	reg [3:0]m;
	always@(posedge clk or negedge rst_n)
	if(!rst_n)begin
		sum = 29'd0;
		yout <= 29'd0;
	end
	else begin
		yout <= sum;
		sum = 29'd0;
		for(m=4'd0;m<8;m=m+1'b1)
			sum = sum + Mout[m];
	end
	
	assign Signal_out = yout;
	
endmodule
