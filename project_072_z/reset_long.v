//-----------------------------------------------------------------------------
//
// Title       : reset_long
// Design      : arria5_tst1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\b072\arria5_tst1\src\reset_long.v
// Generated   : Wed Apr 11 10:06:18 2018
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

module reset_long ( clk,en,rst );

parameter delay=20000;

output rst ;
wire rst ;

input clk ;
wire clk ;

input en ;
wire en ;

reg [31:0] sch=0;	
reg rst_reg=1;

always @(posedge clk)
if (en==0)  begin sch<=0; rst_reg<=1; end
else
	begin		
		if (sch<delay)	 begin sch<=sch+1; rst_reg<=0; end else 	rst_reg<=1;
	end
assign rst = rst_reg;	

endmodule
