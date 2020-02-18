//-----------------------------------------------------------------------------
//
// Title       : sfp_master
// Design      : Eth
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\Eth\src\sfp_master.v
// Generated   : Fri Jan 11 13:33:00 2019
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
//{module {sfp_master}}
module sfp_master (
	output wire [7:0] spi_out,
	output wire scl,
	input wire clk,
	input wire [15:0] spi_in,
	input wire wr,
	output wire o_sda,
	input  wire i_sda,
	output wire upr_drv,
	input wire rst
);
 
reg [7:0] i2c_data=0;
reg [3:0] flag_wr=0;
reg i2c_strobe=0;
reg i2c_cmd=0; 

reg cmd_start=0;
reg cmd_read=0;
reg cmd_write=0;

wire cmd_ready;
wire data_in_ready;
wire busy;
wire bus_active;

reg [15:0] data=0;	

wire data_out_valid;
wire [7:0] data_i2c;
reg  [7:0] data_i2c_read=0;

always @(posedge clk)
begin
	
if (wr)
	begin	
	data<=spi_in;	
	if (spi_in[15]==1) 	cmd_read <=1; else cmd_write<=1;	
	//cmd_write<=1;		
	end	
	else
		begin
			cmd_read <=0;
			cmd_write<=0;			
		end

if (data_out_valid)	data_i2c_read<=data_i2c;
end
	
	
assign spi_out=data_i2c_read;

i2c_master
i2c_v1(
    .clk(clk),
    .rst(rst),
   
     // Host interface
  
    .cmd_address(spi_in[14:8]),
    .cmd_start(cmd_start),
    .cmd_read(cmd_read),
    .cmd_write(cmd_write),
    .cmd_write_multiple(0),
    .cmd_stop(1),
    .cmd_valid(1),
    .cmd_ready(),

    .data_in(spi_in[7:0]),
    .data_in_valid(1),
    .data_in_ready(),
    .data_in_last(0),

    .data_out(data_i2c),
    .data_out_valid(data_out_valid),
    .data_out_ready(1),
    .data_out_last(),
  
     // I2C interface
    
    .scl_i(1),
    .scl_o(scl),
    .scl_t(),
    .sda_i(i_sda),
    .sda_o(o_sda),
    .sda_t(upr_drv),
    
     //Status

    .busy(),
    .bus_control(),
    .bus_active(),
    .missed_ack(),
 
    //Configuration

    .prescale(320),//125/4/320 = 97 KHz
    .stop_on_idle(1)
);

endmodule
