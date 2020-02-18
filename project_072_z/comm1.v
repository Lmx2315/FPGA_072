//-----------------------------------------------------------------------------
//
// Title       : comm1
// Design      : arria5_tst1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\Work_murmansk\Quartus\b072\project\simulation\activehdl\arria5_tst1\src\comm1.v
// Generated   : Wed Jul 18 15:32:36 2018
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
//{module {comm1}}
module comm1 (
	output wire [31:0] out,
	input wire clk,
	input wire upr,
	input wire [15:0] in_I,
	input wire [15:0] in_Q,
	input wire [15:0] in_tst
); 

reg [31:0] a=0;

always @(posedge clk)
	begin 		
		if (upr) a<={in_I,in_Q}; else a<={in_tst,in_tst};			
	end
	
	assign out = a;
endmodule
