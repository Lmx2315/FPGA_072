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
module sdram_mk_upr ( 
	ready,//
	clk ,
	data_from_mem ,
	adr_mem_read ,
	adr_mem_write,
	data_to_mem,
	data_to_sdram,
	data_from_sdram,
	adr_sdram,
	adr_from_mk,
	adr_from_mk_wr,
	wr_req,
	rd_req,
	wr_valid,
	rd_valid,
	wr_bus,//сигнал записи в sdram от МК
	rd_bus,//сигнал чтение из sdram в МЕМ
	//--------------------
	 );
parameter N_mem=1024;

output [15:0] data_to_mem    ;
output [15:0] data_to_sdram  ;
input  [15:0] data_from_mem  ;
input  [15:0] data_from_sdram;
output [24:0] adr_sdram      ;
input  [24:0] adr_from_mk    ;
input  [24:0] adr_from_mk_wr ;
output [ 9:0] adr_mem_read   ;
output [ 9:0] adr_mem_write  ;

output wr_req ; 	//строб 
output rd_req ;
input  wr_valid;
input  rd_valid;

input ready;		//это сигнал окончания бурста в сдрам, в процессе бурста шлём данные, по окончанию бурста шлём сигнал записи 

input clk ;
input wr_bus;
input rd_bus;

reg [23:0] adr_test=0;
reg [10:0] reg_adr_read_full=0;
reg [10:0] reg_adr_all=0;
reg [10:0] reg_adr_to_mem_rd=0;
reg [10:0] reg_adr_to_mem_wr=0;
reg [24:0] adr_reg=-2;
reg [15:0] data_reg=0;
reg [ 7:0] step_wr=200;
reg [ 7:0] step_rd=200;	
reg [15:0] sch=0;
reg write_r=0;
reg [9:0] N_BURST_r=9; //9 - full page
reg flag=0;
reg flag_new_data=0;
reg reg_dqm=0;
reg reg_req=0;
reg [24:0] reg_addr=0;
reg [15:0] r_data  =0;
reg data_en=0;

assign data_to_mem  = r_data; //данные для записи в МЕМ
assign adr_sdram    = reg_addr;//адрес записи в  sdram
assign rd_req       = reg_req;
assign adr_mem_write= reg_adr_read_full;//адрес записи в МЕМ

always @(posedge clk)
						  if (write_r ) reg_addr<=adr_from_mk_wr+{reg_adr_all      [10:3],3'b000};
					else  if (reg_req ) reg_addr<=adr_from_mk   +{reg_adr_read_full[10:3],3'b000};
					else  if (wr_valid) reg_addr<=adr_from_mk_wr+{reg_adr_all      [10:3],3'b000}; // if (wr_valid) reg_addr<=adr_from_mk+{reg_adr_all      [10:3],3'b000};//адрес в sdram 
					else  if (rd_valid) reg_addr<=adr_from_mk   +{reg_adr_read_full[10:3],3'b000}; //адрес в sdram 

always @(posedge clk)
	if (rd_bus)
		begin
		reg_req<=0;
		r_data<=16'haaaa;
		step_rd<=0;
		data_en<=0;
		reg_adr_to_mem_wr<=0;
		reg_adr_read_full<=0;
		end
	else
		if (step_rd==0)
		begin
		if (ready)
			begin
			reg_req<=1;
			step_rd<=1;	
			end				
		end	 else
		if (step_rd==1)
			begin
		//	reg_req<=0;
			step_rd<=2;	
			end else
		if (step_rd==2)
			begin 
			if (rd_valid)
				begin
				reg_req<=0;
				r_data <=data_from_sdram;
				reg_adr_read_full<=reg_adr_read_full+1;
				reg_adr_to_mem_wr<=reg_adr_to_mem_wr+1;//счётчик адреса МЕМ
				if (reg_adr_to_mem_wr==7) step_rd<=3;
				end	else data_en<=0;
			end	 else
		if (step_rd==3)
		begin
			if (reg_adr_read_full<(N_mem-1))
			begin
				step_rd<=0;
				reg_adr_to_mem_wr<=0;
			end else step_rd<=20;
		end


assign adr_mem_read  = reg_adr_all;
assign data_to_sdram = data_reg;
assign wr_req        = write_r;

always @(posedge clk)
	begin
		if (wr_bus) step_wr<=0; 
		else
			if (step_wr==0)
				begin
				if (adr_test<300) adr_test<=adr_test+1; else adr_test<=0;//для теста!!! генерация адреса записи
				step_wr<=2;  
				reg_dqm <=0;
				reg_adr_to_mem_rd<=0;//устанавливаем адрес считывания из МЕМ в ноль
				reg_adr_all<=0;
				end	else
			if (step_wr==2)
				begin
				if (ready)
					begin
					step_wr<=3;
					write_r <=1;//сигнал записи	 
				    data_reg<=16'hbbbb;	
				    end 
				end else
			if (step_wr==3)
				begin
				step_wr<=4;				
			//	write_r<=0;	
				data_reg<=16'hdeed;
				end	else
			if (step_wr==4)
						begin 
							if (wr_valid)
								begin
									write_r<=0;
									if (reg_adr_to_mem_rd<16'd8) 
									begin  									
									reg_adr_all       <=reg_adr_all+1;
									reg_adr_to_mem_rd <=reg_adr_to_mem_rd+1; 
									  data_reg<=data_from_mem;
								  	//data_reg<=reg_adr_all;
									if (reg_adr_to_mem_rd==16'd7)  step_wr<=5; 
									end								
								end 			
						end	else
			if (step_wr==5)
			begin
			if (reg_adr_all<(N_mem-1))
				begin
					step_wr<=2;
					reg_adr_to_mem_rd<=0;
				end else step_wr<=200;
			
			end
			
	end	

endmodule
