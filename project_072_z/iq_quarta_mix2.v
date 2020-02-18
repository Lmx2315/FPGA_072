											 //-----------------------------------------------------------------------------
//
// Title       : iq_quarta_mix
// Design      : list1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\Z1\list1\src\iq_quarta_mix.v
// Generated   : Thu Oct  4 10:13:40 2018
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
//{module {iq_quarta_mix}}
module iq_quarta_mix2 (
	output wire signed [15:0] io,
	output wire signed [15:0] qo,
	input wire rst,
	input wire clk,
	input wire signed [15:0] i,
	input wire signed [15:0] q
);			

reg signed [7:0] ik [3:0];
reg signed [7:0] qk [3:0]; 
reg [1:0] index;	 

reg signed [15:0] iz;
reg signed [15:0] qz;

always @(posedge clk)
if (rst) 
	begin
		ik[0]<= 1;
		ik[1]<= 0;
		ik[2]<=-1;
		ik[3]<= 0;
			
		qk[0]<= 0;
		qk[1]<=-1;
		qk[2]<= 0;
		qk[3]<= 1;
		
		index<=0;
	end	 
else
begin
index<=index+1;
   
iz<=i*ik[index];
qz<=q*qk[index];
	
end

assign io=iz;
assign qo=qz;

endmodule
