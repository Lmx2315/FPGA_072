//-----------------------------------------------------------------------------
//
// Title       : tst_writer
// Design      : list
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : d:\My_Designs\project\list\src\tst_writer.v
// Generated   : Wed Apr 17 15:09:29 2019
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
//{module {tst_writer}}
module tst_writer ( en,clk ,d ,adr ,w );

output [31:0] d ;
wire   [31:0] d ;
output [24:0] adr ;
wire   [24:0] adr ;
output w ;
wire   w ; 

input en;

input clk ;
wire  clk ;

reg [31:0] timer_sch=0;
reg [31:0] adr_reg  =0;
reg [31:0] data_reg =0;
reg [ 7:0] step=0;	 
reg wr_reg=0;  

assign d   = data_reg;
assign adr = adr_reg[24:0];
assign w   = wr_reg;

always @(posedge clk)
	begin
		if (timer_sch<1250000) timer_sch<=timer_sch+1; 
		else 
			if (en)
			begin			
				if ((adr_reg<32'h1ffffff)&&(step==0)) 
					begin
						adr_reg <=adr_reg+2;
						data_reg<={7'b0000000,adr_reg};
				//		data_reg<=32'habcd1234;
						wr_reg<=1;
						step<=1;
					end	 else
					if (step==1)
						begin
						wr_reg<=0;
						step<=0;							
						end			
			end	
	end
	


endmodule
