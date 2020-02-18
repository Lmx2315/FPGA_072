//-----------------------------------------------------------------------------
//
// Title       : fifo_2clk
// Design      : arria5_tst1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\Work_murmansk\Quartus\b072\project\simulation\activehdl\arria5_tst1\src\fifo_2clk.v
// Generated   : Fri Aug  3 17:20:42 2018
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
//{module {fifo_2clk}}
module fifo_2clk (
	output wire [63:0] data_tst1,
	output wire [63:0] data_tst2,
	input wire clk2x,
	input wire clk1x,
	input wire en_tst,
	input wire [63:0] datain,  
	input rst,
	output [15:0] adc0,
	output [15:0] adc1
);

reg [15:0] sch=0;

reg [31:0] reg_o=0;	
reg [31:0] reg_adc0=0;	 
reg [31:0] reg_adc1=0;	

reg [63:0] reg_tst_adc0=0;	 
reg [63:0] reg_tst_adc1=0;	

reg [15:0] adc0_data=0;
reg [15:0] adc1_data=0;

reg k=0;


always @(posedge clk1x)
	begin		
		reg_adc0<=datain[31:0];
		reg_adc1<=datain[63:32];

		if (en_tst)
		begin
		reg_tst_adc0<=datain;
		reg_tst_adc1<=reg_tst_adc0;	
		end
	end					 
 
always @(posedge clk2x)	
	if (rst) k<=0; 
	else
	begin
	if (k==0)
		begin
		adc0_data<=reg_adc0[15:0]; 
		adc1_data<=reg_adc1[15:0];
		end
	else
		begin
		adc0_data<=reg_adc0[31:16];
		adc1_data<=reg_adc1[31:16];
		end		
	k<=k+1;
	sch<=sch+1;
	end		
	   
	assign 	data_tst1=reg_tst_adc0;
	assign 	data_tst2=reg_tst_adc1;

	assign  adc0=adc0_data;
	assign  adc1=adc1_data;
	
//	assign  adc0=sch;
//	assign  adc1=sch;
	
endmodule
