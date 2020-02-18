//-----------------------------------------------------------------------------
//
// Title       : data_world_align
// Design      : list1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\Z1\list1\src\data_world_align.v
// Generated   : Thu Nov 29 10:13:22 2018
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
//{module {data_world_align}}
module line_world_align (
	output wire [1:0] datak,
	output wire [15:0] o, 
	output wire [1:0] align_tst, 
	input wire clk,	 
	input sync_n,
	input rst,
	input wire [15:0] in,
	input wire [1:0] charisk
);	  

reg [15:0] d0=0;
reg [15:0] d1=0;
reg [15:0] dx=0;

reg [1:0] cdc0=0;
reg [1:0] cdc1=0;
reg [1:0] cdcx=0;

reg flag_cgs=0;	
reg [7:0] align=0;

assign datak=cdcx;
assign o = dx;	
assign align_tst=align;

always @(posedge clk)
	begin
		d0<=in;	
		d1<=d0;
		cdc0<=charisk;
		cdc1<=cdc0;
	if (flag_cgs==0)
		begin
		if (align==1) dx  <={d0[ 7:0],d1[15:8]}; else  
		if (align==2) dx  <={d1[ 7:0],d0[15:8]}; else dx<=d1;

		if (align==1) cdcx<={cdc0[0],cdc1[1]};  else  
		if (align==2) cdcx<={cdc1[0],cdc0[1]};  else  cdcx<=cdc1;
		end
	end		  	

always @(posedge clk)
	if (rst)
		begin
			flag_cgs<=0;
			align<=0;
		end	
		else
			if ((!sync_n)&&(flag_cgs==0)&&(align==0))
			begin
				flag_cgs<=1; 			
			end
				else
					if (flag_cgs==1)
					begin
					if (((d1[15:8]==8'hbc)&&(cdc1[1]==1'b1))&&((d1[7:0]==8'hbc)&&(cdc1[0]==1'b1)))	begin align<=0;  flag_cgs<=0; end else
					if (((d1[15:8]==8'hbc)&&(cdc1[1]==1'b1))&&((d1[7:0]!=8'hbc)))					begin align<=1;  flag_cgs<=0; end else 	
					if  ((d1[15:8]!=8'hbc)				    &&((d1[7:0]==8'hbc)&&(cdc1[0]==1'b1)))	begin align<=2;  flag_cgs<=0; end 
					end	
endmodule


