//-----------------------------------------------------------------------------
//
// Title       : adc_align
// Design      : list1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\Z1\list1\src\adc_align.v
// Generated   : Mon Nov 26 13:07:07 2018
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
//{module {adc_align}}
module adc1_align (
	output wire [31:0] data_o,
	input wire [4:0] error_rx,
	input wire [4:0] error_disp,
	input wire clk,
	input wire lmfc_edge,
	input wire [31:0] in,
	input wire [4:0] datak,
	input wire [4:0] syncstatus,
	output [3:0] flag_ok,	
	output sync_n,	
	output rst_f,
	input wire rst
);

parameter adc=0;

wire [15:0] data_l0;
wire [15:0] data_l1; 

reg line_sync=0;
reg [1:0] elastic_buf_wr=0;

reg [31:0] dx=0;
reg [31:0] d0=0;
reg [31:0] cdc_datak0=0;
reg [ 3:0] reg_syncstatus0=0;
reg [31:0] timer=0;


reg reg_SYNC_N=0;

reg [7:0] step=0;  

reg [1:0] align_event0=0;
reg [1:0] align_event1=0;	

reg flag_elastic_buf_wr0=0;
reg flag_elastic_buf_wr1=0;
reg [3:0] ok=0;
reg [7:0] error_disp0=0;
reg [7:0] error_char0=0;

reg  error=0;

always @(posedge clk)
begin	

   d0<=in[31:0];

if ((error_rx)||(error_disp)) error<=1; else error<=0;

cdc_datak0<=datak[3:0];
reg_syncstatus0<=syncstatus[3:0];
end


// 	K.28.0   1c	   "R"
//  K.28.3   7c	   "A"
//  K.28.4	 9c	   "Q"
//  K.28.5	 bc	   "K"
//  K.28.7	 fc	   //frame alignment character


always @(posedge clk)
	if (rst)
		begin
			step<=0;	
			reg_SYNC_N<=1;
			timer<=0;
		end 
	else
		if (step==0)
		begin
			if (timer<100000000) timer<=timer+1; else step<=1;	
		end
		else
		if ((step==1)&&(lmfc_edge))
		begin
			elastic_buf_wr<=0;
			align_event0<=0;
			align_event1<=0;
			elastic_buf_wr<=0; 
			line_sync<=0;
			ok<=0;
			flag_elastic_buf_wr1<=0;
			flag_elastic_buf_wr0<=0;
			step<=2;
			reg_SYNC_N<=0;
		
		end
		else		
		if ((step==2)&&(reg_syncstatus0==4'b1111)&&(!error))
		begin
		  if ((d0=={8'hbc,8'hbc,8'hbc,8'hbc})&&(cdc_datak0==4'b1111))
			begin
				step<=3; 				
			end
		end 
		else
		if ((step==3)&&(reg_syncstatus0==4'b1111)&&(!error))
		begin
		  if ((d0=={8'hbc,8'hbc,8'hbc,8'hbc})&&(cdc_datak0==4'b1111))
			begin
				reg_SYNC_N<=1;
				step<=4; 				
			end
		end 
		else
		 if ((step==4)&&(!error))
			begin
				if (flag_elastic_buf_wr0==0)
				begin
				if ((d0[ 7: 0]==8'h1c)&&(cdc_datak0[0]==1)||
					(d0[15: 8]==8'h1c)&&(cdc_datak0[1]==1)) begin elastic_buf_wr[0]<=1; flag_elastic_buf_wr0<=1; end 
				end else elastic_buf_wr[0]<=0;

				if (flag_elastic_buf_wr1==0)
				begin
			    if ((d0[23:16]==8'h1c)&&(cdc_datak0[2]==1)||
			        (d0[31:24]==8'h1c)&&(cdc_datak0[3]==1)) begin elastic_buf_wr[1]<=1; flag_elastic_buf_wr1<=1; end 
				end else elastic_buf_wr[1]<=0;
			   
				if ((flag_elastic_buf_wr1==1)&&(flag_elastic_buf_wr0==1)) step<=5;	
			end			
		else 
		if ((step==5)&&(!error))
			begin			

				if ((d0[ 7: 0]==8'h7c)&&(cdc_datak0[0]==1)) align_event0<=1; else
				if ((d0[15: 8]==8'h7c)&&(cdc_datak0[1]==1)) align_event0<=2;

				if ((d0[23:16]==8'h7c)&&(cdc_datak0[2]==1)) align_event1<=1; else
				if ((d0[31:24]==8'h7c)&&(cdc_datak0[3]==1)) align_event1<=2;
						
				if ((align_event0)&&(align_event1)) 
				begin 
					line_sync<=1; 
					step<=6; 
				end
		
				ok<={align_event1,align_event0};
			
		    end
		    else 
		    if (step==6)
			   begin
				
				if (adc==0) dx<={data_l1[15:8],data_l0[15:8],data_l1[ 7:0],data_l0[ 7:0]};else begin
				if (adc==1) dx<={data_l1[ 7:0],data_l0[ 7:0],data_l1[15:8],data_l0[15:8]};
				end	
				line_sync<=0; 				
			   end			   
	
   assign data_o=dx;
   assign sync_n=reg_SYNC_N;
   assign datak_tst=cdc_datak0;
   assign syncstatus_tst=reg_syncstatus0;
   assign flag_ok=ok;
   assign rst_f=line_sync;

elastic_buffer 
elastic0(
  .clk(clk),
  .reset(rst),
  .wr_data(d0[15: 0]),
  .rd_data(data_l0),
  .ready_n(elastic_buf_wr[0]),
  .do_release_n(line_sync)
);

elastic_buffer 
elastic1(
  .clk(clk),
  .reset(rst),
  .wr_data(d0[31:16]),
  .rd_data(data_l1),
  .ready_n(elastic_buf_wr[1]),
  .do_release_n(line_sync)
);


endmodule
