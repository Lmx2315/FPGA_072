//-----------------------------------------------------------------------------
//
// Title       : test_gen
// Design      : list
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : d:\My_Designs\project\list\src\test_gen.v
// Generated   : Mon Apr  1 16:15:21 2019
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
//{module {test_gen}}
module test_gen (clk, q ,wr ,clk12 );

output [15:0] q ;
wire [15:0] q ;
output wr ;
wire wr ;

input clk12 ;
wire clk12 ;   

input clk ;
wire clk ;

reg [7:0] accum=0;	
reg wr_reg=0; 

reg [2:0] frnt=0;

always @(posedge clk) frnt<={frnt[1:0],clk12};

assign q  = {accum,accum};
assign wr =	wr_reg;  

always @(posedge clk12)  
	begin
		accum<=accum+1;
	end	

always @(posedge clk) if (frnt==3'b011)  wr_reg<=1; else  wr_reg<=0;
	  	

endmodule
