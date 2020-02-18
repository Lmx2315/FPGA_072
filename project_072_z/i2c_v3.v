												 //-----------------------------------------------------------------------------
//
// Title       : i2c_master_v2
// Design      : Eth
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\Eth\src\i2c_master_v2.v
// Generated   : Wed Jan 16 10:26:01 2019
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
//{module {i2c_master_v2}}
module i2c_master_v2 (
	output wire asc_err,
	output wire [15:0] data,
	output wire ready,
	output wire scl,
	output wire o_sda,
	input wire  i_sda,
	output wire drv,
	input wire clk,
	input wire rst,
	input wire en,
	input wire [31:0] in
);

reg [7:0]  state=0;
reg [15:0] reg_data=0;	 
reg [15:0] sch=0;
reg [2:0] frnt=0; 
reg scl_pos=0;
reg scl_neg=0;
reg reg_scl=1;
reg reg_sda=1;
reg reg_drv=0;	 
reg [ 6:0] adr_i2c=0;
reg [ 7:0] adr_data=0;
reg [15:0] word_data=0;
reg reg_wr_rd=0;  
reg reg_scl_en=1;
reg [7:0] sch_faze=0;  
reg reg_ack=0; 
reg reg_scl_del=1;

reg reg_sda1=0;
reg reg_scl1=0;	  

reg false_scl=0;
reg [15:0] sch_scl=0; 
reg flag_scl_front=0;

assign 	data    = reg_data;
assign  asc_err = reg_ack;
assign  scl     = reg_scl1;
assign 	o_sda   = reg_sda1;
assign  drv     = reg_drv;

always @(posedge clk)  
	begin

		reg_scl1<=reg_scl_en|false_scl&reg_scl_del;
		reg_sda1<=reg_sda;

		sch<=sch+40;
		frnt<={frnt[1:0],sch[15]};
		
	if (frnt==3'b001)  scl_pos<=1; else scl_pos<=0;
	if (frnt==3'b110)  scl_neg<=1; else scl_neg<=0;	
	if (scl_pos) reg_scl<=1; else if (scl_neg) 	reg_scl<=0;
		
	if (scl_pos) flag_scl_front<=1; 
	else		
	if (flag_scl_front)  
		begin
			sch_scl<=0; 
			false_scl<=1;
			flag_scl_front<=0;
		end	else 
		if (false_scl)
			begin
				if (sch_scl!=256) sch_scl<=sch_scl+1; 
				else
					begin
					sch_scl<=0; 
					false_scl<=0;
					end				
			end	
	end
	
 always @(posedge clk)
	 if (rst)
		 begin
			state<=0;
			reg_sda<=1;
			reg_drv<=0;
			reg_ack<=0;	
			reg_scl_en<=1;
		 end
	 else
		 begin
			if (en)
				begin
				state<=1; //фаза старта
				adr_i2c  <=in[30:24];
				adr_data <=in[23:16];
				word_data<=in[15: 0]; 
				reg_wr_rd<=in[31]; 
				reg_drv<=1;//выход в рабочее состояние 
				reg_ack<=0;
				reg_data<=0;
				end	
			else
				 if ((state==1)&&(scl_pos))
				   begin
					 reg_sda<=0; 
				   end else
				 if ((state==1)&&(scl_neg)&&(reg_sda==0))
					 begin 
				  	 state<=2; //фаза адреса  i2c
					 sch_faze<=7;
				    reg_scl_en<=0;	
				    reg_scl_del<=0;
					 end else
				 if ((scl_neg)&&(state==2))
					 begin
					  reg_scl_del<=1;
					  adr_i2c<=adr_i2c<<1; 
					  reg_sda<=adr_i2c[6];					  
					 end else
				 if ((scl_pos)&&(state==2))
					 begin						 
					 sch_faze<=sch_faze-1; 
					 if (sch_faze==0) state<=3; //фаза  бита чтения/записи
					 end else 
				 if ((scl_neg)&&(state==3))
					 begin
					  adr_i2c  <=in[30:24];//востанавливаем адресс устройства	 
					  reg_sda<=0; //пишем бит записи
					 end else
				  if ((scl_pos)&&(state==3))
					  begin
					  state<=4; //фаза чтения ACKa
					  end else				 
				  if ((scl_neg)&&(state==4))
					 begin
					 reg_drv<=0;//выход в третье состояние	
					 reg_sda<=1;
					 end else
				  if ((scl_pos)&&(state==4))
					  begin
					  reg_ack<=i_sda;//считываем состояние SDA
					  state<=5;      //фаза записи адреса слова
					  sch_faze<=7;   //длинна адреса в битах
					  end else
				  if ((scl_neg)&&(state==5))
					  begin
				   	  reg_drv <=1;//выход в рабочее состояние 
					  adr_data<=adr_data<<1; 
					  reg_sda <=adr_data[7];
					  end else
				  if ((scl_pos)&&(state==5))
					 begin
					 sch_faze<=sch_faze-1; 
					 if (sch_faze==0) state<=6; //фаза чтения ACKa
					 end else 
				  if ((scl_neg)&&(state==6))
					 begin
					 reg_drv<=0;//выход в третье состояние	
				     reg_sda<=0;
					 end else 				 
				  if ((scl_pos)&&(state==6))
					  begin
						//reg_ack<=i_sda;//считываем состояние SDA 
						sch_faze<=7;   //длинна байта в битах
			       if (reg_wr_rd==1)	state<=20;      //фаза  цель  - чтение 
						else 	state<=200;      //фаза  цель  - запись 						
			  	    end else
				   if ((scl_neg)&&(state==200)) //эта часть для команды записи в память , пишем первый байт
					   begin
						reg_drv <=1;//выход в рабочее состояние 
					    word_data<=word_data<<1; 
					    reg_sda <=word_data[15];   
					   end	else 
				  if ((scl_pos)&&(state==200))
					 begin
					 sch_faze<=sch_faze-1; 
					 if (sch_faze==0) state<=201; //фаза чтения ACKa
					 end else 
				  if ((scl_neg)&&(state==201))
					 begin
					 reg_drv<=0;//выход в третье состояние	
				     reg_sda<=0;
					 end else 				 
				  if ((scl_pos)&&(state==201))
					  begin
						//reg_ack<=i_sda;//считываем состояние SDA 
						sch_faze<=7;   //длинна байта в битах
				   	    state<=202;      //фаза  цель  - чтение 
			  	    end else
				   if ((scl_neg)&&(state==202)) //записываем второй байт
					   begin
						reg_drv <=1;//выход в рабочее состояние 
					    word_data<=word_data<<1; 
					    reg_sda <=word_data[15];   
					   end	else 
				    if ((scl_pos)&&(state==202))
					 begin
					 sch_faze<=sch_faze-1; 
					 if (sch_faze==0) state<=203; //фаза чтения ACKa
					 end else 
				  if ((scl_neg)&&(state==203))
					 begin
					 reg_drv<=0;//выход в третье состояние	
				     reg_sda<=0;
					 end else 				 
				  if ((scl_pos)&&(state==203))
					  begin
						//reg_ack<=i_sda;//считываем состояние SDA 
				   	    state<=27;      //фаза  stop
			  	    end else
					 
					 
					  
				  if ((scl_neg)&&(state==20)) //снова формируем СТАРТ  -- это если чтение из памяти
					  begin
					    reg_drv<=1;    //выход в рабочее состояние
					    reg_sda <=1; 						
					  end else	  
				   if ((scl_pos)&&(state==20))
					  begin
						reg_scl_en<=1;
						state<=41;      //фаза
					    sch_faze<=6;
			  	    end else 
				   if ((scl_neg)&&(state==41))
					   begin
					   reg_sda <=1;	 
					   end else  
				   if ((scl_pos)&&(state==41))
					   begin 
					   reg_sda <=0; 
					   state<=31;      //фаза 
					   end else	  
					  
				   if ((scl_neg)&&(state==31))
					   begin
					   reg_scl_en<=0;
					   reg_scl_del<=0; 				    
					   end else
				   if ((scl_pos)&&(state==31))
					   begin 					   
					   state<=21;      //фаза   
					   end else			  
					  
				  if ((scl_neg)&&(state==21))	//опять пишем адресс устройства
					  begin	
					  reg_scl_del<=1;
					  adr_i2c<=adr_i2c<<1; 
					  reg_sda<=adr_i2c[6];	
					  end else	 
				   if ((scl_pos)&&(state==21))
					 begin						 
					 sch_faze<=sch_faze-1; 
					 if (sch_faze==0) state<=22; //фаза  бита чтения/записи
					 end else 
				   if ((scl_neg)&&(state==22))
					 begin
					  reg_sda<=1; //пишем бит чтения
					 end else
					if ((scl_pos)&&(state==22))
					  begin
					  state<=23; //фаза чтения ACKa
					  end else				 
				  if ((scl_neg)&&(state==23))
					 begin
					 reg_drv<=0;//выход в третье состояние	
					 reg_sda<=1;
					 end else
				  if ((scl_pos)&&(state==23))
					  begin
					  reg_ack<=i_sda;//считываем состояние SDA
					  state<=24;      //фаза чтения байта
					  sch_faze<=7;   //длинна байта в битах
					  end else 				  
				  if ((scl_neg)&&(state==24))
					  begin
				   	  reg_drv <=0;//по прежнему третье состояние 
					
					  end else
				  if ((scl_pos)&&(state==24))
					 begin
				     reg_data<={reg_data[14:0],i_sda};	 
					 sch_faze<=sch_faze-1; 
					 if (sch_faze==0) state<=25; //фаза записи!!! ACKa
					 end else  
				  if ((scl_neg)&&(state==25))
					 begin
					 reg_drv<=1;//
					 reg_sda<=0;// шлём ACK to slave
					 end else 
				  if ((scl_pos)&&(state==25))
					 begin
					 
					 state<=26;      //фаза чтения следующего байта
					 sch_faze<=7;   //длинна байта в битах
					 end else 
					 
				   if ((scl_neg)&&(state==26))
					  begin
				   	  reg_drv <=0;//по прежнему третье состояние
					  reg_sda<=1;	 
					
					  end else
				  if ((scl_pos)&&(state==26))
					 begin 
				     reg_data<={reg_data[14:0],i_sda};	 
					 sch_faze<=sch_faze-1; 
					 if (sch_faze==0) state<=51; //фаза чтения!!! - сигнал прекращения чтения ACKa
					 end else 
				
				  if ((scl_neg)&&(state==51))
					 begin
					 reg_drv<=0;//	
					 end else 
					 
				  if ((scl_pos)&&(state==51))
					 begin
					 reg_ack<=i_sda;//считываем состояние SDA
					 state<=27;
					 end else 					 
				  if ((scl_neg)&&(state==27))
					 begin
					 reg_drv<=1;//	
					 reg_sda<=0;
					 end else 
				  if ((scl_pos)&&(state==27))	//формируем STOP
					 begin
					 reg_sda<=0;
					 state<=28;      //
					 reg_scl_en<=1;
					 end else 				
				  if ((scl_neg)&&(state==28))
					  begin
					   reg_sda<=1;					   
					  end 
					  
	 end
		 
	
	

endmodule
