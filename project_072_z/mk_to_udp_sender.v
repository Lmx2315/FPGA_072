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
module mk_to_udp_sender ( en,tx_uflow ,tx_septy ,tx_mod ,tx_err ,
					tx_crc_fwd ,tx_wren ,tx_rdy ,tx_eop ,
					tx_sop ,tx_data ,port_dest ,port_source ,ip_dest ,
					ip_source ,dest_mac ,mac ,clk ,mem_data,mem_adr_rd,
					mem_length,crc_data,END_TX);

 
output END_TX ;
wire END_TX ;

input  [31:0] crc_data;					
input  [31:0] mem_data;
output [10:0] mem_adr_rd;
input  [15:0] mem_length;
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
input [15:0] port_dest ;
wire [15:0] port_dest ;
input [15:0] port_source ;
wire [15:0] port_source ;
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

reg [15:0] step=1000;
reg [31:0] data_reg=0;
reg [31:0] crc_reg=0;

reg [1:0]  tx_mod_reg=0;
reg  tx_sop_reg=0;
reg  tx_eop_reg=0;
reg  tx_wren_reg=0;	
reg [15:0] sch=0;

reg [15:0] lenght_Type=16'h0800; 
reg [ 7:0] Version_IntHiderLengh=8'h45;   
reg [ 7:0] Diff_service=8'h00; 
reg [15:0] Total_length=16'd28;//20 (ip header) + 8 (udp header) + whithout 38 byte data of data	= 
reg [15:0] Identification=16'h00;	
reg [15:0] reg_Identification=16'h00;
reg [15:0] Flags_fragment_offset=0;	 
reg [ 7:0] Time_to_live=8'd64;	
reg [ 7:0] Protocol=8'h11;
reg [31:0] temp_Header_crc=0;
reg [15:0] Header_crc=0; 
reg [15:0] Length=46;//8 (UDP header) + 38 byte data
reg [31:0] Temp1_udp_checksum=0;
reg [31:0] Temp2_udp_checksum=0;
reg [15:0] Checksum=0;
reg [15:0] sch_ident=0;	
reg [15:0] z_length=0; 

reg END_TX_reg=0;

wire  [31:0] wire_Temp1_udp_checksum;
wire  [31:0] wire_Temp2_udp_checksum;
wire  [15:0] wire_Checksum;
wire  [15:0] wire_Header_crc; 
reg   [31:0] temp_mem_data;
reg   [ 1:0] mod_reg=0;

assign wire_Temp1_udp_checksum=(ip_source[31:16]+ip_source[15:0]+ip_dest[31:16]+ip_dest[15:0]+{8'h00,Protocol});
assign wire_Temp2_udp_checksum=(Temp1_udp_checksum+Length+port_dest+port_source+Length+crc_data);
assign wire_Checksum          =~(Temp2_udp_checksum[15:0]+Temp2_udp_checksum[31:16]);
assign wire_Header_crc        =(~(temp_Header_crc[15:0]+temp_Header_crc[31:16]))-1;

assign tx_sop=tx_sop_reg;
assign tx_eop=tx_eop_reg;
assign tx_wren=tx_wren_reg;
assign tx_data=data_reg;
assign tx_mod=tx_mod_reg; 

assign mem_adr_rd=sch;	
assign END_TX = END_TX_reg;

always @(posedge clk)
	
	if (en) 
		begin
		step<=0;	
		crc_reg<=0;	
		sch<=0;
		sch_ident<=sch_ident+1;
		reg_Identification<=sch_ident;//identification
		Length<=(mem_length+8+2);//8 - байт из заголовка UDP пакета 4 - число байт последнего CRC
		Total_length<=20+8+(mem_length+2);
		temp_Header_crc<={Version_IntHiderLengh,Diff_service}+Total_length+reg_Identification+Flags_fragment_offset+{Time_to_live,Protocol}+
		ip_source[31:16]+ip_source[15:0]+ip_dest[31:16]+ip_dest[15:0];
		z_length<=mem_length;
		mod_reg <=(~mem_length[1:0])+1'b1;//формирую остаток от числа скачиваемых байт для мас-а
		END_TX_reg<=0;
		end
	else
if (tx_rdy)
	begin
		
		if (step==0)   //------------------MAC header -----------------------
			begin
			z_length<=z_length>>2;	//переводим 
			tx_wren_reg<=1;			//write enable	
			tx_sop_reg<=1;			//start of packet	
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
		if (step==3)               //--------------IP Header ---------
			begin
			data_reg<={lenght_Type,Version_IntHiderLengh,Diff_service};	//ip header = 2 octet
			step<=4;
			end	else
		if (step==4)
			begin
			data_reg<={Total_length,reg_Identification};	 //	 ip header = 4 octet
			step<=5;
			end	else  
		if (step==5)
			begin
			data_reg<={Flags_fragment_offset,Time_to_live,Protocol}; //	 ip header = 4 octet	
			step<=6;
			Header_crc<=wire_Header_crc;	
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
			Temp1_udp_checksum<=wire_Temp1_udp_checksum;
			end	else
		if (step==8)
			begin
			data_reg<={ip_dest[15:0],port_source};	    //	 ip header = 2 octet   //----------UDP---------------	udp header =  2 octet 
			step<=9;
			Temp2_udp_checksum<=wire_Temp2_udp_checksum;//Length - два раза считается
			sch<=1;
			end	else		
		if (step==9)
			begin
			data_reg<={port_dest,Length};	// udp header =  4 octet 
			step<=10;		
			Checksum<=wire_Checksum;
			sch<=2;
			end	else 
		if (step==10)
			begin
			data_reg<={Checksum,mem_data[31:16]};	//start data 8'h00 - rezerv	 channel - номер канала udp header =  2 octet + 2 
			temp_mem_data<=mem_data;
			step<=11;
			sch<=3;
			if (mod_reg!=0) z_length<=z_length+1;
			end	else 
		if (step==11) //Data transfer	2 octet  + 32 (8*4)data +4 octet (crc) = 40 octet
			begin			
			if (sch<(z_length+3)) 
				begin
		        if (sch>1) 
		        	begin
		        	data_reg     <={temp_mem_data[15:0],mem_data[31:16]};
		        	temp_mem_data<=mem_data;//mem_data
		        	if (sch<(z_length+2))  tx_mod_reg	 <=0; 
		        					 else  
		        					 begin
		        					 tx_mod_reg<=mod_reg;//выставляем Transmit data modulo. Indicates invalid bytes in the final frameword:
		        					 tx_eop_reg<=1'b1;	//end of packet	
		        					 step<=15;//
		        					 end
		        	end
				sch<=sch+1; 
				end
			end	else
		if (step==15)
			begin
			tx_wren_reg<=0;//write desable
			tx_eop_reg<=1'b0;
			step<=16;
			END_TX_reg<=1;
			end else
		if (step==16)
			begin
			step<=17;
			END_TX_reg<=0;
			end 			
	 end 
	 else
		 begin
		 tx_wren_reg<=0;//write desable
		 tx_eop_reg<=1'b0;
		 step<=0;
		 END_TX_reg<=0;
		 end
	 
endmodule




















