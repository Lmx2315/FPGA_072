//-----------------------------------------------------------------------------
//
// Title       : error_sch
// Design      : arria5_tst1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\Work_murmansk\Quartus\b072\project\simulation\activehdl\arria5_tst1\src\error_sch.v
// Generated   : Mon Jul 16 15:36:51 2018
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
//{module {error_sch}}
module error_sch (
	output wire [15:0] out,
	input wire clk,
	input wire event_int,
	input wire rst
);

reg [15:0] sch_reg=0;
reg [2:0] front1=0;

always @(posedge clk) front1<={front1[1:0],event_int};

always @(posedge clk)
	if (rst)
		sch_reg<=0; else
	begin
		if (front1[2:0]==3'b001)  sch_reg<=sch_reg+1;		
	end
	
	assign 	out = sch_reg;

endmodule
