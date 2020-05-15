//---------------------------------------------------------------
//автор СС ОАО НПК НИИДАР
//
//
//модуль приёма 51 байта данных из МК по SPI (через мк-ный DMA)
//Прием данных работает на частоте SPI МК и переводится в домен CLK ПЛИС
//когда МК посылает како-то время отличное от нуля - устанавливается флаг синхронизации с
//секундной меткой.
//---------------------------------------------------------------
`timescale 1 ns / 1 ns
module DMA_SPI (
	input clk,    // Clock
	input clk_en, // Clock Enable
	input rst_n,  // Asynchronous reset active low
	
	input MOSI,
	input CS,
	input SCLK,

	output [63:0] TIME,				//предустановка системного времени
	output 		  SYS_TIME_UPDATE,	//сигнал сообщает модулю что произошла переустановка системного времени!!! этот сигнал должен иметь длительность несколько тактов 1/48 МГц!!! 
	output [47:0] FREQ,
	output [47:0] FREQ_STEP,
	output [31:0] FREQ_RATE,
	output [63:0] TIME_START,
	output [15:0] N_impulse,
	output [ 7:0] TYPE_impulse,
	output [31:0] Interval_Ti,
	output [31:0] Interval_Tp,
	output [31:0] Tblank1,
	output [31:0] Tblank2,
	output 		  SPI_WR,
	output 		  RESET_WCW       
);

parameter DELAY_WR=256;

logic [407:0]  REG_SPI=0;//асинхронный регистр
logic [407:0]  REG_CLK=0;//синхронный регистр

logic [ 3:0] frnt_CS   		     =0;
logic 		 FLAG_SPI_DATA_OK    =0;
logic 		 FLAG_SPI_WR         =0;
logic 		 FLAG_SYS_TIME_UPDATE=0;
logic [15:0] timer               =0;
logic 		 FLAG_RSRT_WCW 		 =0;

//------синхронный приём на частоте SPI----------
always_ff @(posedge SCLK) 
begin
 if(!CS) 
 	begin
		 REG_SPI<={REG_SPI[406:0],MOSI};
	end
end
//----------------------------------------------
always_ff @(posedge clk) frnt_CS<={frnt_CS[2:0],CS};
always_ff @(posedge clk)
begin
	if (frnt_CS[3:1]==3'b011)
	begin
		 FLAG_SPI_DATA_OK<=1;
	end
	else FLAG_SPI_DATA_OK<=0;
end

always_ff @(posedge clk) 
begin
	if (FLAG_SPI_DATA_OK) 	
		begin
		if (REG_SPI[407:344]!=64'h0) //если пришло время переустановки часов отличное от нуля - то готовимся к пересинхронизации по секундной метке!!!
			begin 
				FLAG_RSRT_WCW       <=1;
				FLAG_SYS_TIME_UPDATE<=1; 
				timer<=DELAY_WR;//задержка снятия флага синхронизации системного времени
			end else
			begin
			FLAG_SPI_WR<=1;		
			end
		REG_CLK	   <=REG_SPI;
		end	else
		begin
		if (timer>16'h0) 
			begin
				timer<=timer-1;
				if (timer==1)  FLAG_SPI_WR<=1;	
				if (timer==(DELAY_WR-1)) FLAG_RSRT_WCW<=0;
			end
		else 
			begin
				FLAG_SYS_TIME_UPDATE<=0; 
				FLAG_SPI_WR<=0;
			end
		end
end

assign 		       TIME=REG_CLK[407:344];//m[ 0- 7]  56 , 48 , 40 , 32 , 24 , 16 , 8 , 0
assign 		       FREQ=REG_CLK[343:296];//m[ 8-13]          , 40 , 32 , 24 , 16 , 8 , 0
assign        FREQ_STEP=REG_CLK[295:248];//m[14-19]			 , 40 , 32 , 24 , 16 , 8 , 0
assign        FREQ_RATE=REG_CLK[247:216];//m[20-23]			             24 , 16 , 8 , 0
assign       TIME_START=REG_CLK[215:152];//m[24-31]  56 , 48 , 40 , 32 , 24 , 16 , 8 , 0
assign        N_impulse=REG_CLK[151:136];//m[32-33] 							   8 , 0
assign     TYPE_impulse=REG_CLK[135:128];//m[34] 									 , 0
assign      Interval_Ti=REG_CLK[127: 96];//m[35-38]						 24 , 16 , 8 , 0
assign      Interval_Tp=REG_CLK[ 95: 64];//m[39-42]						 24 , 16 , 8 , 0
assign          Tblank1=REG_CLK[ 63: 32];//m[43-46]	                     24 , 16 , 8 , 0
assign          Tblank2=REG_CLK[ 31:  0];//m[47-50] 					 24 , 16 , 8 , 0
assign 		     SPI_WR=FLAG_SPI_WR;
assign 	SYS_TIME_UPDATE=FLAG_SYS_TIME_UPDATE;		
assign        RESET_WCW=FLAG_RSRT_WCW;

endmodule