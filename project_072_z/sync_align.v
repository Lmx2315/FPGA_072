//-----------------------------------------------------------------------------
//
// Title       : sync_align
// Design      : arria5_tst1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\Work_murmansk\Quartus\b072\project\simulation\activehdl\arria5_tst1\src\sync_align.v
// Generated   : Thu Jun 21 17:13:28 2018
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
//{module {sync_align}}
module sync_align (
	 dout,
	 txdatak,
	 clk,
	 sstatus,
	 data
);

parameter N=16;	   
parameter k=2;


output wire [N-1:0] dout;
output wire [k-1:0] txdatak;
input wire clk;
input wire  sstatus;
input wire [N-1:0] data;

  

reg [N-1:0] data_reg=0; 
reg [k-1:0] datak_reg=0;


always @(posedge clk)
	if (sstatus==0)
		begin
			if (N==16)
			begin
			data_reg<=32'd188; // 	bc
			datak_reg<=1;
			end else
			if (N==32)
			begin
			data_reg<={8'd188,8'd188,8'd188,8'd188}; // 	bc
			datak_reg<=4'b1111;
			end
			
			
		end	 else  
		begin
			data_reg<=data;
			datak_reg<=0;
		end
	
		assign 	dout=data_reg;
		assign 	txdatak=datak_reg;

endmodule
