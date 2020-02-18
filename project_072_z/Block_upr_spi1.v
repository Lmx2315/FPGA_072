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
module Block_upr_spi1 ( clk,sclk,mosi,miso,cs ,rst ,out );	

parameter Nbit=8;	
parameter param_adr=1; 

output [Nbit-1:0] out ;
wire   [Nbit-1:0] out ;

output tri1 miso;

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

reg [Nbit-1:0] data_out=0; 
reg [Nbit-1:0] data_in=0; 
reg [2:0] front_clk_spi=0;	 
reg [3:0] flag=0;   
reg [7:0] adr;
reg [7:0] adr_reg; 
reg [7:0] sch;	   
reg r_w = 0;//регистр чтение-запись
reg [Nbit+1:0] reg_out=0;

always @(posedge clk) front_clk_spi<={front_clk_spi[1:0],sclk};

always @(posedge clk)
begin 

adr <=param_adr;

if (rst)
	begin sch<=0; data_out<=32'hffffffff; flag<=0; end
	else 
		if (cs==1)	 begin sch<=0; flag<=0; reg_out<=data_out;end
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
assign 	   out  =  data_out[Nbit-1:0];	
assign 	   miso =  (flag==0)?1'hZ:reg_out[Nbit];	
	
endmodule




//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {Block_upr_spi1}}
module Block_control_spi ( clk,sclk,mosi,miso,cs ,rst ,inport );	

parameter Nbit=8;	
parameter param_adr=1; 

input  [Nbit-1:0] inport ;
wire   [Nbit-1:0] inport ;

output tri1 miso;

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

reg [Nbit-1:0] data_port=0; 
reg [Nbit-1:0] data_in=0; 
reg [2:0] front_clk_spi=0;	 
reg [3:0] flag=0;   
reg [7:0] adr;
reg [7:0] adr_reg; 
reg [7:0] sch;	   
reg r_w = 0;//
reg [Nbit+1:0] reg_out=0;

always @(posedge clk) front_clk_spi<={front_clk_spi[1:0],sclk};

always @(posedge clk)
begin 

adr <=param_adr;

if (rst)
	begin sch<=0;flag<=0; end
	else 
		if (cs==1)	 begin sch<=0; flag<=0; reg_out<=inport;end
		else
			if (cs==0) 
				begin
					if (flag==0)		//
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
							if (data_in[6:0]==param_adr) flag<=flag+1;//
							r_w <=data_in[7]; 
							end 		
					end
					else  
						if (flag==1)
							begin
								if (r_w==0) //
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
	
endmodule
