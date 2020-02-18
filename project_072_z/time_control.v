//-----------------------------------------------------------------------------
//
// Title       : time_control
// Design      : list
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : d:\My_Designs\project\list\src\time_control.v
// Generated   : Tue Apr  9 09:45:00 2019
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
//{module {time_control}}
module time_control ( clk12 ,clk ,rst ,clr ,nbuf ,q );

output [31:0] q ;
wire [31:0] q ;

input clk12 ;
wire clk12 ;
input clk ;
wire clk ;
input rst ;
wire rst ;
input clr ;
wire clr ;
input [15:0] nbuf ;
wire [15:0] nbuf ;

reg [ 2:0] frnt=0;
reg [31:0] accum=0;	 
reg [15:0] reg_nbuf=0;
reg [31:0] sch=0;

assign q=accum;	  


always @(posedge clk) frnt    <={frnt[1:0],clk12};
always @(posedge clk) reg_nbuf<={2'b00,nbuf[15:2]};	
	
always @(posedge clk)
	if (rst|clr)
		begin
		accum<=0;		
		end
	else
	begin	
	if (frnt==3'b011)
		begin
		if (sch!=reg_nbuf) sch<=sch+1;
		else
			begin
			sch<=0;
			accum<=accum+1;
			end				
		end	
	end
		
		

endmodule
