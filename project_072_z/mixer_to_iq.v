//-----------------------------------------------------------------------------
//
// Title       : mixer_to_iq_zero
// Design      : list1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\Z1\list1\src\mixer_to_iq_zero.v
// Generated   : Mon Dec  3 17:00:07 2018
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
//{module {mixer_to_iq_zero}}
module mixer_to_iq (
	output wire  [19:0] o_i,
	output wire  [19:0] o_q,
	input wire clk,
	input wire rst,
	input wire signed [15:0] in,
	input wire signed [17:0] nco_i,
	input wire signed [17:0] nco_q
);

reg signed [15:0] data_in_temp1=0;
reg signed [15:0] data_in_temp2=0;
reg signed [17:0] nco_i_temp=0;
reg signed [17:0] nco_q_temp=0;

reg signed [33:0] r_o_i=0;
reg signed [33:0] r_o_q=0;

wire signed [33:0] mult_out_i;
wire signed [33:0] mult_out_q;

assign mult_out_i = data_in_temp1*nco_i_temp;
assign mult_out_q = data_in_temp2*nco_q_temp;

always @(posedge clk or posedge rst)
	if (rst) 
		begin

		end
	else
		begin
		   data_in_temp1<=in;
		   data_in_temp2<=in;
		   
		   nco_i_temp<=nco_i;
		   nco_q_temp<=nco_q;

			r_o_i<=mult_out_i;
			r_o_q<=mult_out_q;
		end
		
 		assign  o_i=r_o_i[33:14];//09-10-2019
		assign  o_q=r_o_q[33:14];
		
endmodule
