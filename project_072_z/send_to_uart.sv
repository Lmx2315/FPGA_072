
//---------------------------------------------------------------
//автор СС ОАО НПК НИИДАР
//
//
//tb для проверки модуля DMA-SPI , он выводит поаследовательность байт в уарт
//
//---------------------------------------------------------------
`timescale 1 ns / 1 ns
module send_to_uart (
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low	

	input [407:0] data_in,
	input 		  RCV,
	input 		  BUSY,
	output [7:0]  DATA_out,
	output 		  SEND		
);

logic [407:0] MEM  =0;
logic FLAG_WORK    =0;
logic [  7:0] N_sch=0;
logic FLAG_SEND    =0;
logic [  7:0] dat_o=0;

always_ff @(posedge clk) 
begin
	if(~rst_n) 
	begin
	 MEM	  <=0;
	 FLAG_SEND<=0;	
	end else 
	if (RCV)
	begin
	MEM	 	 <= data_in;
	FLAG_WORK<=1'b1;
	FLAG_SEND<=0;	
	N_sch    <=8'd51;//количество байт во входных данных
	end else
	if (FLAG_WORK)
	begin
		if (BUSY==0)
		begin
		FLAG_SEND<=1;
		if (FLAG_SEND==0)
			begin
			if (FLAG_SEND==0)  begin MEM<=MEM<<8; dat_o<=MEM[407:400]; end
			if (N_sch>0) N_sch<=N_sch-1'b1; 
			else 
				begin 
				FLAG_WORK<=0;
				FLAG_SEND<=0;
				end	
			end		
		end 
			else FLAG_SEND<=0;	
	end

end

assign SEND     = FLAG_SEND;
assign DATA_out = dat_o;

endmodule