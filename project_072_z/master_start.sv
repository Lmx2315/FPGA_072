/////////////////////////////////////////////////////////////////////////////
// Copyright 2020 SS  
////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns

module master_start (
output  [47:0] DDS_freq,
output  [47:0] DDS_delta_freq,
output  [31:0] DDS_delta_rate,
output         DDS_start,
output 		   REQ,			//запрос на передачу данных в DDS
 input		   ACK,			//подтверждение принятых данных
output 		   REQ_COMMAND, //запрос новой команды из реестра реального времени

input RESET,
input CLK,					//частота работы 48 МГц !!!
input [63:0] SYS_TIME,		//код времени который надо установить по секундной метке
input SYS_TIME_UPDATE,		//сигнал управления который включает готовность установки системного времени по сигналу T1hz 
input T1hz,			  		//сигнал секундной метки

input 		 WR_DATA,
input [47:0] MEM_DDS_freq,
input [47:0] MEM_DDS_delta_freq,
input [31:0] MEM_DDS_delta_rate,
input [63:0] MEM_TIME_START,
input [15:0] MEM_N_impuls,
input [ 1:0] MEM_TYPE_impulse,  //тип формируемой пачки [бит 0] :0 - повторяющаяся (некогерентный),1 - когерентная (DDS не перепрограммируется)|[бит 1] : 0 - приём на интервале приёма, 1 - приём на интервале передачи
input [31:0] MEM_Interval_Ti,
input [31:0] MEM_Interval_Tp,
input [31:0] MEM_Tblank1,
input [31:0] MEM_Tblank2,

output SYS_TIME_UPDATE_OK,//флаг показывающий,что по секундной метке произошла установка системного времени
output [63:0] TIME,
output [63:0] TEST,
output En_ADC,
output En_Iz,
output En_Pr);

logic [63:0] TIME_MASTER=0;			   // часы с шагом  1/48 мкс
logic reg_En_Iz=0;
logic reg_En_Pr=0;
logic reg_DDS_start				   =0;
logic [47:0] reg_MEM_DDS_freq      =0;					 //начальная частота DDS
logic [47:0] reg_MEM_DDS_delta_freq=0;					 //шаг перестройки частоты DDS
logic [31:0] reg_MEM_DDS_delta_rate=0;					 //скорость перестройки частоты DDS
logic [63:0] reg_MEM_TIME_START    =64'hffffffffffffffff;//время начала исполнения команды
logic [15:0] reg_MEM_N_impuls      =0;					 //число одинаковых импульсов 
logic [15:0] reg_temp_N_impuls     =0;					 //число одинаковых импульсов, рабочий временный регистр
logic [31:0] reg_MEM_Interval_Ti   =0;					 //интервал времени для излучения
logic [ 1:0] reg_MEM_TYPE_impulse  =0;					 //тип формируемой пачки  :0 - повторяющаяся ,1 - когерентная (DDS не перепрограммируется)
logic [31:0] reg_MEM_Interval_Tp   =0;					 //интервал времени для приёма
logic [31:0] reg_MEM_Tblank1       =0;					 //интервал времени для тишины перед излучением
logic [31:0] reg_MEM_Tblank2       =0;					 //интервал времени для тишины перед приёмом
logic FLAG_SYS_TIME_UPDATED        =0;					 //флаг - исполнения синхронизации часов по секундной метки
logic [3:0] frnt_T1hz			   =0;					 //секундная метка уже перепревязаная к внутренним частотам
logic [3:0] frnt_Time_update	   =0;					 //сигнал требующий привязки внутренних часов в секундной метке и установки по ней системного времени
logic 		FLAG_START_PROCESS_CMD =0;					 //флаг означающий что команда начинает выполняться
logic 		FLAG_END_PROCESS_CMD   =0;					 //флаг означающий что команда выполненна
logic       FLAG_REQ 			   =0;
logic [31:0] temp_TIMER1=0;
logic [31:0] temp_TIMER2=0;
logic [31:0] temp_TIMER3=0;
logic [31:0] temp_TIMER4=0;

logic [ 1:0] tmp_MEM_TYPE_impulse  =0;

logic [47:0] tmp_MEM_DDS_freq      =0;					//начальная частота DDS
logic [47:0] tmp_MEM_DDS_delta_freq=0;					//шаг перестройки частоты DDS
logic [31:0] tmp_MEM_DDS_delta_rate=0;					//скорость перестройки частоты DDS
logic 		 tmp_REQ 	 	  =0;
logic 		 FLAG_REQ_CMD_REG =0;						//флаг запроса новой команды из реестра
logic [7:0]  step_tst=0;
logic        FLAG_work_ADC			=0;					//флаг начала работы приёмного канала (может работать как в интервале приёма так и в интервале излучения)

enum {idle,start,cycle,blank1,Tizl,blank2,Tpr,end_cycle} state;

always_ff @(posedge CLK) frnt_T1hz       <={frnt_T1hz       [2:0],T1hz           }; //ищем фронт сигнала T1hz
always_ff @(posedge CLK) frnt_Time_update<={frnt_Time_update[2:0],SYS_TIME_UPDATE}; //ищем фронт сигнала SYS_TIME_UPDATE
always_ff @(posedge CLK) 
begin	
	if (tmp_MEM_TYPE_impulse[1]) FLAG_work_ADC<=reg_En_Pr; //если нет особых условий то АЦП начинает писать по интервалу приёма
	else 						 FLAG_work_ADC<=reg_En_Iz; //если установлена "1" в старший бит типа импульса - то АЦП начинает писать по интервалу излучения
	end


//----------------системное время-------------------
always_ff @(posedge CLK)
if (RESET)
begin
FLAG_SYS_TIME_UPDATED<=0;
TIME_MASTER			 <=64'd0;
end 
else
begin
	if (frnt_Time_update==3'b011)
	begin
	FLAG_SYS_TIME_UPDATED<=0;									//сбрасываем флаг синхронизированых часов, ждём синхронизации с секундной меткой
	end
		else
	begin	
		if ((frnt_T1hz[3:1]==3'b011)&&(FLAG_SYS_TIME_UPDATED==0)) 		//то переустанавливаем системное время
		begin
			TIME_MASTER          <=SYS_TIME;					//перезаписываем системное время
			FLAG_SYS_TIME_UPDATED<=1;							//устанавливаем флаг подтверждения что произошла переустановка системного времени!
		end
		else
		begin
			TIME_MASTER<=TIME_MASTER+1;							//счётчик системного времени в 1/48 мкс
		end
	end
end

//--------------------------------------------------------
//-------------запись внутренних регистров данных---------
always_ff @(posedge CLK)
if (RESET)
begin
reg_MEM_DDS_freq 	  <=48'hffffffffffff;
reg_MEM_DDS_delta_freq<=48'hffffffffffff;
reg_MEM_DDS_delta_rate<=32'hffffffff;
reg_MEM_TIME_START 	  <=64'hffffffffffffffff;
reg_MEM_N_impuls      <=16'hffff;
reg_MEM_Interval_Ti   <=32'hffffffff;
reg_MEM_Interval_Tp   <=32'hffffffff;
reg_MEM_Tblank1       <=32'hffffffff;
reg_MEM_Tblank2       <=32'hffffffff;
end
else
	if (WR_DATA)  //по сигналу записи переносим данные со входов в управляющие регистры
	begin
	reg_MEM_DDS_freq 	  <=MEM_DDS_freq;
	reg_MEM_DDS_delta_freq<=MEM_DDS_delta_freq;
	reg_MEM_DDS_delta_rate<=MEM_DDS_delta_rate;
	reg_MEM_TIME_START 	  <=MEM_TIME_START;
	reg_MEM_N_impuls      <=MEM_N_impuls;//
	reg_MEM_TYPE_impulse  <=MEM_TYPE_impulse;//
	reg_MEM_Interval_Ti   <=MEM_Interval_Ti;//
	reg_MEM_Interval_Tp   <=MEM_Interval_Tp;//
	reg_MEM_Tblank1       <=MEM_Tblank1;//
	reg_MEM_Tblank2       <=MEM_Tblank2;//
	end


//-----------модуль передачи данных через CDC в DDS (CDC находиттся в модуле dds_chirp() )
always_ff @(posedge CLK) 
begin
 if ((ACK==0)&&(FLAG_REQ==1)&&(state==blank1))	//проверяем что можно передавать данные в DDS
 begin
	 tmp_MEM_DDS_freq 		<=reg_MEM_DDS_freq;
	 tmp_MEM_DDS_delta_freq <=reg_MEM_DDS_delta_freq;
	 tmp_MEM_DDS_delta_rate <=reg_MEM_DDS_delta_rate;
	      tmp_REQ 			<=1'b1;
 end else 
 		if (FLAG_REQ==0) tmp_REQ <=1'b0;
end

assign REQ=tmp_REQ; 																//выдаём запрос на передачу данных в DDS

//-----------------------------------------------------------------
//        Модуль проверки срабатывания команды по времени
always_ff @(posedge CLK)
if (RESET)
begin
FLAG_START_PROCESS_CMD<=1'b0;	
end
else
begin
	if (TIME_MASTER==reg_MEM_TIME_START) FLAG_START_PROCESS_CMD<=1'b1;//
	else
		if (state==cycle) 				 FLAG_START_PROCESS_CMD<=1'b0;
end
//----------------------------------------------------------------
//        Модуль исполнения команды
always_ff @(posedge CLK)
if (RESET)
begin
step_tst<=0;
 		state		<=start;
reg_DDS_start		<=0;
FLAG_END_PROCESS_CMD<=1'b1;	
FLAG_REQ_CMD_REG    <=0;
reg_En_Iz    		<=1'b0;
reg_En_Pr    		<=1'b0;
end
else
if (FLAG_SYS_TIME_UPDATED==1)//работаем только если системное время обновлено!!!
begin	    
	if (state==start) 																			//начальное состояние стейт-машины
	begin
	if (FLAG_START_PROCESS_CMD==1) state<=cycle;
	step_tst<=1;	
																								//тут сидим -ждём начала работы по срабатыванию часов
	FLAG_REQ_CMD_REG    <=0;
	end	else
	if (state==cycle)																			//ожидание начала работы
		begin
		state<=idle;
		step_tst<=2;
		    FLAG_REQ_CMD_REG<=1;
			FLAG_REQ		<=1'b1;																//готовимся отослать данные в DDS
		reg_temp_N_impuls   <=reg_MEM_N_impuls; 												//запоминаем сколько импульсов синтезировать
		reg_En_Iz    		<=1'b0;
		reg_En_Pr    		<=1'b0;
		reg_DDS_start		<=1'b0;
		end else
	if (state==idle)																			//ожидание начала работы
		begin
		step_tst<=3;
		tmp_MEM_TYPE_impulse<=reg_MEM_TYPE_impulse ;
		temp_TIMER1  		<=reg_MEM_Tblank1    -1;  											//переписываем управляющие регистры в рабочие переменные
		temp_TIMER2  		<=reg_MEM_Interval_Ti-1;
		temp_TIMER3			<=reg_MEM_Tblank2    -1;
		temp_TIMER4			<=reg_MEM_Interval_Tp-1;
		FLAG_END_PROCESS_CMD<=1'b0;		
		if (reg_temp_N_impuls>0) 
			begin
			reg_temp_N_impuls	<=reg_temp_N_impuls-1'b1;										//считаем сколько импульсов надо синтезировать			
			         state<=blank1;
			end else state<=end_cycle;
		end else
	if (state==blank1)																			//стейт машина: состояние первый бланк (бланк излучения)
		begin
		step_tst<=4;
		if (temp_TIMER1==0) state<=Tizl;
			temp_TIMER1 <=temp_TIMER1-1'b1;
		end else
	if (state==Tizl)																			//стейт машина: состояние интервал излучения
		begin
		step_tst<=5;
			reg_DDS_start	<=1'b1;																//запускаем синтезатор DDS
			reg_En_Iz  		<=1'b1;																//поднимаем флаг "излучения"
			if (temp_TIMER2==0) state<=blank2;
			temp_TIMER2 	<=temp_TIMER2-1'b1;
		end else
	if (state==blank2)																			//стейт машина: состояние второй бланк (бланк приёма)
		begin
		if (temp_TIMER3==0) state<=Tpr;
		step_tst<=6;
			if ((reg_temp_N_impuls      ==0)||	
			    (reg_MEM_TYPE_impulse[0]==0)) reg_DDS_start	<=1'b0;								//выключаем синтезатор DDS если режим пачки - некогерентный!!!
										   	  reg_En_Iz		<=1'b0;								//снимаем флаг  "излучения"
										   	temp_TIMER3    	<=temp_TIMER3-1'b1;										   
		end else
	if (state==Tpr)																				//стейт машина: состояние интервал приёма
		begin
		if (temp_TIMER4==0) state<=end_cycle;
		step_tst<=7;
			reg_En_Pr  <=1'b1;																	//поднимаем флаг  "интервала приёма"
			temp_TIMER4<=temp_TIMER4-1'b1;
		end else
	if (state==end_cycle)				 														//стейт машина: состояние - конец цикла
		begin
		step_tst<=8;
			FLAG_REQ											<=1'b0;							//снимаем флаг запроса передачи данных в DDS
			reg_En_Pr  											<=1'b0;							//снимаем флаг  "интервала приёма"
	   		if  (reg_temp_N_impuls   ==0)
			begin
			FLAG_END_PROCESS_CMD<=1'b1;															//поднимаем флаг конца процесса синтеза пачки									
					 state<=start;
			end else state<=idle;
		end
end 
else
begin
	step_tst<=9;
 	state				<=start;
	reg_DDS_start		<=0;
	FLAG_END_PROCESS_CMD<=1'b1;	
	FLAG_REQ_CMD_REG    <=0;
	reg_En_Iz    		<=1'b0;
	reg_En_Pr    		<=1'b0;
end

//-----------------------------------------------------------

assign TEST 				={reg_MEM_TIME_START[47:0],reg_MEM_N_impuls};//{reg_MEM_TIME_START[55:0],step_tst}
assign TIME 				= TIME_MASTER;				//выводим во вне текущее время
assign DDS_start 			= reg_DDS_start;			//сигнал управляющий встроеным в ПЛИС DDS
assign DDS_freq 			= tmp_MEM_DDS_freq;
assign DDS_delta_freq 		= tmp_MEM_DDS_delta_freq;
assign DDS_delta_rate 		= tmp_MEM_DDS_delta_rate; 
assign SYS_TIME_UPDATE_OK	= FLAG_SYS_TIME_UPDATED;  	//event того что системное время обновлено 
assign En_Iz 				= reg_En_Iz;				//сигнал разрешающий излучение
assign En_Pr 				= reg_En_Pr;				//сигнал разрешающий приём
assign REQ_COMMAND 			= FLAG_REQ_CMD_REG; 		//сигнал запрашивающий новую команду для исполнения, потому как старая была выполненна
assign En_ADC 				= FLAG_work_ADC;			//сигнал разрешения каналам АЦП передавать данные во вне. (интервал обработки АЦП)

endmodule