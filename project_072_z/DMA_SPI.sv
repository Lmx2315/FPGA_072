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
	output 		  SPI_WR       
);

//-------регистры для хранения команды из spi
logic [ 47:0] 	 tmp_FREQ 		    =0;
logic [ 47:0] 	 tmp_FREQ_STEP 	    =0;
logic [ 31:0] 	 tmp_FREQ_RATE	    =0;
logic [ 63:0]    tmp_TIME_START     =0;
logic [ 15:0]    tmp_N_impulse      =0;
logic [  7:0]    tmp_TYPE_impulse   =0;
logic [ 31:0]    tmp_Interval_Ti    =0;
logic [ 31:0]    tmp_Interval_Tp    =0;
logic [ 31:0]    tmp_Tblank1	    =0;
logic [ 31:0]    tmp_Tblank2	    =0;

logic [407:0]  REG_SPI=0;//асинхронный регистр
logic [407:0]  REG_CLK=0;//синхронный регистр

logic [ 3:0] frnt_CS   		     =0;
logic 		 FLAG_SPI_DATA_OK    =0;
logic 		 FLAG_SPI_WR         =0;
logic 		 FLAG_SYS_TIME_UPDATE=0;
logic [ 7:0] timer               =0;

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
		if (REG_SPI!=64'h0) 
			begin 
				FLAG_SYS_TIME_UPDATE<=1; 
				timer<=128;//задержка снятия флага синхронизации системного времени
			end
		REG_CLK	   <=REG_SPI;
		FLAG_SPI_WR<=1;	
		end	else
		begin
		FLAG_SPI_WR<=0;
		if (timer>0) timer<=timer-1; 
		else FLAG_SYS_TIME_UPDATE<=0; 
		end
end

assign 		       TIME=REG_CLK[407:344];
assign 		       FREQ=REG_CLK[343:296];
assign        FREQ_STEP=REG_CLK[295:248];
assign        FREQ_RATE=REG_CLK[247:216];
assign       TIME_START=REG_CLK[215:152];
assign        N_impulse=REG_CLK[151:136];
assign     TYPE_impulse=REG_CLK[135:128];
assign      Interval_Ti=REG_CLK[127: 96];
assign      Interval_Tp=REG_CLK[ 95: 64];
assign          Tblank1=REG_CLK[ 63: 32];
assign          Tblank2=REG_CLK[ 31:  0];
assign 		     SPI_WR=FLAG_SPI_WR;
assign 	SYS_TIME_UPDATE=FLAG_SYS_TIME_UPDATE;		

endmodule