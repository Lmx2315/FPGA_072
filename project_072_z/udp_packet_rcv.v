//-----------------------------------------------------------------------------
//
// Title       : udp_packet_rcv
// Design      : list
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : d:\My_Designs\project\list\src\udp_packet_rcv.v
// Generated   : Mon Mar 11 14:03:46 2019
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
//{module {udp_packet_rcv}}
module udp_packet_rcv ( clk ,sdram_wr ,sdram_rd ,adr_mem ,packet_length ,
data ,mem_adr ,mem_data_to,mem_wr);

output [10:0] mem_adr ;
wire [10:0] mem_adr ;
output [31:0] mem_data_to ;
wire [31:0] mem_data_to ;

output  mem_wr ;
wire    mem_wr ;

input clk ;
wire clk ;
input sdram_wr ;
wire sdram_wr ;
input sdram_rd ;
wire sdram_rd ;
input [15:0] adr_mem ;
wire [15:0] adr_mem ;
input [15:0] packet_length ;
wire [15:0] packet_length ;
input [31:0] data ;
wire [31:0] data ;

reg [15:0] adr_mem_sch=0;
reg [15:0] length_sch=0;   
reg [ 2:0] frnt_WR=0;	
reg [31:0] data_to_mem=0; 
reg reg_mem_wr=0; 

assign 	mem_adr     =  adr_mem_sch;
assign  mem_data_to =  data_to_mem;
assign  mem_wr      =  reg_mem_wr;	 

always @(posedge clk)  frnt_WR<={frnt_WR[1:0],sdram_wr}; 

always @(posedge clk)
	if (frnt_WR==3'b001)
		begin
		length_sch <=packet_length;
//		adr_mem_sch<=adr_mem;
		adr_mem_sch<=0;
		data_to_mem<=data;
		end
	else 
		if (sdram_wr==1)
			begin				
				//if (length_sch!=0)
					begin
					reg_mem_wr<=1;
					length_sch<=length_sch-1;	
					adr_mem_sch<=adr_mem_sch+1;
					data_to_mem<=data;
					end			
			end 
			else 
				begin
				reg_mem_wr <=0;
				adr_mem_sch<=0;
				length_sch <=0;
				end
endmodule
