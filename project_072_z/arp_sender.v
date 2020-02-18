//-----------------------------------------------------------------------------
//
// Title       : udp_sender
// Design      : list
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : d:\My_Designs\project\list\src\udp_sender.v
// Generated   : Tue Feb  5 15:49:38 2019
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
//{module {udp_sender}}
module arp_sender ( en,tx_uflow ,tx_septy ,tx_mod ,tx_err ,
	tx_crc_fwd ,tx_wren ,tx_rdy ,tx_eop ,
	tx_sop ,tx_data ,ip_dest ,ip_source ,dest_mac ,mac ,clk,reply,
	type_i,code,identifier,seq_number,identification,mem_data,mem_adr,crc_ICMP,icmp_length,rst_crc
	 );

input [15:0] icmp_length;
input [31:0] crc_ICMP;	 
	 
input  [31:0] mem_data;
output [10:0] mem_adr;	 
	 
input [15:0] identification ;
wire [15:0] identification ;

input [7:0] reply ;
wire [7:0] reply ;

input [7:0] type_i;
wire  [7:0] type_i;

input [7:0] code;
wire  [7:0] code;

input [15:0] identifier;
wire  [15:0] identifier;

input [15:0] seq_number;
wire  [15:0] seq_number;

output rst_crc;

output [1:0] tx_mod ;
wire [1:0] tx_mod ;	//Indicates invalid bytes in the final frame word
output tx_err ;
wire tx_err ;
output tx_crc_fwd ;
wire tx_crc_fwd ;
output tx_wren ;
wire tx_wren ;
output tx_eop ;
wire tx_eop ;
output tx_sop ;
wire tx_sop ;
output [31:0] tx_data ;
wire [31:0] tx_data ;

input en ;
wire en ;
input tx_uflow ;
wire tx_uflow ;
input tx_septy ;
wire tx_septy ;
input tx_rdy ;
wire tx_rdy ;



input [31:0] ip_dest ;
wire [31:0] ip_dest ;
input [31:0] ip_source ;
wire [31:0] ip_source ;
input [47:0] dest_mac ;
wire [47:0] dest_mac ;
input [47:0] mac ;
wire [47:0] mac ;
input clk ;
wire clk ;

reg [15:0] step=0;
reg [31:0] data_reg=0;
reg [31:0] crc_reg=0;

reg [1:0]  tx_mod_reg=0;
reg  tx_sop_reg=0;
reg  tx_eop_reg=0;
reg  tx_wren_reg=0;	
reg [15:0] sch=0;
reg [ 7:0] code_reply=0;
reg [31:0] reg_timer=0;

reg [15:0] lenght_Type=16'h0800; 
reg [ 7:0] Version_IntHiderLengh=8'h45;   
reg [ 7:0] Diff_service=8'h00; 
reg [15:0] Total_length=16'd60;//20 (ip header) + 8 (udp header) +  32 byte data 	= 
reg [15:0] Total_length_z =16'd60;
reg [15:0] Total_length_z2=16'd60;//из за констрейнов ПЛИС делаю копию переменной
reg [15:0] reg_Identification=16'h00;	
reg [15:0] Flags_fragment_offset=16'h4000;	//dont'fragment 
reg [ 7:0] Time_to_live=8'd128;	
reg [ 7:0] Protocol=8'h11;
reg [31:0] temp_Header_crc=0;

reg [31:0] crc0=0;
reg [31:0] crc1=0;
reg [31:0] crc2=0;
reg [31:0] crc3=0;
reg [31:0] crc4=0;
reg [31:0] crc5=0;
reg [31:0] crc_x=0;
reg [31:0] crc_y=0;

reg [31:0] cc0=0;
reg [31:0] cc1=0;
reg [31:0] cc2=0;
reg [31:0] cc3=0;
reg [31:0] cc4=0;
reg [31:0] cc5=0;
reg [31:0] cc_x=0;
reg [31:0] cc_y=0;


reg [15:0] Header_crc=0; 
reg [15:0] Header_crc_temp=0; 
reg [15:0] Length=46;//8 (UDP header) + 38 byte data
reg [31:0] Checksum=0;	  
reg [15:0] ARP_frame_type=16'h0806;
reg [15:0] sch_ident=0;
reg flag_crc=0;

//ICMP
reg [ 7:0] reg_type=0;
reg [ 7:0] reg_code=0;
reg [15:0] reg_identifier=0;
reg [15:0] reg_seq_number=0; 
reg [31:0] reg_message=32'hdeedbeef;
reg [10:0] reg_mem_adr=0;
reg [15:0] reg_icmp_length=0;
reg [ 1:0] reg_mod_eop=0;
reg reg_rst_crc=0;
 
assign 	tx_sop=tx_sop_reg;
assign 	tx_eop=tx_eop_reg;
assign 	tx_wren=tx_wren_reg;
assign  tx_data=data_reg;
assign  tx_mod=tx_mod_reg;
assign  mem_adr = reg_mem_adr;
assign  rst_crc = reg_rst_crc;

always @(posedge clk)
	
	if (en) 
		begin
		step<=0;	
		crc_reg<=0;	
		sch<=0;
		code_reply<=reply;
		reg_type<=type_i;
		reg_code<=code;
		reg_identifier<=identifier;
		reg_seq_number<=seq_number;	
		tx_mod_reg<=0;
		reg_timer<=0;
		sch_ident<=sch_ident+1;
		
		flag_crc<=0;
		
		reg_icmp_length<=icmp_length>>2;
		reg_mod_eop<=icmp_length[1:0]+2'h2;
		reg_mem_adr<=0;
		reg_rst_crc<=0;
		
		Total_length      <=28+icmp_length;
		Total_length_z    <=28+icmp_length;
		crc5              <=28+icmp_length;
		reg_Identification<=sch_ident;//identification
		
		crc0<={Time_to_live,Protocol};
		crc1<= ip_dest[31:16]+ip_dest[15:0];
		crc2<={Version_IntHiderLengh,Diff_service};
		crc3<= sch_ident+Flags_fragment_offset;
		crc4<= ip_source[31:16]+ip_source[15:0];
		
		//-----------------
		cc0<={type_i,code};
		cc1<=identifier+seq_number;
		cc2<=crc_ICMP;
		
		end
	else
	if (reg_timer<1)
	begin
		reg_timer<=reg_timer+1;

		flag_crc<=1;
		
	end 
	else

if (flag_crc==1)
begin	

	if (code_reply==1)//ARP reply
	begin
	if (tx_rdy)
		begin
			
			if (step==0)   //------------------MAC header -----------------------
				begin
				tx_wren_reg<=1;//write enable	
				tx_sop_reg<=1;//start of packet	
				data_reg<={dest_mac[7:0],dest_mac[15:8],dest_mac[23:16],dest_mac[31:24]};
				step<=1;				
				end	else
			if (step==1)
				begin
				tx_sop_reg<=0;//start of packet	
				data_reg<={dest_mac[39:32],dest_mac[47:40],mac[7:0],mac[15:8]};	
				step<=2;
				end	else
			if (step==2)
				begin
				data_reg<={mac[23:16],mac[31:24],mac[39:32],mac[47:40]};	
				step<=3;
				end	else
			if (step==3)               //--------------ARP Header ---------
				begin
				data_reg<={ARP_frame_type,16'h0001};	//
				step<=4;
				end	else
			if (step==4)
				begin
				data_reg<={16'h0800,8'h06,8'h04};	 //
				step<=5;
				end	else  
			if (step==5)
				begin
				data_reg<={16'h0002,mac[47:40],mac[39:32]}; //
				step<=6;	
				end	else
			if (step==6)
				begin
				data_reg<={mac[31:24],mac[23:16],mac[15:8],mac[7:0]};		 //	
				step<=7;
				end	else
			if (step==7)
				begin
				data_reg<={ip_source[31:16],ip_source[15:0]};		 //	
				step<=8;
				end	else
			if (step==8)
				begin
				data_reg<={dest_mac[7:0],dest_mac[15:8],dest_mac[23:16],dest_mac[31:24]};	    //	
				step<=9;
				end	else		
			if (step==9)
				begin
				data_reg<={dest_mac[39:32],dest_mac[47:40],ip_dest[31:24],ip_dest[23:16]};	// 
				step<=10;
				end	else 
			if (step==10)
				begin
				data_reg<={ip_dest[16:0],crc_reg[31:24],crc_reg[23:16]};	//
				step<=11;
				end	else 
			if (step==11) //
				begin
				data_reg<={crc_reg[15:8],crc_reg[7:0],16'h0000};	
				step<=12;
				tx_eop_reg<=1'b1;//end of packet
				end	else
			if (step==12)
				begin 
				tx_wren_reg<=0;//write desable
				tx_eop_reg<=1'b0;
				step<=13;
				end	
		end
	end else
	if (code_reply==2)//ICMP reply
	begin
	if (tx_rdy)
		begin
			Protocol<=1;			
					
			if (step==0)   //------------------MAC header -----------------------
				begin				
				tx_wren_reg<=1;//write enable	
				tx_sop_reg<=1;//start of packet	
				data_reg<={dest_mac[7:0],dest_mac[15:8],dest_mac[23:16],dest_mac[31:24]};
				step<=1;	
				crc_x<=crc5+crc4+crc3;
				crc_y<=crc2+crc1+crc0;	

				cc_x<=cc0+cc1+cc2;
				end	else
			if (step==1)
				begin
				cc_y<=cc_x[15:0]+cc_x[31:16];
				temp_Header_crc<=crc_x+crc_y;
				tx_sop_reg<=0;//start of packet	
				data_reg<={dest_mac[39:32],dest_mac[47:40],mac[7:0],mac[15:8]};	
				step<=2;
				end	else
			if (step==2)
				begin
				Header_crc_temp<=(temp_Header_crc[15:0]+temp_Header_crc[31:16]);
				data_reg<={mac[23:16],mac[31:24],mac[39:32],mac[47:40]};	
				step<=3;
				end	else
			if (step==3)               //--------------IP Header ---------
				begin
				data_reg<={lenght_Type,Version_IntHiderLengh,Diff_service};	//ip header = 2 octet
				step<=4;
				end	else
			if (step==4)
				begin
				data_reg<={Total_length_z,reg_Identification};	 //	 ip header = 4 octet
				step<=5;
				end	else  
			if (step==5)
				begin
				data_reg<={Flags_fragment_offset,Time_to_live,Protocol}; //	 ip header = 4 octet	
				step<=6;	
				Header_crc<=~Header_crc_temp;
				end	else
			if (step==6)
				begin
				data_reg<={Header_crc,ip_source[31:16]};		 //	 ip header = 4 octet
				step<=7;
				end	else
			if (step==7)
				begin
				data_reg<={ip_source[15:0],ip_dest[31:16]};		 //	 ip header = 4 octet
				step<=8;
				Checksum<=~cc_y;
				reg_mem_adr<=10;
				end	else
			if (step==8)
				begin
				data_reg<={ip_dest[15:0],reg_type,reg_code};	    //	 ip header = 2 octet   //----------UDP---------------	udp header =  2 octet 
				step<=9; 
				reg_mem_adr<=11;
				end	else		
			if (step==9)
				begin
				data_reg<={Checksum[15:0],reg_identifier};	// udp header =  4 octet {Checksum[15:0],reg_identifier} 
				step<=10;
				reg_mem_adr<=12;
				end	else 
			if (step==10)
				begin
				data_reg<={reg_seq_number,mem_data[15:0]};	//start data 16'h0000 - rezerv	  udp header =  2 octet 
				step<=11;
				reg_mem_adr<=13;
				end	else 
			if (step==11)
				begin
				if ((reg_mem_adr-13)<(reg_icmp_length-1)) 
					begin
					step<=11;
					data_reg<={mem_data};
					reg_mem_adr<=reg_mem_adr+1;
					end 
						else 
						begin
						step<=19;
						tx_mod_reg<=reg_mod_eop;   //
						tx_eop_reg<=1'b1;//end of packet
						data_reg<={mem_data};
						reg_mem_adr<=reg_mem_adr+1;
						reg_rst_crc<=1;
						end
				end else				
				if (step==19)
				begin
				tx_wren_reg<=0;//write desable
				tx_eop_reg<=1'b0;
				step<=20;
				reg_rst_crc<=0;
				end
		end
	end
end
endmodule




















