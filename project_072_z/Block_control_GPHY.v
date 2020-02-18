							//-----------------------------------------------------------------------------
//
// Title       : Block_upr_att
// Design      : mur1
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : Block_upr_att.v
// Generated   : Mon Jan 22 11:49:35 2018
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
//{module {Block_upr_spi1}}
module Block_control_GPHY ( clk,sclk,mosi,miso,cs ,rst ,
	reset_PHY,
	tx_ready, 
	rx_ready,
	pll_locked,
	rx_runningdisp,
	rx_disperr,
	rx_errdetect,
	tx_parallel_data,
	tx_datak,
	rx_parallel_data,
	rx_datak	
	);	

parameter Nbit=32;	
parameter param_adr=1; 

input  wire tx_ready;
input  wire rx_ready;
input  wire pll_locked;
input  wire [1:0]   rx_runningdisp;
input  wire [1:0]   rx_disperr;
input  wire [1:0]   rx_errdetect;
output wire [15:0]  tx_parallel_data;
output wire [1:0]   tx_datak;
input  wire [15:0]  rx_parallel_data;
input  wire [1:0]   rx_datak;


output tri1 miso; 
output wire reset_PHY;

input clk ;
wire clk ;	 
input sclk ;
wire sclk ;
input mosi ;
wire mosi ;
input cs ;
wire cs ;
input rst ;
wire rst ;	

reg tx_ready_reg;
reg rx_ready_reg;			 
reg pll_locked_reg;
reg [1 :0] rx_runningdisp_reg;
reg [1 :0] rx_disperr_reg;
reg [1 :0] rx_errdetect_reg;
reg [15:0] tx_parallel_data_reg;
reg [1 :0] tx_datak_reg;
reg [15:0] rx_parallel_data_reg;
reg [1 :0] rx_datak_reg; 

reg [Nbit-1:0] data_out=0; 
reg [Nbit-1:0] data_port=0; 
reg [Nbit-1:0] data_in=0; 
reg [2:0] front_clk_spi=0;	 
reg [3:0] flag=0;   
reg [7:0] adr;
reg [7:0] adr_reg; 
reg [7:0] sch;	   
reg r_w = 0;//регистр чтение-запись
reg [31:0] reg_out=0;

always @(posedge clk) front_clk_spi<={front_clk_spi[1:0],sclk};

always @(posedge clk)
begin 

adr <=param_adr;

if (rst)
	begin sch<=0;flag<=0; end
	else 
		if (cs==1)	 
		begin 
		sch<=0; 
		flag<=0; 
		
		reg_out<={5'h0,
		tx_ready_reg,   //1
		rx_ready_reg,	//1
		pll_locked_reg,	//1
		rx_runningdisp_reg,	//2
		rx_disperr_reg,		//2
		rx_errdetect_reg,	//2
		rx_datak_reg,		//2
		rx_parallel_data_reg};  //16
		
		tx_ready_reg        <=tx_ready;
		rx_ready_reg        <=rx_ready;
		pll_locked_reg      <=pll_locked;
		rx_runningdisp_reg  <=rx_runningdisp;
		rx_disperr_reg      <=rx_disperr;
		rx_errdetect_reg    <=rx_errdetect;
		rx_parallel_data_reg<=rx_parallel_data;
		rx_datak_reg		<=rx_datak;
		
		
		end
		else
			if (cs==0) 
				begin
					if (flag==0)		//пришёл первый адресный байт посылки	
					begin  		
						if (front_clk_spi==3'b001) 
						begin
						data_in<={data_in[Nbit-2:0],mosi};
						sch<=sch+1;
						end	
					    else if (sch==8)  
							begin 
							adr_reg<=data_in[7:0];
							sch<=0;
							if (data_in[6:0]==param_adr) flag<=flag+1;//проверка адресата
							r_w <=data_in[7]; 
							end 		
					end
					else  
						if (flag==1)
							begin
								if (r_w==1)	//запись
								begin  		
									if (front_clk_spi==3'b001) 
									begin
									data_in<={data_in[Nbit-2:0],mosi};
									sch<=sch+1;
									end	 
									if (sch==Nbit)  data_out<=data_in;//	 		
								end else 
								if (r_w==0) //чтение
									begin
										if (front_clk_spi==3'b100) 
										begin
										reg_out<=reg_out<<1;
										sch<=sch+1;
										end											
									end
							end
				end	
end

assign 	   miso =  (flag==0)?1'hZ:reg_out[Nbit-1];	
assign     tx_parallel_data = data_out[15:0];
assign     tx_datak         = data_out[17:16];
assign     reset_PHY        = data_out[18];	  //сброс PHY
	
endmodule
