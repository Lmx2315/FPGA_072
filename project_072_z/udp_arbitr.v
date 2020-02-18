//-----------------------------------------------------------------------------
//
// Title       : udp_arbitr
// Design      : list
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : d:\My_Designs\project\list\src\udp_arbitr.v
// Generated   : Thu Mar 14 17:27:33 2019
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
//{module {udp_arbitr}}
module udp_arbitr ( clk ,tx_rdy,en_arp ,en_udp1,tx_mod1 ,tx_wren1 ,tx_eop1 ,tx_sop1 ,tx_data1,tx_rdy1,tx_mod2 ,tx_wren2 ,tx_eop2 ,tx_sop2 ,tx_data2,tx_rdy2 ,tx_wren ,tx_mod ,tx_eop,tx_sop ,tx_data );

output tx_wren ;
wire tx_wren ;
output [1:0] tx_mod ;
wire [1:0] tx_mod ;
output tx_eop ;
wire tx_eop ;  
output tx_sop ;
wire tx_sop ; 
output [31:0] tx_data ;
wire [31:0] tx_data ;

input clk ;
wire clk ; 

//-----c MAC ядра--------
input tx_rdy;

//-----от блоков сообщений

output tx_rdy1;				//ARP+ICMP
input [1:0] tx_mod1 ;
wire [1:0] tx_mod1 ;
input tx_wren1 ;
wire tx_wren1 ;
input tx_eop1 ;
wire tx_eop1 ;
input tx_sop1 ;
wire tx_sop1 ;
input [31:0] tx_data1 ;
wire [31:0] tx_data1 ; 
input en_arp;

output tx_rdy2;			   //UDP1
input [1:0] tx_mod2 ;
wire [1:0] tx_mod2 ;
input tx_wren2 ;
wire tx_wren2 ;
input tx_eop2 ;
wire tx_eop2 ;
input tx_sop2 ;
wire tx_sop2 ;
input [31:0] tx_data2 ;
wire [31:0] tx_data2 ; 
input en_udp1;

reg FLAG_arp =0;
reg FLAG_udp1=0;
reg [1:0] FLAG_arp_process =0;	 
reg [1:0] FLAG_udp1_process=0;

reg [1:0]   tx_mod_reg=0;
reg        tx_wren_reg=0;
reg         tx_eop_reg=0;
reg         tx_sop_reg=0;
reg [31:0] tx_data_reg=0;
reg        tx1_rdy_reg=0;
reg        tx2_rdy_reg=0; 

assign tx_wren = tx_wren_reg;
assign tx_mod  = tx_mod_reg;
assign tx_eop  = tx_eop_reg;
assign tx_sop  = tx_sop_reg;
assign tx_data = tx_data_reg;
assign tx_rdy1 = tx1_rdy_reg;
assign tx_rdy2 = tx2_rdy_reg;

always @(posedge clk)
	begin
  
	if ((en_arp)&&(FLAG_arp==0)&&(FLAG_udp1==0)) FLAG_arp <=1; 
	else if (FLAG_arp) 
		begin
			if (FLAG_arp_process ==2) FLAG_arp  <=0;  
		end
	
	if ((en_udp1)&&(FLAG_arp==0)&&(FLAG_udp1==0)) FLAG_udp1<=1; 
	else if (FLAG_udp1)
		begin
			if (FLAG_udp1_process==2) FLAG_udp1 <=0;				
		end
	
			
	if (FLAG_arp)
		begin
			if (tx_wren1) FLAG_arp_process<=1; //начало процесса обработки пачки 
			else 
				if ((tx_wren1==0)&&(FLAG_arp_process==1))FLAG_arp_process<=2; //конец  процесса обработки пачки 
				
			tx_mod_reg <=tx_mod1;
			tx_wren_reg<=tx_wren1;
			tx_eop_reg <=tx_eop1;
			tx_sop_reg <=tx_sop1;
			tx_data_reg<=tx_data1;
			tx1_rdy_reg<=tx_rdy; 
			
		end else
	 if (FLAG_udp1)
		begin  
			if (tx_wren2) FLAG_udp1_process<=1; //начало процесса обработки пачки 
			else 
				if ((tx_wren2==0)&&(FLAG_udp1_process==1))FLAG_udp1_process<=2; //конец  процесса обработки пачки 
			
			tx_mod_reg <=tx_mod2;
			tx_wren_reg<=tx_wren2;
			tx_eop_reg <=tx_eop2;
			tx_sop_reg <=tx_sop2;
			tx_data_reg<=tx_data2;	
			tx2_rdy_reg<=tx_rdy; 

		end	
			else
				begin				
				tx_data_reg<=0;
				tx_sop_reg <=0;
				tx_eop_reg <=0;
				tx_mod_reg <=0;
				tx_wren_reg<=0;
				tx1_rdy_reg<=0; 
				tx2_rdy_reg<=0;
				FLAG_arp_process <=0;	
				FLAG_udp1_process<=0;	
				end		
		
	end	 

endmodule
