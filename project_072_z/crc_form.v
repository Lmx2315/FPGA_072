//-----------------------------------------------------------------------------
//
// Title       : crc_form
// Design      : list
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : d:\My_Designs\project\list\src\crc_form.v
// Generated   : Mon Apr  1 10:13:40 2019
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
//{module {crc_form}}
module crc_form ( upr,channel,af0,af1,clk ,rst ,fifo0 ,fifo1 ,rdreq0 ,rdreq1 ,fifo_empty0 ,fifo_empty1 ,end_tx ,q_ram ,adr_ram ,crc_buf,nbuf,full0,full1,fifo_clr,start );
	
parameter n_buf=360;//размер пакета (n octet / 4) 360
parameter z=50;

output [15:0] nbuf ;//размер передаваемого пакета
wire [15:0] nbuf ;

output [7:0] channel ;
wire   [7:0] channel ;

output start ;
wire start ;

output fifo_clr ;
wire fifo_clr ;

output rdreq0 ;
wire rdreq0 ;
output rdreq1 ;
wire rdreq1 ;
output [31:0] q_ram ;
wire [31:0] q_ram ;
output [10:0] adr_ram ;
wire [10:0] adr_ram ;
output [31:0] crc_buf ;
wire [31:0] crc_buf ; 

input [7:0] upr ;
wire [7:0] upr ; 

input [8:0] af0 ;
wire [8:0] af0 ; 	 

input [8:0] af1 ;
wire [8:0] af1 ; 

input full0 ;
wire full0 ; 

input full1 ;
wire full1 ;

input clk ;
wire clk ;
input rst ;
wire rst ;

input [31:0] fifo0 ;
wire [31:0] fifo0 ;
input [31:0] fifo1 ;
wire [31:0] fifo1 ;
input fifo_empty0 ;
wire fifo_empty0 ;
input fifo_empty1 ;
wire fifo_empty1 ;
input end_tx ;
wire end_tx ;

reg rdreq0_reg=0;
reg rdreq1_reg=0;
reg [31:0] time_buf_reg=0;
reg [31:0] crc_buf_reg=0;
reg [31:0] q_ram_reg=0;
reg [10:0] adr_ram_reg=0;

reg [31:0] crc_temp=0;
reg [15:0] sch=0;
reg [ 7:0] n_fifo=0;
reg [ 7:0] step=0; 
reg start_reg=0;
reg fifo_clr_reg=0;
reg flag_fifo_AF=0;
reg [31:0] timer_delay=0;
reg [15:0] sch_delay=100;
reg flag_rst=0;
reg start_work=0;

assign nbuf=(n_buf*4);	//
assign fifo_clr=fifo_clr_reg; 
assign q_ram = q_ram_reg;
assign adr_ram = sch;
assign rdreq0 = rdreq0_reg;
assign rdreq1 = rdreq1_reg;
assign crc_buf=	crc_buf_reg;   
assign start=start_reg;
assign channel=n_fifo;

always @(posedge clk)
	if (rst)
		begin
		start_work<=1;
		sch<=16'hffff;
		crc_temp<=0;
		n_fifo<=0; 
		step<=0;
		start_reg<=0;  
		crc_buf_reg <=0;
		fifo_clr_reg<=1;
		flag_fifo_AF<=0;
		rdreq0_reg<=1;//скачиваем один сэмпл из фифо
		rdreq1_reg<=1;
		flag_rst<=1;
		end
	else
	if (flag_rst==1)
		begin
			rdreq0_reg<=0;
			rdreq1_reg<=0;
			flag_rst<=0;
			fifo_clr_reg<=0;
		end else
		if (start_work==0)
		begin
			if (end_tx) //сигнал что закончена отсылка предыдущего пакета
			begin
			start_work<=1;
			end 
		end 
		else
		begin
				if (sch_delay<z) //введено временно для отладки!!!
				begin
				timer_delay<=0;
					if ((full0)||(full1))
							begin
							fifo_clr_reg<=1;
							flag_fifo_AF<=0;
							start_reg<=0;
						  	step<=0;
							sch<=16'hffff;	
							crc_temp<=0;
							end else
							begin
							fifo_clr_reg<=0;
											if (n_fifo==0)
											begin
												if (flag_fifo_AF==1)
												begin
													if (fifo_empty0==0)
														begin
														//----------------
														
														//----------------
															if (step==0)
																begin
																if (sch!=(n_buf-1)) rdreq0_reg<=1;
																step<=1;
																end	else
															if (step==1)
																begin
																rdreq0_reg<=0;
																										
																if (sch!=(n_buf-1)) 
																	begin
																	sch<=sch+1; 
																	step<=0;
																	q_ram_reg<=fifo0;
																	crc_temp <=fifo0[31:16]+fifo0[15:0]+crc_temp;
																	end
																	else  step<=2;							
																end	else
															if (step==2)
																begin
																start_reg<=1;
																crc_buf_reg <=crc_temp;
																step<=3;	
																end else
															if (step==3)
																begin
																start_work<=0;
																flag_fifo_AF<=0;
																start_reg<=0;
																step<=0;
																sch<=16'hffff;	
																crc_temp<=0;
																n_fifo<=1;//n_fifo<=1;
																if (upr[1]==1) sch_delay<=sch_delay+1;																
																end
														end				
												end else if (af0>300)  flag_fifo_AF<=1;
											end else
											if (n_fifo==1)
											begin
												if (flag_fifo_AF==1)
												begin
													if (fifo_empty1==0)
														begin
															if (step==0)
																begin
																if (sch!=(n_buf-1)) rdreq1_reg<=1;
																step<=1;
																end	else
															if (step==1)
																begin
																rdreq1_reg<=0;
																
																if (sch!=(n_buf-1)) 
																	begin
																	sch<=sch+1; 
																	step<=0;
																	q_ram_reg<=fifo1;
																	crc_temp <=fifo1[31:16]+fifo1[15:0]+crc_temp;
																	end
																	else  step<=2;							
																end	else
															if (step==2)
																begin
																start_reg<=1;
																crc_buf_reg <=crc_temp;
																step<=3;	
																end else
															if (step==3)
																begin
																start_work<=0;
																flag_fifo_AF<=0;
																start_reg<=0;
																step<=0;
																sch<=16'hffff;	
																crc_temp<=0;
																n_fifo<=0;//														
																end
														end				
												end else if (af1>300)  flag_fifo_AF<=1;
											end 
							end
					
				end 
					else
					begin
					if (timer_delay!=20000000) timer_delay<=timer_delay+1; else sch_delay<=0;//задержка 0.5 сек
					end
		end


endmodule
