//-----------------------------------------------------------------------------
//
// Title       : adc_data_rcv
// Design      : arria5_tst1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\Work_murmansk\Quartus\b072\project\simulation\activehdl\arria5_tst1\src\adc_data_rcv.v
// Generated   : Thu Aug  2 11:57:10 2018
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
//{module {adc_data_rcv}}
module adc_data_rcv (
	output wire [63:0] data_o,
	output wire sync_n,
	output wire out_sync_n,
	output wire tst_sync_n,
	output wire [7:0] datak_tst,
	output wire [7:0] syncstatus_tst,
//	input wire  [3:0] rclk ,
	input wire   clk ,
	input wire [63:0] data_in,
	input wire [7:0] datak,	
	input wire [7:0] syncstatus,
//	input wire [7:0] error_link,
	input wire rst

);

 parameter DATA_PATH_WIDTH = 4;

reg [63:0] data_reg =0;	
reg [63:0] d=0;
reg [63:0] d0=0; 
reg [63:0] d1=0;  
reg [63:0] d2=0;
reg [ 7:0] step=0;
reg reg_SYNC_N=0;
reg READY_OK=0;
reg [7:0] reg_datak_tst=0;
reg [7:0] reg_syncstatus_tst=0;

reg [63:0] cdc_data0=0;
reg [63:0] cdc_data1=0;

reg [7:0] cdc_datak0=0;
reg [7:0] cdc_datak1=0;
reg [7:0] reg_syncstatus0=0;
reg [7:0] reg_syncstatus1=0;

reg [15:0] data_rx0=0;
reg [15:0] data_rx1=0;
reg [15:0] data_rx2=0;
reg [15:0] data_rx3=0;
reg [7:0] datak_rclk=0;
reg [7:0] reg_error_link=0;
reg rg_sync0=0;
reg rg_sync1=0;

/*
always @(posedge rclk[0])//posedge rclk[0]
begin

	cdc_data0<=data_in;
	cdc_datak0<=datak;
	reg_syncstatus0<=syncstatus;

end

always @(posedge clk)
begin

cdc_data1<=cdc_data0;
cdc_datak1<=cdc_datak0;
reg_syncstatus1<=reg_syncstatus0;

end
*/	
reg [DATA_PATH_WIDTH-1:0] phy_charisk;//datak
reg [DATA_PATH_WIDTH-1:0] char_is_cgs = 1'b0; 
reg [DATA_PATH_WIDTH-1:0] charisk28 = 4'b0000;
reg [DATA_PATH_WIDTH*8-1:0] phy_data;
wire [7:0] char[0:DATA_PATH_WIDTH-1];

// 	K.28.0   1c	   "R"
//  K.28.3   7c	   "A"
//  K.28.4	 9c	   "Q"
//  K.28.5	 bc	   "K"
//  K.28.7	 fc	   //frame alignment character
/*
genvar i;
generate

for (i = 0; i < 64; i = i + 1) begin: gen_char
  assign char[i] = phy_data[i*8+7:i*8];

  always @(*) begin

    char_is_cgs[i] <= 1'b0;
    charisk28[i] <= 1'b0;

    if (char[i][4:0] == 'd28 && cdc_datak0[i]) begin
      charisk28[i] <= 1'b7;
      if (char[i][7:5] == 'd5) begin
        char_is_cgs[i] <= 1'b1;
      end
    end
  end
end

endgenerate
*/
always @(posedge clk)
begin	
	    d0<=data_in;
cdc_datak0<=datak;
reg_syncstatus0<=syncstatus;
end


always @(posedge clk)
	if (rst)
		begin
		step<=0;	
		reg_SYNC_N<=0;
		rg_sync0<=0;
		rg_sync1<=0;
		READY_OK<=0;
		end 
	else
		if ((step==0)&&(reg_syncstatus0==8'b11111111))
		begin
		  if ((d0=={8'hbc,8'hbc,8'hbc,8'hbc,8'hbc,8'hbc,8'hbc,8'hbc})&&(cdc_datak0==8'b11111111))
			begin
				reg_SYNC_N<=1;
				rg_sync0<=1;
				rg_sync1<=1;
				step<=1;
			end
		end	 
		else 
			if (step==1)
		begin 			

		/*
			d<=d1;
			
			if (cdc_datak0[0]) d1[ 7: 0]<=d[ 7: 0]; else d1[ 7: 0]<=d0[ 7: 0];
			if (cdc_datak0[1]) d1[15: 8]<=d[15: 8]; else d1[15: 8]<=d0[15: 8];
			if (cdc_datak0[2]) d1[23:16]<=d[23:16]; else d1[23:16]<=d0[23:16];
			if (cdc_datak0[3]) d1[31:24]<=d[31:24]; else d1[31:24]<=d0[31:24];
			if (cdc_datak0[4]) d1[39:32]<=d[39:32]; else d1[39:32]<=d0[39:32]; 
			if (cdc_datak0[5]) d1[47:40]<=d[47:40]; else d1[47:40]<=d0[47:40];
			if (cdc_datak0[6]) d1[55:48]<=d[55:48]; else d1[55:48]<=d0[55:48];
			if (cdc_datak0[7]) d1[63:56]<=d[63:56]; else d1[63:56]<=d0[63:56];
		*/

	
		end 
		//{d0[55:48],d0[47:40],d0[63:56],d0[39:32],d0[23:16],d0[15:8],d0[31:24],d0[7:0]};
   assign data_o={d0[47:40],d0[63:56],d0[39:32],d0[55:48],d0[31:24],d0[7:0],d0[23:16],d0[15:8]};	
   assign sync_n=reg_SYNC_N;
   assign out_sync_n=rg_sync0;
   assign tst_sync_n=rg_sync1;
   assign datak_tst=cdc_datak0;
   assign syncstatus_tst=reg_syncstatus0;

endmodule


