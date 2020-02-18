//-----------------------------------------------------------------------------
//
// Title       : sdram_wr_rd
// Design      : list
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : d:\My_Designs\project\list\src\sdram_wr_rd.v
// Generated   : Mon Apr 15 15:56:03 2019
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
//{module {sdram_wr_rd}}
module sdram_wr_rd 
	( 
ok,	
rst,
clk,
wr,
rd,
data_wr,
data_rd, 
addr_wr,
addr_rd,
en,

wb_stb_i,
wb_ack_o,
wb_addr_i,
wb_we_i , // 1 - Write, 0 - Read
wb_dat_i,
wb_sel_i, // Byte enable
wb_dat_o,
wb_cyc_i,
wb_cti_i 
);

input                  rst ;
input                  clk ; 

input wr;
input rd;

output ok;
input [24:0] addr_wr; 
input [24:0] addr_rd;
input [31:0] data_wr;
output[31:0] data_rd;
output en;

output                  wb_stb_i           ;
input                   wb_ack_o           ;
output [24:0]           wb_addr_i          ;
output                  wb_we_i            ; // 1 - Write, 0 - Read
output [31:0]           wb_dat_i           ;
output [3:0]            wb_sel_i           ; // Byte enable
input  [31:0]           wb_dat_o           ;
output                  wb_cyc_i           ;
output [2:0]            wb_cti_i           ;  


reg stb=0;
reg [24:0] reg_addr=0;
reg we=0;
reg [31:0] data_i=0;
reg [3:0]  sel=0;
reg [31:0] data_o=0;
reg cyc=0;
reg [2:0] cti=0;	
reg [7:0] step=100; 
reg reg_en=0;
reg [31:0] d_temp=0;
reg flag_process=0;

assign 	wb_stb_i  = stb;
assign 	wb_addr_i = reg_addr;
assign  wb_we_i   = we;
assign  wb_dat_i  = data_i;
assign 	wb_sel_i  = sel;
assign  wb_cyc_i  = cyc;
assign 	wb_cti_i  = cti;

assign 	data_rd   =  data_o; 
assign       en   =  reg_en;  
assign 	ok        =  ~flag_process;

always @(posedge clk)
	if (rst)
		begin
			
			
		end
	else
	if (wr) begin step<=0 ; flag_process<=1; end
	else
	if (rd) begin step<=10; flag_process<=1; end
	else
		if (step==0)
			begin				
				stb   <=1;
				cyc   <=1;
				we    <=1;
				sel   <=4'b1111;
				reg_addr  <=addr_wr;
				data_i<=data_wr;
				step<=1;
			end	else
		if (step==1)
			begin
				if (wb_ack_o==1)
					begin 
					flag_process<=0;
					stb   <=0;
					cyc   <=0;
					we    <='hx;
					sel   <='hx;
					reg_addr  <='hx;
					data_i<='hx;
					step<=100;	
					end			
			end	 else
		if (step==10)
			begin
			stb   <=1;
			cyc   <=1;
			we    <=0;	
			reg_addr  <=addr_rd;
			step<=11;
			end	else
		if (step==11)
			begin 			
			if (wb_ack_o==1)
				begin					
				data_o<=wb_dat_o;	
				stb   <=0;
				cyc   <=0;
				we    <='hx;
				reg_addr  <='hx;
				reg_en<=1;
				step<=12;
				end
			end	
			else
			if (step==12)
				begin 
				flag_process<=0;
				reg_en<=0;
				step<=100;				
				end					


endmodule
