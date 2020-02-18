//-----------------------------------------------------------------------------
//
// Title       : decimator_t2
// Design      : arria5_tst1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\Work_murmansk\Quartus\b072\project\simulation\activehdl\arria5_tst1\src\decimator_t2.v
// Generated   : Wed Dec 12 12:06:54 2018
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
//{module {decimator_t2}}
module decimator_t2 (
	output wire [19:0] out,
	output wire o_valid,
	input wire clk,
	input wire valid,
	input wire [19:0] in
);

parameter dec=2;

reg [19:0] data=0; 
reg reg_out_valid=0;
reg [7:0] sch=0;
reg [7:0] test=0;	

always @(posedge clk)
	if (valid)
		begin
			
		if (sch==0) 
			begin
				test<=test+1;
				data<=in;
			//	data<={test,test};
				reg_out_valid<=1;
			end	else reg_out_valid<=0;			
		if (sch!=(dec-1)) sch<=sch+1; else sch<=0;
			
		end	
		else reg_out_valid<=0;
		
	assign out=data;
	assign o_valid=reg_out_valid;

endmodule
