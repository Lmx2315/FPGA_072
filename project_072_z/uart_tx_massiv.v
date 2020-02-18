//-----------------------------------------------------------------------------
//
// Title       : uart_tx_massiv
// Design      : list1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\Z1\list1\src\uart_tx_massiv.v
// Generated   : Fri Oct  5 10:50:35 2018
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {uart_tx_massiv}}	 
`define N_BUF 1024 
`define CODE_START 8'h23 
`define CODE_1 8'h0A
`define CODE_2 8'h3A

module uart_tx_massiv (
	output wire tx,
	output wire fifo_wr_en, 
	output wire fifo_rd_en,
	input wire clk,
	input wire [15:0] in,
	input wire rst,
	input wire fifo_full
);
reg [15:0] data=0;
reg fifo_rd=0;
reg fifo_wr=0;
reg ready_reg=0;
reg [7:0] step=0;	
reg [15:0] sch=0;
reg odd=0; 
reg [7:0] data_uart=0; 

reg flag_tr=0;
reg start_reg=0;
reg fifo_flag1=0;
wire ready_tx;

reg [2:0] frnt2_flag=0;
reg [2:0] frnt1_flag=0;
reg flag_fifo_rd=0;	 
reg flag_fifo_wr=0;	 
reg [15:0] crc_reg=0;


reg [31:0] timer_sch=0;	  
reg flag_timer=0;

always @(posedge clk)
	begin
	if (fifo_flag1==1) 
		begin
			 timer_sch <=0;			
		     flag_timer<=0;			
		end	
	else 
		begin		 
			if (timer_sch!=2400000) timer_sch<=timer_sch+1; else flag_timer<=1;
			end
	end
	
always @(posedge clk)
	begin
	if ((fifo_full==1)&&(step==0)) fifo_flag1<=1;
		else fifo_flag1<=0;			
	end
	

always @(posedge clk)
if (rst)
	begin
		fifo_rd<=0;
		fifo_wr<=1;
		data<=0;
		step<=0;
		sch<=0;
		odd<=0;
		data_uart<=0;  
		start_reg<=0;
		flag_tr<=0;	
		crc_reg<=0;
	end	else
if (fifo_flag1==1)
	begin
	fifo_wr<=0;	
	step<=1;
	sch<=0;
	odd<=0;	
	flag_tr<=0;
	crc_reg<=0;
	end	else
if ((flag_tr==0)&&(flag_timer))
begin 
	start_reg<=0;
	
		if (step==1)	//start uart transmit
			begin
				data_uart<=`CODE_START; //code  8'h23 - #
				step<=2;
				flag_tr<=1;
			end else
	    if (step==2)
				begin
				data_uart<=`CODE_1; //code  8'h0a - #
				step<=3;
				flag_tr<=1;
			end else 
		if (step==3)
				begin
				data_uart<=`CODE_2; //code  8'h3a - #
				step<=4;
				flag_tr<=1;
			end else
		if (step==4)//data transmit
			begin
				
				odd<=odd+1; 
				flag_tr<=1;
				
				if (odd==0) 
					begin
						data_uart<=in[15:8]; 
					end
				else
					begin 
						fifo_rd<=1;	
						crc_reg<=crc_reg+in;
						data_uart<=in[7:0];
						if (sch!=`N_BUF) sch<=sch+1; 
						else
							begin
							   step<=5;
							  // fifo_wr<=1;
							end								
					end						
			end
			else 
				if (step==5)
					begin
					data_uart<=crc_reg[15:8];	
					flag_tr<=1;
					step<=6;
					end
				else
					if (step==6)
						begin
						data_uart<=crc_reg[7:0];	
						flag_tr<=1;
						step<=7;
						end
					else
						if (step==7) 
							begin
								fifo_wr<=1;
								step=0;
							end
end else
begin
	fifo_rd<=0;
	if ((ready_tx==1)&&(start_reg==0))
		begin
			start_reg<=1;
			flag_tr<=0;
		end	 	
end




assign 	fifo_wr_en=fifo_wr;
assign 	fifo_rd_en=fifo_rd;

   

uart_tx
tx1
(
.clk(clk), 
.data(data_uart), 
.start(start_reg), 
.tx(tx), 
.ready(ready_tx)
);

endmodule