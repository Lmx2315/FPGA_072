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
module sync_al_tst (
	 dout,
	 txdatak,
	 clk,
	 sstatus,
	 sysref,
	 upr,
	 data
);

parameter N=16;	   
parameter k=2;


output wire [N-1:0] dout;
output wire [k-1:0] txdatak;
input wire clk;	
input wire sysref;
input wire  sstatus;
input wire [N-1:0] data;
input wire [7:0] upr;
  

reg [N-1:0] data_reg=0; 
reg [k-1:0] datak_reg=0;  

reg [3:0] step_faza=0;
reg [7:0] sch_lmfc=0; 
reg [7:0] sch_Mframe=0;
reg flag_lmfc=0;

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
			 if (upr==0)
				 begin
					 data_reg<={8'd188,8'd188,8'd188,8'd188}; // 	bc
			         datak_reg<=4'b1111;
				end else
				 if (upr==1)
				 begin
					 data_reg<={8'd1 ,8'd1 ,8'd1 ,8'd1 }; // 	bc
			         datak_reg<=4'b1111;
				end else 
				 if (upr==2)
				 begin
					 data_reg<={8'd188,8'd188,8'd188,8'd188}; // 	bc
			         datak_reg<=4'b0000;
				end 
				
			end	
			step_faza<=0; 
			sch_Mframe<=0;
		end	 
			else
				if (step_faza==0)
					begin
						data_reg<={8'h1c,8'h1c,8'h1c,8'h1c};  // 	bc
						datak_reg<=4'b1111;
						step_faza<=1;
					end	else
				if (step_faza==1)
					begin
						 if (upr==0)
							 begin
					 			data_reg<=data;  // 	bc
								datak_reg<=4'b0000;	
							 end else
							if (upr==3)
							 begin
					 			data_reg<=data;  // 	bc
								datak_reg<=4'b1111;	
							 end  
					end	
 
//  /R/=/K28.0/=0x1C
//   K character (0xBC)		
//-------------------------LMFC------------------------------------------		
always @(posedge clk)
	if (sysref)	 sch_lmfc<=0; else
	begin
		if (sch_lmfc!=31) sch_lmfc<=sch_lmfc+1; else   sch_lmfc<=0;		
	end
always @(posedge clk) if (sch_lmfc==0)	flag_lmfc<=1; else 	flag_lmfc<=0;	  
	
//-----------------------------------------------------------------------
	
		assign 	dout=data_reg;
		assign 	txdatak=datak_reg;

endmodule
