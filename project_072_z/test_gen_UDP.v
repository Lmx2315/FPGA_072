//-----------------------------------------------------------------------------
//
// Title       : test_gen_UDP
// Design      : list
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : d:\My_Designs\project\list\src\test_gen_UDP.v
// Generated   : Mon Mar 18 13:29:52 2019
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
//{module {test_gen_UDP}}
module test_gen_UDP ( clk ,en ,speed ,send );

output send ;
wire send ;

input clk ;
wire clk ;
input en ;
wire en ;
input [31:0] speed ;
wire [31:0] speed ;

reg [31:0] accum_old=0;
reg [31:0] accum=0;	
reg flag_send=0;

always @(posedge clk)
	if (en)
	begin	   
		
		accum<=accum+speed;	
		accum_old<=accum;
		if (accum_old>accum)  flag_send<=1; else flag_send<=0;
		
	end	else flag_send<=0;

	assign 	send = flag_send;

endmodule
