module dsp_step2 (
	input clk,    			// Clock  48 MHz
	input clk_en, 			// Clock Enable
	input rst_n,  			// Asynchronous reset active low
	input [31:0] DATA,		//входные IQ данные
	input     data_en,		//valid входных данных
	input [31:0] real_TIME, //вход сэмплов реального времени (младшие 32 бита)
   output [31:0] dat_IQ,
   output [31:0] dat_TIME,
   output 		 valid	
);

logic [31:0] reg_data;
logic [31:0] reg_time;
logic 		 reg_valid;

always_ff @(posedge clk) begin : proc_
	if(~rst_n) begin
	reg_valid<= 0;
	reg_data <= 0;
	reg_time <= 0;
	end else 
	if(clk_en ) begin
		if(data_en) begin
	 			 reg_data <= DATA;
	 			 reg_time <= real_TIME;
	 			 reg_valid<= 1;
		end else reg_valid<= 0;
	end
end

assign valid   =reg_valid;
assign dat_IQ  =reg_data;
assign dat_TIME=reg_time; 

endmodule