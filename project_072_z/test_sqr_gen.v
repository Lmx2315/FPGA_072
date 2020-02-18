//-----------------------------------------------------------------------------
//
// Title       : test_sqr_gen
// Design      : arria5_tst1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\Work_murmansk\Quartus\b072\project\simulation\activehdl\arria5_tst1\src\test_sqr_gen.v
// Generated   : Thu Jul 19 10:15:11 2018
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
//{module {test_sqr_gen}}
module test_sqr_gen (
	output wire [15:0] out,
	input wire clk,
	input wire rst
);

reg [31:0] accum=0;
reg [15:0] front=0;

always @(posedge clk)
	begin
		accum<=accum+100000000;	
	    if (accum[31]==1) front<=16'h0000; else front<=16'h7fff;
	end
 	
	  assign out = 	front;
endmodule
