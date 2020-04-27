module wcm (
input 		  CLK 		     ,
input 		  rst_n 	     ,
input 		  REQ_COMM 	     ,
input  [63:0] TIME 			 ,
input  		  SYS_TIME_UPDATE,//сигнал сообщает модулю что произошла переустановка системного времени!!! этот сигнал должен иметь длительность несколько тактов 1/48 МГц!!!
input  [47:0] FREQ           ,//данные с интерфейса МК
input  [47:0] FREQ_STEP      ,//----------------------
input  [31:0] FREQ_RATE      ,//--------//------------ 
input  [63:0] TIME_START     ,
input  [15:0] N_impulse      ,
input  [ 7:0] TYPE_impulse   ,
input  [31:0] Interval_Ti    ,
input  [31:0] Interval_Tp    ,
input  [31:0] Tblank1 	     ,
input  [31:0] Tblank2        ,
input 		   SPI_WR	     ,//этот сигнал должен иметь длительность несколько тактов 1/48 МГц!!!
output 		  DATA_WR 		 ,//сигнал записи данных команды в блок синхронизации
output [47:0] FREQ_z         ,//части команды выводимые из модуля в блок синхронизации и исполнения
output [47:0] FREQ_STEP_z    ,
output [31:0] FREQ_RATE_z    ,
output [63:0] TIME_START_z   ,
output [15:0] N_impuls_z     ,
output [ 1:0] TYPE_impulse_z ,
output [31:0] Interval_Ti_z  ,
output [31:0] Interval_Tp_z  ,
output [31:0] Tblank1_z      ,
output [31:0] Tblank2_z    	 ,//-----//-------	 
output [31:0] TEST 			 
);

parameter N_IDX      =32;//размер памяти в строках (N-1)
parameter TIME_REZERV=48*8;//8 мкс запас времени
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
//-------регистры для хранения команды считаной из памяти реального времени
logic [ 47:0] 	 mem_FREQ 		    =0;
logic [ 47:0] 	 mem_FREQ_STEP 	    =0;
logic [ 31:0] 	 mem_FREQ_RATE	    =0;
logic [ 63:0]    mem_TIME_START     =0;
logic [ 15:0]    mem_N_impulse      =0;
logic [  1:0]    mem_TYPE_impulse   =0;
logic [ 31:0]    mem_Interval_Ti    =0;
logic [ 31:0]    mem_Interval_Tp    =0;
logic [ 31:0]    mem_Tblank1	    =0;
logic [ 31:0]    mem_Tblank2	    =0;
//----------------------------------------

logic [337:0] 	   w_REG_DATA       =0;//данные для записи в реестр
logic [  7:0] 	   w_REG_ADDR       =0;//адрес в реестре куда можно делать свежую запись
logic [  7:0]     rd_REG_ADDR       =0;//адрес в реестре для чтения
logic [  7:0]	 tmp_REG_ADDR		=0;//адрес записи в реестр
logic [  7:0]    clr_REG_ADDR 		=0;//адресс под очистку
logic 			 RD_REG 			=0;
logic 		   	 WR_REG	            =0;//сигнал записи в память реестра
logic 			 FLAG_WORK_PROCESS	=0;//сигнал что идёт какой-то процесс
logic 			 FLAG_CLR_COMMAND   =0;//флаг того что надо стереть команду в памяти
logic 			 FLAG_WR_COMMAND    =0;//флаг того что надо записать новую команду в память
logic 			 FLAG_CMD_SEARCH    =0;//флаг что найдена команда к исполнению в следующие 8 мкс

logic [  2:0]	 FLAG_REG_STATUS	=0;//флаг того что найдено место в памяти для новой команды
logic [337:0] 	 DATA_TIME_REG 		=0;//

logic [ 63:0]    reg_TIME 			=0;//тут храним текущее время

logic 			 reg_DATA_WR		=0;//сигнал записи данных в память синхроблока
logic [ 63:0]    tmp_CMD_TIME		=0;//временное хранение данных для поиска команды в реестре
logic [  7:0] 	 tmp_CMD_ADDR 		=0;//временное хранение данных для поиска команды в реестре	
logic 			FLAG_SYS_TIME_UPDATE=0;//флаг что было произведено переустановка часов
logic [  2:0]   frnt1 				=0;//регистр для поиска фронта сигнала SYS_TIME_UPDATE
logic 			FLAG_WR_SPI_DATA	=0;//флаг того что была запись данных с шины SPI
logic [  2:0]   frnt2               =0;//регистр для поиска фронта сигнала SYS_TIME_UPDATE
logic [  2:0]   frnt3				=0;//регистр поиска фронта  сигнала REQ_COMM
logic [ 63:0]   var1				=64'h0000000000000000;//переменная обозначает пустое место в памяти

logic [  7:0]   t0_CMD_ADDR 	    =0;//адресс команды с учётом латентности
logic [  7:0]   t1_CMD_ADDR 	    =0;//адресс команды с учётом латентности
logic 			FLAG_SRCH			=0;//флаг того что круг поиска завершён
logic 			FLAG_REQ_COMM 		=0;//флаг запроса по сигналу REQ_COMM
logic 			FLAG_NEW_CMD_WR 	=0;//флаг начала поиска новой команды на исполнение, после записи в реестр
logic 			FLAG_SRCH_FAULT		=0;//флаг неудачного поиска новой команды в реестре
 //-----------------------------------------------------------------------------------------------------------
enum {clr_all,clr_data,wr_data,idle_status			  							  } status   ,next_status   ; 
enum {search_a,end_search,read_data,end_read_data,search_time,end_search_time,step2_search_time,step3_search_time,idle  } rd_status,rd_next_status;

always_ff @(posedge CLK) 
begin 
	if(~rst_n) 
	begin
	tmp_FREQ 		<=0;
	tmp_FREQ_STEP 	<=0;
	tmp_FREQ_RATE	<=0;
	tmp_TIME_START  <=0;
	tmp_N_impulse   <=0;
	tmp_TYPE_impulse<=0;
	tmp_Interval_Ti <=0;
	tmp_Interval_Tp <=0;
	tmp_Tblank1	    <=0;
	tmp_Tblank2	    <=0;
	end else
	if (SPI_WR)
	begin
	tmp_FREQ 		<=FREQ;
	tmp_FREQ_STEP 	<=FREQ_STEP;
	tmp_FREQ_RATE	<=FREQ_RATE;
	tmp_TIME_START  <=TIME_START;
	tmp_N_impulse   <=N_impulse;
	tmp_TYPE_impulse<=TYPE_impulse;
	tmp_Interval_Ti <=Interval_Ti;
	tmp_Interval_Tp <=Interval_Tp;
	tmp_Tblank1	    <=Tblank1;
	tmp_Tblank2	    <=Tblank2;
	end	
end

always_ff @(posedge CLK) 
begin
	if(~rst_n) 
	begin
	reg_TIME<= 64'h0;
	end else
	 begin
	 reg_TIME <= TIME ;//перезапоминаем время
	 end
end

always_ff @(posedge CLK) 
begin
	if(~rst_n) 
	begin

	end else
	 begin
	 frnt1<={frnt1[1:0],SYS_TIME_UPDATE};
	 frnt2<={frnt2[1:0],SPI_WR 		   };
	 frnt3<={frnt3[1:0],REQ_COMM	   };
	 
	 if (frnt1==3'b001) 			FLAG_SYS_TIME_UPDATE<=1;//если есть фронт сигнала переустановки времени то поднимаем флаг
	 else 
	 if (rd_status==search_time) 	FLAG_SYS_TIME_UPDATE<=0;//если начался процесс поиска новой команды на исполнение то снимаем флаг
	 
	 if (frnt2==3'b001) 			FLAG_WR_SPI_DATA<=1;	//если есть фронт сигнала записи то поднимаем флаг
	 else 
	 if (rd_status==search_a) 		FLAG_WR_SPI_DATA<=0;	//если начался процесс поиска места для новой команды в памяти	 
	 
	 if (frnt3==3'b001) 			FLAG_REQ_COMM<=1;		//если есть фронт сигнала запроса новой команды то поднимаем флаг
	 else 
	 if (rd_status==search_time) 	FLAG_REQ_COMM<=0;		//если начался процесс чтения новой команды
	 end
end


always_comb
 begin
	case (rd_status)
		  	 search_a:rd_next_status=end_search;
		   end_search:rd_next_status=idle;
		    read_data:rd_next_status=end_read_data;
		end_read_data:rd_next_status=idle;
		  search_time:rd_next_status=step2_search_time;
	step2_search_time:rd_next_status=step3_search_time;
	step3_search_time:rd_next_status=end_search_time;
	  end_search_time:rd_next_status=idle;
	         default :rd_next_status=idle;
	endcase
end

//-------тут всё чтение!-----------------------
always_ff @(posedge CLK) 
begin
	if(~rst_n) 
	begin
	var1			<=64'h0000000000000000;
	FLAG_REG_STATUS	<=3'b000;
	FLAG_CMD_SEARCH	<=0;
	FLAG_WR_COMMAND	<=0; 
	rd_REG_ADDR	 	<=0;
	tmp_CMD_TIME    <=64'hffffffff_ffffffff;
	RD_REG			<=1'b0;
	rd_status  		<=idle;
	FLAG_SRCH_FAULT	<=0;
	end else
	if (rd_status==idle  )
	begin
	
	RD_REG			<=1'b1;
	FLAG_SRCH		<=0;
	FLAG_REG_STATUS	<=3'b000;
	FLAG_CMD_SEARCH	<=0;
	FLAG_WR_COMMAND	<=0; 
	FLAG_CLR_COMMAND<=0;
	rd_REG_ADDR	 	<=0;
	t0_CMD_ADDR     <=0;
	t1_CMD_ADDR     <=0;
	tmp_CMD_ADDR    <=0;
	tmp_CMD_TIME    <=64'hffffffff_ffffffff;	
	
	if ( FLAG_WR_SPI_DATA) 				   		    				rd_status<=search_a		;//по сигналу приёма по spi данных - начинаем поиск свободной строки в памяти
	else
	if ( FLAG_CMD_SEARCH)	   		    							rd_status<=read_data	;//считываем новую(подготовленную) команду для синхронизатора 
	else
	if ( FLAG_NEW_CMD_WR|FLAG_SYS_TIME_UPDATE|FLAG_REQ_COMM)
	begin
								rd_status<=search_time	;//начинаем поиск ближайшей по времени команды на исполнение
	if (FLAG_REQ_COMM)	 FLAG_CLR_COMMAND<=1;			 //если была выполнна предыдущая команда - то стираем её из памяти
	end
	
	end else
	if (rd_status==search_a)					//ищем место под новую запись в память (пустую или ранее стёрттую)
	begin
	  if (DATA_TIME_REG[337:274]!=var1) 		//проверяем запись в реестре на "стёртость"
	  	begin
	 		rd_REG_ADDR<=rd_REG_ADDR+1'b1;					//перебираем адреса в памяти,число адресов должно быть кратно степени 2!!!
			t0_CMD_ADDR<=rd_REG_ADDR;						//учитываем латентность памяти, для адреса команды
			t1_CMD_ADDR<=t0_CMD_ADDR; 
			
			if (t1_CMD_ADDR==N_IDX)
	  			begin
	  			FLAG_REG_STATUS<=3'b011;	//не найдено свободное место в памяти
	  			rd_status 	   <=idle;
	  			end
	  	end else 
	  		begin
	  		FLAG_REG_STATUS<=3'b001;		//   найдено свободное место в памяти
	  		rd_status 	   <=rd_next_status;
	  		w_REG_ADDR     <=t1_CMD_ADDR;	//   запоминаем адресс под запись новой команды
	  	 	end
	end else
	if (rd_status==end_search)
	begin
	FLAG_WR_COMMAND<=1; 					//поиск успешно завершён вызываем процедуру записи в память команды
	rd_status 	   <=rd_next_status;
	end else
	if (rd_status==read_data)				//записываем данные в память синхромодуля
	begin
	reg_DATA_WR     <=1;					//устанавливаем сигнал записи данных в блок синхронизации
	rd_status 	    <=rd_next_status;
	end else
	if (rd_status==end_read_data)
	begin
	reg_DATA_WR    <=0;
	rd_status 	   <=rd_next_status;
	end else
	if (rd_status==search_time)								//ищем свежую команды на исполнение в регистре реального времени
	begin		
 		if (FLAG_SRCH==0)  									//ищем пока не пробежимся по всей памяти!!!		
		begin
			if(t1_CMD_ADDR==N_IDX) FLAG_SRCH<=1; 			//конец перебора памяти (задерженный адресс равен краю памяти)
			rd_REG_ADDR<=rd_REG_ADDR +1'b1;					//перебираем адреса в памяти,число адресов должно быть кратно степени 2!!!
			t0_CMD_ADDR<=rd_REG_ADDR;						//учитываем латентность памяти, для адреса команды
			t1_CMD_ADDR<=t0_CMD_ADDR;
			if (DATA_TIME_REG[337:274]>reg_TIME)  			//проверяем что время исполнения команды актуальное (не старое)
			begin
				FLAG_CMD_SEARCH<=1;							//найдена команда для исполнения
				if (tmp_CMD_TIME> DATA_TIME_REG[337:274]) 
				begin
				tmp_CMD_TIME<=DATA_TIME_REG[337:274];		//запоминаем новое чемпионное время
				tmp_CMD_ADDR<=t1_CMD_ADDR;					//запоминаем новый чемпионный адрес 
				end
			end
		end	else
				if (FLAG_CMD_SEARCH==1)
	  			begin
				   clr_REG_ADDR   <=tmp_CMD_ADDR;			//запоминаем текущий адрес команды в реестре для удаления после выполнения
				   rd_REG_ADDR    <=tmp_CMD_ADDR  ;//устанавливаем адрес чтения новой команды на исполнение
					 rd_status    <=rd_next_status;//если команда была найдена - переходим в состояние чтения
	  			end else 
				begin
				rd_status		<=idle;		   //если поиск закончен и команда не найдена			
				FLAG_SRCH_FAULT	<=1;		   //поднимаем флаг что поиск неудачен
				end
	end else	
	if (rd_status==step2_search_time)		//нужно чтобы учесть задержку чтения из памяти
	begin
	rd_status<=rd_next_status;
	end else
	if (rd_status==step3_search_time)		//нужно чтобы учесть задержку чтения из памяти
	begin
	FLAG_CLR_COMMAND<=0;
	rd_status		<=rd_next_status;
	end else
	if (rd_status==end_search_time)//сохраняем данные команды в промежуточные регисты перед выдачей
	begin
	rd_status<=rd_next_status;
		{
		mem_TIME_START  ,
		mem_FREQ        ,
		mem_FREQ_STEP   ,
		mem_FREQ_RATE   ,
	    mem_N_impulse   ,
	    mem_TYPE_impulse,
	    mem_Interval_Ti ,
	    mem_Interval_Tp ,
	    mem_Tblank1     ,
	    mem_Tblank2}      <=DATA_TIME_REG;
	end 

end

assign TEST 		 = {29'h0,FLAG_REG_STATUS};
assign DATA_WR       = reg_DATA_WR     ;
assign FREQ_z        = mem_FREQ        ;      
assign FREQ_STEP_z   = mem_FREQ_STEP   ;
assign FREQ_RATE_z   = mem_FREQ_RATE   ;
assign TIME_START_z  = mem_TIME_START  ;
assign N_impuls_z    = mem_N_impulse   ;
assign TYPE_impulse_z= mem_TYPE_impulse;
assign Interval_Ti_z = mem_Interval_Ti ;
assign Interval_Tp_z = mem_Interval_Tp ;
assign Tblank1_z     = mem_Tblank1     ;
assign Tblank2_z     = mem_Tblank2     ;	

//------------write---------------------
always_comb
 begin
	case (status)
		 clr_all:next_status=idle_status;
		clr_data:next_status=idle_status;
		 wr_data:next_status=idle_status;
		 default:next_status=idle_status;
	endcase
end

always_ff @(posedge CLK) 
begin 
	if(~rst_n) 
	begin
	FLAG_NEW_CMD_WR   <= 0;
	FLAG_WORK_PROCESS <= 0;
	status            <= clr_all;
	tmp_REG_ADDR      <= 0;
	 WR_REG           <=1'b1;
	  w_REG_DATA  	  <={64'h0000000000000000,274'h0000};
	end else 
	if (status==clr_all) //режим очистки памяти
	begin
		FLAG_WORK_PROCESS<=1'b1;
		 if (tmp_REG_ADDR<N_IDX) //
		 	begin
		 		tmp_REG_ADDR<=tmp_REG_ADDR+1'b1;
		 		w_REG_DATA  <={64'h0000000000000000,274'h0000};
		 	end	 else status<=next_status;
	end else
	if (status==clr_data) 			//режим удаления команды
	begin
		FLAG_WORK_PROCESS<=1'b1;
		tmp_REG_ADDR	 <=clr_REG_ADDR; //записываем адресс удаляемой строки из памяти
		WR_REG      	 <=1'b1;
		w_REG_DATA       <={64'h0000000000000000,274'h0000};//все нули во временной области-очистка!
		status			 <=next_status;
	end else
	if (status==wr_data) 			//режим записи командного слова в память
	begin
		FLAG_NEW_CMD_WR  <=1'b1;    //по  этому флагу обновляем поиск по текущей команде на исполнение
		FLAG_WORK_PROCESS<=1'b1;
		tmp_REG_ADDR<=w_REG_ADDR;
		WR_REG      <=1'b1;
		w_REG_DATA  <={tmp_TIME_START,tmp_FREQ        ,tmp_FREQ_STEP  ,tmp_FREQ_RATE ,
				   	   tmp_N_impulse ,tmp_TYPE_impulse[1:0],tmp_Interval_Ti,tmp_Interval_Tp,tmp_Tblank1,tmp_Tblank2};
		status<=next_status;
	end else
	if (status==idle_status)
	begin
				   FLAG_WORK_PROCESS<=1'b0;
						WR_REG      <=1'b0;
		if (FLAG_CLR_COMMAND) 					status<=clr_data;else
		if (FLAG_WR_COMMAND ) 					status<=wr_data ;
		if (rd_status==search_time)	FLAG_NEW_CMD_WR   <= 0;
	end 
end
 

mem1	
registre_MEM_inst (
	.clock 			( CLK ),
	.data 			( w_REG_DATA ),
	.rdaddress 		( rd_REG_ADDR ),
	.rden 			( RD_REG ),
	.wraddress 		( tmp_REG_ADDR ),
	.wren 			( WR_REG  ),
	.q 				( DATA_TIME_REG )
	);


endmodule