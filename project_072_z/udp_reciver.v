//-----------------------------------------------------------------------------
//
// Title       : udp_reciver
// Design      : list
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : d:\My_Designs\project\list\src\udp_reciver.v
// Generated   : Tue Feb 12 16:40:35 2019
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
//{module {udp_reciver}}
module udp_reciver ( clk ,rx_data ,rx_sop ,rx_eop ,rx_rdy ,
	rx_dval ,rx_dsav ,rx_err ,rx_err_stat,rx_frm_type ,
	rx_mod ,rx_a_full ,rx_a_empty ,adr ,data ,rd ,rst,adr_wr,adr_rd,int_rsv,data_to_mem,data_from_mem,
	stat_err,wren_mem,size,send,source_mac_ARP,source_mac,test,reply,type_i,code,identifier,seq_number,identification,ip_my,
	adr_udp,length_packet_udp,SDRAM_WR,SDRAM_RD,data_mem2,crc_icmp,icmp_length,socket_port);
 
//------SPI block------------------------
output [15:0] size ;
wire [15:0] size ;

output [31:0] data ;
wire [31:0] data ;

output [31:0] stat_err ; //reg_rx_mod + reg_frm_type + reg_rcv_err + reg_err_stat
wire [31:0] stat_err ;

input [15:0] adr ;
wire [15:0] adr ; 

input rd ;
wire rd ; 

output int_rsv ;
wire int_rsv ; 

//--------------MEM block----------------
output [31:0] data_mem2 ;
wire [31:0] data_mem2 ;

output wren_mem ;
wire wren_mem ;

output [10:0] adr_wr ;
wire [10:0] adr_wr ;

output [10:0] adr_rd ;
wire [10:0] adr_rd ;

output [31:0] data_to_mem ;
wire [31:0] data_to_mem ; 

input [31:0] data_from_mem ;
wire [31:0] data_from_mem ;	 

//--------------------------------------
input  [15:0] socket_port;
wire   [15:0] socket_port;

output [15:0] icmp_length;
output [31:0] crc_icmp;

input [31:0] ip_my;
wire [31:0] ip_my;

output [15:0] identification ;
wire [15:0] identification ;

output [7:0] reply ;
wire [7:0] reply ;

output [7:0] type_i;
wire  [7:0] type_i;

output [7:0] code;
wire  [7:0] code;

output [15:0] identifier;
wire  [15:0] identifier;

output [15:0] seq_number;
wire  [15:0] seq_number;

input clk ;
wire clk ;	

output send ;
wire send ; 

output [47:0] source_mac_ARP ;
wire [47:0] source_mac_ARP ;

output [47:0] source_mac ;
wire [47:0] source_mac ;

output [31:0] test ;
wire [31:0] test ;

output rx_rdy ;	 //to MAC eth
wire rx_rdy ;
input [31:0] rx_data ;
wire [31:0] rx_data ;
input rx_sop ;
wire rx_sop ;
input rx_eop ;
wire rx_eop ; 
input rx_dval ;
wire rx_dval ;
input rx_dsav ;
wire rx_dsav ;
input [5:0] rx_err ;
wire [5:0] rx_err ;
input [17:0] rx_err_stat ;
wire [17:0] rx_err_stat ;
input [1:0] rx_mod ;
wire [1:0] rx_mod ;
input rx_a_full ;
wire rx_a_full ;
input rx_a_empty ;
wire rx_a_empty ; 
input [3:0] rx_frm_type;
wire [3:0] rx_frm_type;

input rst ;
wire rst ;

//---------UDP_control----------
output [15:0] adr_udp;
wire [15:0] adr_udp;

output [15:0] length_packet_udp;
wire [15:0] length_packet_udp;

output   SDRAM_WR;
wire   SDRAM_WR;

output   SDRAM_RD;
wire   SDRAM_RD;

//------------------------------

reg [7:0] reg_reply=0;

reg [15:0] adr_spi_sch=0; 
reg reg_rdy=0; 
reg	[10:0] adr_mem_wr_sch=0;
reg	[10:0] adr_mem_rd_sch=0; 

reg reg_wren_mem=0;
reg [31:0] reg_data_delay=0;
reg [31:0] reg_data_to_mem=0;
reg [31:0] reg_data_from_mem=0;	
reg [ 3:0] reg_frm_type=0;
reg [ 5:0] reg_rcv_err=0;
reg [17:0] reg_err_stat=0;
reg [ 1:0] reg_rx_mod=0;   
reg [15:0] reg_size=0;//размер принятого пакета
reg INT_packet_RCV=0; 
reg [15:0] reg_frame_type=0;
reg [47:0] reg_source_mac =0;
reg [47:0] reg_source_mac2=0;
reg [47:0] reg_source_mac3=0;
reg FLAG_arp=0;
reg FLAG_ICMP=0;
reg FLAG_UDP=0;
reg [31:0] reg_test=0;
reg FLAG_UDP_header=0;
reg FLAG_send=0;
reg FLAG_IP_our=0;
reg [31:0] temp_dest_IP=0;
reg [31:0] reg_crc_icmp1=0;
reg [31:0] reg_crc_icmp2=0;

reg [7 :0] reg_type=0;
reg [7 :0] reg_code=0;
reg [15:0] reg_identifier;
reg [15:0] reg_seq_number; 
reg [15:0] reg_identification=0;
reg FLAG_END=0;
reg [15:0] source_port=0;
reg [15:0] destination_port=0;
reg [15:0] udp_length=0;
reg [15:0] udp_checksum=0;
reg [ 7:0] udp_sdram_wr_rd=0;
reg [15:0] udp_sdram_adr=0;
reg [15:0] udp_sdram_length=0;
reg FLAG_UDP_to_MEM=0;
reg FLAG_MEM_to_UDP=0;
reg [31:0] reg_data_mem2=0;
reg [15:0] reg_icmp_length1=0;
reg [15:0] reg_icmp_length2=0;


assign int_rsv    		=INT_packet_RCV;//прерывание о том что принят пакет и он лежит в памяти
assign wren_mem   		=reg_wren_mem;
assign adr_wr     		=adr_mem_wr_sch;
assign adr_rd     		=adr_mem_rd_sch;
assign data_to_mem 		=reg_data_to_mem;
assign data       		=reg_data_from_mem;
assign stat_err   		={2'b00,reg_rx_mod,reg_frm_type,reg_rcv_err,reg_err_stat};  
assign rx_rdy     		=reg_rdy;	
assign size       		=reg_size;
assign send       		=FLAG_send;
assign source_mac_ARP 	=reg_source_mac2;
assign source_mac 	 	=reg_source_mac3;
assign reply      		=reg_reply;
assign type_i     		=reg_type;
assign code       		=reg_code;
assign identifier 		=reg_identifier;
assign seq_number 		=reg_seq_number;
assign identification 	=reg_identification;
assign test          	=reg_test;

//-----
assign adr_udp=udp_sdram_adr;//адресс с которого производится чтение или запись
assign length_packet_udp=udp_sdram_length;//длинна датаграммы для чтения или записи
assign SDRAM_WR = FLAG_UDP_to_MEM;//флаг записи в память пришедшей датаграмммы по этому сигналу начинаем запись в память датаграмму
assign SDRAM_RD = FLAG_MEM_to_UDP;//флаг чтения из памяти и отправки датаграммы по UDP (длится несколько тактов)
assign data_mem2= reg_data_mem2;//данные для основной памяти управления и контроля, из UDP пакетов
assign crc_icmp=reg_crc_icmp2;
assign icmp_length=reg_icmp_length2;//reg_icmp_length2

always @(posedge clk) if ((reg_reply[0]==1)&&(FLAG_send)) 	reg_source_mac2<=reg_source_mac;//запоминается только если нужен ARP ответ!!!
always @(posedge clk) if (              FLAG_UDP_to_MEM) 	reg_source_mac3<=reg_source_mac;


always @(posedge clk) 
if (FLAG_END) 
	begin 

//	if (FLAG_UDP|FLAG_ICMP|FLAG_arp) 
	if (         FLAG_ICMP|FLAG_arp) 
		begin
		if (temp_dest_IP==ip_my) FLAG_send<=1;
		end
		
	end	
	else FLAG_send<=0;

always @(posedge clk)
if (rst)
begin	
adr_mem_wr_sch<=11'b11111111111;
adr_mem_rd_sch<=0;
adr_spi_sch<=0;
reg_rdy<=0;
reg_wren_mem<=0;
INT_packet_RCV<=0;
reg_err_stat<=0;
reg_rcv_err<=0;
reg_rx_mod<=0;
FLAG_arp<=0;
FLAG_ICMP<=0;
FLAG_UDP<=0;
reg_reply<=0;
FLAG_END<=0;
FLAG_UDP_to_MEM<=0;
FLAG_MEM_to_UDP<=0;
reg_crc_icmp1<=0;
reg_crc_icmp2<=0;
reg_icmp_length1<=0;
end else
if (adr!=16'hffff)	 //чтение по SPI из памяти
begin
	INT_packet_RCV<=0;
	adr_mem_rd_sch<=adr[10:0]; 
	reg_data_from_mem<=data_from_mem;	   //применяем block_read_spi_mac	
	
	FLAG_UDP_header<=0;
	reg_reply<=0;	
	FLAG_ICMP<=0;
	FLAG_UDP <=0;
	FLAG_arp <=0;
	reg_size <=0;//110419

end else
if ((rx_dval==0)&&(INT_packet_RCV==1)) 
begin

    if (temp_dest_IP==ip_my) reg_crc_icmp2   <=reg_crc_icmp1+rx_data[31:16]+rx_data[15:0];;//контрольная сумма блока данных ICMP message
	adr_mem_wr_sch<=adr_mem_wr_sch+1;
	reg_wren_mem  <=0;
	INT_packet_RCV<=0;
	FLAG_UDP_header<=0;
	FLAG_ICMP<=0;
	FLAG_UDP <=0;
	FLAG_arp <=0;
	FLAG_END <=0;
	temp_dest_IP<=0;
	reg_crc_icmp1<=0;
	reg_icmp_length1<=0;
//---------------
	if (FLAG_arp) 
	begin
	                              reg_test<=temp_dest_IP;
		 if (temp_dest_IP==ip_my) reg_reply<=8'b00000001;//посылаем ARP ответ
		//reg_reply<=8'b00000001;//посылаем ARP ответ
	end 
	else if (temp_dest_IP==ip_my) reg_reply<={FLAG_UDP,FLAG_ICMP,1'b0};//тип отправляемого пакета

end
else
begin	 //запись в память пакетов из MAC

    reg_rdy<=1;//разрешаем чтение из МАКа
	
	if ((rx_dval)&&(INT_packet_RCV==0)) //принимаем валидные данные от МАКа
	begin	
	
		if (adr_mem_wr_sch==9) reg_crc_icmp1<=rx_data[15:0]; else
		if (adr_mem_wr_sch> 9) reg_crc_icmp1<=reg_crc_icmp1+rx_data[31:16]+rx_data[15:0];								
		
		if (rx_eop==0) 
		begin
		reg_data_to_mem<=rx_data;
		end
		else
		begin
					
			if (rx_mod==0) reg_data_to_mem<=rx_data;else//данные из МАКа в память	
			if (rx_mod==1) reg_data_to_mem<={rx_data[31: 8], 8'h00   };else
			if (rx_mod==2) reg_data_to_mem<={rx_data[31:16],16'h0000 };else
			if (rx_mod==3) reg_data_to_mem<={rx_data[31:24],24'h00000};
		end
		
		adr_mem_wr_sch<=adr_mem_wr_sch+1;

		if (adr_mem_wr_sch==0) 	reg_source_mac<={32'h00000000,rx_data[7:0],rx_data[15:8]};   //запоминает source mac 
		if (adr_mem_wr_sch==1) 	reg_source_mac<={rx_data[7:0],rx_data[15:8],rx_data[23:16],rx_data[31:24],reg_source_mac[15:0]};//запоминает source mac 
		if (adr_mem_wr_sch==2)//из примера в прошивке стм32 вычитаем 2 - для адресации  в пакетах
				begin				   
					if (rx_data[31:16]==16'h0806) begin FLAG_arp<=1; end //ARP ответ
					if (rx_data[31:16]==16'h0800) FLAG_UDP_header<=1;//пришёл пакет вида UDP
				end 
		if (FLAG_UDP_header) if (adr_mem_wr_sch==3) reg_icmp_length1<=rx_data[31:16]-28;//длина данных в байтах
		
		if (FLAG_arp) //если ARP запрос проверяем IP
				begin
					if (adr_mem_wr_sch==8) temp_dest_IP<={rx_data[15:0],16'heeee};				
					if (adr_mem_wr_sch==9) temp_dest_IP<={temp_dest_IP[31:16],rx_data[31:16]};
				end 
				else
				begin
					if (rx_eop==0)
						begin
							if (FLAG_UDP_header)
									begin	
										if (adr_mem_wr_sch==3) reg_identification<=rx_data[15:0];

										if (adr_mem_wr_sch==4)//Protocol формата UDP
										begin					
											if (rx_data[7:0]== 1) begin FLAG_ICMP<=1;end//ICMP
											if (rx_data[7:0]==17) begin FLAG_UDP <=1;end//UDP
										end
										
										if (adr_mem_wr_sch==6) temp_dest_IP<={rx_data[15:0],16'heeee};				
										if (adr_mem_wr_sch==7) temp_dest_IP<={temp_dest_IP[31:16],rx_data[31:16]};
										
										if (FLAG_UDP)
										begin
											if (adr_mem_wr_sch == 7) source_port     <=rx_data[15: 0];
											if (adr_mem_wr_sch == 8) destination_port<=rx_data[31:16];
											if (adr_mem_wr_sch == 8) udp_length      <=rx_data[15: 0];
											if (adr_mem_wr_sch == 9) udp_checksum    <=rx_data[31:16];
											if (adr_mem_wr_sch == 9) udp_sdram_wr_rd <=rx_data[15: 8];//это часть самодельного протокола, байт чтения/записи в память
											if (adr_mem_wr_sch == 9) udp_sdram_adr   <=rx_data[ 7: 0];
											if (adr_mem_wr_sch ==10) udp_sdram_adr   <=udp_sdram_adr<<8+rx_data[31:24];
											if (adr_mem_wr_sch ==10) udp_sdram_length<=rx_data[23:8];
											//if((udp_sdram_wr_rd==1)&&
											//   (adr_mem_wr_sch ==10)) FLAG_UDP_to_MEM <=1;//разрешаем запись из UDP в память
											//if((udp_sdram_wr_rd==0)&&
											//   (adr_mem_wr_sch ==10)) FLAG_MEM_to_UDP <=1;//разрешаем запись из памяти в UDP   
											if((adr_mem_wr_sch  == 9)&&
											   (destination_port==socket_port))	FLAG_UDP_to_MEM <=1;//разрешаем запись из UDP в память если пришло на наш socket порт
							//				if (adr_mem_wr_sch  == 9)	FLAG_UDP_to_MEM <=1;//разрешаем запись из UDP в память если пришло на любой socket порт
										end

										if (FLAG_ICMP)
										begin
																		
											if (adr_mem_wr_sch==7) reg_type<=rx_data[15:8];
											if (adr_mem_wr_sch==7) reg_code<=rx_data[ 7:0];
											
										//	if (adr_mem_wr_sch==8) reg_crc_icmp1 <=rx_data[31:16];
											if (adr_mem_wr_sch==8) reg_identifier<=rx_data[ 7:0];
											if (adr_mem_wr_sch==9) reg_seq_number<=rx_data[31:16];
										end
									end
						end
				end
			
		if (rx_sop)//начало пакета
			begin			  
			   reg_wren_mem<=1;				//разрешаем запись в память
			   reg_frm_type<=rx_frm_type;	//тип пакета: VLAN frames, broadcast,multicast,unicast
			end else  		
		if (rx_eop) //конец пакета
			begin
			    if (temp_dest_IP==ip_my) reg_icmp_length2<=reg_icmp_length1;
			   
				FLAG_END<=1;
				reg_size<=adr_mem_wr_sch+2;//+1
			//	reg_wren_mem  <=0;
				INT_packet_RCV<=1; 
				reg_err_stat  <=rx_err_stat;//ошибки приёма , принимаются в последнем байте
				reg_rcv_err   <=rx_err; 
				reg_rx_mod    <=rx_mod;//показывает какой байт в последнем слове ненужный 00 - все нужны
			end 
					
	end	else  
		begin 
		adr_mem_wr_sch<=11'b11111111111;
		FLAG_UDP_to_MEM<=0;
		FLAG_MEM_to_UDP<=0;
		end
end

endmodule
